# Bilan du Kaggle

## Features Engineering

Le features engineering est fonction du modèle utilisé. Grossièrement, on distingue les tree based models des non tree based models. Très important de visualiser les choses et de comprendre le métier.

#### Tree based models

Pour résumer, deux modèles principaux : **Random Forest** de Scikit Learn et **Xgboost** une librairie à part mais doté d'une api Scikit Learn. Pour ce genre de modèles, toutes les variables sont perçus comme numériques. **L'encodage des variables catégorielles est une tâche cruciale**.
 1. Encodage de variable ordinale : on peut assigner un numérique à chaque modalité en veillant à respecter l'ordre. On peut également binner la variable. On peut également faire du mean encoding.
 2. Encodage de variable catégorielle : Ici, on peut assigner de manière aléatoire chaque modalité vers un nombre (voir label encoding dans scikit learn), ce n'est pas super efficace. On peut également faire du mean encoding mais attention, cette technique peut occasioner de l'overfitting. De la même manière on peut binner la variable. Exemple : si la variable est **ville**, on peut regrouper les villes qui partagent les mêmes caractéristiques ou bien qui se comportent de manière similaire relativement à la variable d'intérêt.



#### Non Tree based models (Linear Models, Neural Networks)

Pour ce genre de modèles, tout ce qui est catégorielle doit être encoder en dummy variables.

## HELP the model (Interactions et binning)

Que ce soit pour les tree based models ou les autres, il est crucial d'aider le modèle en lui fournissant le plus d'informations possibles dès le départ. Parmi ces informations possibles à fournir : 

 1. **Feature intéraction** : il s'agit de la concaténation des modalités de deux variables catégorielles ou bien du produit de deux variables numériques. Ces intéractions doivent avoir un sens. Par exemple, l'heure de la journée croisé avec la variable jour travaillé oui / non. Cette intéraction a du sens car de manière unidimensionnelle l'information aurait été écrasée.
 2. **Binning** : Une autre manière d'aider le modèle est de lui fournir au préalable les *splits* des variables catégorielles que l'on juge pertinents. Pour faire simple, lui enlever cette tâche lui garantir l'occasion de trouver d'autres liens et donc d'améliorer la performance du modèle. Egalement en lui mâchant le travail, on peut se permettre de réduire le nombre d'arbres par exemple, ce qui est intéressant lors du tunning des paramètres. Apparemment la fonction *rpart* de R est une bonne candidate pour la tâche de binning.

## Tunning des paramètres

Quelques tricks en vrac concernant le tunning des paramètres : 
 1. VINCENT VINCENT VINCENT VINCENT VINCENT VINCENT VINCENT VINCENT VINCENT VINCENT VINCENT VINCENT VINCENT VINCENT 
 2. VINCENT VINCENT VINCENT VINCENT VINCENT VINCENT VINCENT VINCENT VINCENT VINCENT VINCENT VINCENT VINCENT VINCENT 

## Ensembliste model

Bon apparemment, tu peux entraîner des modèles qui attaquent une partie spécifique du problème puis les combiner. Voir l'exemple du mec qui modélise le nombre de vélos loués pour les Register et pour les Casual puis qui les somme. Voir également l'exemple du mec qui fait la solution top 5% qui fait un RF et un XGB puis qui met un poids de 80% sur les prédictions de XGB et 20% sur les prédictions de RF. Il s'avère que le modèle est très bon.


## TO DO LIST (next Kaggle)

 1. Un package permettant de binner une variable numérique ou catégorielle en fonction d'une variable cible.