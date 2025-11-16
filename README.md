<!-- Hero + badges + visual README replacement -->

<!-- New visually-appealing README content starts here -->
<p align="center">
  <!-- Inline simple SVG hero -->
  <svg width="100%" height="140" viewBox="0 0 1200 140" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg" style="background:linear-gradient(90deg,#071023,#0b1220);border-radius:8px;">
    <defs>
      <linearGradient id="g" x1="0" x2="1">
        <stop offset="0" stop-color="#00d2ff"/>
        <stop offset="1" stop-color="#4b6ef6"/>
      </linearGradient>
    </defs>
    <rect width="1200" height="140" fill="url(#g)" opacity="0.06"/>
    <g transform="translate(24,18)">
      <text x="0" y="40" fill="#e6eef8" font-size="28" font-weight="700" font-family="Inter, Arial">Routeur Défensif — Honeypot + IA</text>
      <text x="0" y="72" fill="#c7d6ea" font-size="14" font-family="Inter, Arial">Prototype PFE — Détection, redirection & visualisation</text>
    </g>
  </svg>
  <br/>
  <!-- Badges for quick visual status -->
  <img alt="Status" src="https://img.shields.io/badge/status-In%20progress-ffb020" />
  <img alt="Timeline" src="https://img.shields.io/badge/timeline-Nov%202025–May%202026-4c9f70" />
  <img alt="License" src="https://img.shields.io/badge/license-CC--BY--NC-blue" />
</p>

---

# Plan de gestion de projet — Routeur de défense avec Honeypot + IA
Début : 16 novembre 2025 • Fin prévue : 31 mai 2026 • Durée : 6,5 mois

---

## Vue d'ensemble
Projet PFE visant à concevoir et implémenter un routeur défensif intégré à un honeypot et à de l'IA pour détecter, bloquer et rediriger des attaques réseau tout en collectant des logs exploitables.

---

## Quick Navigation
- 🔎 Phases & tâches (collapsible)
- 📊 Timeline & progression
- 🧭 Prototype UI (local)
- 📁 Organisation du repo & bonnes pratiques

---

## Phases détaillées (cliquez pour ouvrir)
<details>
<summary>🧱 Phase 1 — Cadrage & Étude (16 Nov → 15 Déc) — ✅</summary>

**Objectif** : Définir le périmètre, technologies et architecture.

Tâches
- Lire & comprendre les exigences du PFE
- Étude des attaques réseau : brute force, scans, SQLi, etc.
- Choisir les datasets (CIC-IDS2017, UNSW-NB15, NSL-KDD…)
- Définir l’architecture du routeur & VM
- Choisir outils IA (scikit-learn / PyTorch / TensorFlow)
- Rédiger le cahier de conception préliminaire

Livrables
- ✅ Cahier de conception préliminaire (10–15 pages)  
- ✅ Schéma d’architecture réseau  
- ✅ Liste des outils & environnements

Progression : ▇▇▇▇▇▇▇▇▇▇ 100%
</details>

<details>
<summary>🧱 Phase 2 — Mise en place des machines & infra (16 Déc → 15 Jan) — ✅</summary>

Tâches
- Installer VMware + créer les 4 VMs (Routeur, Honeypot, Victime, Attaquant)
- Configurer réseau isolé (VMnet2)
- Installer outils (Python, scapy, etc.)
- Tests ping/SSH

Livrables
- ✅ Topologie réseau fonctionnelle  
- ✅ VMs installées & testées

Progression : ▇▇▇▇▇▇▇▇▇▇ 100%
</details>

<details>
<summary>🧱 Phase 3 — Collecte & Préparation des données IA (15 Jan → 20 Fév) — ✅</summary>

Tâches
- Télécharger dataset public
- Nettoyer & normaliser features
- Capturer attaques locales (nmap, hydra)
- Mélanger données réelles + publiques
- Split train/test/val

Livrables
- ✅ Dataset propre (CSV)
- ✅ Notebook `preprocessing.ipynb`

Progression : ▇▇▇▇▇▇▇▇▇▇ 100%
</details>

<details>
<summary>🧱 Phase 4 — Développement du modèle IA (20 Fév → 31 Mars) — ⚙️ 85%</summary>

Tâches
- Comparer modèles : RandomForest, SVM, XGBoost, MLP
- Mesures : accuracy / recall / F1
- Export modèle final `detector.pkl`

Livrables
- Notebook `model_training.ipynb`  
- Modèle `detector.pkl`

Progression : ▇▇▇▇▇▇▇▇▇▎ 85%
</details>

<details>
<summary>🧱 Phase 5 — Implémentation du routeur défensif (1 Avr → 30 Avr) — ⚙️ 40%</summary>

Tâches
- Capture trafic (scapy)  
- Module classification (chargement `.pkl`)  
- Module décision (iptables/nftables)  
- API interne (FastAPI) + Dashboard (React/Vue)

Progression : ▇▇▇▎▁▁▁▁▁▁ 40%
</details>

<details>
<summary>🧱 Phase 6 — Intégration Honeypot (1 Avr → 15 Mai) — ⚙️ 30%</summary>

Tâches
- Déploiement Cowrie, redirections, collecte logs
- Envoi logs vers dashboard

Progression : ▇▇▎▁▁▁▁▁▁▁ 30%
</details>

<details>
<summary>🧱 Phase 7 — Tests complets & Validation (10 Mai → 25 Mai) — 🔬</summary>

Tâches
- Tests d’attaques (nmap, hydra, SQLi)
- Vérifier détection / blocage / redirection
- Mesurer performances & faux positifs

Livrables
- Rapport de tests & tableau de performances
</details>

<details>
<summary>🧱 Phase 8 — Rédaction & Soutenance (25 Mai → 5 Juin) — 🧾</summary>

Tâches
- Rapport final (80–120 pages)
- Slides & démo
</details>

---

## Timeline visuelle & résumé
| Mois | Phase principale |
|---|---|
| Nov (fin)–Dec | Étude & Cadrage |
| Dec–Jan | Infra + VMs |
| Jan–Fév | Dataset IA |
| Fév–Mars | Modèle IA |
| Avril | Routeur IA + Dashboard |
| Avril–Mai | Honeypot |
| Mai | Tests & validation |
| Fin Mai–Début Juin | Rapport + soutenance |

---

## Visual Progress (emoji bars)
- Phase 1: ██████████ 100%  
- Phase 2: ██████████ 100%  
- Phase 3: ██████████ 100%  
- Phase 4: ████████▎ 85%  
- Phase 5: ███▎ 40%  
- Phase 6: ███▎ 30%

---

## Prototype UI — Dashboard (local)
Un prototype d'interface (HTML/CSS/JS) est fourni dans `dashboard/`. Ouvrir localement :
- Ouvrir : dashboard/index.html dans un navigateur moderne
- Contient animations, thèmes, cartes interactives

Lien local : c:\Users\hp\Desktop\Implementation-of-an-intelligent-defense-router-with-an-integrated-honeypot\dashboard\index.html

---

## Organisation recommandée du repo
- docs/ — conception, schémas, rapports
- notebooks/ — preprocessing.ipynb, model_training.ipynb
- models/ — detector.pkl
- dashboard/ — prototype UI (index.html, styles.css, app.js)
- scripts/ — déploiement, captures, tests

---

## Remarques & bonnes pratiques
- Versionner tous les notebooks et modèles (utiliser .gitignore pour gros fichiers si nécessaire).  
- Automatiser captures et tests (scripts reproducibles).  
- Documenter commandes VM & topologie.  
- Anonymiser logs sensibles.

---

<p align="center">Made with ❤️ — keep UI ideas in `dashboard/` for the full interactive preview.</p>

