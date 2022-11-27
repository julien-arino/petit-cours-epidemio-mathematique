---
marp: true
title: Le modèle SLIRS - Incorporation de la période d'incubation et analyse plus avancée
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 08 - Le modèle SLIRS, incorporation de la période d'incubation et analyse plus avancée
theme: default
math: mathjax
paginate: false
size: 4:3
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
# <!--fit-->Petit cours d'épidémiologie mathématique<br/>Le modèle SLIRS

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/github-icon.png)](https://github.com/julien-arino)

Department of Mathematics & Data Science Nexus
University of Manitoba*

<div style = "font-size:18px; margin-top:-10px; padding-bottom:30px;"></div>

Centre canadien de modélisation des maladies (CCDM/CCMM)
NSERC-PHAC EID Modelling Consortium (CANMOD, MfPH, OMNI/RÉUNIS)

<div style = "text-align: justify; position: relative; bottom: -5%; font-size:25px;">
* The University of Manitoba campuses are located on original lands of Anishinaabeg, Cree, Oji-Cree, Dakota and Dene peoples, and on the homeland of the Métis Nation.</div>

---

<!-- _backgroundImage: "radial-gradient(white,80%,#f1c40f)" -->
# Plan de ce cours

- Durée d'incubation
- Formulation du modèle SLIRS en population constante
- Effet de la vaccination : Immunité de groupe
- Propriétés globales du modèle SLIRS

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Durée d'incubation

---

# <!--fit-->Pourquoi prendre en compte la durée de la période d'incubation

- Modèles SIS et SIR: progression instantanée de $S$ à $I$

| Maladie | Incubation |
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

- Il y de la démographie: naissance au taux $b(N)$ et mort au taux *per capita* $d$
- On regardera deux cas pour commencer: naissance constante et *per capita*
- Maladie pas transmise aux nouveaux nés (pas de *transmission verticale*): toutes les naissances sont dans le compartiment $S$
- La maladie ne cause pas de mortalité additionnelle
- Nouvelles infections ont lieu au taux $f(S,I,N)$
- Il y a une période d'incubation
- Après guérison, les individus sont immunisés à la maladie
- L'immunité est perdue après un certain temps

---

![bg contain 95%](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/SLIRS_birth_bofN.png)


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

# <!--fit-->Fonctions d'incidence classiques en proportion

Si $f(S,I,N)=\beta SI$, alors
$$
\frac{f(S,I,N)}{N} = \beta sI = \beta siN
$$
en se souvenant que $i=I/N$ et donc $I=iN$. On devra donc conserver l'équation en $N$ (mais on pourra oublier une autre équation, puisque $s+\ell+i+r=1$)

Si $f(S,I,N)=\beta\dfrac{SI}N$, alors
$$
\frac{f(S,I,N)}{N} = \beta si
$$
On garde alors les équations pour $s,\ell,i,r$ et omet celle de $N$

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

![bg right:25% width:230px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/SLIRS_constantbirth_vertical.png)

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
est facile à intégrer ou à étudier qualitativement 

Qualitativement: $\eqref{eq:SLIRS_b_dN}$ est scalaire autonome, ses solutions sont donc monotones. Les solutions sont strictement positives pour des conditions initiales positives et toutes tendent vers $N^\star = b/d$

Notons que cette convergence est indépendante du comportement de $\eqref{sys:SLIR_b_dS}$-$\eqref{sys:SLIR_b_dR}$. On peut donc remplacer $N(t)$ par sa limite $N^\star$

---

Cela permet également d'envisager une approche numérique s'abstrayant des variations dues à la démographie:

- on choisit une condition initiale $(S(0),L(0),I(0),R(0))$ t.q. $N(0)=N^\star$

- on est alors assuré que les variations des variables d'état sont uniquement dues aux facteurs épidémiologiques, puisque $N(t)$ reste constant

---

![bg right:21% width:200px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/SLIRS_constantbirth_incidenceNstar_vertical.png)

Dans la suite, on étudie donc le système
$$
\begin{align}
S' &= b-f(S,I,N^\star)-dS+\nu R \tag{6a}\\
L' &= f(S,I,N^\star) -(d+\varepsilon)L \tag{6b}\\
I' &= \varepsilon L -(d+\gamma)I \tag{6c}\\
R' &= \gamma I-(d+\nu)R \tag{6d}
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

![bg right:21% width:200px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/SLIRS_constantbirth_incidenceNstar_vertical.png)


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

Le même genre de raisonement que l'on a conduit lors de l'étude du modèle SIS dans le [Cours 04](cours-04-modele-SIS.html) permet de conclure que le système est bien posé, en ce que

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

De $\eqref{sys:SIRS_EP_I}$, $L=(d+\gamma)I/\varepsilon$, et de $\eqref{sys:SIRS_EP_R}$, $R=\gamma I/(d+\nu)$. On en déduit en particulier qu'en un équilibre sans maladie (ÉSM), $L=I=R=0$

Considérons d'abord ÉSM, où, comme on vient de voir $L=I=R=0$. L'équation $\eqref{sys:SIRS_EP_L}$ n'est pas utile, elle dit seulement que la maladie ne se transmet pas en ÉSM. On considère donc $\eqref{sys:SIRS_EP_S}$, qui s'écrit
$$
f(S,0,N^\star)=b-dS
$$

---

On obtient la valeur de $S$ en ÉSM en résolvant cette équation

Mais, *en général*, $f(S,0,N^\star)=0$ (il n'y a pas transmission sans infectieux) et donc $S=b/d=N^\star$ à l'ÉSM

On aurait aussi pu raisonner que puisque $N\equiv N^\star$ et que $L=I=R=0$, alors nécessairement, $S=N^\star$

---

On a donc l'ÉSM
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
\tag{9a}\label{sys:SIRS_EEP_S} \\
0 &= f(S,I,N^\star) -\frac{(d+\varepsilon)(d+\gamma)}{\varepsilon}I
\tag{9b}\label{sys:SIRS_EEP_L}
\end{align}
$$

De $\eqref{sys:SIRS_EEP_L}$
$$
\tag{10}\label{eq:SIRS_EEP_f_eq_I}
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
\tag{11}\label{eq:SIRS_EEP_dS_plus_kI}
\end{align}
$$


---

On sait du reste que la population totale satisfait
$$
\begin{align}
N^\star &= S+\frac{d+\gamma}{\varepsilon}I+I+\frac{\gamma}{d+\nu}I \\
&= S+\frac{(d+\gamma)(d+\nu)+\varepsilon(d+\nu)+\gamma\varepsilon}{\varepsilon(d+\nu)} I
\tag{12}\label{eq:SIRS_EEP_lineSI}
\end{align}
$$

On a donc deux équations de droite, $\eqref{eq:SIRS_EEP_dS_plus_kI}$ et $\eqref{eq:SIRS_EEP_lineSI}$, dont l'intersection détermine l'équilibre, et donc on confirmera la valeur en utilisant la relation $\eqref{eq:SIRS_EEP_f_eq_I}$

**NB -** On a déjà remarqué que dans le cas d'une population totale constante, bien des fonctions d'incidence sont similaires; en absence de $\eqref{eq:SIRS_EEP_lineSI}$, on cherche l'intersection de $\eqref{eq:SIRS_EEP_f_eq_I}$ et $\eqref{eq:SIRS_EEP_dS_plus_kI}$, ce qui est plus compliqué

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Calcul classique de $\mathcal{R}_0$

---

- $\mathcal{R}_0$ est le lieu dans l'espace des paramètres où l'ÉSM passe de LAS lorsque $\mathcal{R}_0<1$ à instable lorsque $\mathcal{R}_0>1$
- On le caractérise donc en considérant la SAL de l'ÉSM
- Donc on calcule la Jacobienne, on l'évalue en l'ÉSM et on calcule les valeurs propres
- Typiquement, on va avoir toutes sauf une des v.p. à parties réelles strictement négatives et une dont la partie réelle n'est pas de signe fixe
- C'est sur cette dernière qu'on agit

---

# La matrice jacobienne de $\eqref{sys:SLIRS_dS}$-$\eqref{sys:SLIRS_dR}$

On a, en un point arbitraire $(S,L,I,R)$
$$
J_{(S,L,I,R)} =
\begin{pmatrix}
-f_S(S,I,N^\star)-d & 0 & -f_I(S,I,N^\star) & \nu \\
f_S(S,I,N^\star) & -(d+\varepsilon) & f_I(S,I,N^\star) & 0 \\
0 & \varepsilon & -(d+\gamma) & 0 \\
0 & 0 & \gamma & -(d+\nu)
\end{pmatrix}
$$
où 
$$
f_X(S,I,N^\star):=
\left.
  \frac{\partial f}{\partial X}
\right|_{(S,I,N^\star)}
$$ 

On observe que toutes les colonnes somment à $-d$, ce qui entraîne que $-d$ est valeur propre (puisque $\mathbb{1}^TJ=-d\mathbb{1}^T$, avec $\mathbb{1}=(1,\ldots,1)^T$)

---

# <!--fit-->La matrice jacobienne de $\eqref{sys:SLIRS_dS}$-$\eqref{sys:SLIRS_dR}$ en l'ÉSM

$$
J_{E_0} =
\begin{pmatrix}
-f_S(E_0)-d & 0 & -f_I(E_0) & \nu \\
f_S(E_0) & -(d+\varepsilon) & f_I(E_0) & 0 \\
0 & \varepsilon & -(d+\gamma) & 0 \\
0 & 0 & \gamma & -(d+\nu)
\end{pmatrix}
$$

Mais $f_S(E_0)=0$, donc
$$
J_{E_0} =
\begin{pmatrix}
-d & 0 & -f_I(E_0) & \nu \\
0 & -(d+\varepsilon) & f_I(E_0) & 0 \\
0 & \varepsilon & -(d+\gamma) & 0 \\
0 & 0 & \gamma & -(d+\nu)
\end{pmatrix}
$$

---

$$
J_{E_0} =
\begin{pmatrix}
-d & 0 & -f_I(E_0) & \nu \\
0 & -(d+\varepsilon) & f_I(E_0) & 0 \\
0 & \varepsilon & -(d+\gamma) & 0 \\
0 & 0 & \gamma & -(d+\nu)
\end{pmatrix}
$$
Matrice bloc triangulaire supérieure, donc valeurs propres sont $-d$ (on savait déjà) et les valeurs propres de 
$$
\begin{pmatrix}
-(d+\varepsilon) & f_I(E_0) & 0 \\
\varepsilon & -(d+\gamma) & 0 \\
0 & \gamma & -(d+\nu)
\end{pmatrix}
$$

---

Valeurs propres de 
$$
\begin{pmatrix}
-(d+\varepsilon) & f_I(E_0) & 0 \\
\varepsilon & -(d+\gamma) & 0 \\
0 & \gamma & -(d+\nu)
\end{pmatrix}\quad?
$$
Bloc triangulaire inférieure $\Rightarrow$ $-(d+\nu)$ et valeurs propres de 
$$
\begin{pmatrix}
-(d+\varepsilon) & f_I(E_0) \\
\varepsilon & -(d+\gamma) 
\end{pmatrix}
$$
Polynome caractéristique:
$$
P(\lambda) = 
\lambda^2+(2d+\varepsilon+\gamma)\lambda
+(d+\varepsilon)(d+\gamma)-\varepsilon f_I(E_0)
$$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->$\mathcal{R}_0$ par la matrice de  <br /> prochaine génération

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
f_L(E_0)
& f_I(E_0) \\
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
f_I(E_0):=
\left.\dfrac{\partial f}{\partial I}\right|_{E_0}
\quad\quad 
f_L(E_0):=
\left.\dfrac{\partial f}{\partial L}
\right|_{E_0}
$$
Mais $f_L(E_0)=0$ (puisque $N=N^\star$), donc
$$
F=\left(
\begin{matrix}
0 & f_I(E_0) \\
0 & 0
\end{matrix}
\right)
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
Par conséquent
$$
FV^{-1}=\frac{f_I(E_0)}
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
\frac{f_I(E_0)}
{(d+\varepsilon)(d+\gamma)}
$$

---

<div class="theorem">

Soit
$$
\mathcal{R}_0=
\dfrac{\varepsilon f_I(E_0)}
{(d+\varepsilon)(d+\gamma)}
$$

Alors 
- si $\mathcal{R}_0<1$, ÉSM est LAS
- si $\mathcal{R}_0>1$, ÉSM est instable
</div>

Important d'insister sur la nature *locale* de la stabilité qui est déduite de ce résultat. On verra un exemple où lorsque $\mathcal{R}_0<1$, il peut y avoir plusieurs équilibres strictement positifs, et un autre où plusieurs ÉSM ont lieu en même temps

---

# Application

- Incidence en action de masse
$$
f_I(E_0)=\beta\bar S \Rightarrow\mathcal{R}_0 =
\frac{\varepsilon\beta N^\star}{(\varepsilon+d)(\gamma+d)} 
$$
- Incidence standard
$$
f_I(E_0)=\frac{\beta\bar S}{N^\star}
\Rightarrow\mathcal{R}_0 = \frac{\varepsilon\beta}{(\varepsilon+d)(\gamma+d)}
$$

---

# Remarques

- N'utilisez pas les deux méthodes!

- La méthode de la matrice de prochaine génération s'applique facilement à des modèles plus complexes, comme on le verra dans le reste du cours

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Hiérarchie de modèles

---

# <!--fit-->On dérive beaucoup de modèles du SLIRS

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

$(\bar S,\bar I)$ ÉSM, notons $\overline{f}_I=\partial f/\partial I(\bar S,\bar I)$

| Modèle | $\mathcal{R}_0$ | Modèle | $\mathcal{R}_0$ | Modèle | $\mathcal{R}_0$ |
|:---|:---:|:---|:---:|:---|:---:|
| SLIRS | $\dfrac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ | SIRS | $\dfrac{\varepsilon\overline{f}_I}{d+\gamma}$ | SIS | $\dfrac{\overline{f}_I}{d+\gamma}$ |
| SIR | $\dfrac{\overline{f}_I}{d+\gamma}$ | SLIS | $\dfrac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ | SI | $\dfrac{\overline{f}_I}{d+\gamma}$ | 
| SLI | $\dfrac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ | SLIR | $\dfrac{\varepsilon\overline{f}_I}{(d+\varepsilon)(d+\gamma)}$ | 

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Effet de la vaccination :  <br />  Immunité de groupe

---

On reprend le modèle SLIRS de tantôt, mais on le modifie comme suit:
- Il n'y a pas de perte d'immunité, c'est un modèle SLIR, i.e., $\nu = 0$
- La vaccination prend une proportion $p$ des nouveaux susceptibles et les place directement dans le compartiment $R$ des guéris, sans jamais les laisser devenir infectés
- Une fraction $1-p$ des nouveaux nés n'est pas vaccinée à la naissance
- $f(S,I,N)=\beta SI$

---

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
 
- Pour rappel, ÉSM du SLIR (comme SLIRS):
$$
(\bar S,\bar L, \bar I,\bar R)=(N,0,0,0)
$$
- ÉSM du SLIR avec vaccination
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
\tag{13}
\mathcal{R}_0^\text{v}<1 \iff p> 1-\frac{1}{\mathcal{R}_0}
$$

En vaccinant une fraction $p>1-1/\mathcal{R}_0$ de nouveaux nés, on se place dans une situation dans laquelle la maladie est éradicable

C'est l'**immunité de groupe**

---

On verra ailleurs ([Cours 11](cours-11-plus-de-modelisation.html)) une autre façon de modéliser la vaccination, ainsi que des conséquences inattendues de la vaccination

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Propriétés globales du modèle SLIRS

---

# <!--fit-->SLIRS - Mukherjee, Chattopadhyay & Tapaswi

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
\tag{14a}\label{sys:SLIR_LiMuldowney_dS} \\
L' &= \beta S^qI^p -(\varepsilon+d)L
\tag{14b}\label{sys:SLIR_LiMuldowney_dL} \\
I' &= \varepsilon L-(\gamma+d)I 
\tag{14c}\label{sys:SLIR_LiMuldowney_dI} \\
R' &= \gamma I-dR
\tag{14d}\label{sys:SLIR_LiMuldowney_dR} 
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

La preuve utilise les matrices composées (voir plus loin)


---

# <!--fit-->Fonction de Liapounoff pour SLIR et SLIS

Andrei Korobeinikov. Considère un SLIR avec population constante normalisée à 1 et avec transmission verticale

$$
\begin{align}
S' &= d-\beta SI -pdI-qdL-dS 
\tag{15a}\label{sys:SEIR_vert_transmission_dS} \\
L' &= \beta SI +pdI-(\varepsilon+d-qd)L 
\tag{15b}\label{sys:SEIR_vert_transmission_dL} \\
I' &= \varepsilon L-(\gamma+d)I 
\tag{15c}\label{sys:SEIR_vert_transmission_dI}
\end{align}
$$

- $p$ proportion de nouveaux nés de $I$ qui sont $I$ à la naissance
- $q$ proportion de nouveaux nés de $L$ qui sont $L$ à la naissance
- $R$ n'influe pas sur la dynamique du système, on ne le montre pas

---

# Équilibres
 
- ÉSM: $E_0=(1,0,0)$
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
\tag{16}
\mathcal{R}_0^v=\frac{\beta\varepsilon}
{(\gamma+d)(\varepsilon+d)-qd(\varepsilon+d)-pd\varepsilon}
$$
est le nombre de reproduction élémentaire avec transmission verticale. On a $\mathcal{R}_0=\mathcal{R}_0^v \iff p=q=0.$ Par ailleurs, $\mathcal{R}_0^v=1$ lorsque $\mathcal{R}_0=1$

$E^\star$ est biologiquement valide seulement lorsque $\mathcal{R}_0^v>1$

---


Utilisons la fonction
$$
\tag{17}
V=\sum a_i(x_i-x_i^\star  \ln x_i)
$$

<div class="theorem">
 
- Si $\mathcal{R}_0>1$, alors $\eqref{sys:SEIR_vert_transmission_dS}$-$\eqref{sys:SEIR_vert_transmission_dI}$ a l'équilibre GAS $E^\star$
- Si $\mathcal{R}_0\leq 1$, alors $\eqref{sys:SEIR_vert_transmission_dS}$-$\eqref{sys:SEIR_vert_transmission_dI}$ a l'ÉSM $E_0$ GAS et $E^\star$ n'est pas valide biologiquement
</div>


---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Matrices composées

---

# La méthode des matrices composées

- Extension du critère de Dulac à des systèmes en dimension plus élevée
- Utile pour exclure l'existece d'orbites périodiques
- Était très populaire pendant quelques années, mais il faut connaître la limitation principale:
  - Devient difficile d'utilisation lorsque la dimensionalité du système est $\geq 4$

---

Voir Fiedler (1998) pour les détails

Soit $A=(a_{ij})$, $i=1,\ldots,m$, $j=1,\ldots,n$ une $m\times n$-matrice et $k$ un entier, $1\leq k\leq\min(m,n)$

Soient $M=\{1,\ldots,m\}$ et $N=\{1,\ldots,n\}$, $M^{(k)}$ et $N^{(k)})$ les ensemble de $k$-tuples d'éléments de $M$ et $N$ ordonnés lexicographiquement, respectivement

---

La $k$ème matrice composée $A^{(k)}$ de $A$ est la $C(m,k)\times C(n,k)$-matrice, avec rangs indicés par les éléments de $M^{(k)}$ et colonnes indicées par les éléments de $N^{(k)}$, t.q. l'élément $A^{(k)}(I,J)$, $I\in M^{(k)}$, $J\in N^{(k)}$ est le déterminant $\det A(I,J)$

$A(I,J)$ est la sous-matrice de $A$ consistant des rangs dans $I$ et des colonnes dans $J$

Une autre interprétation de $A^{(k)}$ est en tant que $k$ème produit extérieur de la matrice $A$

---

Supposons que $A$ soit une $n\times n$-matrice. La matrice $(I+tA)^{(k)}$ est une $C(n,k)\times C(n,k)$-matrice dont chaque élément est un polynome en $t$ de degré au plus $k$

En regroupant les monomes de même degré en $t$
$$
(I+tA)^{(k)}=A^{(k,0)}+tA^{(k,1)}+\cdots+t^kA^{(k,k)}
$$
où les matrices $A^{(k,s)}$ ne dépendent pas de $t$

La matrice $A^{(k,1)}$ est la $k$ème **matrice composée additive** de $A$ et est notée $A^{[k]}$. Elle vérifie
$$
A^{[k]}=\lim_{h\to 0}
\left(\frac 1h\left((I+hA)^{(k)}-I^{(k)}\right)\right)
$$

Cette dernière égalité peut s'écrire
$$
A^{[k]}=D_+(I+hA)^{(k)}|_{h=0}
$$
où $D_+$ est la dérivée à droite

---


<div class="theorem">

Supposons que $A=(a_{pq})$. Alors, pour $I,J\in N^{(k)}$
$$
A^{[k]}(I,J)=\left\{
\begin{array}{ll}
\sum_{p\in I}a_{pp} & \textrm{si } J=I \\
0 & \textrm{si }|I\cap J|\leq k-2 \\
(-1)^\sigma a_{pq} & \textrm{si } |I\cap J|=k-1
\end{array}
\right.
$$
où $p$ est l'élément de $I\setminus(I\cap J)$, $q$ est l'élément de  $J\setminus(I\cap J)$ et $\sigma$ est le nombre d'éléments de $I\cap J$ entre $p$ et $q$
</div>

---

Lorsque $k=2$, on a

<div class="theorem">

Supposons que $A=(a_{ij})$. Pour tout $i=1,\ldots,C(n,2)$, soit $(i)=(i_1,i_2)$ le $i$ème élément de l'ordre lexicographique de paires $(i_1,i_2)$ d'entiers t.q. $1\leq i_1<i_2\leq n$

Alors l'élément $(i,j)$ de $A^{[2]}$ est
$$
a_{ij}=\left\{
\begin{array}{ll}
a_{i_1i_1}+a_{i_2i_2} & \textrm{si } (j)=(i) \\
(-1)^{r+s}a_{i_rj_s} & \textrm{si exactement un élément  } i_r\textrm{ de }(i)\textrm{ n'apparait pas}\\
&\textrm{dans }(j)\textrm{ et }j_s \textrm{ n'apparait pas dans }(i) \\
0 & \textrm{si aucun élément de }(i)
\textrm{ apparait dans }(j) 
\end{array}
\right.
$$
où $p$ est l'élément dans $I\setminus(I\cap J)$, $q$ est l'élément dans $J\setminus(I\cap J)$ et $\sigma$ est le nombre d'éléments de $I\cap J$ entre $p$ et $q$
</div>

---

# Exemple

Soient
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

Alors
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

Soient $A,B$ deux $n\times n$-matrices. Alors
 
- Le nombre d'éléments non nuls hors de la diagonale de $A^{[k]}$ est égal à $C(n-2,k-1)$ fois le nombre d'éléments non nuls hors de la diagonale de $A$
- $A^{[1]}=A$, $A^{[n]}=\mathsf{tr} A$
- $(A+B)^{[k]}=A^{[k]}+B^{[k]}$ (d'où le suffixe *additif*)
- Soit $S$ une $n\times n$-matrice non singulière. Alors
$$
(SAS)^{[k]}=S^{{k}}A^{[k]}(S^{-1})^{(k)}
$$
</div>

---

Soit $A$ une $m\times m$-matrice. Notons $A^{[2]}$ la deuxième matrice composée additive de $A$

<div class="theorem">

Soit $A$ une matrice $m\times m$ réelle. Pour que $A$ ait toutes ses valeurs propres à parties réelles strictement négatives, il faut et il suffit que
1. la deuxième matrice composée additive $A^{[2]}$ a toutes ses valeurs propres à parties réelles strictement négatives
2. $(-1)^m\det(A)>0$
</div>

---

# Rôle dans la stabilité

Considérons l'équation différentielle
$$
\begin{equation}\tag{18}\label{sys:diff_general}
x'=f(x)
\end{equation}
$$

<div class="theorem">

Une condition suffisante pour qu'une orbite périodique $\gamma=\{p(t):0\leq t\leq\omega\}$ de $\eqref{sys:diff_general}$ soit asymptotiquement orbitalement stable avec phase asymptotique est que le système linéaire
$$
z'(t)=\left(\frac{\partial f^{[2]}}{\partial x}
  \left(p(t)\right)\right)z(t)
$$
soit asymptotiquement stable
</div>


Li & Muldowney (1995)