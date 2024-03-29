---
marp: true
title: Petit cours d'épidémiologie mathématique - Le modèle de Kermack et McKendrick
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 06 - Le modèle de Kermack et McKendrick
theme: default
paginate: false
size: 4:3
math: mathjax
---

<style>
  /* section {
  font-size: 28px;
  padding-left: 40px;
  padding-right: 50px;
  padding-top: 20px;
  padding-bottom: 20px;
  }
  h1 {
  font-size: 35px;
  # color: #09c;
  }
  h2 {
  font-size: 40px;
  } */
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
# <!--fit-->Petit cours d'épidémiologie mathématique<br/>Le modèle de Kermack et McKendrick

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/github-icon.png)](https://github.com/julien-arino)

Department of Mathematics & Data Science Nexus
University of Manitoba*

<div style = "font-size:18px; margin-top:-10px; padding-bottom:30px;"></div>

Centre canadien de modélisation des maladies (CCMM)
NSERC-PHAC EID Modelling Consortium (CANMOD, MfPH, OMNI/RÉUNIS)

<div style = "text-align: justify; position: relative; bottom: -5%; font-size:25px;">
* The University of Manitoba campuses are located on original lands of Anishinaabeg, Cree, Oji-Cree, Dakota and Dene peoples, and on the homeland of the Métis Nation.</div>

<style>
img[alt~="center"] {
  display: block;
  margin: 0 auto;
}
</style>

---

<!-- _backgroundImage: "radial-gradient(white,80%,#f1c40f)" -->
# Plan de ce cours

- Modèle SIR épidémique de Kermack et McKendrick
- Taille finale d'une épidémie
- Dernières remarques

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Modèle SIR épidémique de Kermack et McKendrick

---

# Ceci est un cas particulier !

La série de papiers vaut le coup
- Kermack & McKendrick. [A contribution to the mathematical theory of epidemics](https://doi.org/10.1098/rspa.1927.0118) (1927)

Suivi de "Contributions to the mathematical theory of epidemics."
- [II. The problem of endemicity](https://doi.org/10.1098/rspa.1932.0171) (1932)
- [III. Further studies of the problem of endemicity](https://doi.org/10.1098/rspa.1933.0106) (1933)
- [IV. Analysis of experimental epidemics of the virus disease mouse ectromelia](https://doi.org/10.1017/S0022172400034902) (1937)
- [V. Analysis of experimental epidemics of mouse-typhoid; a bacterial disease conferring incomplete immunity](https://doi.org/10.1017/S0022172400011918) (1939)

---

# <!--fit-->Quelle est la *taille* d'une épidémie?

- Si l'on s'intéresse à la possibilité d'un pic épidémique
  - A-t-il toujours lieu?
  - S'il a lieu, quelle est son intensité?
- Si une épidémie traverse une population, est-ce que tout le monde est infecté?

---

# Le modèle SIR sans démographie

- La période de temps que l'on considère est suffisamment courte que l'on peut négliger la démographie (on parle aussi de modèle *sans dynamique vitale*)
- Différent du modèle précédent, qui incorpore la démographie mais la considère constante
- Les individus dans la populations sont soit *susceptibles*, soit *infectieux* avec la maladie. Après guérison ou mort, on les *retire* du compartiment infectieux ($R$)
- Incidence du type action de masse $\beta SI$

---

Le modèle que nous considérons maintenant est typiquement appelé modèle SIR de Kermack-McKendrick (KMK)
$$
\begin{align}
S' &= -\beta SI \tag{1a}\label{sys:KMK_dS} \\
I' &= \beta SI-\gamma I  \tag{1b}\label{sys:KMK_dI} \\
R' &= \gamma I  \tag{1c}\label{sys:KMK_dR}
\end{align}
$$

![width:600px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/SIR_KMK_ODE.png)

---

# Reduction du problème

3 compartiments, mais quand on inspecte en détail, on remarque que les *retirés* n'ont pas d'influence directe sur la dynamique de $S$ ou $I$, dans le sens où $R$ n'apparaît pas dans $\eqref{sys:KMK_dS}$ ou $\eqref{sys:KMK_dI}$

De plus, la population totale (incluant les morts qui sont aussi classés dans $R$) $N=S+I+R$ satisfait
$$
N'=(S+I+R)'=0
$$
Par conséquent, $N$ est constant et la dynamique de $R$ peut être déduite de $R=N-(S+I)$
Donc on considère à présent
$$
\begin{align}
S' &= -\beta SI \tag{2a}\\
I' &= \beta SI-\gamma I  \tag{2b}
\end{align}
$$

---

# Équilibres

Considérons les équilibres de
$$
\begin{align}
S' &= -\beta SI \tag{2a}\label{sys:KMK_2d_dS} \\
I' &= (\beta S-\gamma)I  \tag{2b}\label{sys:KMK_2d_dI}
\end{align}
$$

De $\eqref{sys:KMK_2d_dI}$
- soit $\bar S=\gamma/\beta$
- ou $\bar I=0$

Substituant dans $\eqref{sys:KMK_2d_dS}$
- dans le premier cas, $(\bar S,\bar I)=(\gamma/\beta,0)$
- dans le second cas, n'importe quel $\bar S\geq 0$ est un équilibre

Le second cas est un **problème**: la linéarisation usuelle ne fonctionne pas lorsque l'on a un *continuum* d'équilibres, puisque les équilibres ne sont pas isolés!


---

# <!--fit-->Une autre approche - On étudie $dI/dS$

$$
\begin{align}
S' &= -\beta SI \tag{2a}\\
I' &= \beta SI-\gamma I  \tag{2b}
\end{align}
$$

Quelle est la dynamique de $dI/dS$? 
$$
\tag{3}\label{eq:KMK_dI_over_dS}
\frac{dI}{dS}
=\frac{dI}{dt}\frac{dt}{dS}
=\frac{I'}{S'}
=\frac{\beta SI-\gamma I}{-\beta SI}
=\frac{\gamma}{\beta S}-1
$$
pourvu que $S\neq 0$

**Attention!** Il convient de se souvenir que $S$ et $I$ sont $S(t)$ et $I(t)$.. l'équation $\eqref{eq:KMK_dI_over_dS}$ décrit ainsi la relation entre $S$ et $I$ le long de solutions de l'EDO d'origine $\eqref{sys:KMK_2d_dS}$-$\eqref{sys:KMK_2d_dI}$

---

On intègre $\eqref{eq:KMK_dI_over_dS}$ sans aucun mal et on obtient des trajectoires dans l'espace d'état
$$
I(S)=\frac\gamma\beta \ln S-S+C
$$
avec $C\in\mathbb{R}$

CI $I(S_0)=I_0$ $\Rightarrow$ $C=S_0+I_0-\dfrac \gamma\beta \ln S_0$, et la solution de $\eqref{sys:KMK_dS}$-$\eqref{sys:KMK_dR}$ est, en tant que fonction de $S$
$$
\begin{align*}
I(S)&=S_0+I_0-S+\frac\gamma\beta \ln \frac S{S_0} \\
R(S)&=N-S-I(S)=R_0-\frac\gamma\beta \ln \frac S{S_0}
\end{align*}
$$
(puisque $N_0=S_0+I_0+R_0$)

---

Trajectoires du système $(S,I)$ normalisé dans l'espace des phases $(S,I)$ avec CI $(S_0,1-S_0)$ et $\beta/\gamma=2.5$

![width:1200px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/KMK_planar_trajectories.png)

---

Étudions 
$$
I(S)=S_0+I_0-S+\frac\gamma\beta \ln \frac S{S_0} 
$$
On a
$$
\frac{d}{dS}I(S) = \frac{\gamma}{\beta S}-1
$$
Donc dans les courbes précédentes, le max de $I(S)$ a lieu lorsque $S=\gamma/\beta$ ($S=0.4$ dans l'exemple). En ce point,
$$
I(S) = I_0+\left(
  1-\frac{1}{\mathcal{R}_0} - \frac{\ln(\mathcal{R}_0)}{\mathcal{R}_0}
\right)S_0
$$

---

<div class="theorem">

Soit $(S(t),I(t))$ une solution à $\eqref{sys:KMK_2d_dS}$-$\eqref{sys:KMK_2d_dI}$ et $\mathcal{R}_0$ défini par 
$$
\begin{equation}\label{eq:R0_KMK}\tag{4}
\mathcal{R}_0=\frac{\beta}{\gamma}S_0
\end{equation}
$$

- Si $\mathcal{R}_0\leq 1$, alors $I(t)\searrow 0$ quand $t\to\infty$
- Si $\mathcal{R}_0>1$, alors $I(t)$ atteint d'abord un maximum 
$$
I_0+\left(
1-\frac{1}{\mathcal{R}_0} - \frac{\ln(\mathcal{R}_0)}{\mathcal{R}_0}
\right)S_0
$$
puis tend vers 0 quand $t\to\infty$
</div>

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
# <!--fit-->Taille finale d'une épidémie

---

# <!--fit-->Calcul de la taille finale de l'épidémie

Pour la fonction à valeurs positives et intégrable $w(t)$,  notons
$$
w_\infty = \lim_{t\to\infty}w(t),\qquad\hat w = \int_0^\infty w(t)\ dt
$$
On note aussi $w_0=w(0)$. Dans le sous-système
$$
\begin{align}
S' &= -\beta SI \tag{2a} \\
I' &= \beta SI-\gamma I  \tag{2b} 
\end{align}
$$
calculons la somme de $\eqref{sys:KMK_2d_dS}$ et $\eqref{sys:KMK_2d_dI}$, en prenant garde de bien faire apparaître la dépendance en le temps
$$
\frac{d}{dt}(S(t)+I(t))=-\gamma I(t)
$$

---

Intégrons de 0 à $\infty$:
$$
\int_0^\infty\frac{d}{dt}(S(t)+I(t))\ dt=-\int_0^\infty\gamma I(t)dt 
$$
Le terme de gauche donne
$$
\int_0^\infty\frac{d}{dt}(S(t)+I(t))\ dt
= S_\infty+I_\infty-S_0-I_0 = S_\infty-S_0-I_0
$$
car $I_\infty=0$

Le terme de droite prend la forme
$$
-\int_0^\infty\gamma I(t)dt = -\gamma\int_0^\infty I(t)dt = -\gamma \hat I
$$
On a donc
$$
\tag{5}\label{eq:KMK_final_size_step1}
S_\infty-S_0-I_0 = -\gamma\hat I
$$

---

Considérons maintenant $\eqref{sys:KMK_2d_dS}$:
$$
S' = -\beta SI
$$
Divisons les deux cotés par $S$:
$$
\frac{S'(t)}{S(t)} = -\beta I(t)
$$
Intégrons de 0 a $\infty$:
$$
\tag{6}\label{eq:KMK_final_size_step2}
\ln S_\infty-\ln S_0 = -\beta \hat I
$$
Exprimons $\eqref{eq:KMK_final_size_step1}$ et $\eqref{eq:KMK_final_size_step2}$ en termes de $-\hat I$ et égalisons
$$
\frac{\ln S_\infty-\ln S_0}{\beta}
=
\frac{S_\infty-S_0-I_0}{\gamma}
$$
On a donc
$$
\tag{7}\label{eq:final_size}
(\ln S_0-\ln S_\infty)S_0 = (S_0-S_\infty)\mathcal{R}_0+I_0\mathcal{R}_0
$$

---

<div class="theorem">

Soit $(S(t),I(t))$ une solution de $\eqref{sys:KMK_2d_dS}$-$\eqref{sys:KMK_2d_dI}$ et $\mathcal{R}_0$ défini par $\eqref{eq:R0_KMK}$.

Le nombre $S(t)$ de susceptibles est une fonction décroissante et sa limite $S_\infty$ est l'unique solution dans $(0,S_0)$ de l'équation transcendante
$$
\tag{7}
(\ln S_0-\ln S_\infty)S_0 = (S_0-S_\infty)\mathcal{R}_0+I_0\mathcal{R}_0
$$
</div>

---

# <!--fit-->L'équation (transcendante) de la taille finale

$$
\tag{7}
(\ln S_0-\ln S_\infty)S_0 = (S_0-S_\infty)\mathcal{R}_0+I_0\mathcal{R}_0
$$
que l'on écrit
$$
\tag{8}\label{eq:final_size_2}
\begin{aligned}
T(S_\infty) &=(\ln S_0-\ln S_\infty)S_0 \\
& \quad - (S_0-S_\infty)\mathcal{R}_0 -I_0\mathcal{R}_0
\end{aligned}
$$

On cherche par conséquent les zéros de la fonction $T(S_\infty)$

---

On cherche $S_\infty$ dans $(0,S_0]$ t.q. $T(S_\infty)=0$ pour
$$
T(S_\infty) =(\ln S_0-\ln S_\infty)S_0
- (S_0-S_\infty)\mathcal{R}_0 -I_0\mathcal{R}_0
$$

Notons pour commencer que lorsque 
$$
\lim_{S_\infty\to 0}T(S_\infty)=\lim_{S_\infty\to 0}-S_0\ln(S_\infty)=\infty
$$

Différentiant $T$ par rapport à $S_\infty$, on obtient 
$$
T'(S_\infty)=\mathcal{R}_0-S_0/S_\infty
$$ 

Lorsque $S_\infty\to 0$, $\mathcal{R}_0-S_0/S_\infty<0$, donc $T$ décroit jusqu'à $S_\infty=S_0/\mathcal{R}_0$

Donc si $\mathcal{R}_0\leq 1$, la fonction $T$ est décroissante sur $(0,S_0)$, tandis qu'elle a un minimum si $\mathcal{R}_0>1$

---

# Cas $\mathcal{R}_0\leq 1$

$$
T(S_\infty) =(\ln S_0-\ln S_\infty)S_0
- (S_0-S_\infty)\mathcal{R}_0 -I_0\mathcal{R}_0
$$

- On a vu que $T$ est décroissante sur $(0,S_0]$

- Par ailleurs, $T(S_0)=-I_0\mathcal{R}_0<0$ (le cas $I_0=0$ est exclu car trivial)

- Du reste, $T$ est continue

$\implies$ il existe un $S_\infty$ unique dans $(0,S_0]$ t.q. $T(S_\infty)=0$

---

# Cas $\mathcal{R}_0> 1$

$$
T(S_\infty) =(\ln S_0-\ln S_\infty)S_0
- (S_0-S_\infty)\mathcal{R}_0 -I_0\mathcal{R}_0
$$

- On a vu que $T$ est décroissante sur $(0,S_0/\mathcal{R}_0]$

- Pour $S_\infty\in[S_0/\mathcal{R}_0]$, $T'>0$

- Comme précédemment, $T(S_\infty)=-I_0\mathcal{R}_0$

- $T$ est continue

$\implies$ il existe un $S_\infty$ unique dans $(0,S_0]$ t.q. $T(S_\infty)=0$. Plus précisemment, dans ce cas, $S_\infty\in(0,S_0/\mathcal{R}_0)$

---

On va résoudre numériquement. Il faut une fonction
```R
final_size_eq = function(S_inf, S0 = 999, I0 = 1, R_0 = 2.5) {
  OUT = S0*(log(S0)-log(S_inf)) - (S0+I0-S_inf)*R_0
  return(OUT)
}
```
et on résoud facilement en utilisant `uniroot`, ici avec les valeurs par défaut qu'on a mis dans la fonction:
```R
uniroot(f = final_size_eq, interval = c(0.05, 999))
$root
[1] 106.8819
$f.root
[1] -2.649285e-07
$iter
[1] 10
$init.it
[1] NA
$estim.prec
[1] 6.103516e-05
```

---

Pour passer des valeurs différentes, on peut par exemple faire
```R
N0 = 1000
I0 = 1
S0 = N0-I0
R_0 = 2.4
uniroot(
  f = function(x) 
    final_size_eq(S_inf = x, 
                  S0 = S0, I0 = I0, 
                  R_0 = R_0),
  interval = c(0.05, S0))
```

---

# <!--fit-->Une figure avec toutes les informations
```R
S = seq(0.1, S0, by = 0.1)
fs = final_size(S, S0 = S0, I0 = I0, R_0 = R_0)
S_inf = uniroot(f = function(x) final_size_eq(S_inf = x, 
                                              S0 = S0, I0 = I0, 
                                              R_0 = R_0),
                interval = c(0.05, S0))
plot(S, fs, type = "l", ylab = "Valeur de l'équation (8)")
abline(h = 0)
points(x = S_inf$root, y = 0, pch = 19)
text(x = S_inf$root, y = 0, labels = "S_inf", adj = c(-0.25,-1))
```

---

# $\mathcal{R}_0=0.8$

![width:1000px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/KMK_final_size_R0_0p8.png)

---

# $\mathcal{R}_0=2.4$

![width:1000px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/KMK_final_size_R0_2p4.png)

---

# Un peu plus joli

```R
valeurs = expand.grid(
  R_0 = seq(0.01, 3, by = 0.01),
  I0 = 1:100
)
valeurs$S0 = N0-valeurs$I0
L = split(valeurs, 1:nrow(valeurs))

valeurs$S_inf = sapply(X = L, FUN = final_size)

valeurs$taille_finale = valeurs$S0-valeurs$S_inf+valeurs$I0
valeurs$taux_attaque = (valeurs$taille_finale / N0)*100

levelplot(taux_attaque ~ R_0*I0, data = valeurs, 
          xlab="R_0", ylab = "I0",
          col.regions = viridis(100))
```
(requiert les librairies `lattice` et `viridis`)

---

# Taux d'attaque (en %)

![width:1000px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/KMK_taux_attaque.png)


---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Dernières remarques

---

# Normaliser ou pas?

- Dans le SIS du [Cours 04]() et ici, puisque la population totale est constante, on peut normaliser à $N=1$
- Cela simplifie pas mal certains calculs
- Toutefois, je ne suis pas très fan: il est important de toujours garder en tête les grandeurs biologiques
- Si vous normalisez, en tout cas, pour un papier à visée biomathématique, pensez à exprimer vos résultats en grandeur réelle


---

# Là où nous en sommes
- Un modèle SIS *endémique* dans lequel le seuil $\mathcal{R}_0=1$ est t.q. quand $\mathcal{R}_0<1$, la maladie s'éteint, tandis que lorsque $\mathcal{R}_0>1$, la maladie s'établit dans la population
- Un modèle SIR *épidémique* (le KMK SIR) dans lequel la présence ou absence de vague épidémique est caractérisée par la valeur de $\mathcal{R}_0$
- Le SIS et le KMK SIR sont intégrables dans un certain sens. **C'est une exception!!!**

