---
marp: true
title: Le modèle SLIRS - Incorporation de la période d'incubation et analyse plus avancée
description: Petit cours d'épidémiologie mathématique - Julien Arino - Cours 03 - Le modèle SLIRS - Incorporation de la période d'incubation et analyse plus avancée
theme: default
math: mathjax
paginate: false
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
# Le modèle SLIRS

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

- Durée d'incubation
- Formulation du modèle SLIRS en population constante

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Durée d'incubation

---

# <!--fit-->Pourquoi prendre en compte la durée de la période d'incubation

- Modèles SIS et SIR: on progresse instantanément de $S$ à $I$
- Exemple de quelques durées d'incubation:

| Maladie | Durée d'incubation |
|:----|:----|
| Yersinia Pestis | 2-6 jours |
| Fièvre hémorragique Ebola | 2-21 jours |
| Fièvre hémorragique Marburg | 5-10 jours |
| Fièvre hémorragique Lassa | 1-3 semaines |
| Tsé-tsé | semaines, mois |
| VIH/SIDA | mois, années |

---

# Plus sur l'incubation

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Formulation du modèle SLIRS en population constante

- Formulation du modèle général
- Le modèle SLIRS avec naissance *per capita*
- Le modèle SLIRS avec naissance constante

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Formulation du modèle général

---

# Hypothèses

- Il y de la démographie
- On regardera deux cas pour commencer: naissance constante et *per capita*
- Maladie pas transmise aux nouveaux nés (pas de *transmission verticale*): toutes les naissances sont dans le compartiment $S$
- La maladie ne cause pas de mortalité additionnelle
- Nouvelles infections ont lieu au taux $f(S,I,N)$
- Il y a une période d'incubation
- Après guérison, les individus sont immunisés à la maladie
- L'immunité est perdue après un certain temps

---

# Les deux modèles SLIRS

Naissance *per capita*
$$
\begin{align}
S' &= {\color{red}bN}-f(S,I,N)-dS+\nu R
\tag{1a}\label{sys:SLIR_bN_dS}\\
L' &= f(S,I,N) -(d+\varepsilon)L 
\tag{1b}\label{sys:SLIR_bN_dL} \\
I' &= \varepsilon L -(d+\gamma)I 
\tag{1c}\label{sys:SLIR_bN_dI} \\
R' &= \gamma I-(d+\nu)R 
\tag{1d}\label{sys:SLIR_bN_dR}
\end{align}
$$
Naissance constante
$$
\begin{align}
S' &= {\color{blue}b}-f(S,I,N)-dS+\nu R
\tag{2a}\label{sys:SLIR_b_dS}\\
L' &= f(S,I,N) -(d+\varepsilon)L 
\tag{2b}\label{sys:SLIR_b_dL} \\
I' &= \varepsilon L -(d+\gamma)I 
\tag{2c}\label{sys:SLIR_b_dI} \\
R' &= \gamma I-(d+\nu)R 
\tag{2d}\label{sys:SLIR_b_dR}
\end{align}
$$

---

# Paramètres

- $1/\varepsilon$ durée moyenne de la période d'incubation

- $1/\gamma$ durée moyenne de la période infectieuse

- $1/\nu$ durée moyenne de la période d'immunité

- $1/d$ espérance de vie moyenne

## Selon le modèle

- $\color{red}b$ taux *per capita* de naissance
- $\color{blue}b$ taux de naissance

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Le modèle SLIRS avec naissance *per capita*

---

$$
\begin{align}
S' &= bN-f(S,I,N)-dS+\nu R
\tag{1a} \\
L' &= f(S,I,N) -(d+\varepsilon)L 
\tag{1b} \\
I' &= \varepsilon L -(d+\gamma)I 
\tag{1c} \\
R' &= \gamma I-(d+\nu)R 
\tag{1d}
\end{align}
$$

Sommant les équations $\eqref{sys:SLIR_bN_dS}$-$\eqref{sys:SLIR_bN_dR}$, on obtient la dynamique de la population totale $N=S+L+I+R$ 
$$
\tag{3}\label{eq:birth_death}
N´ = bN-dN
$$
C'est un processus de naissance et mort

---

# Le processus de naissance et mort
$$
\tag{3}
N´ = bN-dN
$$
Clairement
- Si $b>d$, $N(t)\to\infty$, la population totale explose
- Si $b=d$, $N(t)$ reste constant pour tout $t$
- Si $b<d$, $N(t)\to 0$, la population s'éteint

On peut considérer le modèle en proportions comme on a fait pour le SIS, dans les deux cas non constants ($b\neq d$)

---

# Modèle en proportions (cas $b\neq d$)

Si $X=\{S,L,I,R\}$, alors, notant $x=X/N$,
$$
x^\prime=\left(\frac{X}{N}\right)^\prime
=\frac{X^\prime N-XN^\prime}{N^2}
=\frac{X^\prime}{N}-x\frac{N^\prime}{N}
=\frac{X^\prime}{N}-(b-d)x
$$
où on a utilisé $\eqref{eq:birth_death}$ pour obtenir la dernière égalité

Ainsi
$$
\tag{4}\label{eq:birth_death_dx}
x^\prime = \frac{X^\prime}{N}-(b-d)x
$$
que l'on utilise pour les équations du système

---

# Équation pour $S'$
$$
\tag{1a}
S' = bN-f(S,I,N)-dS+\nu R
$$
donne, en utilisant $\eqref{eq:birth_death_dx}$
$$
\begin{align}
s' &= b-\frac{f(S,I,N)}{N}-d+\nu+(b-d)s \\
&= (b-d)(1+s)-\frac{f(S,I,N)}{N}+\nu
\end{align}
$$
On reviendra plus tard sur le terme $f(S,I,N)/N$

---

De la même manière, on obtient
$$
\begin{align}
\ell' &= \frac{f(S,I,N)}{N} -(d+\varepsilon)\ell+(b-d)\ell \\
i' &= \varepsilon\ell -(d+\gamma)i+(b-d)i \\
r' &= \gamma i-(d+\nu)r+(b-d)r 
\end{align}
$$

---

# Fonctions d'incidence classiques en proportion

Si $f(S,I,N)=\beta SI$, alors
$$
\frac{f(S,I,N)}{N} = \beta sI = \beta siN
$$
en se souvenant que $i=I/N$ et donc $I=iN$. On devra donc conserver l'équation en $N$ (mais on pourra oublier une autre équation, puisque $s+\ell+i+r=1$)

Si $f(S,I,N)=\beta\dfrac{SI}N$, alors
$$
\frac{f(S,I,N)}{N} = \beta si
$$
On garde alors les équations pour $s,\ell,i,r$ et omet celle pour $N$

---

On a donc les systèmes suivants. Incidence en action de masse
$$
\begin{align}
N' &= (b-d)N \\
\ell' &= \beta (1-\ell-i-r)iN -(d+\varepsilon)\ell+(b-d)\ell \\
i' &= \varepsilon\ell -(d+\gamma)i+(b-d)i \\
r' &= \gamma i-(d+\nu)r+(b-d)r 
\end{align}
$$
Incidence proportionnelle
$$
\begin{align}
s' &= (b-d)(1+s)-\beta si+\nu \\
\ell' &= \beta si -(d+\varepsilon)\ell+(b-d)\ell \\
i' &= \varepsilon\ell -(d+\gamma)i+(b-d)i \\
r' &= \gamma i-(d+\nu)r+(b-d)r 
\end{align}
$$
On n'étudiera pas ces systèmes ici!

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Le modèle SLIRS avec naissance constante

---

$$
\begin{align}
S' &= b-f(S,I,N)-dS+\nu R
\tag{2a} \\
L' &= f(S,I,N) -(d+\varepsilon)L 
\tag{2b} \\
I' &= \varepsilon L -(d+\gamma)I 
\tag{2c} \\
R' &= \gamma I-(d+\nu)R 
\tag{2d}
\end{align}
$$

En sommant $\eqref{sys:SLIR_b_dS}$-$\eqref{sys:SLIR_b_dR}$, on obtient que la dynamique de $N=S+L+I+R$ est donnée par
$$
\tag{5}\label{eq:SLIRS_b_dN}
N'=b-dN
$$

---

L'équation
$$
\tag{5}
N'=b-dN
$$
est facile à intégrer ou à étudier qualitativement. Qualitativement: $\eqref{eq:SLIRS_b_dN}$ est scalaire autonome, ses solutions sont donc monotones. Les solutions sont strictement positives pour des conditions initiales positives et toutes tendent vers $N^\star = b/d$

Notons que cette convergence est indépendante du comportement de $\eqref{sys:SLIR_b_dS}$-$\eqref{sys:SLIR_b_dR}$. On peut donc remplacer $N(t)$ par sa limite $N^\star$

Cela permet également d'envisager une approche numérique s'abstrayant des variations dues à la démographie: en choisissant une condition initiale $(S(0),L(0),I(0),R(0))$ t.q. $N(0)=N^\star$, on est assuré que les variations dans les variables d'état sont uniquement dues aux facteurs épidémiologiques, puisque $N(t)$ reste constant

---

Dans la suite, on étudie donc le système
$$
\begin{align}
S' &= b-f(S,I,N^\star)-dS+\nu R \\
L' &= f(S,I,N^\star) -(d+\varepsilon)L \\
I' &= \varepsilon L -(d+\gamma)I \\
R' &= \gamma I-(d+\nu)R 
\end{align}
$$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Étude mathématique du modèle SLIRS

- Début de l'analyse
- Calcul des équilibres
- Calcul classique de $\mathcal{R}_0$
- $\mathcal{R}_0$ par la matrice de prochaine génération

---

On étudie le système
$$
\begin{align}
S' &= b-f(S,I,N^\star)-dS+\nu R
\tag{6a}\label{sys:SLIRS_dS} \\
L' &= f(S,I,N^\star) -(d+\varepsilon)L 
\tag{6b}\label{sys:SLIRS_dL}  \\
I' &= \varepsilon L -(d+\gamma)I 
\tag{6c}\label{sys:SLIRS_dI}  \\
R' &= \gamma I-(d+\nu)R 
\tag{6d}\label{sys:SLIRS_dR} 
\end{align}
$$

On rappelle que la population totale $N$ est asymptotiquement constante avec limite $N^\star=b/d$

On choisit en général une condition initiale t.q. $L(0)+I(0)>0$ pour éviter le cas trivial, et pour simplifier, on suppose que 
$$
N(0)=S(0)+L(0)+I(0)+R(0)=N^\star=\dfrac bd
$$


---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Début de l'analyse

---

Le même genre de raisonement que l'on a conduit lors de l'étude du modèle SIS dans le [Cours 02]() permet de conclure que le système est bien posé, en ce que

- il y a existence et unicité des solutions de $\eqref{sys:SLIRS_dS}$-$\eqref{sys:SLIRS_dR}$
- le cône positif $\mathbb{R}_+^4$ est positivement invariant sous le flot de $\eqref{sys:SLIRS_dS}$-$\eqref{sys:SLIRS_dR}$
- les solutions de $\eqref{sys:SLIRS_dS}$-$\eqref{sys:SLIRS_dR}$ sont bornées

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Calcul des équilibres

---

$$
\begin{align}
0 &= b-f(S,I,N^\star)-dS+\nu R
\tag{7a}\label{sys:SIRS_EP_S} \\
0 &= f(S,I,N^\star) -(d+\varepsilon)L 
\tag{7b}\label{sys:SIRS_EP_L} \\
0 &= \varepsilon L -(d+\gamma)I 
\tag{7c}\label{sys:SIRS_EP_I} \\
0 &= \gamma I-(d+\nu)R 
\tag{7d}\label{sys:SIRS_EP_R}
\end{align}
$$

De $\eqref{sys:SIRS_EP_I}$, $L=(d+\gamma)I/\varepsilon$, et de $\eqref{sys:SIRS_EP_R}$, $R=\gamma I/(d+\nu)$. On en déduit en particulier qu'en un équilibre sans maladie (ESM), $L=I=R=0$

Considérons d'abord ESM, où, comme on vient de voir $L=I=R=0$. L'équation $\eqref{sys:SIRS_EP_L}$ n'est pas utile, elle dit seulement que la maladie ne se transmet pas en ESM. On considère donc $\eqref{sys:SIRS_EP_S}$, qui s'écrit
$$
f(S,0,N^\star)=b-dS
$$
On obtient la valeur de $S$ en ESM en résolvant cette équation. Mais, *en général*, $f(S,0,N^\star)=0$ (il n'y a pas transmission sans infectieux) et donc $S=b/d=N^\star$ à ESM. On aurait aussi pu raisonner que puisque $N\equiv N^\star$ et que $L=I=R=0$, alors nécessairement, $S=N^\star$

---

On a donc ESM
$$
\tag{8}\label{eq:SLIRS_DFE}
E_0:(S,L,I,R)=(N^\star,0,0,0)
$$
Trouver l'équilibre ou les équilibres endémiques (EE) est impossible sans plus d'information sur la forme de la fonction d'incidence $f$, mais on peut quand même faire quelques inférences

---

Les relationsdéduites de $\eqref{sys:SIRS_EP_I}$ et $\eqref{sys:SIRS_EP_R}$ permettent d'écrire $\eqref{sys:SIRS_EP_S}$-$\eqref{sys:SIRS_EP_R}$ sous la forme d'un système nonlinéaire à deux inconnues, $S$ et $I$
$$
\begin{align}
0 &= b-f(S,I,N^\star)-dS+\frac{\nu\gamma}{d+\nu} I
\tag{8a}\label{sys:SIRS_EEP_S} \\
0 &= f(S,I,N^\star) -\frac{(d+\varepsilon)(d+\gamma)}{\varepsilon}I
\tag{8b}\label{sys:SIRS_EEP_L}
\end{align}
$$

De $\eqref{sys:SIRS_EEP_L}$
$$
\tag{9}\label{eq:SIRS_EEP_f_eq_I}
f(S,I,N^\star)=\frac{(d+\varepsilon)(d+\gamma)}{\varepsilon}I
$$
Substituant $\eqref{eq:SIRS_EEP_f_eq_I}$ dans $\eqref{sys:SIRS_EEP_S}$,
$$
\begin{align}
& b-\frac{(d+\varepsilon)(d+\gamma)}\varepsilon I-dS+\frac{\nu\gamma}{d+\nu}I = 0 \\
\iff & 
dS+\left(
\frac{(d+\varepsilon)(d+\gamma)}\varepsilon
-\frac{\nu\gamma}{d+\nu}
\right)I = b
\tag{10}\label{eq:SIRS_EEP_dS_plus_kI}
\end{align}
$$


---

On sait du reste que la population totale satisfait
$$
\begin{align}
N^\star &= S+\frac{d+\gamma}{\varepsilon}I+I+\frac{\gamma}{d+\nu}I \\
&= S+\frac{(d+\gamma)(d+\nu)+\varepsilon(d+\nu)+\gamma\varepsilon}{\varepsilon(d+\nu)} I
\tag{11}\label{eq:SIRS_EEP_lineSI}
\end{align}
$$

On a donc deux équations de droite, $\eqref{eq:SIRS_EEP_dS_plus_kI}$ et $\eqref{eq:SIRS_EEP_lineSI}$, dont l'intersection détermine l'équilibre, et donc on confirmera la valeur en utilisant la relation $\eqref{eq:SIRS_EEP_f_eq_I}$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Calcul classique de $\mathcal{R}_0$

---

# The basic reproduction number $\mathcal{R}_0$

Indicator often used in epidemiology. Verbally

> average number of new cases generated when an infectious individual is introduced in a completely susceptible population
 
$- If $\mathcal{R}_0>1$, then each infectious individual infects on average more than 1 person and an epidemic is quite likely to occur


---

# Computation of $\mathcal{R}_0$

Mathematically

> bifurcation parameter aggregating system parameters, such that the DFE loses it *local* asymptotic stability as $\mathcal{R}_0$ crosses 1 from left to right

- Obtained by considering the linearisation of the system at the DFE
- Quickly becomes unmanageable (matrix size) and we get a non unique form

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# $\mathcal{R}_0$ par la matrice de prochaine génération

---

# Example of the SLIRS model

Variations of the infected variables described by
$$
\begin{align*}
L' &= f(S,I,N)-(\varepsilon+d) L \\
I' &= \varepsilon L -(d+\gamma) I
\end{align*}
$$
Thus
$$
\left(
\begin{matrix}
L \\
I
\end{matrix}
\right)'
=\left(
\begin{matrix}
f(S,I,N) \\
0
\end{matrix}
\right)
-
\left(
\begin{matrix}
(\varepsilon+d) L \\
(d+\gamma) I-\varepsilon L
\end{matrix}
\right)=\mathcal{F}-\mathcal{V}
$$

---

Then compute the Jacobian matrices of vectors $\mathcal{F}$ and $\mathcal{V}$
$$
F=\left(
\begin{matrix}
\dfrac{\partial\overline{f}}{\partial L}
& \dfrac{\partial\overline{f}}{\partial I} \\
0 & 0
\end{matrix}
\right),\quad
V=\left(
\begin{matrix}
\varepsilon+d & 0 \\
-\varepsilon & d+\gamma
\end{matrix}
\right)
$$
where
$$
\dfrac{\partial\overline{f}}{\partial I}:=
\dfrac{\partial f}{\partial I}(\bar
S,\bar I,\bar N)\quad\quad 
\dfrac{\partial\overline{f}}{\partial L}:=
\dfrac{\partial f}{\partial L}(\bar
S,\bar I,\bar N)
$$

---

We have
$$
V^{-1}=\frac{1}{(d+\varepsilon)(d+\gamma)}
\left(
\begin{matrix}
d+\gamma & 0 \\
\varepsilon & d+\varepsilon
\end{matrix}
\right)
$$

Also, when $N$ constant, $\partial f/\partial
L=0$, then
$$
FV^{-1}=\frac{{\partial\overline{f}}/{\partial I}}
{(d+\varepsilon)(d+\gamma)}
\left(
\begin{matrix}
\varepsilon 
& d+\varepsilon  \\
0 & 0
\end{matrix}
\right)
$$
and thus,
$$
\mathcal{R}_0=\varepsilon
\frac{{\partial\overline{f}}/{\partial I}}
{(d+\varepsilon)(d+\gamma)}
$$

---

<div class="theorem">

Let
$$
\mathcal{R}_0=
\dfrac{\varepsilon\dfrac{\partial\overline{f}}{\partial I}}
{(d+\varepsilon)(d+\gamma)}
$$

Then 
- if $\mathcal{R}_0<1$, the DFE is LAS
- if $\mathcal{R}_0>1$, the DFE is unstable
</div>

Important to stress *local* nature of stability that is deduced from this result. We will see later that even when $\mathcal{R}_0<1$, there can be several positive equilibria

---

# Application

The DFE takes the form
$$
(\bar S,\bar L,\bar I,\bar R)=(N,0,0,0)
$$
 
- Frequency-dependent contacts (mass action incidence)
$$
\frac{\partial\overline{f}}{\partial I}=\beta\bar S \Rightarrow\mathcal{R}_0 =
\frac{\varepsilon\beta N}{(\varepsilon+d)(\gamma+d)} 
$$
- Proportion-dependent contacts (standard incidence)
$$
\frac{\partial\overline{f}}{\partial I}=\frac{\beta\bar S}{N}
\Rightarrow\mathcal{R}_0 = \frac{\varepsilon\beta}{(\varepsilon+d)(\gamma+d)}
$$

---

# Remark

Method shown here is easily applied to more complex models

We will see some cases later

---

# Links between model types

<style scoped>
@import url('https://unpkg.com/tailwindcss@^2/dist/utilities.min.css');
</style>
<div class="grid grid-cols-2 gap-4">
<div>

$$
\begin{align*}
S'&=d(1-S)-f(S,I)+\nu R \\
L'&=f(S,I)-(d+\varepsilon) L \\
I'&=\varepsilon L-(d+\gamma)I \\
R'&=\gamma I-(d+\nu)R
\end{align*}
$$
</div>

<div>

- SLIR is SLIRS where $\nu=0$
- SLIS limit of an SLIRS when $\nu\to\infty$
- SLI is SLIR where $\gamma=0$
- SIRS limit of an SLIRS when $\varepsilon\to\infty$
- SIR is SIRS where $\nu=0$
- SIS limit of an SIRS when $\nu\to\infty$
- SIS limit of an SLIS when $\varepsilon\to\infty$
- SI is SIS where $\nu=0$ 
</div>

---

# Expressions of $\mathcal{R}_0$

$(\bar S,\bar I)$ the DFE, denote $\overline{f}_I=\partial f/\partial I(\bar S,\bar I)$

| Model | $\mathcal{R}_0$ | Model | $\mathcal{R}_0$ | Model | $\mathcal{R}_0$ |
|:---|:---:|:---|:---:|:---|:---:|
| SLIRS | $\dfrac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ | SIRS | $\dfrac{\varepsilon\overline{f}_I}{d+\gamma}$ | SIS | $\dfrac{\overline{f}_I}{d+\gamma}$ |
| SIR | $\dfrac{\overline{f}_I}{d+\gamma}$ | SLIS | $\dfrac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ | SI | $\dfrac{\overline{f}_I}{d+\gamma}$ | 
| SLI | $\dfrac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ | SLIR | $\dfrac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ | 

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Effect of vaccination - Herd immunity

---

Take the simple case of an SIR model but assume the following
- Vaccination takes susceptible individuals and moves them directly into the recovered compartment, without them ever becoming infected/infectious
- A fraction $p$ is vaccinated at birth
- $f(S,I,N)=\beta SI$

$$
\begin{align}
S' &= d((1-p)N-S)-\beta SI \tag{21a} \\
I' &= \beta SI -(d+\gamma)I \tag{21b} \\
R' &= dpN+\gamma I-dR \tag{21c}
\end{align}
$$

---

# Computation of $\mathcal{R}_0$
 
- DFE, SIR: 
$$
(\bar S,\bar I,\bar R)=(N,0,0)
$$
- DFE, SIR with vaccination
$$
(\bar S,\bar I,\bar R)=
\left((1-p)N,0,pN\right)
$$

Thus,
- In SIR case
$$
\mathcal{R}_0=\frac{\beta N}{d+\gamma}
$$
- In SIR with vaccination case, denote $\mathcal{R}_0^\textrm{v}$ and
$$
\mathcal{R}_0^\textrm{v}=(1-p)\mathcal{R}_0
$$

---

# Herd immunity

Therefore 
- $\mathcal{R}_0^\textrm{v}<\mathcal{R}_0$ if $p>0$
- To control the disease, $\mathcal{R}_0^\text{v}$ must take a value less than 1, i.e.,
$$
\tag{22}
\mathcal{R}_0^\text{v}<1 \iff p> 1-\frac{1}{\mathcal{R}_0}
$$

By vaccinating a fraction $p>1-1/\mathcal{R}_0$ of newborns, we thus are in a situation where the disease is eventually eradicated

This is *herd immunity*

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->SLIRS model - Global properties

---

# Lyapunov function for SLIR and SLIS

Andrei Korobeinikov. Considers an SLIR with constant population normalised to 1 and vertical transmission

$$
\begin{align}
S' &= d-\beta SI -pdI-qdL-dS 
\tag{23a}\label{sys:SEIR_vert_transmission_dS} \\
L' &= \beta SI +pdI-(\varepsilon+d-qd)L 
\tag{23b}\label{sys:SEIR_vert_transmission_dL} \\
I' &= \varepsilon L-(\gamma+d)I 
\tag{23c}\label{sys:SEIR_vert_transmission_dI}
\end{align}
$$

- $p$ proportion of newborns from $I$ who are $I$ at birth
- $q$ proportion of newborns from $L$ who are $L$ at birth
- $R$ does not influence the dynamics of the system, so not shown

---

# Equilibria
 
- DFE: $E_0=(1,0,0)$
- EEP: $E^\star =(S^\star,L^\star,I^\star)$ with
$$
S^\star =\frac 1{\mathcal{R}_0^v}\quad L^\star =\frac{d}{\varepsilon+d}\left(1-\frac
  1{\mathcal{R}_0^v}\right) 
\quad
I^\star =\frac{d\varepsilon}{(\varepsilon+d)(\gamma+d)}\left(1-\frac
  1{\mathcal{R}_0^v}\right) 
$$

where
$$
\tag{24}
\mathcal{R}_0^v=\frac{\beta\varepsilon}
{(\gamma+d)(\varepsilon+d)-qd(\varepsilon+d)-pd\varepsilon}
$$
is the basic reproduction number with vertical transmission. We have $\mathcal{R}_0=\mathcal{R}_0^v \iff p=q=0$. On the other hand, $\mathcal{R}_0^v=1$ when $\mathcal{R}_0=1$

$E^\star$ is biologically relevant only when $\mathcal{R}_0^v>1$

---


Use the function
$$
\tag{25}
V=\sum a_i(x_i-x_i^\star  \ln x_i)
$$

<div class="theorem">
 
- If $\mathcal{R}_0>1$, then system $\eqref{sys:SEIR_vert_transmission_dS}$-$\eqref{sys:SEIR_vert_transmission_dI}$ has the globally asymptotically stable equilibrium $E^\star$
- If $\mathcal{R}_0\leq 1$, then system $\eqref{sys:SEIR_vert_transmission_dS}$-$\eqref{sys:SEIR_vert_transmission_dI}$ has the globally asymptotically stable DFE $E_0$ and $E^\star$ is not biologically relevant
</div>


---

# SEIRS - Mukherjee, Chattopadhyay & Tapaswi

SEIRS with constant birth rate $d$, *per capita* death rate $d$ and incidence function
$$
f(S,I,N)=\beta S^q I^p
$$

After establishing uniform boundedness of the system, they define 
$$
V(S,E,I)=\frac 12\left(
(S-S^\star )^2+(E-E^\star )^2+(I-I^\star )^2\right)
$$

<div style = "text-align: justify; position: relative; bottom: -25%; font-size:18px;">

Mukherjee, Chattopadhyay & Tapaswi. [Global stability results of epidemiological models with nonlinear incidence rates](https://doi.org/10.1016/0895-7177(93)90009-N). *Mathematical and Computer Modelling* **18** (1993)
</div>

---

Defining matrix
$$
A=\left(
\begin{array}{ccc}
\beta I^{*p}g(S)+d+\nu & \frac 12 (\nu-\beta I^{*p}g(S)) & \frac 12
(\beta S^q h(I)+\nu) \\
\frac 12(\nu-\beta I^{*p}g(S) & \varepsilon+d & -\frac 12 (\beta S^q
h(I)+\varepsilon) \\
\frac 12 (\beta S^q h(I)+\nu) & -\frac 12(\beta S^qh(I)+\varepsilon) &
\gamma+d
\end{array}
\right)
$$
with functions $g$ and $h$ s.t.
$$
S^q-S^{*q}=(S-S^\star )g(S),\quad I^p-I^{*p}=(I-I^\star )h(I)
$$
they obtain the following result

<div class="theorem">

Function $V$ is s.t. $V'<0$ if
- $4(\beta I^{*p}g(S)+d+\nu)(\varepsilon+d)>(\nu-\beta I^{*p}g(S))^2$
- $\det A>0$
</div>

Clearly, this is hard to use in practice so the system was studied in other ways

---

# [Li & Muldowney (1995)](https://doi.org/10.1016/0025-5564(95)92756-5)

$$
\begin{align}
S' &= d-\beta S^qI^p-dS 
\tag{26a}\label{sys:SLIR_LiMuldowney_dS} \\
L' &= \beta S^qI^p -(\varepsilon+d)L
\tag{26b}\label{sys:SLIR_LiMuldowney_dL} \\
I' &= \varepsilon L-(\gamma+d)I 
\tag{26c}\label{sys:SLIR_LiMuldowney_dI} \\
R' &= \gamma I-dR
\tag{26d}\label{sys:SLIR_LiMuldowney_dR} 
\end{align}
$$

---

# Li, Muldowney and PvdD - CAMQ (1999)

SEIRS with incidence
$$
f(S,I,N)=\beta g(I)S
$$
where $g$ is s.t. $g(0)=0$, $g(I)>0$ for $I\in(0,1]$ and $g\in
C^1(0,1]$

They normalise the total population, so $S+E+I+R=1$. They make an additional hypothesis about $g$:

- **(H)** $c=\lim_{I\to 0^+} \frac{g(I)}{I}\leq +\infty$; when $0<c<+\infty$, $g(I)\leq cI$ for sufficiently small $I$

---

We have
$$
\frac{\partial\overline{f}}{\partial I}=\beta\frac{\partial\overline{g}}{\partial I}
$$
Since $\dfrac{\partial\overline{g}}{\partial I}=\lim_{I\to 0^+}
\dfrac{g(I)}{I}=c$, 
$$
\mathcal{R}_0=\frac{c\beta\varepsilon}
{(d+\varepsilon)(d+\gamma)}
$$

The local stability results already established are valid here, since $g$ is a particular case of the function $f$ used to establish these results

---

<div class="theorem">

If $g(I)$ satisfies hypothesis **(H)**, then system $f(S,I,N)=\beta S^q I^p$ with incidence $f(S,I,N)=\beta S^q I^p$ is uniformly persistent if and only if $\mathcal{R}_0>1$
</div>

The system is **uniformly persistent** if there exists $0<\epsilon_0<1$ s.t. any solution $(S(t),E(t),I(t),R(t))$ of SEIRS with initial condition $(S(0),E(0),I(0),R(0))\in \overset{\circ}{\Gamma}$ satisfies
$$
\begin{array}{c}
\liminf_{t\to\infty} S(t)\geq \epsilon_0,\quad 
\liminf_{t\to\infty} E(t)\geq \epsilon_0 \\
\liminf_{t\to\infty} I(t)\geq \epsilon_0,\quad 
\liminf_{t\to\infty} R(t)\geq \epsilon_0
\end{array}
$$

---

<div class="theorem">

Suppose that incidence $f(S,I,N)=\beta S^q I^p$ satisfies **(H)** and that
$$
|g'(I)|I\leq g(I) \textrm{ pour }I\in(0,1]
$$
Suppose additionnally that $\mathcal{R}_0>1$ and that one of the conditions
$$
\begin{gather*}
\gamma\nu<\epsilon_0(\beta\eta_0+\gamma+d)(\beta\eta_0+\nu+d) \\
\varepsilon-\gamma-d<\nu
\end{gather*}
$$
is satisfied, where 
$$
\eta_0=\min_{I\in[\epsilon_0,1]}g(I)>0
$$
and $\epsilon_0$ defined by (\ref{eq:SEIRS_persist}). Then there is no closed rectifiable curve that is invariant with respect to SEIRS. Furthermore, each semi-trajectory of SEIRS in $\Gamma$ converges to an equilibrium
</div>

The proof uses compound matrices (see [Practicum 02](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_P02_Analysis_LargeScaleModels.html))