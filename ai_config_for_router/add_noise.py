import pandas as pd
import random

df = pd.read_csv('/home/narie/ai/dataset_ready.csv')

print(f"original size of the dataset: {len(df)}")

def add_noise(text):
	words = text.split()

	#randomly drop words
	if len(words) > 3 and random.random() > 0.5:
		words.pop(random.randint(0, len(words)-1))

	#randomly shuffle some words
	if len(words) > 3 and random.random() > 0.7:
		i = random.randint(0, len(words)-2)
		words[i], words[i+1] = words[i+1], words[i]

	return ' '.join(words)

#add noisy copies of existing data
noisy_rows = []
for _, row in df.iterrows():
	if random.random() > 0.5:
		noisy_rows.append({
			'text': add_noise(row['text']),
			'label': row['label']
		})

noisy_df = pd.DataFrame(noisy_rows)
df_combined = pd.concat([df, noisy_df], ignore_index=True)
df_combined = df_combined.sample(frac=1).reset_index(drop=True) #shuffle

df_combined.to_csv('/home/narie/ai/dataset_ready.csv', index=False)
print(f"new zise of the dataset: {len(df_combined)}")
print("done!!!")
