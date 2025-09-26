# Initiation au Machine learning

Cette formation a été conçue pour initier au Machine Learning, en deux jours, des chefs de projets. Elle s'adresse à des personnes n'ayant pas de connaissance préalable du domaine.

La formation est en langue française.

Cette formation a été initialement créée par Météo-France pour ses salariés, mais elle est parfaitement adaptée à d'autres domaines d'application que la météorologie. Les supports de cours et les codes sources des travaux pratiques sont partagés en open-source dans ce dépôt.

## Pré-requis

  * Connaissances de base en programmation, idéalement en python
  * Mathématiques, niveau premier cycle universitaire

## Programme de la formation

La formation alterne cours et travaux pratiques. Elle est prévue pour être suivie dans l'ordre suivant :

  * Cours 00    - Programme de la formation
  * Cours 01    - Introduction au Machine Learning 
  * Cours - Notebook 02.1  - Manipulation et description des données  
  * TP 01       - Python pour Data Scientists Partie 1 Données
  * Cours - Notebook 02.2  - Algorithmes de machine learning  
  * Cours - Notebook 02.3  - Evaluation et sélection de modèles 
  * TP 01       - Python pour Data Scientists Partie 2 Modélisation
  * Cours - Notebook 02.4.1  - Forêts d'arbre aléatoire
  * Cours - Notebook 02.4.2  - Clustering - Kmeans
  * TP 02       - Reconnaissance de chiffres manuscrits (modèles linéaires, random forest...)
  * Cours 02    - Introduction au Deep Learning - Vidéo : https://youtu.be/F3F75xnhG0M (contribuée par Lior Perez)
  * Cours 03    - La librairie Keras
  * TP 03       - Réseaux convolutionnels : reconnaissance de chiffres manuscrits avec Keras - Vidéo : https://youtu.be/p5HZ5YaCc04 (contribuée par Sirine Hdiji)
  * Cours 04    - Réseaux récurrents

## Les Travaux Pratiques

Dans le dossier de chaque TP, vous trouverez :

  * Le TP lui-même, sous la forme d'un notebook Jupyter à compléter,
  * La correction du TP.

## Format des fichiers

Les planches des cours sont au format Markdown, afin d'être aisément modifiables. Une version pdf est également fournie. La version pdf est générée à partir du Markdown avec l'utilitaire Marp :

https://yhatt.github.io/marp/

## Installation

### 1. Téléchargement du repo git de la formation

Clonez ce répertoire git à la racine de votre home:

```bash
cd
git clone https://github.com/meteofrance/formation-machine-learning.git
```

Dans la suite des instructions, le terme `terminal` désigne :

* un **terminal classique** pour les utilisateurs de Linux ou MacOS.
* un **Anaconda Powershell Prompt** pour les utilisateurs de Windows ayant installé Python avec Anaconda.
* une **invite de commande 'cmd.exe'** pour les utilisateurs de Windows ayant installé Python d'une autre façon. Dans ce cas, il vous faudra peut-être modifier vos variables d'environnement pour indiquer à Windows les chemins vers Python et pip. 


### 1. Préparation de l'environnement Python

#### Prérequis (au choix)
- Disposer de **[conda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html)** ou **[micromamba](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html)**.

- Disposer de **[docker](https://docs.docker.com/engine/install/)**.

#### Micromamba

Commencez par créer un environnement micromamba et y installer `python 3.10`:
```bash
micromamba create -n formation_ml
micromamba activate formation_ml
micromamba install python=3.10
```

Installez ensuite les librairies qui vont nous être utiles lors de la formation:
```bash
micromamba install -f requirements.txt
```

#### Docker à Météo-France
Se connecter à priam. Dans un terminal, taper la commande suivant 
```bash
ssh user_XXX@priam-sidev.meteo.fr
```
>  **Prérequis** : Disposer de l'outil *runai*
>
>Pour vérifier si *runai* est installer, taper la commande suivante qui affiche vos ports *SSH*:
> ```bash
> runai listuserports
>```
>
> Si *runai* n'est pas installé, commencez par cloner le repertoire git de *runai* du LabIA:
> ```bash
> cd
> git clone https://git.meteo.fr/dsm-labia/libs/runai.git
> ```
>
> Ajouter la ligne suivante à votre *.bashrc*, cela permet d'ajouter *runai* à votre environnement d'execution (i.e. d'utiliser directement *runai* en ligne de commande):
> ```bash
> export PATH=$PATH:$HOME/runai
>```
>
>Activer la modification dans votre *.bashrc* en utilisant la commande suivante:
>```bash
>source ~/.bashrc
>```

Il vous faut maintenant construire le conteneur de la formation. Pour cela, il faut vous placer à la racine du repo de la formation et lancer la commande suivante:

```bash
cd ~/formation-machine-learning
runai build
```

### 2. Vérification de l'installation

#### Micromamba

#### Docker à Météo-France

Lancez le serveur Juypter Notebook:
```bash
cd ~/formation-machine-learning
runai notebook formation/
```

> Utilisation avancée de Jupyter Notebook sur un noeud de calcul GPU depuis priam (uniquement pour la fin de la formation):
> ```bash
> runai gpu_play 1 # reserver un GPU sur noeud
> runai build # s'assurer que l'image docker est à jour !
> runai notebook_gpu formations/ # lancer jupyter dans le dossier de la formation 
> ```
>
> Il faut maintenant créer un tunnel ssh entre priam et le noeud de calcul. Dans un nouveau terminal sur priam :
> ```bash
> runai gpu_play 1 # reserver un GPU sur noeud
> runai build # s'assurer que l'image docker est à jour !
> runai notebook_gpu formations/ # lancer jupyter dans le dossier de la formation 
> ```

## Exporter des slides en pdf avec Marp

Pour exporter des slides avec marp, il est nécessaire d'installer l'extension "Marp for VS Code" dans votre VS Code, puis de définir dans les paramètres de Marp (`@ext:marp-team.marp-vscode`) les paramètres suivants: `markdown.marp.browser` et `markdown.marp.browserPath`.
Exemple: si vous souhaitez utiliser le navigateur Firefox de votre poste local vous aurez: `markdown.marp.browser: firefox` et `markdown.marp.browserPath: C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Firefox`.


## Comment contribuer ?

Les contributions pour améliorer ce cours ou pour le compléter sont bienvenues.

Si vous souhaitez contribuer, plusieurs issues sont déjà ouvertes et attendent votre aide.

Vous pouvez également soumettre des pull requests pour apporter des corrections mineures. Si vous souhaitez apporter des modifications importantes, merci d'ouvrir d'abord une issue.

## Crédits

Contributeurs ayant participé à la création de cette formation : Lior Perez, Simon Moisselin, Valentin Fouqueau, Bruno Pradel, Oscar Dewasmes, Théo Tournier.

Certains contenus ont été empruntés à d'autres formations. Merci à leurs auteurs :

  * Cours de Machine Learning de Stanford par Andrew NG, sur la plateforme Coursera
  * Cours de Deep Learning de Stanford University par Fei-Fei Li, Justin Johnson et Serena Yeung
  * Scikit-learn Tutorial par Jake VanderPlas

Si vous trouvez des documents non crédités, ou si nous avons involontairement utilisé sans votre accord un contenu vous appartenant, veuillez nous contacter.

If you believe that we have unintentionally used some contents without giving credits or without approval from the authors, please contact us.

## Licence

Copyright 2018 - Météo-France

Cette formation est partagée par Météo-France sous la licence Apache 2.0.

This content is shared by Météo-France under the Apache 2.0 licence.
