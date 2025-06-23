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

Introduction au Deep Learning
=

<br/>

### Présentation partagée sous la licence Apache 2.0

---

# Le Deep Learning 

![h:500px image Dl center](./Images/04-intro_DL/DL.PNG)

---

## Un neurone
 
 
![image neurone center](./Images/04-intro_DL/neurone.png) 
 

* *f* est la fonction d'activation
* Question : quelle fonction *f* choisir pour retrouver le modèle linéaire ?

---


## Fonctions d'activation couramment utilisées


![Sigmoid/relu center](./Images/04-intro_DL/sigmoid_relu.PNG)

|Utilisation : à mettre en fin de réseau pour prédire une probabilité (entre 0 et 1) |Utilisation : entre chaque couche pour dé-linéariser (à coût de calcul faible)|
|:---:|:---:|

---


## D'autres fonctions d'activation 

![images fonctions center](./Images/04-intro_DL/fonction_activation.PNG) 

---


## Les couches / layers 


![image layers center](./Images/04-intro_DL/layers.PNG)

##### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; profondeur = 1 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; profondeur = 2 


---

## Intuition

Un réseau de neurones peut approcher n'importe quelle fonction continue.

![center 2_segments center](./Images/04-intro_DL/approche_courbe_segments.png)
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Couche cachée à 2 neurones &nbsp;&nbsp;&nbsp; Couche cachée à 4 neurones

---

## Classifier une image avec un réseau de neurones sans couche cachée

+ Objectif : classifier une image 32x32 en 10 classes

![image Classif center](./Images/04-intro_DL/classif.PNG)

+ Plus de 30 000 paramètres pour un petit réseau et une petite image 
+ Explose avec la résolution de l'image et la complexité du réseau

---

# Réseaux de neurones convolutionnels


---

## Convolution sur une image 

  
![image convolution center](./Images/04-intro_DL/convolution2.PNG)

+ Multiplication pixel par pixel (produit scalaire)

---

## Convolution sur une image 

![h:250px image convolution générale center](./Images/04-intro_DL/convolution.PNG)

- 1 filtre 5x5

- Exemple en images : <http://setosa.io/ev/image-kernels/>

--- 

## Autres types de couches 

 
- MaxPooling

- DropOut

---

## Max Pooling : Réduire la dimension
![h:300px image Max-Pooling center](./Images/04-intro_DL/max_pooling.png)
* Max pooling : filtre 2x2 et stride 2

---


## Dropout : supprimer aléatoirement des neurones 

 Méthode de régularisation 

![image dropout center](./Images/04-intro_DL/dropout.PNG)

---

<!-- *page_number: true -->

## Exemple de réseau convolutionnel complet 

![Réseau complet center](./Images/04-intro_DL/réseau_complet.PNG)


