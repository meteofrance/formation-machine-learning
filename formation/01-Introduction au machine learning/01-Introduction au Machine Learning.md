---
marp: true

footer: 'Formation Permanente Météo-France | Introduction au Machine Learning'
paginate: true
---

<style>
 
 
h1 {
 color: SteelBlue;
 } 
 
h2 {
 color: SteelBlue ; 
 } 
 
h3 {
 color: Black ; 
 } 
 
img[alt~="center"] {
  display: block;
  margin: 0 auto;
}

</style>

![Logo météo](./Images/logo2.PNG)

<br/>

Introduction : le Machine Learning
==

<br/>


### Présentation partagée sous la licence Apache 2.0


---
Grandes catégories d’algorithmes de machine learning 
--
![h:550px center](./Images/02-intro_ML/types_apprentissages.PNG)


---
Classification / Régression
-
![h:350px center](./Images/02-intro_ML/Reg_Clas.PNG)


|Régression   |Classification|
|:---:|:---:|
|Prédire une variable quantitative|Prédire une classe (qualitative, discrète)|


---
## Apprentissage supervisé / non supervisé

##### ■ Apprentissage supervisé : Nécessite un jeu d’entraînement X (prédicteurs), y (prédictants, ie. variables que l'on veut prévoir)

* Application principale: la classification ou la regression

* Exemples: corriger la température prévue par modèle de PNT, dire si de la neige est présente sur une image webcam

##### ■ Apprentissage non supervisé : Nécessite un jeu d’entraînement contenant uniquement des X

* Application principale: le clustering

* Exemple: classer des situations météo en groupes homogènes


---
## Une première méthode de Machine Learning:
# La Régression Linéaire


---
La régression linéaire
--

#### ■ Méthode d’apprentissage supervisé :

* Un jeu d’entraînement X, y

  * X : la superficie des maisons

  * y : le prix de vente

#### ■ Exemple : prévoir le prix de vente des maisons en fonction de leur superficie


---
La régression linéaire: l'intuition
--
**Trouver la droite qui se rapproche le plus du nuage de points**

![h:500 center](./Images/02-intro_ML/regression_lineaire.PNG)


---
La régression linéaire: l'intuition
--
#### ■ Comment définir la « meilleure » droite ?

# **Définir une fonction de coût**

#### ■ La « meilleure » droite est celle qui minimise la fonction de coût.

---
## La fonction de coût

#### ■ Soit $x$, $y$ un échantillon du jeu d’entraînement (superficie et prix d'une maison)

#### ■ Soit $h(x)$ notre prédiction : $h(x) = w_0.x + w_1$

#### ■ Une fonction de coût possible: écart quadratique moyen entre les prédictions et la vérité terrain

$$
J = \frac{1}{2m} \times \sum_{i=1}^{m}(h(x_i)-y_i)^2
$$
$m$ étant le nombre d’échantillons dans le jeu d’entraînement.

---
## La fonction de coût: **Trouver le minimum**

![h:450px center](./Images/02-intro_ML/descente_gradient.PNG)


---
## La fonction de coût: **La descente de gradient**

![h:450px center](./Images/02-intro_ML/convergence.PNG)


---
## La fonction de coût: **Le calcul du gradient**

#### ■ Application à la régression linéaire

$$
J = \frac{1}{2m} \times \sum_{i=1}^{m}(h(x_i)-y_i)^2
$$
Avec $h(x) = w_0.x + w_1$

#### ■ Gradient :
$$
\frac{\partial J}{\partial w_0} = \frac{1}{m} \sum_{i=1}^{m}x_i.(h(x_i)-y_i)
$$
$$
\frac{\partial J}{\partial w_1} = \frac{1}{m} \sum_{i=1}^{m}(h(x_i)-y_i)
$$


---
## La fonction de coût: **Le calcul du gradient**

#### ■ Répéter autant de fois que nécessaire :

![h:350px center](./Images/02-intro_ML/convergence2.PNG)

#### ■ $\alpha$ est le coefficient d’apprentissage (learning rate)


---
## La convergence en image

<https://www.youtube.com/watch?v=1hGsKphwC-A> 


---
## Influence du learning rate

![h:450px center](./Images/02-intro_ML/learning_rate.PNG)

---


## Et si le jeu de données est très gros ?

#### ■ Rappel calcul des gradients pour la régression linéaire :


![image learning rate center](./Images/02-intro_ML/gradient.PNG)


####  ■ Si m est très grand et X de dimension élevée, alors calculer la somme devient très long, voire interminable...

#### ■ Exemple : 1 million d’images en 1024x1024


##### [IL FAUT CENTER!] PROBLEME...

---
## La solution : la descente de gradient stochastique

#### ■ A chaque étape de descente de gradient, au lieu de prendre l’ensemble des échantillons d’un coup comme ceci :

![h:180px center](./Images/02-intro_ML/formule1.PNG)

#### ■ On itère sur les échantillons un par un :

pour i allant de 1 à m, répéter :
![h:175px center](./Images/02-intro_ML/formule2.PNG)


---
  
## Illustration


|Full batch gradient descent (FBGD)|Stochastic gradient descent (SGD)|
|:---:|:---:|
| ![Full batch/Sochastic](./Images/02-intro_ML/full_batch_gradient_descent.PNG) | ![](./Images/02-intro_ML/stochastic_gradient_descent.PNG) |

---

## Démo en images

 <https://www.youtube.com/watch?v=HvLJUsEc6dw>

---

## Taille de batch (batch size)


#### ■ Full batch GD : calcul du gradient sur l’ensemble du jeu de données
* Inconvénient : demande le chargement de toutes les données en RAM ce qui est impossible pour les grands jeux de données.

#### ■ Stochastic GD : on estime le gradient échantillon par échantillon
* Inconvénient : lent et convergence plus chaotique.

#### ■ Compromis : mini-batch gradient descent

* On estime le gradient sur k échantillons à la fois (par exemple 32 échantillons).

#### En pratique, on essaie d'avoir le plus grand batch que la carte graphique peut acceuillir.

---


## La notion d’epoch

#### ■ Dans la SGD, on estime le « gradient » échantillon par échantillon, ou par mini-batchs de quelques échantillons

* Une passe complète sur le jeu de données s’appelle : 

  
 ![une_epoch center](./Images/02-intro_ML/epoch.PNG)

#### ■ Le nombre d’épochs est donc le nombre de passes effectuées sur le jeu d’entraînement lors de l’apprentissage.

---


## Des questions sur la descente de gradient ?

---


## Hyper-paramètres – comment « régler » un modèle de Machine Learning

#### ■ Que peut-on modifier dans un modèle de Machine Learning ?

― Le type et la complexité du modèle

* La régression linéaire est un modèle simple, mais on peut le complexifier : polynôme de degré n, random forest, réseaux de neurones...

― Certains paramètres spécifiques du modèle

* Pour un réseau de neurones : nb de couches, nb de neurones par couche...

― Mais aussi : le learning rate, la taille des batchs, le nombre d'épochs ...

####  **Comment choisir ces hyper-paramètres ?**

---


## Evaluer le modèle
**Première idée:** choisir les hyper-paramètres qui fonctionnent le mieux sur le jeu d’entraînement

![h:65px entraînement center](./Images/02-intro_ML/entrainement.PNG)

##### Pas bon. Le modèle risque de ne pas être capable de généraliser.


![h:280px overfit center](./Images/02-intro_ML/overfitting.PNG)

---

## Evaluer le modèle

**Deuxième idée:** 
* Choisir les hyper-paramètres qui fonctionnent le mieux sur un jeu de test

![h:70px entraînement test center](./Images/02-intro_ML/entrainement_test.PNG)

#####  Pas bon. Aucune garantie que l’algorithme fonctionnera bien sur de nouvelles données. 

---

## Evaluer le modèle


**Troisième idée:** 
* Entraîner sur le jeu d’entraînement, choisir les hyper-paramètres qui fonctionnent le mieux sur un jeu de validation, puis une fois le modèle réglé, l’évaluer sur un jeu de test.

![h:70px entraînement test_validation center](./Images/02-intro_ML/entrainement_test_valid.PNG)

#####  C’est mieux ! 

---


## Sous-apprentissage - Sur-apprentissage

![h:250px sur_sous_app center](./Images/02-intro_ML/sur_sous_apprentissage.PNG)


|Sous-apprentissage|Bon modèle|Sur-apprentissage|
|:---:|:---:|:---:|
|Trop simple pour expliquer la variance| |Colle trop au bruit du jeu de données |

---

  
## Sous-apprentissage - Sur-apprentissage

![h:500px biais_variance center](./Images/02-intro_ML/sur_sous_apprentissage2.PNG)

---


## Combattre l’underfitting ("sous-apprentissage")


― Complexifier le modèle

 * Exemple: modèle quadratique au lieu d’un modèle linéaire pour prédire le prix des maisons

 ―   Ajouter des prédicteurs

 * Exemple: il existe d’autres paramètres que la superficie qui influent sur le prix des maisons. Par exemple la localisation, le nombre de chambres, la distance au centre-ville...

---

## Combattre l’overfitting ("sur-apprentissage") 1/2

― Ajouter des données d’entraînement

 *  Préférer situations météorologiques diverses (sur plusieurs années) plutot que sur courte période (situations très corréllées)

― Simplifier le modèle

 *  Eviter que le modèle dispose de suffisement de poids pour « apprendre par coeur » le jeu d’entraînement.
---

## Combattre l’overfitting ("sur-apprentissage") 2/2
― Limiter la capacité d’apprentissage du modèle

 * De nombreuses méthodes de régularisation permettent d'éviter le surapprentissage: *lasso, augmentation de données, early-stopping, dropout*.

― Entraîner le modèle moins longtemps ()

 *  Réduire le nombre d'épochs pour un réseau de neurones puisque le processus d'apprentissage est itératif

― Utiliser des ensembles

 * Comme en météo, entraîner plusieurs modèles et combiner leurs prédictions.

---

##  Des questions? 

---

![Logo météo](./Images/logo2.PNG)

<br/>

# Python pour le Machine Learning 

<br/>


---


## Utilisation de la Librairie Pandas 

#### Importer des fichiers (Excel, CSV) avec Pandas

#### Preparation d'un jeu de données

*  Suppression des valeurs aberrantes / manquantes

---


## Présentation de Scikit-Learn

### Séparer les données en jeux d'entraînement et de test

### Réaliser une régression linéaire

### Réaliser une classification non supervisée

* Prédiction d’une classe et des probabilités pour chaque classe

![sklearn](./Images/03-python_data_science/sklearn_code2.PNG) 

---


## Un projet Machine Learning en Python

* Les grandes étapes et les librairies associées

