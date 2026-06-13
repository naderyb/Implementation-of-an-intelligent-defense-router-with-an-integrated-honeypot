# 🎤 Discours de Soutenance — HoneyNet
### Nader & Mariya | 25 minutes | IFAG 2025/2026

---

> **Légende :**
> - 🟦 **NADER** parle
> - 🟧 **MARIYA** parle
> - ⏱️ Durée estimée indiquée pour chaque partie
> - 🔄 = Transition / switching

---

## SLIDE 1 — Page de titre
### 🟦 NADER *(~1 min)*

Bonjour à tous.

Monsieur le jury, monsieur l'encadrant, permettez-nous de vous présenter notre projet de fin d'études.

Nous nous appelons Nader et Mariya, et ensemble on forme… le binôme du binaire.

Notre projet s'appelle **HoneyNet** — un routeur intelligent avec des honeypots intégrés.

L'idée de base est simple : et si votre routeur, au lieu de juste bloquer les attaques, pouvait les **piéger** ?

C'est exactement ce qu'on va vous expliquer aujourd'hui.

---

## SLIDE 2 — Introduction
### 🟦 NADER *(~1 min 30)*

Depuis quelques années, les attaques informatiques évoluent très vite. Elles deviennent plus sophistiquées, plus ciblées, et les solutions classiques — les firewalls, les antivirus — peinent à suivre.

On s'est posé une question simple : est-ce qu'on peut faire mieux ? Est-ce qu'on peut concevoir un système qui **réagit intelligemment** aux attaques, qui piège l'attaquant dans un environnement qu'on contrôle, pour observer ce qu'il fait et le neutraliser ?

C'est cette question qui a donné naissance à HoneyNet.

🔄 *[Nader regarde Mariya]*
Justement Mariya, avant d'aller plus loin, est-ce que tu peux nous expliquer rapidement ce que ça veut dire concrètement ?

---

## SLIDE 3 — Plan de la présentation
### 🟧 MARIYA *(~1 min)*

Bien sûr Nader.

Pour vous donner une vue claire, voici comment on va structurer notre présentation.

On commence par les **définitions** des composants clés. Ensuite on vous montre la **vue d'ensemble** du système — comment tout s'articule. On passe ensuite à la **solution de routage**, puis à l'**intelligence artificielle** qu'on a intégrée. On vous montrera le **routeur** en détail, le **tableau de bord**, et on finira par les **défis** qu'on a rencontrés, avant la **conclusion**.

Allez, on commence !

---

## SLIDE 4 — Composants majeurs (Définitions)
### 🟧 MARIYA *(~2 min)*

Notre système repose sur trois composants principaux.

Le premier, c'est le **routeur**. Imaginez-le comme un agent de sécurité à l'entrée d'un bâtiment. Il analyse chaque connexion qui arrive et décide quoi en faire.

Le deuxième, c'est le **honeypot** — littéralement "le pot de miel". C'est un faux serveur qu'on met en place exprès pour attirer les attaquants. On leur tend un piège, et une fois dedans, on observe tout ce qu'ils font, sans jamais exposer nos vraies ressources.

Et le troisième, c'est l'**IA** — l'intelligence artificielle. C'est le cerveau du système. Elle analyse les données en temps réel et prend les décisions automatiquement.

🔄 *[Mariya fait une pause, sourit]*
Ces trois composants, seuls, c'est bien. Mais ensemble ? C'est là où ça devient vraiment intéressant. Nader, tu veux bien nous montrer comment ils s'assemblent ?

---

## SLIDE 5 — Vue d'ensemble (illustration pixel art)
### 🟦 NADER *(~1 min 30)*

Merci Mariya.

Ce schéma résume tout le flux de notre système.

Quand un attaquant arrive sur le réseau, le routeur capture et analyse son trafic. L'IA classe le type d'attaque. Et selon ce que l'IA décide, le trafic est redirigé vers le bon honeypot — soit Cowrie pour les attaques SSH, soit DVWA pour les attaques web.

Pendant tout ce temps, le tableau de bord enregistre tout en temps réel.

L'attaquant, lui ? Il croit avoir trouvé un vrai serveur. Mais il est dans notre piège.

---

## SLIDE 6 — Vue d'ensemble (détail des 3 blocs)
### 🟦 NADER *(~1 min 30)*

Pour être encore plus précis, voici les trois blocs du système :

**Le cerveau** — c'est le routeur intelligent. Il analyse le trafic en continu, apprend les comportements suspects et identifie le type d'attaque.

**Le leurre** — c'est le honeypot. Un serveur vulnérable, conçu pour attirer l'attaquant, l'isoler et l'observer.

**Le moniteur** — c'est le dashboard. Une interface visuelle qui affiche tout ce qui se passe en temps réel.

🔄 *[Nader s'arrête un instant]*
On va maintenant rentrer dans les détails. Mariya, tu veux bien nous parler des honeypots qu'on a choisis ?

---

## SLIDE 7 — Les Honeypots
### 🟧 MARIYA *(~2 min)*

Oui, avec plaisir.

On a déployé deux honeypots.

Le premier c'est **Cowrie**. C'est un honeypot SSH — il simule un accès terminal à un serveur Linux. Il écoute sur le port 2222, et dès qu'un attaquant essaie de se connecter en SSH, on le redirige là-dedans. Il peut taper des commandes, il croit être connecté à un vrai système... mais tout est faux et tout est enregistré.

Le deuxième c'est **DVWA** — Damn Vulnerable Web Application. C'est une application web intentionnellement vulnérable, qui tourne sur le port 80 avec Apache et MySQL. Elle est conçue pour attirer les attaques web comme les injections SQL.

Ces deux honeypots couvrent les deux types d'attaques les plus courants : les attaques réseau et les attaques web.

🔄 *[Mariya marque une pause]*
Pour que ces honeypots soient utiles, il faut que l'IA sache vers lequel rediriger. Et là, ça implique un modèle entraîné sur des vraies données. Nader, le dataset ?

---

## SLIDE 8 — Dataset
### 🟦 NADER *(~1 min 30)*

Exactement.

Pour entraîner notre IA, on avait besoin de données. On a travaillé sur un dataset de plus de **48 000 entrées**, réparties en **5 classes** d'attaques différentes.

On a aussi utilisé du **NLP** — le traitement du langage naturel — pour analyser les commandes et les requêtes des attaquants comme du texte, pas juste comme des chiffres.

Et surtout, on est passés d'une solution **statique** — des règles fixes — à une solution **dynamique** qui apprend et s'adapte.

Concrètement, ça veut dire que plus le système voit d'attaques, plus il devient précis.

---

## SLIDE 9 — Intelligence artificielle (tableau comparatif)
### 🟦 NADER *(~2 min)*

On a testé plusieurs modèles pour trouver le meilleur.

On voit ici que le Random Forest fait 100% de précision — mais c'est trop beau pour être vrai, c'est de l'overfitting. Le Gradient Boosting est presque parfait aussi, mais il met 462 secondes à s'entraîner — beaucoup trop lent pour notre cas.

Le gagnant ? Le **SGDClassifier**. Il atteint **99.84%** de précision avec un F1-Score de 0.9983, et s'entraîne en seulement **0.85 secondes**. C'est rapide, précis, et léger — parfait pour un système temps réel.

🔄 *[Nader incline légèrement la tête vers Mariya]*
Et maintenant qu'on a notre cerveau, voyons comment tout ça tourne dans le routeur. Mariya ?

---

## SLIDE 10 — ai_router.py (le cœur du système)
### 🟧 MARIYA *(~2 min 30)*

Merci Nader.

Voici le schéma du script principal — **ai_router.py**. C'est le cœur de tout le système.

Il fonctionne en 4 étapes.

**Étape 1 — L'initialisation** : au démarrage, le routeur charge le modèle IA, configure les règles réseau avec iptables, et vérifie que tout est en place.

**Étape 2 — La capture des paquets** : avec la librairie Scapy, le routeur capture en temps réel tout le trafic entrant sur les ports 22 et 80. Il filtre le trafic interne pour ne garder que les connexions suspectes.

**Étape 3 — La classification IA** : chaque connexion est vectorisée avec TF-IDF, puis analysée par le SGDClassifier. En moins d'une seconde, le système sait quel type d'attaque c'est.

**Étape 4 — La redirection dynamique** : selon le verdict de l'IA, une règle DNAT est injectée automatiquement — soit vers Cowrie sur le port 2222, soit vers DVWA sur le port 80.

Tout ça, sans aucune intervention humaine.

---

## SLIDE 11 — Défi Technique
### 🟧 MARIYA *(~2 min)*

On a rencontré un problème technique intéressant, et je veux vous en parler parce qu'on en est plutôt fiers.

Quand on redirige une connexion SSH vers Cowrie, il y a une règle SNAT qui remplace l'adresse IP de l'attaquant par l'adresse IP du routeur. Résultat : Cowrie voit le routeur comme source, pas le vrai attaquant. On perd la traçabilité.

Notre solution ? On a ajouté une **règle LOG** qui capture le paquet SYN initial — c'est-à-dire le tout premier paquet de la connexion, avant que le SNAT s'applique. On extrait l'IP réelle via **dmesg**, et on l'envoie directement au dashboard via une requête POST.

Résultat : le dashboard affiche la vraie IP de l'attaquant — dans notre cas, 192.168.244.137 — correctement.

🔄 *[Mariya sourit, avec un air de "on a trouvé un hack propre"]*
Et ce dashboard justement, Nader, montre-nous ce qu'on voit dessus.

---

## SLIDE 12 — Tableau de bord
### 🟦 NADER *(~2 min)*

Le tableau de bord, c'est la fenêtre sur tout ce qui se passe dans le système.

Là on voit une vraie capture de nos tests. **571 événements** au total, dont 140 via Cowrie et 431 via DVWA. On a eu **24 connexions SSH réussies** et **228 attaques SQL**.

Le dashboard permet de :
- Voir les stats **en temps réel**
- Filtrer par source — Cowrie ou DVWA
- Identifier le type d'attaque grâce aux **codes couleur**
- **Exporter en CSV** pour une intégration dans un outil SIEM
- Et vider les logs avec le bouton Flush

C'est une interface pensée pour un analyste de sécurité — claire, rapide, et sans superflu.

---

## SLIDE 13 — Dépôt GitHub
### 🟦 NADER *(~1 min)*

Tout le code source est disponible sur GitHub.

Le dépôt est organisé proprement : le dossier `ai_config_for_router` pour le modèle, `attack_scripts` pour les tests, `dashboard` pour l'interface, et `honeypot_config` pour la configuration de Cowrie et DVWA.

Tout est documenté dans le README pour qu'on puisse cloner et déployer la solution rapidement sur n'importe quel environnement virtuel.

---

## SLIDE 14 — Démonstration
### 🟧 MARIYA *(~2 min)*

On va maintenant vous faire une petite démonstration.

*[Lancer la démo — montrer les étapes à l'écran]*

On lance le routeur avec `./start`. Le modèle IA se charge. Les honeypots démarrent.

On simule maintenant une attaque SSH depuis Kali Linux... le routeur capte le trafic, l'IA classe la connexion comme suspecte, et automatiquement la connexion est redirigée vers Cowrie.

Sur le dashboard — vous pouvez voir l'événement qui apparaît en temps réel, avec l'IP de l'attaquant, la commande qu'il a tapée, et le type d'attaque.

Tout ça, en quelques fractions de seconde, sans qu'on touche à rien.

---

## SLIDE 15 — Conclusion
### 🟧 MARIYA *(~1 min 30)*

Pour conclure, notre projet montre qu'il est tout à fait possible de transformer un réseau passif et rigide en un **système de défense actif, dynamique et autonome**.

Trois mots résument ce qu'on a accompli :

**Vélocité** — notre IA classe une attaque en 0.85 secondes.

**Autonomie** — la boucle complète de détection, classification et redirection se fait sans aucune intervention humaine.

**Transparence** — chaque attaque est tracée, documentée, exportable. C'est ce qu'on appelle de la Cyber Threat Intelligence — une vraie valeur pour n'importe quelle organisation.

---

## SLIDE 16 — Limites & Perspectives
### 🟦 NADER *(~1 min 30)*

On est honnêtes — notre solution a aussi des limites.

Notre dataset est limité en diversité d'attaques. Et l'environnement de test est 100% virtualisé — on n'a pas pu tester sur du matériel physique.

Mais les perspectives sont claires : on peut ajouter de nouveaux honeypots, déployer la solution sur du cloud ou sur infrastructure physique, et surtout enrichir le dataset en continu une fois le système en production — ce qui le rendra de plus en plus précis avec le temps.

🔄 *[Nader regarde le jury avec un sourire]*
Et avec ça, je cède la parole à Mariya pour les derniers mots.

---

## MOT DE FIN
### 🟧 MARIYA *(~30 sec)*

HoneyNet n'est pas juste un projet académique. C'est une vraie solution, conçue avec des outils réels, testée avec de vraies attaques.

On tient à remercier Monsieur Boukabou pour son encadrement tout au long de ce projet.

Merci à vous pour votre attention, et on est prêts pour vos questions.

---

## 🕐 TIMING ESTIMÉ

| Partie | Qui | Durée |
|---|---|---|
| Titre + Introduction | Nader | ~2 min 30 |
| Plan | Mariya | ~1 min |
| Définitions | Mariya | ~2 min |
| Vue d'ensemble | Nader | ~3 min |
| Honeypots | Mariya | ~2 min |
| Dataset + IA | Nader | ~3 min 30 |
| ai_router.py | Mariya | ~2 min 30 |
| Défi technique | Mariya | ~2 min |
| Dashboard + GitHub | Nader | ~3 min |
| Démo | Mariya | ~2 min |
| Conclusion + Limites | Mariya + Nader | ~3 min |
| **TOTAL** | | **~27 min** |

> ⚠️ Ajustez le timing selon la démo — si elle prend plus de temps, raccourcissez légèrement le slide GitHub ou le défi technique.

---

## 🔄 RÉCAP DES MÉTHODES DE SWITCHING

| Type de transition | Exemple dans le discours |
|---|---|
| Question directe | *"Mariya, tu veux bien nous expliquer ?"* |
| Relance thématique | *"Et là, ça implique un modèle entraîné. Nader, le dataset ?"* |
| Regard + prénom | *"[Nader regarde Mariya] Justement..."* |
| Complétion naturelle | *"Et ce dashboard, Nader, montre-nous..."* |
| Cession avec sourire | *"Je cède la parole à Mariya pour les derniers mots."* |
| Transition par curiosité | *"C'est là où ça devient vraiment intéressant. Nader ?"* |
