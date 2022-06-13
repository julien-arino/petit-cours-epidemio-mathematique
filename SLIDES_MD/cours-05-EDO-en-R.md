---
marp: true
title: Petit cours d'épidémiologie mathématique - Résolution numérique des EDO en R
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 05 - Résolution numérique des EDO en R
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

# Petit cours d'épidémiologie mathématique<br/>Résolution numérique des EDO en R

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

- Résolution numérique des EDO
- Quelques exemples

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Résolution numérique des EDO

---

# La librairie deSolve

- Aide de [`deSolve`](https://cran.r-project.org/web/packages/deSolve/index.html):
> The functions provide an interface to the FORTRAN functions 'lsoda', 'lsodar', 'lsode', 'lsodes' of the 'ODEPACK' collection, to the FORTRAN functions 'dvode', 'zvode' and 'daspk' and a C-implementation of solvers of the 'Runge-Kutta' family with fixed or variable time steps

- Donc vous bénéficiez d'années d'experience: [ODEPACK](https://computing.llnl.gov/projects/odepack) est une librairie de solveurs numériques écrits à l'origine en Fortran (77!) développés au Lawrence Livermore National Laboratory (LLNL) à partir des années 70

- D'autres bons solveurs sont aussi inclus, ceux écris en C

- Voir [l'aide du package](https://cran.r-project.org/web/packages/deSolve/deSolve.pdf) pour des détails

---

# Utiliser deSolve pour des ODE simples

Comme avec la majorité des algorithmes, il faut écrire une fonction qui renvoie la valeur des dérivées (droite du signes égal) du système (le champ de vecteurs) en un point donné de l'espace (et potentiellement du temps), puis appeler cette fonction depuis le solveur

```
library(deSolve)
rhs_logistic <- function(t, x, p) {
  with(as.list(x), {
    dN <- p$r * N *(1-N/p$K)
    return(list(dN))
  })
}
params = list(r = 0.1, K = 100)
IC = c(N = 50)
times = seq(0, 100, 1)
sol <- ode(IC, times, rhs_logistic, params)
```

---

On peut aussi faire la chose suivante: en ajoutant `p` aux arguments de `as.list`, on peut utiliser le contenu de `p` sans avoir besoin de préfixer par `p$`

```
library(deSolve)
rhs_logistic <- function(t, x, p) {
  with(as.list(c(x, p)), {
    dN <- r * N *(1-N/K)
    return(list(dN))
  })
}
params = list(r = 0.1, K = 100)
IC = c(N = 50)
times = seq(0, 100, 1)
sol <- ode(IC, times, rhs_logistic, params)
```

(Attention de ne pas avoir une variable et un paramètre avec le même nom..)

---

# Méthode par défaut: `lsoda`

- `lsoda` change automatiquement entre méthodes stiff et nonstiff

- Vous pouvez aussi spécifier d'autres méthodes: "lsode", "lsodes", "lsodar", "vode", "daspk", "euler", "rk4", "ode23", "ode45", "radau", "bdf", "bdf_d", "adams", "impAdams" ou "impAdams_d" ,"iteration" (ce dernier pour les systèmes en temps discret)

```
ode(y, times, func, parms, 
    method = "ode45")
```

- Vous pouvez même implémenter votre propre méthode

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Quelques exemples

- Modèle SIS endémique
- Modèle épidémique de Kermack et McKendrick
- Modèle SIRS endémique

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Modèle SIS endémique

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Modèle épidémique de Kermack et McKendrick

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Modèle SIRS endémique

