# Plan de gestion de projet — Routeur de défense avec Honeypot + IA

Début : 16 novembre 2025  
Fin prévue : 31 mai 2026  
Durée : 6,5 mois

---

## Vue d'ensemble
Projet PFE visant à concevoir et implémenter un routeur défensif intégré à un honeypot et à de l'IA pour la détection et la mitigation d'attaques réseau.

---

## Phases détaillées

### Phase 1 — Cadrage & Étude (16 Nov → 15 Déc)
Objectif : Définir clairement le projet, technologies, besoins et environnement.

Tâches
- Lire & comprendre les exigences du PFE
- Étude des attaques réseau : brute force, scans, SQLi, etc.
- Choisir les datasets pour l’IA (CIC-IDS2017, UNSW-NB15, NSL-KDD…)
- Définir l’architecture du routeur
- Définir les machines virtuelles (déjà faites)
- Choisir les outils IA (scikit-learn / PyTorch / TensorFlow)
- Rédiger un document de conception préliminaire

Livrables
- [x] Cahier de conception préliminaire (10–15 pages)
- [x] Architecture réseau + schéma
- [x] Liste des outils & environnements retenus

Durée : 1 mois — Deadline interne : 15 Décembre 2025

---

### Phase 2 — Mise en place des machines & infra (16 Déc → 15 Jan)
Objectif : Préparer l’environnement virtuel pour le développement.

Tâches
- Installer VMware + créer les 4 machines :
  - Routeur : Parrot OS / Debian
  - Honeypot : Ubuntu Server + Cowrie
  - Victime : Ubuntu Server
  - Attaquant : Kali (OS principal)
- Configurer le réseau isolé VMnet2
- Mettre en place les communications inter-VM
- Préparer les outils (Python, pip, scapy, etc.)

Livrables
- [x] Topologie réseau fonctionnelle
- [x] VMs installées et testées
- [x] Accès SSH + tests ping entre machines

Durée : 1 mois — Deadline interne : 15 Janvier 2026

---

### Phase 3 — Collecte & Préparation des données IA (15 Jan → 20 Fév)
Objectif : Construire un dataset pour entraîner la détection.

Tâches
- Télécharger dataset public (CIC-IDS2017 ou UNSW-NB15)
- Nettoyer, normaliser et préparer les features
- Capturer des attaques dans le laboratoire (nmap, hydra…)
- Mélanger données réelles + datasets publics
- Diviser en train/test/validation

Livrables
- [x] Dataset propre (CSV, labellisé)
- [x] Notebook `preprocessing.ipynb`
- [x] Rapport de préparation des données

Durée : 1 mois — Deadline interne : 20 Février 2026

---

### Phase 4 — Développement du modèle IA (20 Fév → 31 Mars)
Objectif : Construire, entraîner, tester et sélectionner le meilleur modèle.

Tâches
- Tester plusieurs modèles :
  - RandomForest
  - SVM
  - XGBoost
  - MLP (réseau de neurones léger)
- Comparer accuracy / recall / F1-score
- Choisir le meilleur modèle
- Exporter le modèle en `.pkl`
- Intégrer un script Python pour charger le modèle

Livrables
- [x] Notebook `model_training.ipynb`
- [x] Modèle final `detector.pkl`
- [x] Rapport IA (méthode / résultats / métriques)

Durée : 1.5 mois — Deadline interne : 31 Mars 2026

---

### Phase 5 — Implémentation du routeur défensif (1 Avr → 30 Avr)
Objectif : Construire le cœur du projet.

Tâches
- Module de capture de trafic (Python + scapy)
- Module de classification (chargement du modèle IA)
- Module de décision (bloquer / rediriger)
- Intégration avec iptables / nftables
- Système de logs
- Création API interne (FastAPI)
- Tableau de bord web (React / Vue)

Livrables
- [x] Routeur fonctionnel
- [x] Dashboard web
- [x] Documentation interne
- [x] Démonstration interne

Durée : 1 mois — Deadline interne : 30 Avril 2026

---

### Phase 6 — Intégration du Honeypot (1 Avr → 15 Mai)
Cette phase se fait en parallèle du développement du routeur.

Tâches
- Déploiement Cowrie
- Configuration des ports (SSH, Telnet)
- Scripts de redirection automatique vers le honeypot
- Collecte des logs
- Envoi des logs vers le dashboard

Livrables
- [x] Honeypot opérationnel
- [x] Redirection automatisée
- [x] Logs exploitables pour analyse

Durée : 2 semaines à 1 mois — Deadline interne : 15 Mai 2026

---

### Phase 7 — Tests complets & Validation (10 Mai → 25 Mai)
Objectif : Valider l’ensemble du système par des tests d’attaque.

Tâches
- Tests d’attaques :
  - scan nmap
  - brute-force hydra
  - SQL injection
  - port scanning agressif
- Vérifier :
  - détection par le modèle IA
  - blocage / redirection
  - capture des logs dans le honeypot
- Mesurer performances et analyser faux positifs

Livrables
- [x] Rapport de tests (captures d’écran, résultats)
- [x] Tableau de performances
- [x] Corrections finales

Durée : 2 semaines — Deadline interne : 25 Mai 2026

---

### Phase 8 — Rédaction & Soutenance (25 Mai → 5 Juin)
Objectif : Livrer le PFE complet et préparer la soutenance.

Tâches
- Rédaction du rapport final (80–120 pages) :
  - État de l’art
  - Architecture
  - Modèle IA
  - Honeypot
  - Tests & résultats
- Préparer slides PowerPoint
- Préparer démonstration en live

Livrables
- [x] Rapport final
- [x] Sources
- [x] Slides
- [x] Vidéo / démo (optionnel)

---

## Timeline visuelle (résumé)
- Nov (fin)–Dec : Étude & Cadrage  
- Dec–Jan : Infra + VMs  
- Jan–Fév : Dataset IA  
- Fév–Mars : Modèle IA  
- Avril : Routeur IA + Dashboard  
- Avril–Mai : Honeypot  
- Mai : Tests & validation  
- Fin Mai–Début Juin : Rapport + soutenance

---

## IA — Calendrier recommandé
- Jan–Fév : collecte et preprocessing dataset  
- Fév–Mars : développement du modèle IA  
- Avril : intégration du modèle dans le routeur  
- Mai : tests d’attaques + validation IA

---

## Remarques & bonnes pratiques
- Versionner documents (docs/, notebooks/, models/) dans le repo.  
- Automatiser captures et tests via scripts reproducibles.  
- Documenter commandes d’installation des VMs et topologie réseau.  
- Prévoir sauvegarde et anonymisation des logs si nécessaires.

--- 

