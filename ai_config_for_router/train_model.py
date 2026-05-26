import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics import classification_report, accuracy_score
import pickle
import os

# ─────────────────────────────────────────────
# MODEL IMPORTS — all ready, just pick one below
# ─────────────────────────────────────────────
from sklearn.ensemble import RandomForestClassifier          # Model 1
from sklearn.ensemble import GradientBoostingClassifier      # Model 2
from sklearn.linear_model import LogisticRegression          # Model 3
from sklearn.svm import LinearSVC                            # Model 4
from sklearn.calibration import CalibratedClassifierCV       # Model 4
from sklearn.model_selection import cross_val_score
from sklearn.naive_bayes import MultinomialNB                # Model 5
from sklearn.neighbors import KNeighborsClassifier           # Model 6
from sklearn.neural_network import MLPClassifier             # Model 7
from sklearn.linear_model import SGDClassifier
# ─────────────────────────────────────────────
# Load dataset
# ─────────────────────────────────────────────
print("[*] Loading dataset...")
df = pd.read_csv('/home/narie/ai/dataset_ready.csv')
df = df.dropna()
X = df['text']
y = df['label']

# Split
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)
print(f"[*] Training samples: {len(X_train)}")
print(f"[*] Testing samples: {len(X_test)}")

# Vectorize text
print("[*] Vectorizing text...")
vectorizer = TfidfVectorizer(max_features=1000, ngram_range=(1, 2))
X_train_vec = vectorizer.fit_transform(X_train)
X_test_vec = vectorizer.transform(X_test)

# ══════════════════════════════════════════════
#   PICK YOUR MODEL — comment all except one
# ══════════════════════════════════════════════

# --- Model 1: Random Forest (your original) ---
# model = RandomForestClassifier(n_estimators=100, random_state=42, n_jobs=-1)

# --- Model 2: Gradient Boosting ---
# model = GradientBoostingClassifier(n_estimators=100, learning_rate=0.1, max_depth=5, random_state=42)

# --- Model 3: Logistic Regression ---
# model = LogisticRegression(max_iter=1000, C=1.0, solver='lbfgs', multi_class='auto', random_state=42)

# --- Model 4: Linear SVM (great for text classification) ---
# base_model = LinearSVC(C=0.1, max_iter=2000, random_state=42)
# model = CalibratedClassifierCV(base_model, cv=5) #this one gives real probabilities

# --- Model 5: Naive Bayes (fast + solid baseline for text) ---
# model = MultinomialNB(alpha=0.1)

# --- Model 6: K-Nearest Neighbors ---
# model = KNeighborsClassifier(n_neighbors=5, metric='cosine', algorithm='brute', n_jobs=-1)

# --- Model 7: MLP Neural Network ---
'''model = MLPClassifier(
hidden_layer_sizes=(256, 128, 64),
activation='relu',
max_iter=300,
early_stopping=True, #stops when it starts overfitting
validation_fraction=0.1,
random_state=42
)'''
# --- Model 8: SGDClassifier ---
model = SGDClassifier(
loss='modified_huber', #this gives probabilities like a neural net
max_iter=1000,
random_state=42,
class_weight='balanced', #handles imbalanced classes
alpha=0.001, #regularization to reduce overfittinf
n_jobs=-1
)
# ══════════════════════════════════════════════

# Train
model_name = type(model).__name__
print(f"[*] Training {model_name}...")
model.fit(X_train_vec, y_train)

# Evaluate
print("\n[*] Evaluating model...")
y_pred = model.predict(X_test_vec)
accuracy = accuracy_score(y_test, y_pred)
print(f"\nAccuracy: {accuracy * 100:.2f}%")
print(f"\nModel used: {model_name}")
print("\nDetailed report:")
print(classification_report(y_test, y_pred))

print("[*] running cross-validation to check overfitting...")
cv_scores = cross_val_score(model, X_train_vec, y_train, cv=5)
print(f"CV Scores: {cv_scores}")
print(f"CV Mean: {cv_scores.mean()*100:.2f}%")
print(f"CV Std: {cv_scores.std()*100:.2f}%")

if cv_scores.mean() > 0.98:
    print(" WARNINGGGGG: overfitting detected!") #overfitting prevention and detection

# Save model
os.makedirs('/home/narie/ai/model', exist_ok=True)
with open('/home/narie/ai/model/model.pkl', 'wb') as f:
    pickle.dump(model, f)
with open('/home/narie/ai/model/vectorizer.pkl', 'wb') as f:
    pickle.dump(vectorizer, f)

print(f"\nModel saved to /home/narie/ai/model/")
