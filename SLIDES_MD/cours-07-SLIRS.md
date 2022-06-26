---
marp: true
title: Le modèle SLIRS - Incorporation de la période d'incubation et analyse plus avancée
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 07 - Le modèle SLIRS, incorporation de la période d'incubation et analyse plus avancée
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

# Petit cours d'épidémiologie mathématique<br/>Le modèle SLIRS

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

- Durée d'incubation
- Formulation du modèle SLIRS en population constante
- Effet de la vaccination - Immunité de groupe
- Propriétés globales du modèle SLIRS

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
| Fièvre hémorragique virale (FHV) Ebola | 2-21 jours |
| FHV Marburg | 5-10 jours |
| FHV Lassa | 1-3 semaines |
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
- Hiérarchie de modèles

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

Les relations déduites de $\eqref{sys:SIRS_EP_I}$ et $\eqref{sys:SIRS_EP_R}$ permettent d'écrire $\eqref{sys:SIRS_EP_S}$-$\eqref{sys:SIRS_EP_R}$ sous la forme d'un système nonlinéaire à deux inconnues, $S$ et $I$
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

**NB -** On a déjà remarqué que dans le cas d'une population totale constante, bien des fonctions d'incidence sont similaires; en absence de $\eqref{eq:SIRS_EEP_lineSI}$, on cherche l'intersection de $\eqref{eq:SIRS_EEP_f_eq_I}$ et $\eqref{eq:SIRS_EEP_dS_plus_kI}$, ce qui est plus compliqué

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
# <!--fit-->$\mathcal{R}_0$ par la matrice de prochaine génération

---

Les variations des variables infectées sont données par
$$
\begin{align*}
L' &= f(S,I,N^\star)-(\varepsilon+d) L \\
I' &= \varepsilon L -(d+\gamma) I
\end{align*}
$$
Donc on écrit le système en les variables infectées sous la forme
$$
\left(
\begin{matrix}
L \\
I
\end{matrix}
\right)'
=\left(
\begin{matrix}
f(S,I,N^\star) \\
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

On calcule les matrices Jacobiennes associées aux vecteurs $\mathcal{F}$ et $\mathcal{V}$
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
où
$$
\dfrac{\partial\overline{f}}{\partial I}:=
\left.\dfrac{\partial f}{\partial I}\right|_{E_0}
\quad\quad 
\dfrac{\partial\overline{f}}{\partial L}:=
\left.\dfrac{\partial f}{\partial L}
\right|_{E_0}
$$

---

On a
$$
V^{-1}=\frac{1}{(d+\varepsilon)(d+\gamma)}
\left(
\begin{matrix}
d+\gamma & 0 \\
\varepsilon & d+\varepsilon
\end{matrix}
\right)
$$

Aussi, puisque $N$ est constant, $\partial f/\partial
L=0$. Par conséquent
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
et donc
$$
\mathcal{R}_0=\varepsilon
\frac{{\partial\overline{f}}/{\partial I}}
{(d+\varepsilon)(d+\gamma)}
$$

---

<div class="theorem">

Soit
$$
\mathcal{R}_0=
\dfrac{\varepsilon\dfrac{\partial\overline{f}}{\partial I}}
{(d+\varepsilon)(d+\gamma)}
$$

Alors 
- si $\mathcal{R}_0<1$, ESM est LAS
- si $\mathcal{R}_0>1$, ESM est instable
</div>

Important d'insister sur la nature *locale* de la stabilité qui est déduite de ce résultat. On verra un exemple où lorsque $\mathcal{R}_0<1$, il peut y avoir plusieurs équilibres strictement positifs, et un autre où plusieurs ESM ont lieu en même temps

---

# Application

- Incidence en action de masse
$$
\frac{\partial\overline{f}}{\partial I}=\beta\bar S \Rightarrow\mathcal{R}_0 =
\frac{\varepsilon\beta N}{(\varepsilon+d)(\gamma+d)} 
$$
- Incidence standard
$$
\frac{\partial\overline{f}}{\partial I}=\frac{\beta\bar S}{N}
\Rightarrow\mathcal{R}_0 = \frac{\varepsilon\beta}{(\varepsilon+d)(\gamma+d)}
$$

---

# Remarques

- N'utilisez pas les deux méthodes!

- La méthode de matrice de prochaine génération s'applique facilement à des modèles plus complexes, comme on le verra dans le reste du cours

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Hiérarchie de modèles

---

# On dérive beaucoup de modèles du SLIRS

<style scoped>
@import url('https://unpkg.com/tailwindcss@^2/dist/utilities.min.css');
</style>
<div class="grid grid-cols-2 gap-4">
<div>

$$
\begin{align}
S' &= b-f(S,I,N)-dS+\nu R \\
L' &= f(S,I,N) -(d+\varepsilon)L \\
I' &= \varepsilon L -(d+\gamma)I \\
R' &= \gamma I-(d+\nu)R 
\end{align}
$$
</div>

<div>

- SLIR: SLIRS où $\nu=0$
- SLIS: limite SLIRS quand $\nu\to\infty$
- SLI: SLIR où $\gamma=0$
- SIRS: limite SLIRS quand $\varepsilon\to\infty$
- SIR: SIRS où $\nu=0$
- SIS: limite SIRS quand $\nu\to\infty$
- SIS: limite SLIS quand $\varepsilon\to\infty$
- SI: SIS où $\nu=0$ 
</div>

---

# Expressions de $\mathcal{R}_0$

$(\bar S,\bar I)$ ESM, notons $\overline{f}_I=\partial f/\partial I(\bar S,\bar I)$

| Modèle | $\mathcal{R}_0$ | Modèle | $\mathcal{R}_0$ | Modèle | $\mathcal{R}_0$ |
|:---|:---:|:---|:---:|:---|:---:|
| SLIRS | $\dfrac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ | SIRS | $\dfrac{\varepsilon\overline{f}_I}{d+\gamma}$ | SIS | $\dfrac{\overline{f}_I}{d+\gamma}$ |
| SIR | $\dfrac{\overline{f}_I}{d+\gamma}$ | SLIS | $\dfrac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ | SI | $\dfrac{\overline{f}_I}{d+\gamma}$ | 
| SLI | $\dfrac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ | SLIR | $\dfrac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ | 

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Effet de la vaccination - Immunité de groupe

---

On reprend le modèle SLIRS de tantôt, mais on le modifie comme suit:
- Il n'y a pas de perte d'immunité, c'est un modèle SLIR, i.e., $\nu = 0$
- La vaccination prend une proportion $p$ des nouveaux susceptibles et les place directement dans le compartiment $R$ des guéris, sans jamais les laisser devenir infectés
- Une fraction $1-p$ des nouveaux nés n'est pas vaccinée à la naissance
- $f(S,I,N)=\beta SI$

On a donc le modèle qui suit

$$
\begin{align}
S' &= (1-p)b-f(S,I,N)-dS \\
L' &= f(S,I,N) -(d+\varepsilon)L \\
I' &= \varepsilon L -(d+\gamma)I \\
R' &= pb+\gamma I-dR 
\end{align}
$$

---

# Calcul de $\mathcal{R}_0$
 
- Pour rappel, ESM du SLIR (comme SLIRS):
$$
(\bar S,\bar L, \bar I,\bar R)=(N,0,0,0)
$$
- ESM du SLIR avec vaccination
$$
(\bar S,\bar L, \bar I,\bar R)=
\left((1-p)\frac bd,0,p\frac bd\right)
=\left((1-p)N^\star,0,0,pN^\star\right)
$$

Donc
- dans le cas SLIR
$$
\mathcal{R}_0=\frac{\varepsilon\beta N^\star}{(d+\gamma)(d+\varepsilon)}
$$
- dans le cas SLIR avec vaccination case, notons $\mathcal{R}_0^\textrm{v}$ et
$$
\mathcal{R}_0^\textrm{v}=(1-p)\mathcal{R}_0
$$

---

# Immunité de groupe

Par conséquent 
- $\mathcal{R}_0^\textrm{v}<\mathcal{R}_0$ si $p>0$: le nombre de reproduction avec vaccination est toujours meilleur (plus petit) que celui sans vaccination
- Pour contrôler la maladie, $\mathcal{R}_0^\text{v}$ doit prendre une valeur inférieure à 1, i.e.,
$$
\tag{12}
\mathcal{R}_0^\text{v}<1 \iff p> 1-\frac{1}{\mathcal{R}_0}
$$

En vaccinant une fraction $p>1-1/\mathcal{R}_0$ de nouveaux nés, on se place dans une situation dans laquelle la maladie est éradicable

C'est l'**immunité de groupe**

---

On verra ailleurs ([Cours ]()) une autre façon de modéliser la vaccination, ainsi que des conséquences inattendues de la vaccination

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Propriétés globales du modèle SLIRS

---

# SLIRS - Mukherjee, Chattopadhyay & Tapaswi

SLIRS (SEIRS) avec naissance constante $d$, mortalité *per capita* $d$ et fonction d'incidence
$$
f(S,I,N)=\beta S^q I^p
$$

Établissent bornitude uniforme, puis définissent
$$
V(S,E,I)=\frac 12\left(
(S-S^\star )^2+(E-E^\star )^2+(I-I^\star )^2\right)
$$

<div style = "text-align: justify; position: relative; bottom: -25%; font-size:18px;">

Mukherjee, Chattopadhyay & Tapaswi. [Global stability results of epidemiological models with nonlinear incidence rates](https://doi.org/10.1016/0895-7177(93)90009-N). *Mathematical and Computer Modelling* **18** (1993)
</div>

---

Définissant
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
avec fonctions $g$ et $h$ t.q.
$$
S^q-S^{*q}=(S-S^\star )g(S),\quad I^p-I^{*p}=(I-I^\star )h(I)
$$
ils obtiennent le résultat suivant

<div class="theorem">

La fonction $V$ est t.q. $V'<0$ si
- $4(\beta I^{*p}g(S)+d+\nu)(\varepsilon+d)>(\nu-\beta I^{*p}g(S))^2$
- $\det A>0$
</div>

Clairement, dur à verifier en pratique, donc le système est étudié d'autres façons

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

# Li, Muldowney & PvdD - CAMQ (1999)

SLIRS (SEIRS) avec incidence
$$
f(S,I,N)=\beta g(I)S
$$
où $g$ t.q. $g(0)=0$, $g(I)>0$ pour $I\in(0,1]$ et $g\in
C^1(0,1]$

Normalisent la population totale à $S+E+I+R=1$. Hypothèse additionnelle sur $g:$

- **(H)** $c=\lim_{I\to 0^+} \frac{g(I)}{I}\leq +\infty$; quand $0<c<+\infty$, $g(I)\leq cI$ pour $I$ suffisamment petit

---

On a
$$
\frac{\partial\overline{f}}{\partial I}=\beta\frac{\partial\overline{g}}{\partial I}
$$
Puisque $\dfrac{\partial\overline{g}}{\partial I}=\lim_{I\to 0^+}
\dfrac{g(I)}{I}=c$, 
$$
\mathcal{R}_0=\frac{c\beta\varepsilon}
{(d+\varepsilon)(d+\gamma)}
$$

---

<div class="theorem">

Si $g(I)$ satisfait **(H)**, alors le système avec incidence $f(S,I,N)=\beta S^q I^p$ est uniformément persistant $\iff\mathcal{R}_0>1$
</div>

Le système est **uniformément persistant** s'il existe $0<\epsilon_0<1$ t.q. toute solution $(S(t),E(t),I(t),R(t))$ du SEIRS avec conditions initiales $(S(0),E(0),I(0),R(0))\in \overset{\circ}{\Gamma}$ satisfait
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

Supposons que l'incidence $f(S,I,N)=\beta S^q I^p$ satisfait **(H)** et que 
$$
|g'(I)|I\leq g(I) \textrm{ pour }I\in(0,1]
$$
Supposons additionnallement que $\mathcal{R}_0>1$ et que l'une des conditions
$$
\begin{gather*}
\gamma\nu<\epsilon_0(\beta\eta_0+\gamma+d)(\beta\eta_0+\nu+d) \\
\varepsilon-\gamma-d<\nu
\end{gather*}
$$
soit satisfaite, où
$$
\eta_0=\min_{I\in[\epsilon_0,1]}g(I)>0
$$
et $\epsilon_0$ est défini comme précédemment. Alors il n'y a pas de courbe fermée rectifiable qui soit invariante sous le flot de SEIRS. De plus, toute semi-trajectoire de SEIRS dans $\Gamma$ converge vers un équilibre
</div>

La preuve utilise les matrices composées (voir [Cours 11]())


---

# Fonction de Liapounoff pour SLIR et SLIS

Andrei Korobeinikov. Considère un SLIR avec population constante normalisée à 1 et avec transmission verticale

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

- $p$ proportion de nouveaux nés de $I$ qui sont $I$ à la naissance
- $q$ proportion de nouveaux nés de $L$ qui sont $L$ à la naissance
- $R$ n'influe pas sur la dynamique du système, on ne le montre pas

---

# Équilibres
 
- ESM: $E_0=(1,0,0)$
- EE: $E^\star =(S^\star,L^\star,I^\star)$ avec
$$
S^\star =\frac 1{\mathcal{R}_0^v}\quad L^\star =\frac{d}{\varepsilon+d}\left(1-\frac
  1{\mathcal{R}_0^v}\right) 
\quad
I^\star =\frac{d\varepsilon}{(\varepsilon+d)(\gamma+d)}\left(1-\frac
  1{\mathcal{R}_0^v}\right) 
$$
où
$$
\tag{24}
\mathcal{R}_0^v=\frac{\beta\varepsilon}
{(\gamma+d)(\varepsilon+d)-qd(\varepsilon+d)-pd\varepsilon}
$$
est le nombre de reproduction élémentaire avec transmission verticale. On a $\mathcal{R}_0=\mathcal{R}_0^v \iff p=q=0.$ Par ailleurs, $\mathcal{R}_0^v=1$ lorsque $\mathcal{R}_0=1$

$E^\star$ est biologiquement valide seulement lorsque $\mathcal{R}_0^v>1$

---


Utilisons la fonction
$$
\tag{25}
V=\sum a_i(x_i-x_i^\star  \ln x_i)
$$

<div class="theorem">
 
- Si $\mathcal{R}_0>1$, alors $\eqref{sys:SEIR_vert_transmission_dS}$-$\eqref{sys:SEIR_vert_transmission_dI}$ a l'équilibre GAS $E^\star$
- Si $\mathcal{R}_0\leq 1$, alors $\eqref{sys:SEIR_vert_transmission_dS}$-$\eqref{sys:SEIR_vert_transmission_dI}$ a l'ESM $E_0$ GAS et $E^\star$ n'est pas valide biologiquement
</div>


---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Compound matrices

---

# The compound matrix method

- An extension of Dulac's criterion to higher order systems
- Useful to rule out the existence of periodic orbits
- Was very popular for a while, but you must be aware of the main limitation:
  - Becomes hard to use when dimensionality $\geq 4$

---

Refer for example to Fiedler, 1998 for details

Let $A=(a_{ij})$, $i=1,\ldots,m$, $j=1,\ldots,n$ an $m\times n$-matrix and $k$ an integer, $1\leq k\leq\min(m,n)$

Let $M=\{1,\ldots,m\}$ and $N=\{1,\ldots,n\}$, $M^{(k)}$ and $N^{(k)}$) the lexicographically ordered sets of ordered $k$-tuples of elements of $M$ and $N$, respecti

---


The $k$th compound matrix $A^{(k)}$ of $A$ is the $C(m,k)\times C(n,k)$ matrix, with rows indexed by elements of $M^{(k)}$ and columns indexed by the elements of $N^{(k)}$, s.t. element $A^{(k)}(I,J)$, $I\in M^{(k)}$, $J\in N^{(k)}$ is the determinant $\det A(I,J)$

$A(I,J)$ is the submatrix of $A$ consisting of rows in $I$ and columns in $J$

Another interpretation of $A^{(k)}$ is as the $k$th exterior product of matrix $A$

---


Suppose now that $A$ is an $n\times n$-matrix. The matrix $(I+tA)^{(k)}$ is a $C(n,k)\times C(n,k)$-matrix, with each entry a polynomial of $t$ with degree at most $k$

Grouping monomials of same degree in $t$
$$
(I+tA)^{(k)}=A^{(k,0)}+tA^{(k,1)}+\cdots+t^kA^{(k,k)}
$$
where matrices $A^{(k,s)}$ do not depend on $t$

Matrix $A^{(k,1)}$ is the $k$th **additive compound matrix** of $A$ and is denoted $A^{[k]}$. It satisfies
$$
A^{[k]}=\lim_{h\to 0}
\left(\frac 1h\left((I+hA)^{(k)}-I^{(k)}\right)\right)
$$

The latter equality can be written
$$
A^{[k]}=D_+(I+hA)^{(k)}|_{h=0}
$$
where $D_+$ is the right derivative

---


<div class="theorem">

Suppose $A=(a_{pq})$. Then, for $I,J\in N^{(k)}$
$$
A^{[k]}(I,J)=\left\{
\begin{array}{ll}
\sum_{p\in I}a_{pp} & \textrm{if } J=I \\
0 & \textrm{if }|I\cap J|\leq k-2 \\
(-1)^\sigma a_{pq} & \textrm{if } |I\cap J|=k-1
\end{array}
\right.
$$
where $p$ is the entry in $I\setminus(I\cap J)$, $q$ is the entry in $J\setminus(I\cap J)$ and $\sigma$ is the number of entries of $I\cap J$ between $p$ and $q$
</div>

---

When $k=2$, we have

<div class="theorem">

Suppose that $A=(a_{ij})$. For all $i=1,\ldots,C(n,2)$, let $(i)=(i_1,i_2)$ the $i$th element of the lexicographic order of pairs $(i_1,i_2)$ of integers s.t. $1\leq i_1<i_2\leq n$

Then the entry in the $i$th row and $j$th column of $A^{[2]}$ is
$$
a_{ij}=\left\{
\begin{array}{ll}
a_{i_1i_1}+a_{i_2i_2} & \textrm{if } (j)=(i) \\
(-1)^{r+s}a_{i_rj_s} & \textrm{if exactly one element  } i_r\textrm{ of }(i)\textrm{ does not appear}\\
&\textrm{in }(j)\textrm{ and }j_s \textrm{ does not appear in }(i) \\
0 & \textrm{if no element of }(i)
\textrm{ appears in }(j) 
\end{array}
\right.
$$
where $p$ is the entry in $I\setminus(I\cap J)$, $q$ is the entry in $J\setminus(I\cap J)$ and $\sigma$ is the number of elements of $I\cap J$ between $p$ and $q$
</div>

---

# Example

Let
$$
A_2=\left(
\begin{matrix}
a_{11} & a_{12} \\
a_{21} & a_{22} 
\end{matrix}
\right),\quad
A_3=\left(
\begin{matrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33}
\end{matrix}
\right)
$$
$$
A_4=\left(
\begin{matrix}
a_{11} & a_{12} & a_{13} & a_{14} \\
a_{21} & a_{22} & a_{23} & a_{24} \\
a_{31} & a_{32} & a_{33} & a_{34} \\
a_{41} & a_{42} & a_{43} & a_{44}
\end{matrix}
\right)
$$

---

Then
$$
A_2^{[2]}=a_{11}+a_{22},\quad
A_3^{[2]}=\left(
\begin{matrix}
a_{11}+a_{22} & a_{23} & -a_{13} \\
a_{32} & a_{11}+a_{33} & a_{12} \\
-a_{31} & a_{21} & a_{22}+a_{33}
\end{matrix}
\right)
$$


---

$$
A_4^{[2]}=\left(
\begin{matrix}
a_{11}+a_{22} & a_{23} & a_{24} & -a_{13} & -a_{14} & 0 \\
a_{32} & a_{11}+a_{33} & a_{34} & a_{12} & 0 & -a_{14} \\
a_{42} & a_{43} & a_{11}+a_{44} & 0 & a_{12} & a_{13} \\
-a_{31} & a_{21} & 0 & a_{22}+a_{33} & a_{34} & -a_{24} \\
-a_{41} & 0 & a_{21} & a_{43} & a_{22}+a_{44} & a_{23} \\
0 & -a_{41} & a_{31} & -a_{42} & a_{32} & a_{33}+a_{44}
\end{matrix}
\right)
$$
$$
A_3^{[3]}=a_{11}+a_{22}+a_{33}
$$
$$
A_4^{[3]}=\left(
\right)
$$

---

<div class="theorem">

Let $A,B$ be two $n\times n$-matrices. Then
 
- The number of nonzero offdiagonal entries of $A^{[k]}$ equals $C(n-2,k-1)$ times the number of nonzero offdiagonal entries of $A$
- $A^{[1]}=A$, $A^{[n]}=\mathsf{tr} A$
- $(A+B)^{[k]}=A^{[k]}+B^{[k]}$ (whence the *additive* suffix)
- Let $S$ be a nonsingular $n\times n$-matrix. Then
$$
(SAS)^{[k]}=S^{{k}}A^{[k]}(S^{-1})^{(k)}
$$
</div>

---

Let $A$ be an $m\times m$-matrix. Denote $A^{[2]}$ the second additive compound matrix of $A$

<div class="theorem">

Let $A$ be a real $m\times m$-mix. For $A$ to have all its eigenvalues with negative real parts, it is necessary and sufficient that 
1. the second additive compound matrix $A^{[2]}$ has all its eigevalues with negative real parts
2. $(-1)^m\det(A)>0$
</div>

---

# Role in stability

Consider the differential equation
$$
\begin{equation}\tag{1}\label{sys:diff_general}
x'=f(x)
\end{equation}
$$

<div class="theorem">

[Li \& Muldowney, 1995]\label{th:LM1}
A sufficient condition for a periodic orbit $\gamma=\{p(t):0\leq t\leq\omega\}$ of $\eqref{sys:diff_general}$ be asymptotically orbitally stable with asymptotic phase is that the linear system
$$
z'(t)=\left(\frac{\partial f^{[2]}}{\partial x}
  \left(p(t)\right)\right)z(t)
$$
be asymptotically stable
</div>
