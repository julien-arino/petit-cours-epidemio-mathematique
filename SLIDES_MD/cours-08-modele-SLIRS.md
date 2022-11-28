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

(De [Wikipedia](https://fr.wikipedia.org/wiki/Période_d'incubation))

| Maladie | Incubation |
|:----|:----|
| Yersinia Pestis | 2-6 jours |
| Fièvre hémorragique virale (FHV) Ebola | 2-21 jours |
| FHV Marburg | 5-10 jours |
| FHV Lassa | 1-3 semaines |
| Tsé-tsé | semaines, mois |
| VIH/SIDA | mois, années |

---

# Incubation versus latence

La période d'**incubation** est le période entre le moment où un individu est infecté par la maladie et le moment où ses symptômes deviennent visible

La période de **latence** est la période entre le moment où un individu est infecté par la maladie et le moment où il devient infectieux

Ces périodes peuvent être identiques ou bien différer un peu (souvent, l'infectiosité commence avant les symptômes)

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

Le même genre de raisonnement que l'on a conduit lors de l'étude du modèle SIS dans le [Cours 04](cours-04-modele-SIS.html) permet de conclure que le système est bien posé, en ce que

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
Polynôme caractéristique:
$$
P(\lambda) = 
\lambda^2+(2d+\varepsilon+\gamma)\lambda
+(d+\varepsilon)(d+\gamma)-\varepsilon f_I(E_0)
$$

---

Polynôme caractéristique:
$$
P(\lambda) = 
\lambda^2+(2d+\varepsilon+\gamma)\lambda
+(d+\varepsilon)(d+\gamma)-\varepsilon f_I(E_0)
$$
De la règle des signes de Descartes, on déduit que la nature des valeurs propres dépend du signe de 
$$
\tag{13}\label{eq:signe_vps}
\psi(E_0)=(d+\varepsilon)(d+\gamma)-\varepsilon f_I(E_0)
$$
- Si $\psi(E_0)<0$, il y a une valeur propre réelle strictement positive et $E_0$ est instable
- Si $\psi(E_0)=0$, les valeurs propres sont $-2d-\varepsilon-\gamma$ et 0 (par inspection du polynôme caractéristique)
- Si $\psi(E_0)> 0$, il n'y a pas de valeurs propres réelles strictement positives 

---

Attention: à ce stade, rien dans le cas $\psi(E_0)>0$ ne dit qu'on ne peut pas avoir deux valeurs propres complexes conjuguées à parties réelles positives

Pour lever l'incertitude, on calcule le discriminant
$$
\begin{align}
\Delta &= (2d+\varepsilon+\gamma)^2
-4(d+\varepsilon)(d+\gamma)+4\varepsilon f_I(E_0) \\
&= (\gamma-\varepsilon)^2+4\varepsilon f_I(E_0) \\
&>0
\end{align}
$$

Il suit que le cas $\psi(E_0)>0$ correspond bien au cas où les deux valeurs propres sont réelles et négatives et $E_0$ est LAS

---

# Expression de $\mathcal{R}_0$

On veut une expression telle que si $\mathcal{R}_0<1$, l'ÉSM est LAS, et si $\mathcal{R}_0>1$, l'ÉSM est instable

On a vu que, étant donné
$$
\tag{13}
\psi(E_0)=(d+\varepsilon)(d+\gamma)-\varepsilon f_I(E_0)
$$

- si $\psi(E_0)>0$, l'ÉSM est LAS
- si $\psi(E_0)<0$, l'ÉSM est instable

On utilise donc
$$
\mathcal{R}_0 = \frac{\varepsilon f_I(E_0)}{(d+\varepsilon)(d+\gamma)}
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
\mathcal{R}_0=
\frac{\varepsilon f_I(E_0)}
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

- Si vous considérez la SAL de l'ÉE, alors il faudra utiliser la jacobienne

---

# Les grandeurs impliquées dans $\mathcal{R}_0$

On revient sur les temps de résidence dans le [Cours 09](cours-09-temps-de-residence.html), mais en prélude à ce cours, réécrivons $\mathcal{R}_0$

- Incidence en action de masse
$$
f_I(E_0)=
\frac{\varepsilon}{\varepsilon+d} 
\frac{\beta N^\star}{\gamma+d} 
$$
- Incidence standard
$$
f_I(E_0)= 
\frac{\varepsilon}{\varepsilon+d}
\frac{\beta}{\gamma+d}
$$
$1/(d+\varepsilon)$ et $1/(d+\gamma)$ sont les temps moyens de séjour dans les compartiments $L$ et $I$, respectivement

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

| Modèle | $\mathcal{R}_0$ | Modèle | $\mathcal{R}_0$ | Modèle | $\mathcal{R}_0$ |
|:---|:---:|:---|:---:|:---|:---:|
| SLIRS | $\dfrac{\varepsilon f_I(E_0)}{(d+\varepsilon)(d+\gamma)}$ | SIRS | $\dfrac{\varepsilon f_I(E_0)}{d+\gamma}$ | SIS | $\dfrac{f_I(E_0)}{d+\gamma}$ |
| SIR | $\dfrac{f_I(E_0)}{d+\gamma}$ | SLIS | $\dfrac{\varepsilon f_I(E_0)}{(d+\varepsilon)(d+\gamma)}$ | SI | $\dfrac{f_I(E_0)}{d+\gamma}$ | 
| SLI | $\dfrac{\varepsilon f_I(E_0)}{(d+\varepsilon)(d+\gamma)}$ | SLIR | $\dfrac{\varepsilon f_I(E_0)}{(d+\varepsilon)(d+\gamma)}$ | 

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

![bg contain 95%](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/SLIRS_constantbirth_and_vacc.png)

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
(\bar S,\bar L, \bar I,\bar R)=(N^\star,0,0,0)
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

En vaccinant une fraction $p>1-1/\mathcal{R}_0$ de nouveaux nés, on se place dans une situation dans laquelle la maladie peut être éradiquée

C'est l'**immunité de groupe**

---

On verra ailleurs ([Cours 11](cours-11-plus-de-modelisation.html)) une autre façon de modéliser la vaccination, ainsi que des conséquences inattendues de la vaccination

