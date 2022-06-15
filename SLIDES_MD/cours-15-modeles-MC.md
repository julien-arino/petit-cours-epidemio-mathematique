---
marp: true
title: Stochastic epidemic models
description: 3MC Course Epidemiological Modelling - Julien Arino - Lecture 07 - Stochastic epidemic models
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
    box-shadow: 0px 1px 5px #999;
  }
  .definition {
    text-align:justify;
    background-color:#ededde;
    border-radius:20px;
    padding:10px 20px 10px 20px;
    box-shadow: 0px 1px 5px #999;
  }
  img[alt~="center"] {
    display: block;
    margin: 0 auto;
  }
</style>

# Petit cours d'épidémiologie mathématique<br/>Modèles en chaînes de Markov

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
- Chaînes de Markov en temps discret
- Chaînes de Markov en temps continu

--- 

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Chaînes de Markov en temps discret
- Définition des CMTD
- Comportement asymptotique des CMTD
- CMTD régulières
- CMTD absorbantes
- Marches aléatoires

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Définition des CMTD

---

Soit $p_i(n)$ la probabilité que le système soit dans l'état $S_i$, $1\leq i\leq r$, lors de la $n^\text{eme}$ répetition de l'expérience

Le système doit être dans l'un des états $S_i$, $1\leq i\leq r$, à la $n^\text{eme}$ répétition, donc
$$
p_1(n)+p_2(n)+\cdots+p_r(n)=1
$$

---

Soit $p_i(n+1)$ la probabilité que le système soit dans l'état $S_i$, $1\leq i\leq r$, à la $(n+1)^\text{eme}$ répétition de l'expérience

Il y a $r$ façons d'être dans l'état $S_i$ à l'étape $n+1$:
- Étape $n$ dans l'état $S_1$. Probabilité d'obtenir $S_1$ au $n^\text{eme}$ pas est $p_1(n)$, et la probabilité de passer vers $S_i$ depuis $S_1$ est $p_{1i}$. Par le principe de multiplication, $\mathbb{P}(S_i|S_1)=p_{1i}p_1(n)$
- Étape $n$ dans l'état $S_2$, et étape $n+1$ dans l'état $S_i$. Alors $\mathbb{P}(S_i|S_2)=p_{2i}p_2(n)$
- ...
-  Probabilité d'être dans l'état $S_i$ à l'étape $n+1$ si on est dans l'état $S_r$ à l'étape $n$ est $\mathbb{P}(S_i|S_r)=p_{ri}p_r(n)$

Donc $p_i(n+1)$ est la somme de toutes ces probabilités
$$
\begin{align*}
p_i(n+1) &= \mathbb{P}(S_i|S_1)+\cdots+\mathbb{P}(S_i|S_r) \\
&= p_{1i}p_1(n)+\cdots+p_{ri}p_r(n)
\end{align*}
$$

---

Par conséquent,
$$
\begin{align*}
p_1(n+1) &= p_{11}p_1(n)+p_{21}p_2(n)+\dots+p_{r1}p_r(n) \\
& \vdots\\
p_k(n+1) &= p_{1k}p_1(n)+p_{2k}p_2(n)+\dots+p_{rk}p_r(n) \\
& \vdots\\
p_r(n+1) &= p_{1r}p_1(n)+p_{2r}p_2(n)+\dots+p_{rr}p_r(n)
\end{align*}
$$

---

En forme matricielle
$$
p(n+1)=p(n)P, \quad n=1,2,3,\dots
$$
où $p(n)=(p_1(n),p_{2}(n),\dots , p_r(n))$ est un vecteur (ligne) de probabilité et $P=(p_{ij})$ est une $r\times r$-**matrice de transition**
$$
P=
\begin{pmatrix}
p_{11} & p_{12} & \cdots & p_{1r} \\
p_{21} & p_{22} & \cdots & p_{2r} \\
&&& \\
p_{r1} & p_{r2} & \cdots & p_{rr}
\end{pmatrix}
$$

---

Donc
$$
(p_1(n+1),\ldots,p_r(n+1))= 
(p_1(n),\ldots,p_r(n))
\begin{pmatrix}
p_{11} & p_{12} & \cdots & p_{1r} \\
p_{21} & p_{22} & \cdots & p_{2r} \\
&&& \\
p_{r1} & p_{r2} & \cdots & p_{rr}
\end{pmatrix}
$$

Il est facile de vérifier que ceci donne la même expression que 
$$
p(n+1)=p(n)P, \quad n=1,2,3,\dots
$$

---

# Matrices stochastiques

<div class="definition">

La $r\times r$-matrice non-négative $M$ est **stochastique** (par ligne) si $\sum_{j=1}^ra_{ij}=1$ pour tout $i=1,2,\dots, r$
</div>

<div class="theorem">

Sot $M$ une matrice stochastique. Alors toutes les valeurs propres $\lambda$ de $M$ sont t.q. $|\lambda|\leq 1$, i.e., $\rho(M)=1$. De plus, $\lambda =1$ est une valeur propre de $M$
</div>


---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Comportement asymptotique des CMTD

---

Soit $p(0)$ le vecteur ligne de distribution initiale des probabilités. Alors
$$
\begin{align*}
p(1) &= p(0)P \\
p(2) &= p(1)P\\
&= (p(0)P)P \\
&= p(0)P^2
\end{align*}
$$
En itérant, on obtient que pour tout $n$
$$
p(n)=p(0)P^n
$$
Par conséquent 
$$
\lim_{n\rightarrow +\infty}p(n)=\lim_{n\rightarrow +\infty}p(0)P^n=p(0)\lim_{n\rightarrow +\infty}P^n
$$
si bien sur cette limite existe

---
# Pour aller plus loin...
On a vu que 
$$
\lim_{n\rightarrow +\infty}p(n)=\lim_{n\rightarrow +\infty}p(0)P^n=p(0)\lim_{n\rightarrow +\infty}P^n
$$
si cette limite existe

Un bon signe:
<div class="theorem">

Soient $M,N$ deux matrices stochastiques de tailles compatibles, $k\in\mathbb{N}$. Alors $MN$ et $M^k$ sont stochastiques
</div>

Donc en tout cas, $P^n$ dans la limite est stochastique.. le comportement dépend alors de la nature de la chaîne

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# CMTD régulières

---

# CMTD régulières pas très utiles en épidémiologie

- Dans les modèles épidémiologiques, l'état $I=0$ est presque toujours *absorbant*, donc les chaînes ne sont pas *régulières* mais *absorbantes*
- Cela vaut le coup de jeter un œil, toutefois

---

#  Chaîne de Markov régulière

<div class="definition">

Une **chaîne de Markov régulière** est une CMTD dans laquelle $P^k$ est positive pour un entier $k>0$, i.e., $P^k$ a toutes ses entrées strictement positives
</div>

<div class="definition">

Une matrice non-négative $M$ est **primitive** si il existe un entier $k>0$ t.q. $M^k$ est positive
</div>

<div class="theorem">

Une CMTD est régulière $\iff$ sa matrice de transition $P$ est primitive
</div>

---

#  Résultat important pour les chaînes régulières

<div class="theorem">

Si $P$ est la matrice de transition d'une chaîne de Markov régulière, alors

1. les puissances $P^n$ approchent une matrice stochastiques $W$
2. chaque ligne de $W$ est le même vecteur (ligne) $w=(w_1,\ldots,w_r)$
3. les éléments de $w$ sont strictement positifs
</div>

Donc, si la chaîne de Markov est régulière
$$
\lim_{n\rightarrow +\infty}p(n)=p(0)\lim_{n\rightarrow +\infty}P^n
=p(0)W
$$

---

# Vecteurs propres à gauche et à droite

Soit $M$ une $r\times r$-matrice, $u,v\neq 0$ deux vecteurs colonnes, $\lambda\in\mathbb{R}$. Alors, si  
$$
Mu=\lambda u
$$
$u$ est un vecteur propre (à droite) associé à la valeur propre $\lambda$, et si 
$$
v^TM=\lambda v^T
$$
alors $v$ est le vecteur propre à gauche associé à $\lambda$. À chaque valeur propre correspond un vecteur propre gauche et un vecteur propre droit (à un facteur multiplicatif près)

---

The vector $w$ is in fact the left eigenvector corresponding to the eigenvalue 1 of $P$. (We already know that the (right) eigenvector corresponding to 1 is $\mathbf{1}$.)

To see this, remark that, if $p(n)$ converges, then $p(n+1)=p(n)P$, so $w$ is a fixed point of the system. We thus write
$$
wP=w
$$
and solve for $w$, which amounts to finding $w$ as the left eigenvector corresponding to the eigenvalue 1

Alternatively, we can find $w$ as the (right) eigenvector associated to the eigenvalue 1 for the transpose of $P$
$$
P^Tw^T=w^T
$$

---

Now remember that when you compute an eigenvector, you get a result that is the eigenvector, to a multiple

So the expression you obtain for $w$ might have to be normalized (you want a probability vector). Once you obtain $w$, check that the norm $\|w\|$ defined by
$$
\|w\|=w_1+\cdots+w_r
$$
is equal to one. If not, use
$$
\frac{w}{\|w\|}
$$

---

# Une autre façon de vérifier la primitivité
<div class="theorem">

Une matrice $M$ est primitive si le graphe de connection associé est fortement connexe (il y a un chemin entre tous les nœuds), et il y a au moins une entrée strictement positive sur la diagonale de $M$
</div>

Cela se vérifie directement sur le graphe de transition
![width:100% center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/graphe_hybride.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# CMTD absorbantes

---

#  États absorbants, chaînes absorbantes

<div class="definition">

Un état $S_i$ dans une chaîne de Markov est **absorbant** si, lorsqu'il a lieu à la $n^\text{eme}$ expérience, il se répète pour toute itération future de l'expérience. En d'autres termes, $S_i$ est absorbant si $p_{ii}=1$ et $p_{ij}=0$ pour $i\neq j$
</div>

<div class="definition">

Une **chaîne de Markov est absorbante** si elle a au moins un état absorbant, et qu'il est possible d'aller de n'importe quel état vers un état absorbant (en un nombre fini de pas)
</div>

<div class="definition">

Dans une chaîne de Markov absorbante, un état qui n'est pas absorbant est dit **transient**
</div>

---

#  Quelques questions sur les chaînes absorbantes

Supposons que l'on ait une chaîne absorbante, e.g.,

![width:100% center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/graphe_absorbant.png)

1. Le processus atteint-il toujours un état absorbant ?
2. Quel est le temps moyen que le processus passe dans un état transient, s'il est initié dans un état transient ?
3. Quel est le temps moyen avant que le processus entre dans un état absorbant ?
4. Quelle est la probabilité d'être absorbé dans un état absorbant donné, s'il y en a plus d'un, quand le processus est initié dans un état transient donné ?

---

#  Atteindre un état absorbant (question 1)

<div class="theorem">

Dans une chaîne de Markov absorbante, la probabilité d'atteindre un état absorbant est 1
</div>

---

# Forme standard de la matrice de transition

La matrice de transition d'une chaîne absorbante avec $k$ états absorbants et $r-k$ états transients peut s'écrire sous la forme
$$
P=\begin{pmatrix}
\mathbb{I}_k & \mathbf{0} \\
R & Q
\end{pmatrix}
$$

|     | États absorbants | États transients |
|:---:|:---:|:---:|
| **États absorbants** | $\mathbb{I}_k$ | $\mathbf{0}$ |
| **États transients** | $R$ | $Q$ |

$\mathbb{I}_k$ l'identité de taille $k\times k$, $\mathbf{0}\in\mathbb{R}^{k\times(r-k)}$, $R\in\mathbb{R}^{(r-k)\times k}$, $Q\in\mathbb{R}^{(r-k)\times(r-k)}$

---

La matrice $\mathbb{I}_{r-k}-Q$ est inversible. Soit

- $N=(\mathbb{I}_{r-k}-Q)^{-1}$ la **matrice fondamentale** de la chaîne de Markov
- $T_i$ la somme des éléments sur la ligne $i$ de $N$
- $B=NR$

Réponses aux autres questions que nous posions:

2. $N_{ij}$ est le nombre moyen de fois que le processus est dans le $j^\text{eme}$ état transient si il est initié dans le $i^\text{eme}$ état transient
3. $T_i$ est le nombre moyen de pas avant que le processus entre dans un état absorbant s'il est initié dans le $i^\text{eme}$ état transient
4. $B_{ij}$ est la probabilité d'être absorbé dans le $j^\text{eme}$ état absorbant si le processus est initié dans le $i^\text{eme}$ état transient

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Marches aléatoires

---

#  Drunk man's walk 1.0 (regular case)

- chain of states $S_1,\ldots,S_p$
- if in state $S_i$, $i=2,\ldots,p-1$, probability 1/2 of going left (to $S_{i-1}$) and 1/2 of going right (to $S_{i+1}$)
- if in state $S_1$, probability 1 of going to $S_2$
- if in state $S_p$, probability 1 of going to $S_{p-1}$

![width:100% center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/drunk_mans_walk_regular.png)

---

#  Transition matrix for DMW 1.0

$$
P=\begin{pmatrix}
0 & 1 & 0 & 0 & 0 & \cdots & 0\\
1/2 & 0 & 1/2 & 0 & & & \\
0 & 1/2 & 0 & 1/2 & & & \\
\vdots & & \ddots & \ddots & \ddots & & \vdots \\
& & & & & & \\
& & & & 1/2 & 0 & 1/2 \\
& & & & 0 & 1 & 0
\end{pmatrix}
$$
Clearly a primitive matrix, so a regular Markov chain

---

We need to solve $w^TP=w^T$, that is,
$$
\begin{align*}
\frac 12 w_2 &= w_1 \\
w_1 +\frac 12 w_3 &= w_2 \\
\frac 12 w_2+\frac 12 w_4 &= w_3 \\
\frac 12 w_3+\frac 12 w_5 &= w_4 \\
& \vdots \\
\frac 12 w_{p-3}+\frac 12 w_{p-1} &= w_{p-2} \\
\frac 12 w_{p-2}+w_p &= w_{p-1} \\
\frac 12 w_{p-1} &= w_p
\end{align*}
$$

---

Express everything in terms of $w_1$:
$$
\begin{align*}
w_2 &= 2w_1 \\
w_1 +\frac 12 w_3 &= w_2 \Leftrightarrow w_3 = 2(w_2-w_1)=2w_1\\
\frac 12 w_2+\frac 12 w_4 &= w_3 \Leftrightarrow w_4=2(w_3-\frac 12 w_2)=2(w_3-w_1)=2w_1\\
\frac 12 w_3+\frac 12 w_5 &= w_4 \Leftrightarrow w_5=2(w_4-\frac 12 w_3)=2(w_4-w_1)=2w_1\\
& \vdots \\
\frac 12 w_{p-3}+\frac 12 w_{p-1} &= w_{p-2} \Leftrightarrow w_{p-1} = 2w_1 \\
\frac 12 w_{p-2}+w_p &= w_{p-1} \Leftrightarrow w_p=w_{p-1}-\frac 12 w_{p-2}=w_1\\
\frac 12 w_{p-1} &= w_p \qquad (\textrm{confirms that }w_p=w_1)
\end{align*}
$$

---

So we get
$$
w^T=\left(w_1,2w_1,\ldots,2w_1,w_1\right)
$$
We have
$$
\begin{align*}
\sum_{i=1}^p w_i &= w_1+\left(\sum_{i=2}^{p-1}2w_1\right)+w_1 \\
&= 2w_1+\sum_{i=2}^{p-1}2w_1 \\
&= \sum_{i=1}^{p-1} 2w_1  \\
&= 2w_1\sum_{i=1}^{p-1}1  \\
&= 2w_1(p-1)
\end{align*}
$$

---

Since 
$$
\sum_{i=1}^p w_i = 2w_1(p-1)
$$
to get a probability vector, we need to take 
$$
w_1=\frac{1}{2(p-1)}
$$
So 
$$
w^T=\left(\frac{1}{2(p-1)},\frac{1}{p-1},\ldots,\frac{1}{p-1},\frac{1}{2(p-1)}\right)
$$

---

Now assume we take an initial condition with $p(0)=(1,0,\ldots,0)$, i.e., the walker starts in state 1. Then
$$
\lim_{t\to\infty}p(t)=p(0)W=p(0)w=p(0)\cdot w^T
$$
so
$$
\lim_{t\to\infty}p(t)=(1,0,\ldots,0)\cdot\left(\frac{1}{2(p-1)},\frac{1}{p-1},\ldots,\frac{1}{p-1},\frac{1}{2(p-1)}\right)
$$

---

#  Drunk man's walk 2.0 (absorbing case)

- chain of states $S_1,\ldots,S_p$
- if in state $S_i$, $i=2,\ldots,p-1$, probability 1/2 of going left (to $S_{i-1}$) and 1/2 of going right (to $S_{i+1}$)
- if in state $S_1$, probability 1 of going to $S_1$
- if in state $S_p$, probability 1 of going to $S_p$

![width:100% center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/drunk_mans_walk_absorbing.png)

---

#  Transition matrix for DMW 2.0

$$
P=\begin{pmatrix}
1 & 0 & 0 & 0 & 0 & \cdots & 0\\
1/2 & 0 & 1/2 & 0 & & & \\
0 & 1/2 & 0 & 1/2 & & & \\
\vdots & & \ddots & \ddots & \ddots & & \vdots \\
& & & & & & \\
& & & & 1/2 & 0 & 1/2 \\
& & & & 0 & 0 & 1
\end{pmatrix}
$$

---

#  Put $P$ in standard form

Absorbing states are $S_1$ and $S_p$, write them first, then write other states

|     | $S_1$ | $S_p$ | $S_2$ | $S_3$ | $S_4$ | $\cdots$ | $S_{p-2}$ | $S_{p-1}$ |
|:---:|:-----:|:-----:|:-----:|:-----:|:-----:|:--------:|:---------:|:---------:|
$S_1$ | 1 | 0 | 0 | 0 | 0 | $\cdots$ | 0 | 0 |
$S_p$ | 0 | 1 | 0 | 0 | 0 | $\cdots$ | 0 | 0 |
$S_2$ | 1/2 | 0 | 0 | 1/2 | 0 | $\cdots$ | 0 | 0 |
$S_3$ | 0 | 0 | 1/2 | 0 | 1/2 | $\cdots$ | 0 | 0 |
$\vdots$ |  |  |  |  | | | | |
$S_{p-2}$ | 0 | 0 | 0 | 0 | 0 | $\cdots$ | 0 | 1/2 |
$S_{p-1}$ | 0 | 1/2 | 0 | 0 | 0 | $\cdots$ | 1/2 | 0 |

---

So we find
$$
P=\begin{pmatrix}
\mathbb{I}_2 & \mathbf{0} \\
R & Q
\end{pmatrix}
$$
where $\mathbf{0}$ a $2\times(p-2)$-matrix, $R$ a $(p-2)\times 2$ matrix and $Q$ a $(p-2)\times (p-2)$ matrix

---

$$
R=
\begin{pmatrix}
1/2 & 0 \\
0 & 0 \\
\vdots & \vdots \\
0 & 0 \\
0 & 1/2   
\end{pmatrix}
$$
and
$$
Q=
\begin{pmatrix}
0 & 1/2 & 0 & \\
1/2 & 0 & 1/2 & \\
0 & 1/2 & 0 & \\
&& \ddots & \ddots & \ddots \\
&&&& \\
0 &&& 1/2 & 0 & 1/2 \\
0 &&&&1/2 & 0
\end{pmatrix}
$$

---

$$
\mathbb{I}_{p-2}-Q=
\begin{pmatrix}
1 & -1/2 & 0 & \\
-1/2 & 1 & -1/2 & \\
0 & -1/2 & 1 & \\
&& \ddots & \ddots & \ddots \\
&&&& \\
0 &&& -1/2 & 1 & -1/2 \\
0 &&&& -1/2 & 1
\end{pmatrix}
$$

This is a **symmetric tridiagonal Toeplitz** matrix 

(symmetric: obvious; tridiagonal: there are three diagonal bands; Toeplitz: each diagonal band is constant)

---

#  Inverting a symmetric tridiagonal matrix

Gérard Meurant [A Review on the Inverse of Symmetric Tridiagonal and Block Tridiagonal Matrices](https://doi-org.uml.idm.oclc.org/10.1137/0613045) (1992): if 
$$
J_k=
\begin{pmatrix}
\alpha_1 & \beta_1 \\
\beta_1 & \alpha_2 & \beta_2 \\
& \ddots &\ddots &\ddots \\
&& \beta_{k-2} & \alpha_{k-1} & \beta_{k-1} \\
&&& \beta_{k-1} & \alpha_k
\end{pmatrix}
$$
$$
\delta_1=\alpha_1,\quad \delta_j=\alpha_j-\frac{\beta_{j-1}^2}{\delta_{j-1}},j=2,\ldots,k
$$
$$
d^{(k)}_k=\alpha_k,\quad d^{(k)}_j=\alpha_j-\frac{\beta_j^2}{d^{(k)}_{j+1}},j=k-1,\ldots,1
$$
then we have the result on the next slide

---

#  Inverse of a symmetric tridiagonal matrix

<div class="theorem">

The inverse of the symmetric tridiagonal matrix $J_k$ is given by
$$
(J_k^{-1})_{ij} = (-1)^{j-i}\beta_i\cdots\beta_{j-1}\frac{d_{j+1}^{(k)}\cdots d_k^{(k)}}{\delta_i\cdots\delta_k},\;\forall i,\forall j>i
$$
$$
(J_k^{-1})_{ii} = \frac{d_{i+1}^{(k)}\cdots d_k^{(k)}}{\delta_i\cdots\delta_k},\;\forall i
$$
</div>

---

Note that $\alpha_1=\cdots=\alpha_k=1$ and $\beta_1=\cdots=\beta_{k-1}=-1/2$

Write $\alpha:=\alpha_i=1$ and $\beta:=\beta_i=-1/2$

We have $\delta_1 = \alpha = 1$, and the general term takes the form
$$
\delta_j = \alpha-\frac{\beta^2}{\delta_{j-1}}=1-\frac{1}{4\delta_{j-1}},\quad j=2,\ldots,k
$$

---

$$
\begin{align*}
\delta_2 &= 1-\frac 14= \frac 34 \\
\delta_3 &= 1-\frac{1}{4\frac 34} = \frac 23 \\
\delta_4 &= 1-\frac{1}{4\frac 23} = 1-\frac 38 = \frac 58 \\
\delta_5 &= 1-\frac{1}{4\frac 58} = 1-\frac 25 = \frac 35 \\
\delta_6 &= 1-\frac{1}{4\frac 35} = 1-\frac 5{12} = \frac 7{12} \\
\delta_7 &= 1-\frac{1}{4\frac 7{12}} = 1-\frac 37 = \frac 47
\end{align*}
$$

---

Taking a look at the few terms in the sequence, we get the feeling that
$$
\delta_{2n}=\frac{2n+1}{4n} \textrm{ and } \delta_{2n+1}=\frac{n+1}{2n+1}
$$
A little induction should confirm this. Induction hypothesis (changing indices for odd $\delta$):
$$
\mathcal{P}_n:
\begin{cases}
\delta_{2n-1} &= \frac{n}{2n-1} \\
\delta_{2n} &= \frac{2n+1}{4n}
\end{cases}
$$
$\mathcal{P}_1$ is true. Assume $\mathcal{P}_j$. Then
$$
\delta_{2j+1} = 1-\frac{1}{4\delta_{2j}}=1-\frac{1}{4\frac{2j+1}{4j}}=1-\frac{j}{2j+1}=\frac{j+1}{2j+1}
$$
$$
\delta_{2j+2} = 1-\frac{1}{4\delta_{2j+1}} = 1-\frac{1}{4\frac{j+1}{2j+1}}=1-\frac{2j+1}{4(j+1)}=\frac{2(j+1)+1}{4(j+1)}
$$
So $\mathcal{P}_{j+1}$ holds true

---

In fact, we can go further, by expressing
$$
\delta_{2n}=\frac{2n+1}{4n} \textrm{ and } \delta_{2n+1}=\frac{n+1}{2n+1}
$$
in terms of odd and even $j$. If $j$ is even,
$$
\delta_j=\frac{j+1}{2j}
$$
while if $j$ is odd,
$$
\delta_j=\frac{(j+1)/2}{j}
$$
But the latter gives
$$
\delta_j=\frac{j+1}{2j}
$$
so this formula holds for all $j$'s

---

For the $d_j^{(k)}$'s, we have $d_k^{(k)}=1$ and
$$
d_j^{(k)} = 1-\frac{1}{4d_{j+1}^{(k)}}
$$
So $d_k^{(k)}=\delta_1$ and
$$
d_{k-j+1}^{(k)} = \delta_j=\frac{j+1}{2j},\quad j=2,\ldots,k
$$
The form
$$
d_j^{(k)} = \delta_{k-j+1}
$$
is also useful

---

In summary

| $\delta_1$ | $\delta_2$ | $\cdots$ | $\delta_j$ | $\cdots$ | $\delta_{k-1}$ | $\delta_k$ |
|:----------:|:----------:|:--------:|:----------:|:--------:|:--------------:|:----------:|
| $d_k^{(k)}$ | $d_{k-1}^{(k)}$ | $\cdots$ | $d_{k-j+1}^{(k)}$ | $\cdots$ | $d_2^{(k)}$ | $d_1^{(k)}$ |
| 1 | $\frac 34$ | $\cdots$ | $\frac{j+1}{2j}$ | $\cdots$ | $\frac{k}{2(k-1)}$ | $\frac{k+1}{2k}$ |

---

In $J^{-1}$, the following terms appear
$$
\frac{d_{j+1}^{(k)}\cdots d_k^{(k)}}{\delta_i\cdots\delta_k},\;\forall i,\forall j>i
$$
and
$$
\frac{d_{i+1}^{(k)}\cdots d_k^{(k)}}{\delta_i\cdots\delta_k},\;\forall i
$$

---

We have, $\forall i$,
$$
\begin{align*}
\frac{d_{i+1}^{(k)}\cdots d_k^{(k)}}{\delta_i\cdots\delta_k}
&= \frac{\delta_{k-(i+1)+1}\cdots\delta_{k-k+1}}{\delta_i\cdots\delta_k} \\
&= \frac{\delta_{k-i}\cdots\delta_{1}}{\delta_i\cdots\delta_k} \\
&= \frac{\delta_{1}\cdots\delta_{k-i}}{\delta_i\cdots\delta_k} \\
&= \frac{\prod\limits_{j=1}^{k-i}\frac{j+1}{2j}}{\prod\limits_{j=i}^{k}\frac{j+1}{2j}} \\
&= \prod\limits_{j=1}^{k-i}\frac{j+1}{2j}\prod\limits_{j=i}^{k}\frac{2j}{j+1}
\end{align*}
$$

--- 

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Chaînes de Markov en temps continu

---

# Continuous-time Markov chains

CTMC similar to DTMC except in way they handle time between events (transitions)

DTMC: transitions occur each $\Delta t$

CTMC: $\Delta t\to 0$ and transition times follow an exponential distribution parametrised by the state of the system

CTMC are roughly equivalent to ODE

---

# <!--fit-->EDO vers CMTC : on considère des choses différentes

![width:600px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/flow-diagrams/figure_SIS_no_demography_ODE.png)  ![width:400px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/flow-diagrams/figure_SIS_no_demography_CTMC.png)

---


Weight | Transition | Effect 
--- | --- | ---
$\beta SI$ | $S\to S-1$, $I\to I+1$ | new infection of a susceptible 
$\gamma I$ | $S\to S+1$, $I\to I-1$ | recovery of an infectious 

Will use $S=N^*-I$ and omit $S$ dynamics

---

# Several ways to formulate CTMC's

A continuous time Markov chain can be formulated in terms of
- infinitesimal transition probabilities
- branching process
- time to next event

Here, time is in $\mathbb{R}_+$

---

For small $\Delta t$,
$$
\begin{align*}
p_{ji}(\Delta t) &= \mathbb{P}\left\{I(t+\Delta)=j|I(t)=i\right\} \\
&=
\begin{cases}
B(i)\Delta t+o(\Delta t) & j=i+1 \\
D(i)\Delta t+o(\Delta t) & j=i-1 \\
1-[B(i)+D(i)]\Delta t+o(\Delta t) & j=i \\
o(\Delta t) & \textrm{otherwise}
\end{cases}
\end{align*}
$$
with $o(\Delta t)\to 0$ as $\Delta t\to 0$

---

# Forward Kolmogorov equations

Assume we know $I(0)=k$. Then
$$
\begin{multline*}
p_i(t+\Delta t)= p_{i-1}(t)B(i-1)\Delta t+p_{i+1}(t)D(i+1)\Delta t \\
+p_i(t)[1-(B(i)+D(i))\Delta t]+o(\Delta t)
\end{multline*}
$$
Compute $(p_i(t+\Delta t)-p_i(t))/\Delta t$ and take $\lim_{\Delta t\to 0}$, giving
$$
\begin{align*}
\frac d{dt}p_0 &= p_1D(1) \\
\frac d{dt}p_i &= p_{i-1}B(i-1)+p_{i+1}D(i+1)-p_i[B(i)+D(i)] \quad i=1,\ldots,N
\end{align*}
$$

**Forward Kolmogorov equations** associated to the CTMC

---

# In vector form

Write previous system as
$$
p'=Qp
$$
with
$$
Q=
\begin{pmatrix}
0 & D(1) & 0 & \cdots & 0 \\
0 & -(B(1)+D(1)) & D(2) & \cdots & 0 \\
0 & B(1) & -(B(2)+D(2)) & \cdots & 0 \\
&&& \\
&&&& D(N) \\
&&&& -D(N)
\end{pmatrix}
$$
$Q$ **generator matrix**. Of course,
$$
p(t)=e^{Qt}p(0)
$$


---

# Linking DTMC and CTMC for small $\Delta t$

DTMC:
$$
p(t+\Delta t)=P(\Delta t)p(t)
$$
for transition matrix $P(\Delta t)$. Let $\Delta t\to 0$, obtain Kolmogorov equations for CTMC
$$
\frac d{dt} p = Qp
$$
where
$$
Q=\lim_{\Delta t\to 0}\frac{P(\Delta t)-\mathbb{I}}{\Delta t}=P'(0)
$$


