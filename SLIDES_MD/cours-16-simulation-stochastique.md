---
marp: true
title: Petit cours d'épidémiologie mathématique - Simulation des systèmes stochastiques
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 16 - Simulation des systèmes stochastiques
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

# Petit cours d'épidémiologie mathématique<br/>Simulation des systèmes stochastiques

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
# Plan de ce cours
- Simulation et analyse numérique des CMTD
- Simulation des CMTC
- Paralléliser son code

---

# Remarques / Ressources

Ceci est un cours *orienté sur l'utilisation*: je touche à peine aux algorithmes, je me concentre sur leur utilisation

Le code est disponible dans [ce répo Github](https://github.com/julien-arino/petit-cours-epidemio-mathematique/) dans le répertoire CODE

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# Simulation et analyse numérique des CMTD

---

# Le SIS DTMC

On va considérer un modèle SIS en population totale constante $P^\star$. $S(t)$ le nombre de susceptibles, $I(t)$ le nombre d'infectieux. Les transitions suivantes sont possibles entre $t$ et $t+\Delta t$:
- Nouvelle infection, avec probabilité $\beta S(t)I(t)\Delta t$
- Guérison, avec probabilité $\gamma I(t)\Delta t$
- Pas de transition: complément des deux probabilités précédentes, $1-(\beta S(t)+\gamma)I(t)\Delta t$

Puisque $S(t)=P^\star-I(t)$, on ne considère que les infectés $I(t)$

---

# Le SIS en marche aléatoire (version simplifiée)

Transitions:
- Nouvelle infection $\lambda_I:=\beta (P^\star-I)I\ \Delta t$
- Guérison $\mu_I:=\gamma I\ \Delta t$
- Pas de transition $\sigma_I:=1-(\lambda_I+\mu_I)\ \Delta t$

On peut donc considérer une marche aléatoire absorbante sur $I$

![width:1200px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/figure_SIS_random_walk.png)

---

# Attention à $\Delta t$ !!!

Pour $I\in\{1,\ldots,P^\star\}$, on va calculer $\lambda_I=\beta(P^\star-I)I\Delta t$ et $\mu_I=\gamma I\Delta t$ (pour $I=0$, on sait que toute la masse est sur $\sigma_I$ puisque $I=0$ est absorbant). On veut
$$
\forall I\in\{1,\ldots,P^\star\},\quad
(\beta(P^\star-I)I+\gamma I)\Delta t\leq 1
$$
puisque l'on doit avoir des probabilités. $<1$ n'est pas un problème, puisqu'on rattrape les choses avec $\sigma_I=1-(\lambda_I+\gamma_I)\Delta t$

Donc on doit avoir
$$
\Delta t \leq \frac{1}{\beta(P^\star-I)I+\gamma I},\quad \forall I\in\{1,\ldots,P^\star\}
$$

---

# Calcul de la borne sup de $\Delta t$

$$
\forall I\in\{1,\ldots,P^\star\}, \quad \Delta t \leq \frac{1}{\beta(P^\star-I)I+\gamma I}=:f(I)
$$

On a:
- $f(1)=1/(\beta(P^\star-1)+\gamma)$
- $f(P^\star)=1/(\gamma P^\star)$
- $f'(1)<0$ (pourvu que $P>1$..)
- $f'(I)=0 \iff \tilde I=(\beta P^\star+\gamma)/(2\beta)$, avec $f(\tilde I)=4\beta/(\beta P^\star+\gamma)^2$
- $f''(I)>0$

$$\implies
\Delta t\leq 
\begin{cases}
\dfrac{1}{\gamma P^\star} & \text{si } \dfrac{\beta P^\star+\gamma}{2\beta} > P^\star\\
\dfrac{4\beta}{(\beta P^\star+\gamma)^2} & \text{si } \dfrac{\beta P^\star+\gamma}{2\beta} \leq P^\star
\end{cases}
$$

---

# Matrice de transition

$T\in\mathcal{M}_{P^\star +1}$ donnée par
$$
T = 
\begin{pmatrix}
1 & 0 \\
\mu_1 & \sigma_1 & \lambda_1 & 0 \\
0 & \mu_2 & \sigma_2 & \lambda_2 & 0 \\
\\
& & & & & \ddots \\
\\
& & & & &  & 0 & \mu_{P^\star-1} & \mu_{P^\star-1} & \lambda_{P^\star-1} & 0 \\
&&&&&&&& 0 & \mu_{P^\star} & \sigma_{P^\star}
\end{pmatrix}
$$

---

```R
# Construction de la matrice de transition
T = mat.or.vec(nr = (Pop+1), nc = (Pop+1))
for (row in 2:Pop) {
  I = row-1
  mv_right = gamma*I*Delta_t # Guérisons
  mv_left = beta*I*(Pop-I)*Delta_t # Infections
  T[row,(row-1)] = mv_right
  T[row,(row+1)] = mv_left
}
# Dernier rang, mouvement vers la gauche uniquement
T[(Pop+1),Pop] = gamma*(Pop)*Delta_t
# On vérifie que les valeurs ne sont pas trop grandes
if (max(rowSums(T))>1) {
  T = T/max(rowSums(T))
}
diag(T) = 1-rowSums(T)
```


---

# Simulation d'une CMTD

```R
library(DTMCPack)
sol = MultDTMC(nchains = 20, tmat = T, io = IC, n = t_f)
```
donne 20 réalisations d'une CMTD avec matrice de transition ``T``, conditions initiales ``IC`` (un vecteur de probabilité d'être dans les $P^\star+1$ differents états de $I$) et temps final ``t_f``

Voir [le code](https://github.com/julien-arino/UK-APASI)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/stochastic/several_DTMC_sims.png)

---

# Aller plus loin

`DTMCPack` est bien pour obtenir des réalisation d'une CMTD, mais pour l'étudier plus en détail, `markovchain` est bien plus complet

```R
library(markovchain)
mcSIS <- new("markovchain", 
             states = sprintf("I_%d", 0:Pop),
             transitionMatrix = T,
             name = "SIS")
```

De façon intéressante, `markovchain` redéfinit l'étrange notation de `R`pour les produits matriciels où "`*` est Hadamard, `%*%` est l'habituel", si bien que pour un objet défini comme `markovchain`, `mcSIS*mcSIS` est le produit matriciel usuel

---

```R
> summary(mcSIS)
SIS  Markov chain that is composed by: 
Closed classes: 
I_0 
Recurrent classes: 
{I_0}
Transient classes: 
{I_1,I_2,I_3,I_4,I_5,I_6,I_7,I_8,I_9,I_10,I_11,I_12,I_13,I_14,I_15,
I_16,I_17,I_18,I_19,I_20,I_21,I_22,I_23,I_24,I_25,I_26,I_27,I_28,
I_29,I_30,I_31,I_32,I_33,I_34,I_35,I_36,I_37,I_38,I_39,I_40,I_41,
I_42,I_43,I_44,I_45,I_46,I_47,I_48,I_49,I_50,I_51,I_52,I_53,I_54,
I_55,I_56,I_57,I_58,I_59,I_60,I_61,I_62,I_63,I_64,I_65,I_66,I_67,
I_68,I_69,I_70,I_71,I_72,I_73,I_74,I_75,I_76,I_77,I_78,I_79,I_80,
I_81,I_82,I_83,I_84,I_85,I_86,I_87,I_88,I_89,I_90,I_91,I_92,I_93,
I_94,I_95,I_96,I_97,I_98,I_99,I_100}
The Markov chain is not irreducible 
The absorbing states are: I_0
```

---

<span style="font-size:25px;">

Function | Role
--- | ---
`absorbingStates` | absorbing states of the transition matrix, if any
`steadyStates` | the vector(s) of steady state(s) in matrix form
`meanFirstPassageTime` | matrix or vector of mean first passage times
`meanRecurrenceTime` | vector of mean number of steps to return to each recurrent state
`hittingProbabilities` | matrix of hitting probabilities for a Markov chain
`meanAbsorptionTime` | expected number of steps for a transient state to be absorbed by any recurrent class
`absorptionProbabilities` | $\mathbb{P}$ transient states being absorbed by each recurrent state
`canonicForm` | canonic form of transition matrix
`period` | the period of an irreducible DTMC
`summary` | DTMC summary

</span>

--- 

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Simulation des CMTC
- Algorithme de Gillespie
- Utilisation d'une librairie
- Limitation de Gillespie et tau-leap

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Algorithme de Gillespie

---

Poids | Transition | Effet 
--- | --- | ---
$\beta SI$ | $S\to S-1$, $I\to I+1$ | nouvelle infection d'un susceptible 
$\gamma I$ | $S\to S+1$, $I\to I-1$ | guérison d'un infectieux

On utilise $S=N^*-I$ et on omet la dynamique de $S$

---

# <!--fit-->Algorithme de Gillespie (modèle SIS avec seulement I)

posons $t\leftarrow t_0$ et $I(t)\leftarrow I(t_0)$
tant que {$t\leq t_f$}
- $\xi_t\leftarrow \beta (P^\star-i)i+\gamma i$
- tirer $\tau_t$ de $T\thicksim \mathcal{E}(\xi_t)$
- $v\leftarrow\left[\beta (P^\star-i)i,\xi_t\right]/\xi_t$
- tirer $\zeta_t$ de $\mathcal{U}([0,1])$
- trouver $pos$ t.q. $v_{pos-1}\leq\zeta_t\leq v_{pos}$
- selon {$pos$}
  - 1: nouvelle infection, $I(t+\tau_t)=I(t)+1$
  - 2: fin de la période infectieuse, $I(t+\tau_t)=I(t)-1$
- $t\leftarrow t+\tau_t$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Utilisation d'une librairie

---

- Vous pouvez implémenter l'algorithme de Gillespie à la main, c'est un bon exercice. On le fait plus loin, d'ailleurs
- Mais dans `R`, il y a plusieurs librairies permettant de faire ça facilement
- Ces librairies ont aussi l'avantage qu'elles implémentent le tau-leap (voir plus loin dans ce cours)

---

# Simulation d'une CMTC avec une librairie

```R
library(GillespieSSA2)
IC <- c(S = (Pop-I_0), I = I_0)
params <- c(gamma = gamma, beta = beta)
reactions <- list(
  reaction("beta*S*I", c(S=-1,I=+1), "new_infection"),
  reaction("gamma*I", c(S=+1,I=-1), "recovery")
)
set.seed(NULL)
sol <- ssa(
    initial_state = IC,
    reactions = reactions,
    params = params,
    method = ssa_exact(),
    final_time = t_f,
)
plot(sol$time, sol$state[,"I"], type = "l",
     xlab = "Time (days)", ylab = "Number infectious")
```

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/stochastic/one_CTMC_sim.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Limitation de Gillespie et tau-leap

---

# Parfois, simuler une CMTC peut être compliqué

- Le temps inter-évènements est distribué exponentiellement
- Étape critique de l'algorithme de Gillespie:
  -  $\xi_t\leftarrow$ poids de tous les évènements possibles (*propensité*)
  - Tirer $\tau_t$ au hasard d'une $T\thicksim \mathcal{E}(\xi_t)$
- Donc le temps inter-évènement $\tau_t\to 0$ si $\xi_t$ devient très grand ([Cours 05](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-05-temps-de-residence.html#19): exponentielle de paramètre $\xi_t$ a un temps de séjour moyen $1/\xi_t$)
- Ceci peut causer un "arrêt" de la simulation

---

# Exemple: un processus de naissance et mort

- Individus naissent au taux *per capita* $b$
- Individus meurrent au taux *per capita* $d$
- Faisons un Gillespie classique "à la main"

---

# <!--fit-->Algorithme de Gillespie (modèle naissance & mort)

posons $t\leftarrow t_0$ et $N(t)\leftarrow N(t_0)$
tant que {$t\leq t_f$}
- $\xi_t\leftarrow (b+d)N(t)$
- tirer $\tau_t$ de $T\thicksim \mathcal{E}(\xi_t)$
- $v\leftarrow\left[bN(t),\xi_t\right]/\xi_t$
- tirer $\zeta_t$ from $\mathcal{U}([0,1])$
- trouver $pos$ t.q. $v_{pos-1}\leq\zeta_t\leq v_{pos}$
- selon {$pos$}
  - 1: naissance, $N(t+\tau_t)=N(t)+1$
  - 2: mort, $N(t+\tau_t)=N(t)-1$
- $t\leftarrow t+\tau_t$

---

```R
b = 0.01   # Taux de naissance
d = 0.01   # Taux de mortalité
t_0 = 0    # Temps initial
N_0 = 100  # Population initiale

# Vecteurs pour le temps et l'état, initialisés avec la condition initiale
t = t_0
N = N_0

t_f = 1000  # Temps final

# On garde le temps et l'état actuel en mémoire. On pourrait juste regarder 
# la fin des vecteurs t et N, mais ça demande plus d'opérations
t_curr = t_0
N_curr = N_0
```

---

```R
while (t_curr<=t_f) {
  xi_t = (b+d)*N_curr
  # Pour éviter les problèmes lorsque N=0, on termine si c'est le cas
  if (N_curr == 0) {
    break
  }
  tau_t = rexp(1, rate = xi_t)
  t_curr = t_curr+tau_t
  v = c(b*N_curr, xi_t)/xi_t
  zeta_t = runif(n = 1)
  pos = findInterval(zeta_t, v)+1
  switch(pos,
         { 
           # Naissance
           N_curr = N_curr+1
         },
         {
           # Mort
           N_curr = N_curr-1
         })
  N = c(N, N_curr)
  t = c(t, t_curr)
}
```

---

# <!--fit-->Choisir au hasard une valeur d'une loi exponentielle

Si vous n'avez pas accès à un générateur de nombre aléatoires exponentiels (pas de problème en `R`), vous pouvez utiliser une loi uniforme sur $[0,1]$ (ça, ça existe toujoura)

On veut $\tau_t$ de $T\thicksim\mathcal{E}(\xi_t)$, i.e., $T$ a la densité de probabilité
$$
f(x,\xi_t)=
\xi_te^{-\xi_t x}\mathbf{1}_{x\geq 0}
$$
On utilise l'inverse de la densité cumulative $F(x,\xi_t)=\int_{-\infty}^x f(s,\xi_t)\,ds$
$$
F(x,\xi_t)=
(1-e^{-\xi_t x})\mathbf{1}_{x\geq 0}
$$
qui à ses valeurs dans $[0,1]$. Tirons $\zeta$ de $\mathcal{U}([0,1])$ et résolvons $F(x,\xi_t)=\zeta$ pour $x$
$$
\begin{align*}
F(x,\xi_t)=\zeta & \Leftrightarrow 1-e^{-\xi_tx}=\zeta
\Leftrightarrow e^{-\xi_tx} = 1-\zeta 
\Leftrightarrow \xi_tx = -\ln(1-\zeta) \\
&\Leftrightarrow \boxed{x = \frac{-\ln(1-\zeta)}{\xi_t}}
\end{align*}
$$

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS//CTMC_birth_death_sol_b=0_01__d=0_01.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS//CTMC_birth_death_sol_b=0_01__d=0_02.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS//CTMC_birth_death_sol_b=0_025__d=0_01.png)

---

# Ce dernier ne s'est pas bien passé

- Je voulais 1000 unités de temps (jours?)
- J'ai interrompu lorsque $t=473.4544$ parce que j'ai perdu patience
- (Transparent $b=0.01,d=0.02$: la simul s'est arrêtée parce que la population s'est éteinte, je ne l'ai pas arreêté!)
- Au temps d'arrêt
  - $|N| = 241\ 198$
  - le temps allait très lentement
```R
> tail(diff(t))
[1] 1.357242e-04 1.291839e-04 5.926044e-05 7.344020e-05 1.401148e-04 4.423529e-04
```

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS//CTMC_birth_death_ie_vs_t_b=0_025__d=0_01.png)

---

# Le tau-leap au secours !

- Je ne vais pas rentrer dans les détails
- Méthode d'*approximation* (pas comme Gillespie classique, qui est exact)
- En gros: considère des "groupes" d'évènements plutôt que des évènements individuels
- Bonne nouvelle: `GillespieSSA2` (qu'on a vu avant) et `adaptivetau` implémentent le tau-leap

--- 

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Paralléliser son code

---

# Parallélisation

- Pour faire beaucoup de simulations (voir de multiples réalisations), c'est une bonne idée de paralléliser son code
- Les réalisations d'une chaîne de Markov (ainsi que bien d'autres problèmes dans ce *petit cours*) sont ce que l'on appelle *embarrassingly parallel*: les réalisations sont indépendantes, donc pourvu d'avoir assez de CPU et assez de RAM, on peut les faire tourner en même temps sans se poser de questions
- En `R`, on utilisera `parLapply` pour ce genre de simulations
- Implémentation facile, mais encore plus facile avec un exemple :)

---

On écrit une fonction, e.g.,  `run_one_sim` qui .. fait une simulation, puis on l'appelle avec `parLapply` après avoir "instancié" un cluster

```R
no_cores <- detectCores()-1
cl <- makeCluster(no_cores)
clusterEvalQ(cl,{
  library(GillespieSSA2)
})
clusterExport(cl,
              c("params", "run_one_sim"),
              envir = .GlobalEnv)
SIMS = parLapply(cl = cl, 
                 X = 1:params$number_sims, 
                 fun =  function(x) run_one_sim(params))
stopCluster(cl)
```

Voir `simulate_CTMC_parallel.R` sur [Github](https://github.com/julien-arino/UK-APASI)

---

# Bénéfices de la parallélisation

À titre d'exemple, pour montrer à quel point on peut gagner en temps

On fait tourner le code parallèle pour 100 simuls entre `tictoc::tic()` et `tictoc::toc()`, donnant `66.958 sec elapsed`, puis la version séquentielle

```R
tictoc::tic()
SIMS = lapply(X = 1:params$number_sims, 
              FUN =  function(x) run_one_sim(params))
tictoc::toc()
```
qui donne `318.141 sec elapsed` sur une machine Intel Corei9-8950HK 6C/12T @ 2.90GHz (4.75$\times$ plus rapide). Sur une machine plus orientée calcul: `12.067 sec elapsed` versus `258.985 sec elapsed` sur un processeur AMD Ryzen Threadripper 3970X 32C/64T @ 4.15GHz (21.46$\times$ plus rapide !)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/many_CTMC_sims_with_means.png)

---

# Remarque: interpolation des solutions

- Dans la figure sur le transparent précédent, on présente la moyenne et la moyenne conditionnée sur la non extinction
- C'est un peu plus compliqué qu'il n'y paraît: chaque réalisation a un ensemble d'instants de saut différent, puisque ces temps sont tirés au hasard
- Pour calculer une moyenne, on doit donc interpoler les solutions
- Dans le code, c'est ce que fait la fonction `approx`, que l'on utilise sur la solution générée par la fonction `ssa`