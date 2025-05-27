---
marp: true
---

<style>
 
.slide {
 background-color: White ;
 font: 25px arial, sans-serif; 
 position: relative;
 background-image: url('../shared_images/logo.png');
 background-repeat: no-repeat, repeat;
 background-position: bottom 10px left 10px;
 }

.slide a {
 color: black;
 }
 
.slide h1 {
 color: Black !important;
 } 
 
.slide h2 {
 color: SteelBlue ; 
 } 
 
 .slide h3 {
 color: LightSkyBlue ; 
 }
 
 .slide h4 { 
 color: Black; 
 }
 
 .slide h5 {
 color: Red
 }
 
</style>

<!-- *page_number: true -->

![Logo météo](../shared_images/logo2.PNG)

<br/>

Introduction : le Machine Learning
==

<br/>


### Présentation partagée sous la licence Apache 2.0

---

<!-- *page_number: true -->

Grandes catégories d’algorithmes de machine learning 
-

<!-- -->

![types apprentissages](Images/intro_ML/types_apprentissages.PNG) 

---
<!-- *page_number: true -->

Régression / Classification
-
<center>
  
![Regression/Classification](Images/intro_ML/Reg_Clas.PNG)



|Régression   |Classification|
|:---:|:---:|
|Prédire une variable quantitative|Prédire une classe (qualitative, discrète)|

</center>

---
<!-- *page_number: true -->

## Apprentissage supervisé / non supervisé

<!-- -->

<center>
<img src="Images/intro_ML/Types_de_learning.PNG" width="300", height=150>

</center>

##### ■ Apprentissage supervisé :

* Nécessite un jeu d’entraînement X, y
  * X : prédicteurs
  * y : variable à prédire

##### ■ Apprentissage non supervisé :

* Nécessite un jeu d’entraînement X

* Application principale : le clustering

* Exemple : classer des situations météo en groupes homogènes

---

<!-- *page_number: true -->


#### Une première méthode de Machine Learning : la régression linéaire



---
<!-- *page_number: true -->



La régression linéaire
--

#### ■ Exemple : prévoir le prix de vente des maisons en fonction de leur taille

#### ■ Méthode d’apprentissage supervisé :

* Un jeu d’entraînement X, y

* X : la taille des maisons

* y : le prix

---
  
<!-- *page_number: true -->

## Trouver la droite qui se rapproche le plus du nuage de points



![regression lineaire](Images/intro_ML/regression_lineaire.PNG)



---

  
<!-- *page_number: true -->

## La régression linéaire : fonction de coût

#### ■ Comment définir la « meilleure » droite ?


![image fonction de coût](Images/intro_ML/fonction_cout.PNG)

#### ■ La « meilleure » droite est celle qui minimise la fonction de coût.





---

<!-- *page_number: true -->

## La fonction de coût

#### ■ Soit x,y un échantillon du jeu d’entraînement
*  x = taille de la maison
*  y = prix de la maison

#### ■ Soit h(x) notre prédiction : h(x) = w<sub>0</sub>.x + w<sub>1</sub>



#### ■ Une fonction de coût possible :

<center>

![Formule4](Images/intro_ML/formule4.PNG)

</center>

m étant le nombre d’échantillons dans le jeu d’entraînement.

#### ■ C’est l’écart quadratique moyen entre les prédictions et la vérité terrain

---


  
<!-- *page_number: true -->
  
## Comment trouver le minimum de la fonction de coût ?

<img src="Images/intro_ML/descente_gradient.PNG" width="900">

---

<!-- *page_number: true -->

## Comment trouver le minimum de la fonction de coût ?

#### ■ La descente de gradient

![Image decente de gradient](Images/intro_ML/convergence.PNG)

---
  
<!-- *page_number: true -->

## Application à la régression linéaire Calcul du gradient

#### ■ Application à la régression linéaire

<center>
  
![formule1](Images/intro_ML/formule3.PNG)

</center>
Avec h(x) = w0.x + w1 

#### ■ Gradient :

<center>
  
![image learning rate](Images/intro_ML/gradient.PNG)
</center>

---
  
<!-- *page_number: true -->

## C’est parti, on dévale la pente

#### ■ Répéter autant de fois que nécessaire :

<img src="Images/intro_ML/convergence2.PNG" width="600">

#### ■ α est le coefficient d’apprentissage (learning rate)

---
  
<!-- *page_number: true -->

## La convergence en images

<center>

<https://www.youtube.com/watch?v=1hGsKphwC-A> 

</center>

---
  
<!-- *page_number: true -->

## Influence du learning rate

<img src="Images/intro_ML/learning_rate.PNG" width="900">

---
  
<!-- *page_number: true -->

## Et si le jeu de données est très gros ?

#### ■ Rappel calcul des gradients pour la régression linéaire :

<center>

![image learning rate](Images/intro_ML/gradient.PNG)

</center>

####  ■ Si m est très grand et X de dimension élevée, alors calculer la somme devient très long, voire interminable...

#### ■ Exemple : 1 million d’images en 1024x1024


##### <center>PROBLEME...</center>

---
  
<!-- *page_number: true -->
  
## La descente de gradient stochastique

#### ■ La solution : la descente de gradient stochastique

#### ■ A chaque étape de descente de gradient, au lieu de prendre l’ensemble des échantillons d’un coup comme ceci :

<center>

<img src="Images/intro_ML/formule1.PNG" height=120>

</center>

#### on itère sur les échantillons un par un :

<center>
  
pour i allant de 1 à m, répéter :

<img src="Images/intro_ML/formule2.PNG" height=120>


</center>

---

<!-- *page_number: true -->
  
## Illustration


|Full batch gradient descent (FBGD)|Stochastic gradient descent (SGD)|
|:---:|:---:|
![Full batch/Sochastic](Images/intro_ML/Full_batch_Stochastic.PNG)

---

<!-- *page_number: true -->

## Démo en images

 <https://www.youtube.com/watch?v=HvLJUsEc6dw>

---

<!-- *page_number: true -->

## Mini-batch


#### ■ Full batch gradient descent : on calcule le gradient sur l’ensemble du jeu de données
* Inconvénient : beaucoup trop long sur gros jeu de données

#### ■ SGD : on estime le gradient échantillon par échantillon
* Inconvénient : lent et convergence plus chaotique

#### ■ Compromis : mini-batch gradient descent

* On estime le gradient sur k échantillons à la fois (par exemple 32 échantillons)

##### <center> C’est la méthode utilisée en pratique  </center>

---
  
<!-- *page_number: true -->

## La notion d’epoch

#### ■ Dans la SGD, on estime le « gradient » échantillon par échantillon, ou par mini-batches de quelques échantillons

* Une passe complète sur le jeu de données s’appelle : 

<center>
  
 ![une_epoch](Images/intro_ML/epoch.PNG)
 
 </center>

#### ■ Le nombre d’épochs est donc le nombre de passes effectuées sur le jeu d’entraînement lors de l’apprentissage.

---
  
<!-- *page_number: true -->

## <center>  Des questions sur la descente de gradient ? </center>

---
  
<!-- *page_number: true -->

## Hyper-paramètres – comment « régler » un modèle de Machine Learning

#### ■ Que peut-on modifier dans un modèle de Machine Learning ?

― Le type et la complexité du modèle

* La régression linéaire est un modèle simple, mais on peut le complexifier : polynôme de degré n, random forest, réseaux de neurones...

― Certains paramètres spécifiques du modèle

* Pour un réseau de neurones : nombre de couches, nombre de neurones par couche...

― Le learning rate

― La taille des mini-batches

#### ■ Comment choisir ces hyper-paramètres ?

---
  
<!-- *page_number: true -->

## Evaluer le modèle
Première idée : choisir les hyper-paramètres qui fonctionnent le mieux sur le jeu d’entraînement

![entraînement](Images/intro_ML/entrainement.PNG)

##### Pas bon. Le modèle risque de ne pas être capable de généraliser.

<center>

<img src="Images/intro_ML/overfitting.PNG" height=300>

</center>

---

<!-- *page_number: true -->

## Evaluer le modèle

Deuxième idée : choisir les hyper-paramètres qui fonctionnent le mieux sur un jeu de test

![entraînement test](Images/intro_ML/entrainement_test.PNG)

##### <center> Pas bon. Aucune garantie que l’algorithme fonctionnera bien sur de nouvelles données. </center> 

---

<!-- *page_number: true -->

## Evaluer le modèle


Troisième idée : entraîner sur le jeu d’entraînement, choisir les hyper-paramètres qui fonctionnent le mieux sur un jeu de validation, puis une fois le modèle réglé, l’évaluer sur un jeu de test.

![entraînement test_validation](Images/intro_ML/entrainement_test_valid.PNG)

##### <center> C’est mieux ! </center>

---
  
<!-- *page_number: true -->

## Sous-apprentissage - Sur-apprentissage
<center>

<img src="Images/intro_ML/sur_sous_apprentissage.PNG" height=270, width=800>

</center>


|Sous-apprentissage|Bon modèle|Sur-apprentissage|
|:---:|:---:|:---:|
|modèle trop simple pour expliquer la variance||modèle qui colle trop au bruit du jeu de données |

---
  
<!-- *page_number: true -->
  
## Sous-apprentissage - Sur-apprentissage

<center>

<img src="Images/intro_ML/sur_sous_apprentissage2.PNG" width=850>

</center>

---
  
<!-- *page_number: true -->

## Combattre l’underfitting


#### ■ Combattre l’underfitting

― Complexifier le modèle

 * Ex : modèle quadratique au lieu d’un modèle linéaire pour prédire le prix des maisons

 ―   Ajouter des prédicteurs

 * Ex : il existe d’autres paramètres que la taille qui influent sur le prix des maisons. Par exemple le nombre de chambres, la distance au centre-ville...

---

<!-- *page_number: true -->

### Combattre l’overfitting

##### ■ Combattre l’overfitting
― Ajouter des données d’entraînement

 *  Deux exemples de maisons ne permettent pas de créer un modèle qui généralise bien

― Simplifier le modèle ou retirer des prédicteurs

 *  Eviter que le modèle parvienne à « apprendre par coeur » le jeu d’entraînement

― Entraîner le modèle moins longtemps

 *  En français, l’overfitting se dit « surapprentissage ».  

― Limiter la capacité d’apprentissage du modèle

 * Il existe plusieurs méthodes dont la régularisation et le dropout.

― Utiliser des ensembles

 * Comme en météo, entraîner plusieurs modèles et combiner leurs prédictions.

---

<!-- *page_number: true -->

## <center> Des questions? </center> 

---

<!-- *page_number: true -->

![Logo météo](../shared_images/logo2.PNG)

<br/>

# Python pour le Machine Learning 

<br/>


---

<!-- *page_number: true -->

## Part de marché chez les data scientists (2019)

<center>

![Part de Marché](Images/python_data_science/part_marché.PNG)

</center>

---
  
<!-- *page_number: true -->

## Librairies Pythons 

![librairies python](Images/python_data_science/librairies.PNG)

---
 
<!-- *page_number: true -->

## Lire des fichiers Excel : utilisation de la Librairie Pandas 

![Excel](Images/python_data_science/pandas.PNG)

---
  
<!-- *page_number: true -->

## Importer un fichier Excel avec Pandas

![code d'importation](Images/python_data_science/code_pandas.PNG)

---
  
<!-- *page_number: true -->

## Importer un fichier csv avec Pandas

![importation csv](Images/python_data_science/code_pandas2.PNG)

*  Préparation du jeu de données (X,Y) pour le modèle

---
  
<!-- *page_number: true -->

## Utilisation de Pandas pour vérifier les données

###### ● Les données contiennent-elles des valeurs aberrantes ? (ex : une température de 6000 degrés)

###### ● Y a-t-il des valeurs manquantes ?

##### Exemple de code sur le dataframe housing:

![Housing.desribe output](Images/python_data_science/code_pandas3.PNG)

---
  
<!-- *page_number: true -->

## Utilisation de Pandas pour vérifier les données

![housing.hist](Images/python_data_science/code_pandas4.PNG)

---
  
<!-- *page_number: true -->

## Présentation de Sklearn

![Sklearn](Images/python_data_science/sklearn.PNG)

---
  
<!-- *page_number: true -->

## Séparer les données en jeux d'entraînement et de test

<center>

![code_sklearn](Images/python_data_science/sklearn_code.PNG)

</center>

---
  
<!-- *page_number: true -->

## Utilisation de Sklearn pour une régression

 ● Utilise la méthode de descente de gradient pour trouver les bons paramètres
 ● Large collection de modèles statistiques disponibles (random forest, réseaux de neurones..)
 
 Exemple de code :

![Code sklearn](Images/python_data_science/sklearn_code1.PNG)

---
  
<!-- *page_number: true -->

## Utilisation de Sklearn pour une classification

 ● Prédiction d’une classe et des probabilités pour chaque classe

![sklearn](Images/python_data_science/sklearn_code2.PNG) 

---
  
<!-- *page_number: true -->

## Un projet Machine Learning en Python

 ● Les grandes étapes et les librairies associées

<center>

<img src="Images/python_data_science/diagramme.PNG"  width=1000>


</center>
