# Installation

Les librairies suivantes sont nécessaires pour cette formation :
* Python 3.6+
* numpy
* [matplotlib](https://matplotlib.org/users/installing.html)
* [pandas](https://pandas.pydata.org/pandas-docs/stable/getting_started/install.html)
* [Jupyter notebook](https://jupyter.readthedocs.io/en/latest/install.html)
* [scikit-learn](https://scikit-learn.org/stable/install.html)
* [tensorflow](https://pypi.org/project/Keras/)

Nous allons voir comment les installer.

## 1. Installation de Python
**Si vous n'avez pas déjà Python installé sur votre machine**, installez Anaconda en téléchargeant la version correspondant à votre OS et en suivant les instructions disponibles [ici](https://docs.anaconda.com/anaconda/install/).

---

## 2. Téléchargement du dossier de la formation

Téléchargez ou clonez le répertoire git disponible [ici](https://git.meteo.fr/deep_learning/formation-machinelearning).

---

Dans la suite des instructions, le terme ```terminal``` désigne :

* un **terminal classique** pour les utilisateurs de Linux ou MacOS.
* un **Anaconda Powershell Prompt** pour les utilisateurs de Windows ayant installé Python avec Anaconda.
* une **invite de commande 'cmd.exe'** pour les utilisateurs de Windows ayant installé Python d'une autre façon. Dans ce cas, il vous faudra peut-être modifier vos variables d'environnement pour indiquer à Windows les chemins vers Python et pip. 

---

## 3. **(Optionnel)** Utilisation d'un environnement virtuel Conda

Si vous utilisez Python régulièrement, afin de préserver votre environnement et configuration de travail, vous pouvez **créer un environnement virtuel Python**. Ainsi les modifications faites lors de l'installation seront faites uniquement dans ce nouvel environnement. Voici la marche à suivre avec **Conda** :

1. Pour créer un nouvel environnement : ouvrez un terminal et entrez ```conda create -n my_new_env_name python=3.7```
2. Pour activer le nouvel environnement : ```conda activate my_new_env_name```
3. Pour revenir à votre configuration habituelle quand vous avez fini de travailler sur la formation MLFLow : ```conda deactivate```

---



---
## 4. Installation des librairies Python

Dans un terminal, naviguez jusqu'au dossier de la formation. Installez les librairies avec la commande suivante : ```pip install -r requirements.txt```.

---

## 5. Vérification de l'installation

Ouvrez un terminal et naviguez jusqu'au dossier de la formation. Entrez ```jupyter notebook```. L'interface Jupyter doit s'ouvrir dans votre navigateur. Cliquez sur le notebook ```formation-machinelearning.ipynb```. Le notebook doit s'ouvrir dans un nouvel onglet. Exécutez la première cellule qui contient les instructions ```import```. Aucun message d'erreur ne doit apparaître.

Si vous avez des messages d'erreur du type ```Import error : Could not import ...``` , revenez à l'étape 4. Si vous avez toujours des messages d'erreur ensuite, contactez [bruno.pradel@meteo.fr](bruno.pradel@meteo.fr).
