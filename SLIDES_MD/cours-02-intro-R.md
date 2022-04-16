---
marp: true
title: Petit cours d'épidémiologie mathématique - Introduction à R
description: Petit cours d'épidémiologie mathématique - Julien Arino - Cours 01 - Introduction à R
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

# Going further

- [RStudio server](https://www.rstudio.com/products/rstudio/#rstudio-server): fait tourner RStudio sur un serveur Linux, permet une connection depuis la toile en utilisant un navigateur web
- Shiny: créer facilement un site web interactif avec du `R` tournant en tâche de fond
- [Shiny server](https://www.rstudio.com/products/shiny/shiny-server/): fait tourner des applis Shiny sur un serveur Linux, accessible depuis la toile
- Rmarkdown: `markdown` qui incorpore des commandes `R`. Utile pour générer des rapports en html ou pdf, permet aussi de faire des transparents.. Très utile pour générer des rapports incorporant des données dynamiques
- RSweave: Code LaTeX incorporant des commandes `R`. Comme Rmarkdown, utile pour générer des rapports. A perdu un peu de popularité depuis l'avènement de Rmarkdown

---

# R est un langage scripté

- Interactif
- Permet de travailler en temps réel, d'évaluer directement l'effet d'une commande
    - Be careful: what is in memory might involve steps not written down in a script
    - If you want to reproduce your steps, it is good to write all the steps down in a script and to test from time to time running using `Rscript`: this will ensure that all that is required to run is indeed loaded to memory when it needs to, i.e., that it is not already there..

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Programming in R

---

# Similar to matlab..

.. with some differences, of course! Otherwise, where would the fun be? ;)

---

# Assignment

Two ways:

```
X <- 10
```

or

```
X = 10
```

First version is preferred by R purists.. I don't really care

---

# Lists

A very useful data structure, quite flexible and versatile. Empty list: `L <- list()`. Convenient for things like parameters. For instance

```
L <- list()
L$a <- 10
L$b <- 3
L[["another_name"]] <- "Plouf plouf"
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
> L$another_name
[1] "Plouf plouf"
```

---

# Vectors

```
x = 1:10
y <- c(x, 12)
> y
 [1]  1  2  3  4  5  6  7  8  9 10 12
z = c("red", "blue")
> z
[1] "red"  "blue"
z = c(z, 1)
> z
[1] "red"  "blue" "1"
```
Note that in `z`, since the first two entries are characters, the added entry is also a character. Contrary to lists, vectors have all entries of the same type

---

# Matrices

Matrix (or vector) of zeros
```
A <- mat.or.vec(nr = 2, nc = 3)
```

Matrix with prescribed entries

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

Remark that here and elsewhere, naming the arguments (e.g., `nr = 2`) allows to use arguments in any order

---

# Matrix operations

Probably the biggest annoyance in R compared to other languages

- The notation `A*B` is the *Hadamard product* $A\circ B$ (what would be denoted `A.*B` in matlab), not the standard matrix multiplication
- Matrix multiplication is written `A %*% B`

---

# Vector operations

Vector addition is also frustrating. Say you write `x=1:10`, i.e., make the vector
```
> x
 [1]  1  2  3  4  5  6  7  8  9 10
```
Then `x+1` gives
```
> x+1
 [1]  2  3  4  5  6  7  8  9 10 11
 ```
 i.e., adds 1 to all entries in the vector

 Beware of this in particular when addressing sets of indices in lists, vectors or matrices

---

# For the matlab-ers here

- R does not have the keyword `end` to access the last entry in a matrix/vector/list..
- Use `length` (lists or vectors), `nchar` (character chains), `dim` (matrices.. careful, of course returns 2 values)

---

# Flow control

```
if (condition is true) {
  list of stuff to do
}
```

Even if `list of stuff to do` is a single instruction, best to use curly braces

```
if (condition is true) {
  list of stuff to do
} else if (another condition) {
  ...
} else {
  ...
}
```

---

# For loops

`for` applies to lists or vectors

```
for (i in 1:10) {
  something using integer i
}
for (j in c(1,3,4)) {
  something using integer j
}
for (n in c("truc", "muche", "chose")) {
  something using string n
}
for (m in list("truc", "muche", "chose", 1, 2)) {
  something using string n or integer n, depending
}
```

---

# lapply

Very useful function (a few others in the same spirit: `sapply`, `vapply`, `mapply`)

Applies a function to each entry in a list/vector/matrix

Because there is a parallel version (`parLapply`) that we will see later, worth learning

```
l = list()
for (i in 1:10) {
        l[[i]] = runif(i)
}
lapply(X = l, FUN = mean)
```

or, to make a vector

```
unlist(lapply(X = l, FUN = mean))
```

or

```
sapply(X = l, FUN = mean)
```

---

# "Advanced" lapply

Can "pick up" nontrivial list entries

```
l = list()
for (i in 1:10) {
        l[[i]] = list()
        l[[i]]$a = runif(i)
        l[[i]]$b = runif(2*i)
}
sapply(X = l, FUN = function(x) length(x$b))
```

gives

```
[1]  2  4  6  8 10 12 14 16 18 20
```

Just recall: the argument to the function you define is a list entry (`l[[1]]`, `l[[2]]`, etc., here)

---

# Avoid parameter variation loops with expand.grid

```
# Suppose we want to vary 3 parameters
variations = list(
    p1 = seq(1, 10, length.out = 10),
    p2 = seq(0, 1, length.out = 10),
    p3 = seq(-1, 1, length.out = 10)
)

# Create the list
tmp = expand.grid(variations)
PARAMS = list()
for (i in 1:dim(tmp)[1]) {
    PARAMS[[i]] = list()
    for (k in 1:length(variations)) {
        PARAMS[[i]][[names(variations)[k]]] = tmp[i, k]     
    }
}
```

There is still a loop, but you can split this list, use it on different machines, etc. And can use `parLapply`

