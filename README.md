# Petit cours d'épidémiologie mathématique
Vous trouverez ici le matériel pour un *Petit cours d'épidémiologie mathématique* que je donnerai à N'Djaména fin juin 2022. La majorité du matériel de cours est dans cinq sous-répertoires principaux, qui sont expliqués plus bas. Vous pouvez aussi acccéder à une version *web* de ce site en cliquant sur [ce lien](https://julien-arino.github.io/petit-cours-epidemio-mathematique/). Dans la version web, les transparents du cours seront utilisables dans un navigateur web classique.

- `CODE` contient le code `R` qui sera utilisé pendant le cours ainsi que du code additionnel qui pourrait être utile.. 
- `DATA` contient quelques (très peu) jeux de données qui seront utilisés pendant le cours. Ces jeux de données sont également accessibles en ligne, mais pour faciliter les choses pour les participants, ils sont dupliqués ici.
- `FIGS` contient des figures qui ne sont probablement pas utiles par elles mêmes, mais qui sont liées dans les transparents `html`. 
- `OUTPUT` contient toute sortie générée par le code (à l'exception des figures, qui sont générées directement dans le répertoire FIGS).
- `SLIDES_MD` contient les fichiers `markdown` requis pour générer les transparents. Pour compiler les transparents depuis les fichier markdown, on peut par exemple utiliser la commande `npx @marp-team/marp-cli@latest --html cours-*.md` depuis ce sous-répertoire. (Cela requiert d'être en ligne. Pour apprendre comment installer une version hors-ligne de `marp`, voir [ici](https://github.com/marp-team/marp-cli).)

### Se préparer pour le cours
Tout mon code est en `R`. Lorsque j'aurai le temps, je produirai l'équivalent en `Python`, mais je ne fais aucune promesse quant à quand cela aura lieu. 

Il vous faudra installer `R`, que l'on peut charger [ici](https://www.r-project.org/). Bien que cela ne soit pas strictement nécessaire, je recommande de charger également `RStudio`, ce qui peut se faire [ici](https://www.rstudio.com/products/rstudio/download/). Une fois `R` (et peut être `RStudio`) installé , il faudra faire tourner dans `R` le fichier [`CODE/install_required_libraries.R`](https://raw.githubusercontent.com/julien-arino/CIMPA-SA-MathEpi-2022/main/CODE/install_required_libraries.R) depuis `RStudio` ou depuis la ligne de commande `R`, ce qui installera les librairies utilisées dans les exemples de ce cours. Voyez les détails dans le fichier lui même.
