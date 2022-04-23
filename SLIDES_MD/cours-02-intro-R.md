---
marp: true
title: Petit cours d'épidémiologie mathématique - Introduction à R
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 02 - Introduction à R
theme: default
paginate: false
math: mathjax
size: 4K
---

<style>
  .theorem {
    text-align:justify;
    background-color:#16a085;
    border-radius:20px;
    padding:10px 20px 10px 20px;
    box-shadow: 0px 1px 5px #999;  margin-bottom: 10px;
  }
  .definition {
    text-align:justify;
    background-color:#ededde;
    border-radius:20px;
    padding:10px 20px 10px 20px;
    box-shadow: 0px 1px 5px #999;
    margin-bottom: 10px;
  }
  img[alt~="center"] {
    display: block;
    margin: 0 auto;
  }
</style>

# Petit cours d'épidémiologie mathématique
<<<<<<< HEAD

=======
>>>>>>> 83f66b45a7bf1e17a5f1552d3ba6d9e99750e2a3
# Introduction à R

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/github-icon.png)](https://github.com/julien-arino)

Department of Mathematics & Data Science Nexus
University of Manitoba*

<div style = "font-size:18px; margin-top:-10px; padding-bottom:30px;"></div>

Canadian Centre for Disease Modelling
Canadian COVID-19 Mathematical Modelling Task Force
NSERC-PHAC EID Modelling Consortium (CANMOD, MfPH, OMNI/RÉUNIS)

<div style = "text-align: justify; position: relative; bottom: -5%; font-size:18px;">
* The University of Manitoba campuses are located on original lands of Anishinaabeg, Cree, Oji-Cree, Dakota and Dene peoples, and on the homeland of the Métis Nation.</div>

---

<!-- _backgroundImage: "radial-gradient(white,80%,#f1c40f)" -->
# Plan du cours

- Avant propos: le langage R
- Programmer en R

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Avant propos: le langage R

---

# R vient des statistiques, mais est maintenant bien plus

- Version Open Source de S
- Apparu en 1993
- On en est à la version 4.1
- Un avantage majeur à mon sens: pour bien des fonctions, `R` est en fait une interface pour du code `C` et `Fortran`. E.g., `deSolve`:
> The functions provide an interface to the FORTRAN functions 'lsoda', 'lsodar', 'lsode', 'lsodes' of the 'ODEPACK' collection, to the FORTRAN functions 'dvode', 'zvode' and 'daspk' and a C-implementation of solvers of the 'Runge-Kutta' family with fixed or variable time steps
- Communauté très active sur la toile, facile de trouver des solutions (vrai aussi de `Python`, je préfère juste `R`)

---

# Environments de dévelopement 

- Version en terminal, pas très sympa
- Une version terminal plus agréable: [radian](https://github.com/randy3k/radian)
- Exécute des scripts R en utilisant `Rscript name_of_script.R`. Utile pour certains tests (voir plus loin) ou faire tourner du code en `cron`, par exemple
- Utiliser des EDI (environnements de développemen intégrés):
    - [RStudio](https://www.rstudio.com/products/rstudio/) est devenu la référence
    - [RKWard](https://invent.kde.org/education/rkward) est utile si vous utilisez par exemple un processeur ARM non Mac (Raspberry Pi, certains Chromebooks..)
- S'intègre dans un `jupyter notebook`

---

#  Pour aller plus loin..

- [RStudio server](https://www.rstudio.com/products/rstudio/#rstudio-server): fait tourner RStudio sur un serveur Linux, permet une connection depuis la toile en utilisant un navigateur web
- Shiny: créer facilement un site web interactif avec du `R` tournant en tâche de fond
- [Shiny server](https://www.rstudio.com/products/shiny/shiny-server/): fait tourner des applis Shiny sur un serveur Linux, accessible depuis la toile
- Rmarkdown: `markdown` qui incorpore des commandes `R`. Utile pour générer des rapports en html ou pdf, permet aussi de faire des transparents.. Très utile pour générer des rapports incorporant des données dynamiques
- RSweave: Code LaTeX incorporant des commandes `R`. Comme Rmarkdown, utile pour générer des rapports. A perdu un peu de popularité depuis l'avènement de Rmarkdown

---

# R est un langage scripté

- Interactif
- Permet de travailler en temps réel, d'évaluer directement l'effet d'une commande
    - Attention! Ce qui est en mémoire peut avoir été généré par des étapes pas notées dans le script
    - Pour que les étapes d'un calcul soient reproductibles, il est bien de noter toutes les étapes dans un script et de tester ce script de temps en temps en utilisant `Rscript`: ceci assure que tout ce qui est requis pour faire tourner le script est chargé en mémoire quand celà doit l'être..

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Programmation en R

---

# Similaire à matlab..

.. avec des différences, bien sûr! Sinon, où serait l'intérêt? ;)

---

# Assignation

Deux façons d'écrire:

```
X <- 10
```

ou

```
X = 10
```

La première version est préférrée par les puristes R.. Personnellement, je m'en fiche un peu

---

# Listes

Structure de données très utile, flexible et versatile. Liste vide: `L <- list()`. Très pratique pour stocker des choses comme des paramètres. Par exemple:

```
L <- list()
L$a <- 10
L$b <- 3
L[["autre_nom"]] <- "Plouf plouf"
```

```
> L[1]
$a
[1] 10
> L[[2]]
[1] 3
> L$a
[1] 10
> L[["b"]]
[1] 3
> L$autre_nom
[1] "Plouf plouf"
```

---

# Vecteurs

```
x = 1:10
y <- c(x, 12)
> y
 [1]  1  2  3  4  5  6  7  8  9 10 12
z = c("rouge", "bleu")
> z
[1] "rouge"  "bleu"
z = c(z, 1)
> z
[1] "rouge"  "bleu" "1"
```
Remarquez que dans `z`, puisque les deux premières entrées sont des caractères, l'entrée que nous ajoutons après est aussi un caractère. Contrairement aux listes, les vecteurs ont toutes leurs entrées du même type. La même chose est vraie avec les matrices. Attention, ceci est une source d'erreur!!

---

# Matrices

Matrice (ou vecteur) de zéros
```
A <- mat.or.vec(nr = 2, nc = 3)
```

Matrice avec entrées assignées

```
B <- matrix(c(1,2,3,4), nr = 2, nc = 2)
> B
     [,1] [,2]
[1,]    1    3
[2,]    2    4
C <- matrix(c(1,2,3,4), nr = 2, nc = 2, byrow = TRUE)
> C
     [,1] [,2]
[1,]    1    2
[2,]    3    4
```

Remarquez qu'ici et ailleurs, nommer les arguments (e.g., `nr = 2`) permet de les utiliser dans n'importe quel ordre

---

# Opérations matricielles

Probablement la chose la plus ennuyeuse en R comparé à d'autres langages

- La notation `A*B` est le *produit de Hadamard* $A\circ B$ (qui serait noté `A.*B` en matlab), pas la multiplication matricielle standard
- La multiplication matricielle s'écrit `A %*% B`

Par ailleurs
- Concaténer deux matrices de tailles compatibles avec `rbind(A,B)` (B sous A) et `cbind(A,B)` (B à droite de A) 

---

# Opérations vectorielles

L'addition vectorielle est aussi un peu frustrante. Mettons que vous écriviez `x=1:10`, i.e., implémentiez le vecteur

```
> x
 [1]  1  2  3  4  5  6  7  8  9 10
```
Alors `x+1` donne
```
> x+1
 [1]  2  3  4  5  6  7  8  9 10 11
 ```
 i.e., ajoute 1 à tous les éléments du vecteur

Attention en particulier lorsque l'on cherche à accéder à un ensemble d'indices dans une liste, un vecteur ou une matrice

---

# Pour les matlab-eux dans le public

- R n'a pas le mot clé `end` pour accéder au dernier élément d'une matrice/liste/vecteur..
- Utilisez `length` (listes ou vecteurs), `nchar` (chaînes de caractères), `dim` (matrices.. attention, renvoie 2 valeurs), `nrow` et `ncol` (matrices)

---

# Data frames

- Spécifiques à R
- Comme des matrices sous stéroïdes

---

# Nommage des positions/lignes/colonnes/etc.

Une capacité très attrayante de R: il est possible de nommber les entrées dans toute liste (on a déjà vu ça), mais aussi tout vecteur, toute matrice ou data frame

```
r$> v = c(alpha = 2, beta = 3, gamma = 4, delta = 5)
r$> v
alpha  beta gamma delta 
    2     3     4     5 
```
est un vecteur, et `v["beta"]` renvoie 3..

---

# Assigner un nom *a posteriori*

```
r$> v = c(1,2,3)
r$> names(v) = c("alpha", "beta", "gamme")
r$> v
alpha   beta  gamme 
     1      2      3 
```
Ou encore, pour une matrice
```
r$> A = matrix(c(1,2,3,4), nrow = 2, byrow = TRUE)
r$> rownames(A) = c("alpha","beta")
r$> colnames(A) = c("chose","truc")
r$> A
      chose truc
alpha     1    2
beta      3    4
r$> A[1,2]
[1] 2
r$> A["alpha","truc"]
[1] 2
```


---

# Contrôle du flot

```
if (condition est vraie) {
  liste de choses à faire
}
```

Même si `liste de choses à faire` est une seule chose, il vaut mieux utiliser des accolades { }

```
if (condition est vraie) {
  liste de choses à faire
} else if (une autre condition est vraie) {
  ...
} else {
  ...
}
```

---

# Boucles for

`for` s'applique à des listes ou des vecteurs

```
for (i in 1:10) {
  quelque chose utilisant l'entier i
}
for (j in c(1,3,4)) {
  quelque chose utilisant l'entier j
}
for (n in c("truc", "muche", "chose")) {
  quelque chose utilisant la chaîne n
}
for (m in list("truc", "muche", "chose", 1, 2)) {
  quelque chose utilisant la chaîne n ou l'entier n, selon les cas
}
```

---

# lapply

Fonction très utile (d'autres dans la même veine: `sapply`, `vapply`, `mapply`)

Applique une fonction à chaque élément d'une liste,d'un vecteur  ou d'une matrice

Il existe des versions parallèles (p. ex., `parLapply`) que nous verrons plus tard

```
l = list()
for (i in 1:10) {
        l[[i]] = runif(i)
}
lapply(X = l, FUN = mean)
```

ou, pour renvoyer un vecteur

```
unlist(lapply(X = l, FUN = mean))
```

ou

```
sapply(X = l, FUN = mean)
```

---

# lapply "avancé"

On peut choisir des éléments non évidents dans une liste

```
l = list()
for (i in 1:10) {
        l[[i]] = list()
        l[[i]]$a = runif(i)
        l[[i]]$b = runif(2*i)
}
sapply(X = l, FUN = function(x) length(x$b))
```

donne

```
[1]  2  4  6  8 10 12 14 16 18 20
```

Il suffit de se souvenir que l'argument de la fonction est un élément de la liste (`l[[1]]`, `l[[2]]`, etc., ici)

---

# <!--fit-->Éviter les boucles de variation de paramètres avec expand.grid

```
# Supposon qu'on veuille faire varier 3 paramètres
variations = list(
    p1 = seq(1, 10, length.out = 10),
    p2 = seq(0, 1, length.out = 10),
    p3 = seq(-1, 1, length.out = 10)
)

# Créons la liste
tmp = expand.grid(variations)
PARAMS = list()
for (i in 1:dim(tmp)[1]) {
    PARAMS[[i]] = list()
    for (k in 1:length(variations)) {
        PARAMS[[i]][[names(variations)[k]]] = tmp[i, k]     
    }
}
```

Il reste une boucle, mais une fois la liste constituée, on peut la découper pour la distribuer entre machines, ou l'utiliser avec `parLapply`

