---
marp: true
title: Petit cours d'épidémiologie mathématique - Résolution numérique des EDO en R
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 13 - Résolution numérique des EDO en R
theme: default
paginate: false
math: mathjax
size: 16:9
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

<!-- _backgroundImage: "linear-gradient(to top, #85110d, 1%, white)" -->
# Petit cours d'épidémiologie mathématique<br/>Résolution numérique des EDO en R

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/github-icon.png)](https://github.com/julien-arino)

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
# Plan de ce cours

- Résolution numérique des EDO
- Quelques exemples
- Investigation computationnelle des grands systèmes

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

```R
library(deSolve)
rhs_logistic <- function(t, x, p) {
  dN <- p$r * x[1] *(1-x[1]/p$K)
  return(list(dN))
}
params = list(r = 0.1, K = 100)
IC = 50
times = seq(0, 100, 1)
sol <- ode(IC, times, rhs_logistic, params)
```

---

# Deuxième option: `with(as.list(x), {`

On peut aussi faire la chose suivante: en utilisant `with(as.list(x, {`, on peut accéder au contenu de `x` directement, s'il est *nommé*

```R
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

Il est donc important de nommer le contenu de la condition initiale: avant, on avait fait simplement `IC = 50`, ici on doit faire `IC = c(N = 50)`

---

On peut aussi ajouter `p` aux arguments de `as.list` pour utiliser le contenu de `p` sans avoir besoin de préfixer par `p$`

```R
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

Attention de ne pas avoir une variable et un paramètre avec le même nom..

---

# Méthode par défaut: `lsoda`

- `lsoda` change automatiquement entre méthodes stiff et nonstiff

- Vous pouvez aussi spécifier d'autres méthodes: "lsode", "lsodes", "lsodar", "vode", "daspk", "euler", "rk4", "ode23", "ode45", "radau", "bdf", "bdf_d", "adams", "impAdams" ou "impAdams_d" ,"iteration" (ce dernier pour les systèmes en temps discret)

```R
ode(y, times, func, parms, method = "ode45")
```

- Vous pouvez même implémenter votre propre méthode

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Quelques exemples

- Modèle SIS endémique
- Modèle épidémique de Kermack et McKendrick

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Modèle SIS endémique

---

```R
library(deSolve)
rhs_SIS <- function(t, x, p) {
  with(as.list(c(x, p)), {
    N = S + I
    dS = b + gamma * I - d * S - beta * S * I / N
    dI = beta * S * I / N - (d + gamma) * I
    return(list(c(dS, dI)))
  })
}
d = 1/(80 * 365.25)
gamma = 1/14
# On règle la natalité pour que b/d = 1000
b = 1000 * d
# On règle beta pour que R_0 = 1.5
beta = 1.5 * (d + gamma)
params = list(b = b, d = d, gamma = gamma, beta = beta)
IC = c(S = 1000, I = 1)
times = seq(0, 365, 1)
sol <- ode(IC, times, rhs_SIS, params)
```

---

```R
plot(sol[, "time"], sol[, "I"], type = "l",
     xlab = "Temps (jours)", ylab = "Prévalence")
```

![height:500px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/sol_endemic_SIS_R015.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Modèle épidémique de<br/>Kermack & McKendrick

---

```R
rhs_SIR_KMK <- function(t, x, p) {
  with(as.list(c(x, p)), {
    dS = - beta * S * I
    dI = beta * S * I - gamma * I
    dR = gamma * I
    return(list(c(dS, dI, dR)))
  })
}
# Condition initiale pour S (pour calculer R_0)
S0 = 1000
gamma = 1/14
# On règle beta pour que R_0 = 1.5
beta = 1.5 * gamma / S0 
params = list(gamma = gamma, beta = beta)
IC = c(S = S0, I = 1, R = 0)
times = seq(0, 365, 1)
sol <- ode(IC, times, rhs_SIR_KMK, params)
```

---

```
plot(sol[, "time"], sol[, "I"], type = "l",
     main = TeX("SIR de Kermack et McKendrick, $R_0=1.5$"),
     xlab = "Temps (jours)", ylab = "Prévalence")
```

![height:500px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/sol_SIR_KMK_R015.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Investigation computationnelle</br> des grands systèmes

<div style = "position: relative; bottom: -30%; font-size:20px;">

- JA. [Spatio-temporal spread of infectious pathogens of humans](https://doi.org/10.1016/j.idm.2017.05.001). *Infectious Disease Modelling* **2**(2):218-228 (2017)
- JA. [Mathematical epidemiology in a data-rich world](https://doi.org/10.1016/j.idm.2019.12.008). *Infectious Disease Modelling* **5**:161-188 (2020)
- github repo [modelling-with-data](https://github.com/julien-arino/modelling-with-data)

</div>

---

# Pas très compliqué

- Comme pour l'analyse mathématique ([Cours 12](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-12-modeles-metapopulation.html)), si l'on procède avec attention et que l'on réfléchit un peu, ça n'est pas trop compliqué
- Enfin, pas plus dur que dans le cas de la basse dimension
- Important de prendre avantage de la structure vectorielle

---

# Définissons le champ de vecteurs

```R
SLIAR_metapop_rhs <- function(t, x, p) {
  with(as.list(x), {
    S = x[p$idx_S]
    L = x[p$idx_L]
    I = x[p$idx_I]
    A = x[p$idx_A]
    R = x[p$idx_R]
    N = S + L + I + A + R
    Phi = p$beta * S * (I + p$eta * A)
    dS = S - Phi + p$M %*% S
    dL = Phi - p$epsilon * L + p$M %*% L
    dI = (1 - p$pi) * p$epsilon * L - p$gammaI * I + p$M %*% I
    dA = p$pi * p$epsilon * L - p$gammaA * A + p$M %*% A
    dR = p$gammaI * I + p$gammaA * A + p$M %*% R
    list(c(dS, dL, dI, dA, dR))
  })
}
```

---

# Mise en place des paramètres

```R
pop = c(34.017, 1348.932, 1224.614, 173.593, 93.261) * 1e+06
countries = c("Canada", "China", "India", "Pakistan", "Philippines")
T = matrix(data = 
             c(0, 1268, 900, 489, 200, 
               1274, 0, 678, 859, 150, 
               985, 703, 0, 148, 58, 
               515, 893, 144, 0, 9, 
               209, 174, 90, 2, 0), 
           nrow = 5, ncol = 5, byrow = TRUE)
```

---

# Calculons la matrice de mouvement

```R
p = list()
# Use the approximation explained in Arino & Portet (JMB 2015)
p$M = mat.or.vec(nr = dim(T)[1], nc = dim(T)[2])
for (from in 1:5) {
  for (to in 1:5) {
    p$M[to, from] = -log(1 - T[from, to]/pop[from])
  }
  p$M[from, from] = 0
}
p$M = p$M - diag(colSums(p$M))
```

---

```R
p$P = dim(p$M)[1]
p$idx_S = 1:p$P
p$idx_L = (p$P + 1):(2 * p$P)
p$idx_I = (2 * p$P + 1):(3 * p$P)
p$idx_A = (3 * p$P + 1):(4 * p$P)
p$idx_R = (4 * p$P + 1):(5 * p$P)
p$eta = rep(0.3, p$P)
p$epsilon = rep((1/1.5), p$P)
p$pi = rep(0.7, p$P)
p$gammaI = rep((1/5), p$P)
p$gammaA = rep((1/3), p$P)
# The desired values for R_0. Here we take something simple
R_0 = rep(1.5, p$P)
```

---

# Définissons les conditions initiales

```R
# On fixe les conditions initiales
# Par exemple, 2 infectieux au Canada
L0 = mat.or.vec(p$P, 1)
I0 = mat.or.vec(p$P, 1)
A0 = mat.or.vec(p$P, 1)
R0 = mat.or.vec(p$P, 1)
I0[1] = 2
S0 = pop - (L0 + I0 + A0 + R0)
# Vecteur de conditions initiales à passer au solveur
IC = c(S = S0, L = L0, I = I0, A = A0, R = R0)
# Instants auxquels renvoyer une solution 
# Tous les 0.1 jours pour 5 ans ici
tspan = seq(from = 0, to = 5 * 365.25, by = 0.1)
```

---

# On choisit $\beta$ pour éviter une explosion

On prend $\mathcal{R}_0=1.5$ pour les patchs quand ils sont isolés. Pour cela, on résoud $\mathcal{R}_0$ en fonction de $\beta$ 
$$
\beta=\frac{\mathcal{R}_0}{S(0)}
\left(
\frac{1-\pi_p}{\gamma_{Ip}}
+\frac{\pi_p\eta_p}{\gamma_{Ap}}
\right)^{-1}
$$ 

<p style="margin-bottom:2cm;"></p> 

```R
for (i in 1:p$P) {
  p$beta[i] = 
    R_0[i] / S0[i] / ((1 - p$pi[i])/p$gammaI[i] + p$pi[i] * p$eta[i]/p$gammaA[i])
}
```

---

# Et maintenant les problèmes commencent..

```R
# On appelle le solveur
sol <- deSolve::ode(y = IC, times = tspan, 
                    func = SLIAR_metapop_rhs, parms = p)
## DLSODA- At current T (=R1), MXSTEP (=I1) steps
## taken on this call before reaching TOUT
## In above message, I1 = 5000
##
## In above message, R1 = 117.498
```

La sortie au dessus indique un problème numérique lors de l'intégration. Le problème vient certainement de la différence de taille entre les pays, en particulier le Canada et la Chine

Il faut jouer avec les taux de mouvement et les conditions initiales. Je n'explique pas ici

