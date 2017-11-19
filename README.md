# Kata APB

Quelques solutions pour le [Kata APB](http://notarianni.org/article/kata-apb/)


### Solution 1

[apb1.hs](apb1.hs)

- Distribue les etudiants sur toutes les formations disponibles
- Aucun choix ou résultats de notes formulés
- Pas de limite aux nombre de places disponibles

### Solution 2

[apb2.hs](apb2.hs)

- Les étudiants sont répartis exactement selon leurs choix
- Aucune limite au nombre de places disponibles et pas de critère à l'entrée

### Solution 3

[apb3.hs](apb3.hs)

- Les étudiants sont répartis exactement selon leurs choix, a condition d'avoir
  la note minimale attendue par la formation demandée.
- S'ils n'ont pas la note attendue, ils sont affectés à une formation par
  défaut.
- Aucune limite au nombre de places disponibles
