<div align="center">

# 🍯 HoneyNet — AI-Powered Intelligent Router

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=22&duration=3000&pause=1000&color=4F8EF7&center=true&vCenter=true&width=600&lines=Real-time+Attack+Classification;Dynamic+Honeypot+Deployment;AI-Driven+Network+Defense;SGDClassifier+%7C+99.84%25+Accuracy" alt="Typing SVG" />

<br>

![Python](https://img.shields.io/badge/Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white)
![scikit-learn](https://img.shields.io/badge/scikit--learn-1.3+-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white)
![Scapy](https://img.shields.io/badge/Scapy-2.5+-009639?style=for-the-badge)
![iptables](https://img.shields.io/badge/iptables-NAT%2FDNAT-CC0000?style=for-the-badge)
![Accuracy](https://img.shields.io/badge/Accuracy-99.84%25-brightgreen?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

<br>

> **An intelligent router that intercepts network traffic in real time, classifies attacks using Machine Learning, and dynamically deploys the most appropriate honeypot — fully automated, zero human intervention.**

<br>

---

</div>

## 📋 Table of Contents

- [Overview](#-overview)
- [Architecture](#-architecture)
- [How It Works](#-how-it-works)
- [Attack Classes](#-attack-classes)
- [File Structure](#-file-structure)
- [Pipeline](#-pipeline)
- [Model Comparison](#-model-comparison)
- [Quick Start](#-quick-start)
- [Configuration](#-configuration)
- [Dataset](#-dataset)
- [Performance](#-performance)

---

## 🌐 Overview

HoneyNet transforms a standard Linux router into an **AI-powered cyber defense system**. Instead of blindly forwarding SSH and HTTP traffic to a fixed honeypot, it:

1. **Intercepts** every incoming TCP packet on ports 22 and 80
2. **Classifies** the attack type using a trained ML model
3. **Deploys** the right honeypot dynamically via `iptables` rules

```
Without AI  →  port 22 → Cowrie (always)   port 80 → DVWA (always)
With AI     →  SQLi → DVWA   |   SSH Brute → Cowrie   |   XSS → DVWA   |   ...
```

---

## 🏗 Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        NETWORK TOPOLOGY                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   ┌──────────────┐        WAN                ┌───────────────┐  │
│   │  🖥  Kali     │   192.168.244.0/24        │  🤖 Router IA │  │
│   │   Attacker   │ ─────────────────────────▶│  ai_router.py │  │
│   │ .244.137     │                           │  .244.133     │  │
│   └──────────────┘                           │  .10.1 (LAN)  │  │
│                                              └───────┬───────┘  │
│                                                      │ LAN      │
│                                              192.168.10.0/24    │
│                                                      │          │
│                              ┌───────────────────────┼──────┐   │
│                              │                       │      │   │
│                    ┌─────────▼──────┐    ┌──────────▼────┐  │   │
│                    │  🐝 Cowrie     │    │  📊 Dashboard │  │   │
│                    │  SSH Honeypot  │    │  Flask :5000  │  │   │
│                    │  :2222         │    │  .10.10       │  │   │
│                    └────────────────┘    └───────────────┘  │   │
│                    ┌────────────────┐                        │   │
│                    │  🌐 DVWA      │                        │   │
│                    │  Web Honeypot  │                        │   │
│                    │  :80           │    .10.20              │   │
│                    └────────────────┘                        │   │
│                                                              │   │
└──────────────────────────────────────────────────────────────┘
```

---

## ⚙️ How It Works

```
                    INCOMING PACKET
                          │
                          ▼
              ┌───────────────────────┐
              │   Scapy BPF Filter    │
              │  tcp AND (port 22     │
              │       OR port 80)     │
              └───────────┬───────────┘
                          │
                          ▼
              ┌───────────────────────┐
              │  IP / Internal Filter  │
              │  Skip 192.168.10.x    │
              │  Cooldown 3s/IP       │
              └───────────┬───────────┘
                          │
                          ▼
              ┌───────────────────────┐
              │   Payload Extraction  │
              │   Raw Layer → UTF-8   │
              └───────────┬───────────┘
                          │
                          ▼
              ┌───────────────────────┐
              │   Text Serialization  │
              │  source:DVWA          │
              │  event:SQLi           │
              │  ip:x.x.x.x           │
              │  request:GET ...      │
              └───────────┬───────────┘
                          │
                          ▼
              ┌───────────────────────┐
              │   TF-IDF Vectorizer   │
              │   max_features=1000   │
              │   ngram_range=(1,2)   │
              └───────────┬───────────┘
                          │
                          ▼
              ┌───────────────────────┐
              │   SGDClassifier       │◀─── model.pkl
              │   predict() +         │◀─── vectorizer.pkl
              │   predict_proba()     │
              └───────────┬───────────┘
                          │
                    ┌─────┴──────┐
                    │            │
                    ▼            ▼
             COWRIE :2222    DVWA :80
              iptables         iptables
              DNAT rule        DNAT rule
```

---

## 🎯 Attack Classes

| Label | Honeypot | Description |
|-------|----------|-------------|
| `BRUTE_FORCE_SSH-COWRIE` | 🐝 Cowrie | SSH brute force login attempts |
| `SSH_SUCCESS-COWRIE` | 🐝 Cowrie | Successful SSH authentication |
| `SSH_COMMAND-COWRIE` | 🐝 Cowrie | Commands executed in SSH session |
| `RECON-COWRIE` | 🐝 Cowrie | SSH reconnaissance / port probing |
| `SQLI-DVWA` | 🌐 DVWA | SQL Injection attack |
| `XSS-DVWA` | 🌐 DVWA | Cross-Site Scripting attack |
| `CMD_INJECTION-DVWA` | 🌐 DVWA | OS Command Injection |
| `BRUTE_FORCE_WEB-DVWA` | 🌐 DVWA | Web login brute force |

---

## 📁 File Structure

```
ai_config_for_router/
│
├── 📂 model/
│   ├── model.pkl            ← Trained SGDClassifier (serialized)
│   └── vectorizer.pkl       ← Fitted TF-IDF vectorizer (serialized)
│
├── 🤖 ai_router.py          ← MAIN — Real-time packet capture + classification + iptables
├── 🧪 inference.py          ← Test the model with sample inputs
├── 🏋️ train_model.py        ← Train/retrain the ML model
├── 🔧 prep_dataset.py       ← Prepare and format raw logs into dataset_ready.csv
├── 🏷️ fix_labels.py         ← Relabel and correct mislabeled dataset entries
├── 📈 add_noise.py          ← Data augmentation — add noise to prevent overfitting
├── ➕ add_recon.py           ← Add synthetic RECON-COWRIE samples to dataset
└── 📊 logs_export.csv       ← Raw exported logs (source dataset)
```

---

## 🔄 Pipeline

```
RAW LOGS (Cowrie JSON + Apache access.log)
           │
           ▼
   prep_dataset.py
   ─────────────────
   • Parse Cowrie JSON events
   • Parse Apache HTTP logs
   • Serialize to unified text format
   • Export → dataset_ready.csv
           │
           ▼
   fix_labels.py
   ─────────────────
   • Correct mislabeled entries
   • Reclassify RECON vs CMD_INJECTION
   • Add RECON-DVWA / XSS-DVWA labels
           │
           ▼
   add_noise.py + add_recon.py
   ─────────────────
   • Random word deletion (50% prob)
   • Word swap augmentation (30% prob)
   • Add 500 synthetic RECON-COWRIE rows
   • Shuffle + merge → dataset_ready.csv
           │
           ▼
   train_model.py
   ─────────────────
   • TF-IDF vectorization (max 1000 features)
   • Train SGDClassifier
   • 5-fold cross-validation
   • Save → model/model.pkl
           │         model/vectorizer.pkl
           ▼
   ai_router.py
   ─────────────────
   • Load model.pkl + vectorizer.pkl
   • Sniff packets (Scapy BPF)
   • Classify in real time
   • Inject DNAT iptables rules
   • POST real attacker IP to dashboard
```

---

## 📊 Model Comparison

| Model | Accuracy | F1-Score | Train Time | Decision |
|-------|----------|----------|------------|----------|
| Random Forest | 100% | 1.00 | ~15s | ❌ Overfitting |
| Gradient Boosting | 99.99% | 1.00 | 462s | ❌ Too slow |
| Logistic Regression | ~98% | ~0.98 | ~2s | ⚠️ Acceptable |
| Linear SVM | ~99% | ~0.99 | ~1s | ⚠️ Good |
| MLP Neural Network | 100% | 1.00 | 86s | ❌ Overfitting |
| **SGDClassifier** | **99.84%** | **0.9983** | **0.85s** | ✅ **Selected** |

> SGDClassifier was chosen for its exceptional speed (0.85s training), high accuracy, and ability to produce confidence scores via `loss='modified_huber'` — essential for real-time inference in `ai_router.py`.

---

## 🚀 Quick Start

### Prerequisites

```bash
# On the router machine (Ubuntu Server)
pip install scapy netifaces requests scikit-learn --break-system-packages
```

### Step 1 — Prepare the dataset

```bash
python3 prep_dataset.py
python3 fix_labels.py
python3 add_noise.py
python3 add_recon.py
```

### Step 2 — Train the model

```bash
python3 train_model.py
```

Expected output:
```
[*] Loading dataset...
[*] Training samples: 39277
[*] Vectorizing text...
[*] Training SGDClassifier...
[*] Evaluating model...

 Accuracy: 99.84%
 CV Mean:  99.75%

 Model saved to /home/narie/ai/model/
```

### Step 3 — Test inference

```bash
python3 inference.py
```

### Step 4 — Launch the router

```bash
sudo python3 ai_router.py
```

Expected output:
```
[*] Loading AI model...
[*] Model loaded successfully!
[*] Default forwarding rules set successfully!
==================================================
AI router started!
  WAN Interface: ens33
  WAN IP:        192.168.244.133
  LAN IP:        192.168.10.1
  Honeypot:      192.168.10.20
  Cowrie port:   2222
  DVWA port:     80
==================================================

[AI] New packet from 192.168.244.137:22
[AI] Attack:      BRUTE_FORCE_SSH-COWRIE
[AI] Confidence:  100.00%
[AI] Deploy:      COWRIE
[AI] Reason:      SSH brute force detected
[iptables] 192.168.244.137:22 - COWRIE (192.168.10.20:2222)
```

---

## 🔧 Configuration

Edit the static config section in `ai_router.py`:

```python
# ── Static Config ──────────────────────────────
HONEYPOT_IP  = "192.168.10.20"   # Honeypot VM IP
ROUTER_LAN   = "192.168.10.1"    # Router LAN interface IP
COWRIE_PORT  = 2222              # Cowrie SSH honeypot port
DVWA_PORT    = 80                # DVWA web honeypot port
# ───────────────────────────────────────────────
```

---

## 📦 Dataset

### Format

Each entry in `dataset_ready.csv` follows this unified NLP text format:

```
source:cowrie event:cowrie.login.failed ip:185.107.108.86 username:root password:admin123 command:- request:-
```

```
source:DVWA event:SQLi ip:192.168.244.137 username:- password:- command:- request:GET /dvwa/vulnerabilities/sqli/?id=1+OR+1=1
```

### Stats

| Metric | Value |
|--------|-------|
| Total entries | ~48,000+ |
| Classes | 8 |
| Source | Cowrie JSON + Apache access.log |
| Format | CSV — text + label |
| Augmented | Yes — noise + synthetic RECON rows |

---

## 📈 Performance

```
Classification Report — SGDClassifier
──────────────────────────────────────────────────────
Class                    Precision  Recall  F1     Support
──────────────────────────────────────────────────────
BRUTE_FORCE_SSH-COWRIE   1.00       1.00    1.00   840
BRUTE_FORCE_WEB-DVWA     1.00       1.00    1.00   1910
CMD_INJECTION-DVWA       0.97       1.00    0.99   155
RECON-COWRIE             1.00       0.90    0.95   112
RECON-DVWA               0.98       0.99    0.99   674
SQLI-DVWA                1.00       1.00    1.00   1972
SSH_COMMAND-COWRIE       1.00       1.00    1.00   2735
SSH_SUCCESS-COWRIE       1.00       1.00    1.00   1349
XSS-DVWA                 1.00       1.00    1.00   60
──────────────────────────────────────────────────────
Accuracy                                   99.84%  9820
Macro avg                1.00       0.99    0.99   9820
──────────────────────────────────────────────────────

Cross-Validation (5-fold):
  CV Scores : [0.998, 0.997, 0.998, 0.997, 0.998]
  CV Mean   : 99.75%
  CV Std    : 0.03%
```

---

## 🔑 Key Technical Features

- **Dynamic WAN detection** — `netifaces` auto-detects the active interface
- **Per-IP cooldown** — 3s cooldown per IP:port pair to avoid redundant inference
- **Fallback logic** — Unknown predictions default to `UNKNOWN-COWRIE`
- **Rule injection** — Each attacker gets a personalized DNAT rule at position 1
- **Real IP recovery** — SNAT masking resolved via `dmesg` LOG rule + Flask cache
- **Confidence scoring** — Every prediction includes a `%` confidence score

---

## 🛡️ iptables Rules Applied at Startup

```bash
# IP forwarding
sysctl -w net.ipv4.ip_forward=1

# Default DNAT rules
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.10.20:80
iptables -t nat -A PREROUTING -p tcp --dport 22 -j DNAT --to-destination 192.168.10.20:2222

# Forwarding
iptables -A FORWARD -d 192.168.10.20 -j ACCEPT
iptables -A FORWARD -s 192.168.10.20 -j ACCEPT

# SNAT
iptables -t nat -A POSTROUTING -d 192.168.10.20 -j SNAT --to-source 192.168.10.1

# LOG for real IP recovery
iptables -t nat -I PREROUTING 1 -p tcp --dport 22 -j LOG --log-prefix "COWRIE_ORIG: " --log-level 4
```

---

<div align="center">

## 👥 Authors

**Youb Mahmoud Nader** &nbsp;·&nbsp; **Djouaher Mariya**

*Binôme du Binaire*

Supervised by **Pr. Boukabou Abdelhamid**

Licence Informatique — Spécialité Métiers de l'Informatique
IFAG Algeria · 2025/2026

---

*Built with 🍯 honeypots, 🤖 AI, and way too many `iptables` rules.*

</div>
