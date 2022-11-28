---
marp: true
title: Petit cours d'épidémiologie mathématique - Un peu de stabilité globale
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 15 - Un peu de stabilité globale
theme: default
paginate: false
math: mathjax
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
# <!--fit-->Petit cours d'épidémiologie mathématique<br/>Un peu de stabilité globale

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
- Propriétés globales du modèle SLIRS
- Considérations sur la stabilité globale en métapopulations
- Du numérique

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

# <!--fit-->Li, Muldowney & PvdD - CAMQ (1999)

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
Supposons additionnellement que $\mathcal{R}_0>1$ et que l'une des conditions
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
- Utile pour exclure l’existence d'orbites périodiques
- Était très populaire pendant quelques années, mais il faut connaître la limitation principale:
  - Devient difficile d'utilisation lorsque la dimensionnalité du système est $\geq 4$

---

Voir Fiedler [Special Matrices and Their Applications in Numerical Mathematics](https://books.google.ca/books?id=SwzDAgAAQBAJ) (2013) pour les détails

Soit $A=(a_{ij})$, $i=1,\ldots,m$, $j=1,\ldots,n$ une $m\times n$-matrice et $k$ un entier, $1\leq k\leq\min(m,n)$

Soient $M=\{1,\ldots,m\}$ et $N=\{1,\ldots,n\}$, $M^{(k)}$ et $N^{(k)})$ les ensemble de $k$-tuples d'éléments de $M$ et $N$ ordonnés lexicographiquement, respectivement

---

La $k$ème matrice composée $A^{(k)}$ de $A$ est la $C(m,k)\times C(n,k)$-matrice, avec rangs indicés par les éléments de $M^{(k)}$ et colonnes indicées par les éléments de $N^{(k)}$, t.q. l'élément $A^{(k)}(I,J)$, $I\in M^{(k)}$, $J\in N^{(k)}$ est le déterminant $\det A(I,J)$

$A(I,J)$ est la sous-matrice de $A$ consistant des rangs dans $I$ et des colonnes dans $J$

Une autre interprétation de $A^{(k)}$ est en tant que $k$ème produit extérieur de la matrice $A$

---

Supposons que $A$ soit une $n\times n$-matrice. La matrice $(I+tA)^{(k)}$ est une $C(n,k)\times C(n,k)$-matrice dont chaque élément est un polynôme en $t$ de degré au plus $k$

En regroupant les monômes de même degré en $t$
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
(-1)^{r+s}a_{i_rj_s} & \textrm{si exactement un élément  } i_r\textrm{ de }(i)\textrm{ n’apparaît pas}\\
&\textrm{dans }(j)\textrm{ et }j_s \textrm{ n’apparaît pas dans }(i) \\
0 & \textrm{si aucun élément de }(i)
\textrm{ apparaît dans }(j) 
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

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Considérations sur la stabilité globale<br/> en métapopulations

---

# <!--fit-->Remarques sur la SAG dans les métapopulations

- Contrairement à l'analyse locale, il n'y a pas d'algorithme permettant de considérer ce problème de façon systématique
- On procède au cas par cas. Deux exemples dans le reste de ce cours
- Des éléments de théorie globale systématique: travail de Zhisheng Shuai et collaborateurs, principalement
- La question, comme souvent: la SAG est-elle vraiment importante ? Cela dépend du contexte du travail..

---

# Modèle $|\mathcal{P}|$-SLIRS

Considérons un cas particulier de $\eqref{sys:pSLIRS_dS}$-$\eqref{sys:pSLIRS_dR}$ avec naissance constante
$$
\begin{align}
S_{p}' &=b_p+\nu_pR_p-\Phi_p-d_pS_p
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Spq}S_{q}
\tag{9a}\label{sys:pSLIRS_GAS_dS} \\
L_{p}' &=\Phi_p-\left( \varepsilon_{p}+d_{p}\right)L_{p}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Lpq}L_{q}
\tag{9b}\label{sys:pSLIRS_GAS_dL} \\
I_{p}' &=\varepsilon_pL_p-(\gamma_p+d_p)I_p
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Ipq}I_{q}
\tag{9c}\label{sys:pSLIRS_GAS_dI} \\
R_{p}' &=\gamma _{p}I_{p}-\left(\nu_{p}+d_{p}\right)R_{p}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Rpq}R_{q}
\tag{9d}\label{sys:pSLIRS_GAS_dR}
\end{align}
$$
et incidence standard
$$
\tag{9e}
\Phi_p=\beta_p\frac{S_pI_p}{N_p}
$$


<div style = "position: relative; bottom: -4%; font-size:20px;">

- JA & PvdD. [Disease spread in metapopulations](https://server.math.umanitoba.ca/~jarino/publications/ArinoVdD-2006-FIC48.pdf). *Fields Institute Communications* **48**:1-13 (2006)
- JA. [Diseases in metapopulations](https://server.math.umanitoba.ca/~jarino/papers/Arino_metapopulations.pdf). In *Modeling and Dynamics of Infectious Diseases*, World Scientific (2009)
</div>

---

Le résultat de SAL de l'ÉSM lorsque $\mathcal{R}_{0}<1$ peut être rendu global

<div class="theorem">

Calculons $\mathcal{R}_0$ comme expliqué précédemment. Si $\mathcal{R}_0<1,$ alors l'ÉSM du système $|\mathcal{P}|$-SLIRS $\eqref{sys:pSLIRS_GAS_dS}$-$\eqref{sys:pSLIRS_GAS_dR}$ est globalement asymptotiquement stable
</div>

---

# Preuve

Puisque $S_{p}\leq N_{p}$ pour tout $t$, il suit que $\Phi_p\leq\beta_pN_pI_p/N_p=\beta_pI_p,$ et l'équation $\eqref{sys:pSLIRS_GAS_dL}$ donne l'inégalité
$$
\begin{equation}
L_p' \leq \beta_pI_p-(\varepsilon_p+d_p)L_p+\sum_{q\in\mathcal{P}}m_{Lpq}L_{q} \tag{10}\label{eq:ineq_dL}
\end{equation}
$$
Pour utiliser un théorème de comparaison, définissons un système linéaire consistant de $\eqref{eq:ineq_dL}$ et $\eqref{sys:pSLIRS_GAS_dI}$
$$
\begin{align}
L_p' &= \beta_pI_p-(\varepsilon_p+d_p)L_p+\sum_{q\in\mathcal{P}}m_{Lpq}L_q 
\tag{11a}\label{sys:pSLIRS_bounding_dL} \\
I_p' &= \varepsilon_pL_p-(\gamma_p+d_p+\delta_p)I_p+\sum_{q\in\mathcal{P}}m_{Ipq}I_q
\tag{11b}\label{sys:pSLIRS_bounding_dI} 
\end{align}
$$

---

- Le système linéaire $\eqref{sys:pSLIRS_bounding_dL}$-$\eqref{sys:pSLIRS_bounding_dI}$ a la matrice $F-V$ comme matrice de coefficients, donc (par des arguments dans la preuve du résultat sur $\mathcal{R}_0$ de van den Driessche & Watmough) vérifie $\lim\limits_{t\rightarrow \infty }L_{p}=0$ et $\lim\limits_{t\rightarrow \infty }I_{p}=0$ pour $\mathcal{R}_{0}=\rho (FV^{-1})<1$ 
- En utilisant un théorème de comparaison, il suit que ces limites sont aussi vérifées pour le sous-système non linéaire $\eqref{sys:pSLIRS_GAS_dL}$-$\eqref{sys:pSLIRS_GAS_dI}$
- Il suit par le même raisonnement que plus avant que $\lim\limits_{t\rightarrow \infty }R_{p}=0$ et $\lim\limits_{t\rightarrow \infty }S_{p}=N_{p}^\star$

Donc, lorsque $\mathcal{R}_{0}<1,$ l'ÉSM est GAS, la maladie s'éteint

---

# $|\mathcal{S}|\;|\mathcal{P}|$-SLIRS (espèces multiples)

On considère $\eqref{sys:spSLIRS_dS}$-$\eqref{sys:spSLIRS_dR}$ avec population totale constante, mouvement égal pour tous les états et irréductible

$$
\begin{align}
S_{sp}' &= d_{sp}N_{sp}+\nu_{sp}R_{sp}-\Phi_{sp}-d_{sp}S_{sp}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{spq}S_{sq} 
\tag{12a}\label{sys:spSLIRS_GAS_dS} \\
L_{sp}' &= \Phi_{sp}-(\varepsilon_{sp}+d_{sp})L_{sp}
+\textstyle{\sum_{q\in\mathcal{P}}}m_{spq}L_{sq}
\tag{12b}\label{sys:spSLIRS_GAS_dL} \\
I_{sp}' &= \varepsilon_{sp}L_{sp}-(\gamma_{sp}+d_{sp})I_{sp}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{spq}I_{sq}
\tag{12c}\label{sys:spSLIRS_GAS_dI} \\
R_{sp} &= \gamma _{sp}I_{sp}-(\nu_{sp}+d_{sp})R_{sp}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{spq}R_{sq}
\tag{12d}\label{sys:spSLIRS_GAS_dR} 
\end{align}
$$

et incidence standard
$$
\tag{12e}
\Phi_{sp}=\sum_{k\in\mathcal{S}}\beta_{skp}\frac{S_{sp}I_{kp}}{N_p}
$$

<div style = "position: relative; bottom: -3%; font-size:20px;">

- JA, Davis, Hartley, Jordan, Miller \& PvdD. [A multi-species epidemic model with spatial dynamics](https://server.math.umanitoba.ca/~jarino/papers/ArinoDavisHartleyJordanMillerVdD-2005-MMB22.pdf). *Mathematical Medicine and Biology* **22**(2):129-142 (2005) 
- JA, Jordan \& PvdD. [Quarantine in a multi-species epidemic model with spatial dynamics](https://server.math.umanitoba.ca/~jarino/publications/ArinoJordanVdD-2007-MBS206.pdf). *Mathematical Biosciences* **206**(1):46-60 (2007)
</div>

---

<div class="theorem">

Pour le modèle $|\mathcal{S}|\;|\mathcal{P}|$-SLIRS $\eqref{sys:spSLIRS_GAS_dS}$-$\eqref{sys:spSLIRS_GAS_dR}$, définissons $\mathcal{R}_0$ en utilisant la méthode décrite plus haut. Si $\mathcal{R}_0<1$, alors l'ÉSM est GAS
</div>

---

# Preuve

Pour établir la SAG de l'ÉSM lorsque $\mathcal{R}_0<1$, considérons le système **non autonome** consistant de $\eqref{sys:spSLIRS_GAS_dL}$-$\eqref{sys:spSLIRS_GAS_dR}$, dans lequel on écrit $\eqref{sys:spSLIRS_GAS_dL}$ sous la forme
$$
\begin{equation}\label{sys:nonauton_E}\tag{13}
\begin{aligned}
L_{sp}' =& \sum_{j\in\mathcal{S}}
\beta_{sjp}(N_{sp}-L_{sp}-I_{sp}-R_{sp})\frac{I_{jp}}{N_{jp}} \\
&-(d_{sp}+\varepsilon_{sp})L_{sp} \\
&+\sum_{q\in\mathcal{P}} m_{spq}L_{sq}
-\sum_{q\in\mathcal{P}} m_{sqp}L_{sp}
\end{aligned}
\end{equation}
$$
i.e., où l'on a remplacé $S_{sp}$ par $N_{sp}-L_{sp}-I_{sp}-R_{sp}$, et $N_{sp}$ est solution de l'équation pour la population totale
$$
\begin{equation}
\frac{d}{dt}N_{sp}=
\sum_{q\in\mathcal{P}}m_{spq}N_{sq}
\end{equation}
$$

--- 

On a (par raisonnement similaire à celui de la SAL de l'ÉSM)
$$
\lim_{t\to\infty}N_{sp}(t)=N_{sp}^\star>0
$$
Écrivons le système non autonome $\eqref{sys:nonauton_E}$-$\eqref{sys:spSLIRS_GAS_dI}$-$\eqref{sys:spSLIRS_GAS_dR}$ comme
$$
\begin{equation}\label{sys:nonauton}\tag{14}
x' = f(t,x)
\end{equation}
$$
où $x$ vecteur $3|\mathcal{S}||\mathcal{P}|$-dimensionnel des $L_{sp}$, $I_{sp}$ et $R_{sp}$ 

L'ÉSM pour $\eqref{sys:spSLIRS_GAS_dL}$-$\eqref{sys:spSLIRS_GAS_dR}$ correspond au PÉ $x=0$ de $\eqref{sys:nonauton}$

$\eqref{sys:nonauton}$ dépend de $N_{sp}(t)$, mais $N_{sp}(t)$ peut être considéré independemment des variables épidémiologiques, et l'on a vu que $N_{sp}(t)\to N_{sp}^\star$ quand $t\to\infty$

---

Substituons la limite $N_{sp}^\star$ à $N_{sp}$ dans $\eqref{sys:nonauton_E}$
$$
\begin{equation}\label{sys:asympt_auton_E}\tag{15}
\begin{aligned}
L_{sp}' =& \sum_{j\in\mathcal{S}}
\beta_{sjp}(N_{sp}^\star-L_{sp}-I_{sp}-R_{sp})\frac{I_{jp}}{N_{jp}^\star} \\
&-(d_{sp}+\varepsilon_{sp})L_{sp}+\sum_{q\in\mathcal{P}} m_{spq}L_{sq}
\end{aligned}
\end{equation}
$$

Il suit que le système non autonome $\eqref{sys:nonauton}$ est *asymptotiquement autonome*, avec système limite
$$
\begin{equation}\label{sys:asympt_auton}\tag{16}
x' = g(x)
\end{equation}
$$

---

Pour montrer que 0 est GAS pour le système limite $\eqref{sys:asympt_auton}$, considérons le système linéaire
$$
\begin{equation}\label{sys:linear}\tag{17}
x'=\mathcal{L}x
\end{equation}
$$
où $x$ est le vecteur $3|\mathcal{S}||\mathcal{P}|$-dimensionnel consistant des $L_{sp}$, $I_{sp}$ et $R_{sp}$. Dans $\mathcal{L}$, on remplace $S_{sp}/N_{jp}$ par $N_{sp}^\star/N_{jp}^\star$. Les équations $\eqref{sys:spSLIRS_GAS_dI}$ et $\eqref{sys:spSLIRS_GAS_dR}$ ne sont pas affectées par cette transformation, tandis que $\eqref{sys:spSLIRS_GAS_dL}$ devient
$$ 
\begin{equation}\label{sys:lin_E}\tag{18}
\begin{aligned}
L_{sp}' &= \sum_{j\in\mathcal{S}}
\beta_{sjp}\frac{N_{sp}^*}{N_{jp}^*}I_{jp}
-(d_{sp}+\varepsilon_{sp})L_{sp}\\
&+\sum_{q\in\mathcal{P}} m_{spq}L_{sq}
\end{aligned}
\end{equation}
$$
Si l'on compare $\eqref{sys:asympt_auton_E}$ et $\eqref{sys:lin_E}$, on note que $g(x)\leq\mathcal{L}x$ pour tout $x \in \mathbb{R}_+^{3|\mathcal{S}||\mathcal{P}|}$

---

Dans $\eqref{sys:linear}$, les équations pour $L_{sp}$ et $I_{sp}$ n'impliquent pas $R_{sp}$. Soit $\tilde x$ la partie du vecteur $x$ correspondant aux variables $E_{sp}$ et $I_{sp}$, et soit $\tilde{\mathcal{L}}$ la sous-matrice de $\mathcal{L}$ correspondante

La méthode utilisée pour prouver la SAL peut être appliquée pour prouver la stabilité de $\tilde x=0$ pour le sous-système $\tilde x'=\tilde{\mathcal{L}}\tilde x$, avec $\tilde{\mathcal{L}}=F-V$

Si $\mathcal{R}_0<1$, alors $\tilde x=0$ est un équilibre stable du sous-système $\tilde x'=\tilde{\mathcal{L}}\tilde x$. Quand $\tilde x=0$, $\eqref{sys:spSLIRS_GAS_dR}$ prend la forme
$$
R_s' = (\mathcal{M}_s-D_s)R_s
$$
avec $R_s=(R_{s1},\ldots,R_{s|\mathcal{P}|})^T,$ $D_s=\mathsf{diag}(d_{s1},\ldots,d_{s|\mathcal{P}|})$

---

On sait, par les résultats vus avant, que $-\mathcal{M}_s$ est une M-matrice singulière et que $-\mathcal{M}_s+D_s$ est une M-matrice non-singulière pour tout $D_s$

Donc l'équilibre $R_s=0$ de ce système linéaire est stable

Par conséquent, l'équilibre $x=0$ de $\eqref{sys:linear}$ est stable quand $\mathcal{R}_0<1$

En utilisant un théorème de comparaison standard, il suit que 0 est un équilibre GAS de $\eqref{sys:asympt_auton}$

---

Lorsque $\mathcal{R}_0<1$, le système linéaire $\eqref{sys:lin_E}$ et $\eqref{sys:spSEIRS_GAS_dI}$ a un équilibre unique (l'ÉSM) puisque sa matrice de coefficients $F-V$ est non-singulière

La SAG suit par utilisation de résultats sur les systèmes asymptotiquement autonomes

