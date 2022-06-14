---
marp: true
title: Practicum 02 - Model analysis, studying large-scale models in R
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 10 -
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

# Petit cours d'épidémiologie mathématique<br/>Étapes de l'analyse mathématique des modèles 

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

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Étapes de l'analyse

---

# Étape 1 - Modèle épidémique ou endémique ?

- Souvent source de confusion: l'analyse d'un modèle épidémique diffère de celle d'un modèle endémique !
- Important de déterminer ce que vous avez
- Premier test simple (pas forcément sans erreur): y-t-il de la démographie ? 
  - La démographie peut être présente malgré une population totale constante, s'il y a un flux au travers du système (avec, e.g., naissance = mort)
- Autre test (plus complexe): quelle est la nature de l'ESM ?

---

# Étape 1 et demie - Calcul de l'ESM

- Si vous ne savez pas encore si vous avez un modèle épidémique ou endémique, il faudra calculer l'ESM; il faudra le(s) calculer de toute façon
- **En général**: on suppose que toutes les variables *infectées* sont égales à 0 (I, L et I, etc.)
  - Si vous trouvez un PE unique ou une quantité dénombrable d'équilibres, c'est un modèle endémique
  - Si votre solution est de la forme "toute valeur de $S$ marche", le modèle est épidémique

---

# Étape 2 - Cas d'un modèle épidémique

- Calcul de $\mathcal{R}_0$
- En général: **ne pas** considérer les propriétés de SAL de l'ESM, elles sont données (tout y va)
- Calculez une taille finale (si possible)

# Step 2 - Cas d'un modèle endémique

- Calculer $\mathcal{R}_0$ et en déduire les propriétés de SAL de l'ESM
- (Optionnel) Déterminez la direction de la bifurcation en $\mathcal{R}_0=1$
- (Souvent très compliqué voire impossible) Déterminer les propriétés de SAG de l'ESM ou de l'ÉÉ

---

# <!--fit-->Ne considérez pas la SAL de l'ESM d'un modèle endémique!

Considérons le PVI
$$
x'=f(x),\qquad x(t_0)=x_0
$$
et notons $x(t,x_0)$ sa solution au temps $t\geq t_0$ passant par la condition initiale $(t_0,x_0)$

$x^\star$ est un **point d'équilibre** si $f(x^\star)=0$

$x^\star$ est LAS si $\exists\mathcal{S}\ni x^\star$ ouvert dans le domaine de $f$ t.q. pour tout $x_0\in\mathcal{S}$, $x(t,x_0)\in\mathcal{S}$ pour tout $t\geq 0$ et, de plus, $\lim_{t\to\infty}x(t,x_0)=x^\star$

S'il y a un continuum de PE, alors $x^\star\in\mathcal{C}$, où $\mathcal{C}$ est une courbe dans le domaine de $f$ t.q. $f(y^\star)=0$ pour tout $y^\star\in\mathcal{C}$. On dit que $x^\star$ n'est **pas isolé**. Mais alors tout voisinage ouvert de $x^\star$ contient des éléments de $\mathcal{C}$ et prendre $x_0\in\mathcal{C}$, $x_0\neq x^\star$, implique que $\lim_{t\to\infty}x(t,x_0)=x_0\neq x^\star$. $x^\star$ est *localement stable* mais pas *localement asymptotiquement stable* !

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Numerical investigations of large-scale systems

<div style = "position: relative; bottom: -40%; font-size:20px;">

- JA. [Spatio-temporal spread of infectious pathogens of humans](https://doi.org/10.1016/j.idm.2017.05.001). *Infectious Disease Modelling* **2**(2):218-228 (2017)
- JA. [Mathematical epidemiology in a data-rich world](https://doi.org/10.1016/j.idm.2019.12.008). *Infectious Disease Modelling* **5**:161-188 (2020)
- github repo [modelling-with-data](https://github.com/julien-arino/modelling-with-data)

</div>

---

# Not very difficult

- As for the mathematical analysis: if you do things carefully and think about things a bit, numerics are not hard. Well: not harder than numerics in low-D
- Exploit vector structure

---

# Define the vector field

```
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

# Set up parameters

```
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

# Work out movement matrix

```
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

```
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

# Set up IC and time

```
# Set initial conditions. For example, we start with 2
# infectious individuals in Canada.
L0 = mat.or.vec(p$P, 1)
I0 = mat.or.vec(p$P, 1)
A0 = mat.or.vec(p$P, 1)
R0 = mat.or.vec(p$P, 1)
I0[1] = 2
S0 = pop - (L0 + I0 + A0 + R0)
# Vector of initial conditions to be passed to ODE solver.
IC = c(S = S0, L = L0, I = I0, A = A0, R = R0)
# Time span of the simulation (5 years here)
tspan = seq(from = 0, to = 5 * 365.25, by = 0.1)
```

---

# Set up $\beta$ to avoid blow up

Let us take $\mathcal{R}_0=1.5$ for patches in isolation. Solve $\mathcal{R}_0$ for $\beta$ 
$$
\beta=\frac{\mathcal{R}_0}{S(0)}
\left(
\frac{1-\pi_p}{\gamma_{Ip}}
+\frac{\pi_p\eta_p}{\gamma_{Ap}}
\right)^{-1}
$$ 

<p style="margin-bottom:2cm;"></p> 

```
for (i in 1:p$P) {
  p$beta[i] = 
    R_0[i] / S0[i] * 1/((1 - p$pi[i])/p$gammaI[i] + p$pi[i] * p$eta[i]/p$gammaA[i])
}
```

---

# And now the problems begin :)

```
# Call the ODE solver
sol <- deSolve::ode(y = IC, times = tspan, 
                    func = SLIAR_metapop_rhs, parms = p)
## DLSODA- At current T (=R1), MXSTEP (=I1) steps
## taken on this call before reaching TOUT
## In above message, I1 = 5000
##
## In above message, R1 = 117.498
```

The output I copy above means the integration went wrong. The problem is the sie difference between countries, in particular China and Canada..

Need to play with movement rates and initial conditions. Will not explain here

