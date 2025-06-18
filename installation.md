# Installation

## 1. Téléchargement du repo git de la formation

Clonez ce répertoire git:

```bash
git clone https://github.com/meteofrance/formation-machine-learning.git
```

Dans la suite des instructions, le terme `terminal` désigne :

* un **terminal classique** pour les utilisateurs de Linux ou MacOS.
* un **Anaconda Powershell Prompt** pour les utilisateurs de Windows ayant installé Python avec Anaconda.
* une **invite de commande 'cmd.exe'** pour les utilisateurs de Windows ayant installé Python d'une autre façon. Dans ce cas, il vous faudra peut-être modifier vos variables d'environnement pour indiquer à Windows les chemins vers Python et pip. 

---

## 1. Préparation de l'environnement Python

### Prérequis (au choix)
- Disposer de **[conda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html)** ou **[micromamba](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html)**.

- Disposer de **[docker](https://docs.docker.com/engine/install/)**.
---

### Micromamba

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


### Docker à Météo-France
Après avoir cloné le *monorepo* du LabIA, il vous faut construire le conteneur de la formation. Pour cela, il faut vous placer à la racine du repo de la formation et lancer la commande suivante:

```bash
runai build
```

---

## 2. Vérification de l'installation

### Micromamba


### Docker à Météo-France

Lancez le serveur Juypter Notebook:
```bash
runai notebook
```