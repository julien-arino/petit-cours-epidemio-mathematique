---
marp: true
title: Petit cours d'épidémiologie mathématique - Modèles en chaînes de Markov
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 15 - Modèles en chaînes de Markov
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

<!-- _backgroundImage: "linear-gradient(to top, #85110d, 1%, white)" -->
# Petit cours d'épidémiologie mathématique<br/>Modèles en chaînes de Markov

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

# De façon un peu plus générale

Évolution de l'état régie par
$$
p(t+\Delta t) = p(t)A(\Delta t)
$$
où $A(\Delta t)$ est une matrice stochastique, la matrice de transition, dont les éléments $a_{ij}=\mathbb{P}(X_{t+\Delta t}=s_j|X_t=s_i)$, où $X_1,\ldots$ est une suite de variables aléatoires décrivant l'état

Si $A(\Delta t)=A$, une constante, la CMTD est *homogène*

On normalise souvent le temps de telle manière que $\Delta t=1$

---

# Remarque importante

Les CMTD vivent à la frontière du monde des probabilistes, qui aiment penser à $p(t)$ comme un vecteur ligne, $A(\Delta t)$ comme une matrice stochastique par ligne et écrivent l'évolution de la chaîne sous la forme
$$
p(t+\Delta t) = p(t)A(\Delta t)
$$
et des algébristes linéaires, qui préfèrent les vecteur colonnes et les matrices de transition colonne-stochastiques 
$$
p(t+\Delta t) = A(\Delta t)p(t)
$$

Assurez-vous de la direction utilisée: votre source parle-t-elle de $A$ ou $A^T$ ?

---

# Avantages des CMTD

En tant que personne qui enseigne la modélisation: la théorie des CMTD utilise beaucoup d'algèbre linéaire et matricielle et de théorie des graphes, elle est en général bien comprise et appréciée par les étudiants

Une très bonne référence sur le sujet est le livre de [Kemeny & Snell](https://www.amazon.com/Finite-Markov-Chains-Laurie-Kemeny/dp/B000KYES0O)

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

Le vecteur $w$ dans le résultat précédent est le vecteur propre à gauche associé à la valeur propre 1 de $P$. (Le vecteur propre à droite correspondant à 1 est $\mathbf{1}$ puisque $P\mathbf{1}=\mathbf{1}$)

En effet, si $p(n)$ converge, alors à la limite, $p(n+1)=p(n)$, mais puisqu'on a aussi (par la relation de récurrence) $p(n+1)=p(n)P$, il suit que $w$ est un point fixe du système. On écrit donc
$$
wP=w
$$
et l'on résoud pour $w$, ce qui revient à trouver un vecteur propre correspondant à la valeur propre 1

On peut aussi chercher $w$ comme le vecteur propre à droite associé à la valeur propre 1 de la matrice transposée $P^T$. (Cela peut être utile numériquement si un algorithme ne renvoie que les valeurs propres à droite)

---

Pour rappel: si $Av=\lambda v$ pour $v\neq 0$, alors $Akv=\lambda kv$ pour tout $k\neq 0$, i.e., si $v$ est un vecteur propre associé à $\lambda$, alors tous ses multiples $kv$ sont aussi des vecteurs propres associés à $\lambda$

L'expression obtenue pour $w$ pourrait ne pas être un vecteur stochastique. Il convient donc de vérifier que 
$$
\|w\|=w_1+\cdots+w_r = 1
$$
Si ce n'est pas le cas, on considère 
$$
\frac{w}{\|w\|}
$$

---

# Une autre façon de vérifier la primitivité
<div class="theorem">

Une matrice $M$ est primitive si le graphe de connection associé est fortement connexe (il y a un chemin entre tous les nœuds), et il y a au moins une entrée strictement positive sur la diagonale de $M$
</div>

Cela se vérifie directement sur le graphe de transition
![width:100% center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/graphe_hybride.png)

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

![width:100% center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/graphe_absorbant.png)

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

#  Marche aléatoire v1.0 (cas régulier)

- Chaîne (ligne) d'états $S_1,\ldots,S_p$
- Quand dans l'état $S_i$, $i=2,\ldots,p-1$, probabilité 1/2 d'aller à gauche (vers $S_{i-1}$) et 1/2 d'aller à droite (vers $S_{i+1}$)
- Dans l'état $S_1$, probabilité 1 d'aller en $S_2$
- Dans l'état $S_p$, probabilité 1 d'aller en $S_{p-1}$

![width:100% center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/drunk_mans_walk_regular.png)

---

# Matrice de transition pour v1.0

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
On montre relativement facilement que $P$ est primitive, donc on a une CMTD régulière

---

On doit résoudre $w^TP=w^T$, i.e.,
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

Exprimons tout en fonction de $w_1$:
$$
\begin{align*}
w_2 &= 2w_1 \\
w_1 +\frac 12 w_3 &= w_2 \Leftrightarrow w_3 = 2(w_2-w_1)=2w_1\\
\frac 12 w_2+\frac 12 w_4 &= w_3 \Leftrightarrow w_4=2(w_3-\frac 12 w_2)=2(w_3-w_1)=2w_1\\
\frac 12 w_3+\frac 12 w_5 &= w_4 \Leftrightarrow w_5=2(w_4-\frac 12 w_3)=2(w_4-w_1)=2w_1\\
& \vdots \\
\frac 12 w_{p-3}+\frac 12 w_{p-1} &= w_{p-2} \Leftrightarrow w_{p-1} = 2w_1 \\
\frac 12 w_{p-2}+w_p &= w_{p-1} \Leftrightarrow w_p=w_{p-1}-\frac 12 w_{p-2}=w_1\\
\frac 12 w_{p-1} &= w_p \qquad (\textrm{confirme que }w_p=w_1)
\end{align*}
$$

---

Donc on obtient
$$
w^T=\left(w_1,2w_1,\ldots,2w_1,w_1\right)
$$
On a
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

Puisque
$$
\sum_{i=1}^p w_i = 2w_1(p-1)
$$
pour avoir un vecteur de probabilité, il nous faut prendre 
$$
w_1=\frac{1}{2(p-1)}
$$
Donc
$$
w^T=\left(\frac{1}{2(p-1)},\frac{1}{p-1},\ldots,\frac{1}{p-1},\frac{1}{2(p-1)}\right)
$$

---

Supposons par exemple une condition initiale avec $p(0)=(1,0,\ldots,0)$, i.e., la marche débute dans l'état 1. Alors
$$
\lim_{t\to\infty}p(t)=p(0)W=p(0)w=p(0)\cdot w^T
$$
donc
$$
\lim_{t\to\infty}p(t)=(1,0,\ldots,0)\cdot\left(\frac{1}{2(p-1)},\frac{1}{p-1},\ldots,\frac{1}{p-1},\frac{1}{2(p-1)}\right)
$$

---

#  Marche aléatoire v2.0 (cas absorbant)

- Chaîne (ligne) d'états $S_1,\ldots,S_p$
- Quand dans l'état $S_i$, $i=2,\ldots,p-1$, probabilité 1/2 d'aller à gauche (vers $S_{i-1}$) et 1/2 d'aller à droite (vers $S_{i+1}$)
- Dans l'état $S_1$, probabilité 1 d'aller en $S_1$
- Dans l'état $S_p$, probabilité 1 d'aller en $S_{p}$

![width:100% center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/drunk_mans_walk_absorbing.png)

---

# Matrice de transition v2.0

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

# Écrivons $P$ en forme standard

Les états absorbants sont $S_1$ et $S_p$, on les écrit en premier, puis les autres états

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

On trouve donc
$$
P=\begin{pmatrix}
\mathbb{I}_2 & \mathbf{0} \\
R & Q
\end{pmatrix}
$$
où $\mathbf{0}$ une $2\times(p-2)$-matrice, $R$ une $(p-2)\times 2$-matrice et $Q$ une $(p-2)\times (p-2)$-matrice

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
et
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

Ceci est une matrice de **Toeplitz tridiagonale symmétrique** 

(symmétrique: évident; tridiagonale: il y a 3 bandes diagonales; Toeplitz: chaque bande diagonale est constante)

On peut donc inverser explicitement.. pour illustrer, voici comment on s'y prendrait

---

#  Inverser une matrice tridiagonale symmétrique

[Gérard Meurant](https://doi-org.uml.idm.oclc.org/10.1137/0613045) (1992): si 
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
alors on a le résultat sur le transparent suivant

---

#  Inverse d'une matrice tridiagonale symmétrique

<div class="theorem">

L'inverse d'une matrice tridiagonale symmétrique $J_k$ est donnée par
$$
(J_k^{-1})_{ij} = (-1)^{j-i}\beta_i\cdots\beta_{j-1}\frac{d_{j+1}^{(k)}\cdots d_k^{(k)}}{\delta_i\cdots\delta_k},\;\forall i,\forall j>i
$$
$$
(J_k^{-1})_{ii} = \frac{d_{i+1}^{(k)}\cdots d_k^{(k)}}{\delta_i\cdots\delta_k},\;\forall i
$$
</div>

---

Ici, $\alpha_1=\cdots=\alpha_k=1$ et $\beta_1=\cdots=\beta_{k-1}=-1/2$

Écrivons $\alpha:=\alpha_i=1$ et $\beta:=\beta_i=-1/2$

On a $\delta_1 = \alpha = 1$, et le terme général prend la forme
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

En inspectant quelques termes de la suite, on développe le sentiment que 
$$
\delta_{2n}=\frac{2n+1}{4n} \textrm{ and } \delta_{2n+1}=\frac{n+1}{2n+1}
$$
Une petite récurrence devrait confirmer ça. Hypothèse de récurrent (en changeant les indices pour $\delta$ impair):
$$
\mathcal{P}_n:
\begin{cases}
\delta_{2n-1} &= \frac{n}{2n-1} \\
\delta_{2n} &= \frac{2n+1}{4n}
\end{cases}
$$
$\mathcal{P}_1$ est vrai. Supposons $\mathcal{P}_j$ vrai. Alors
$$
\delta_{2j+1} = 1-\frac{1}{4\delta_{2j}}=1-\frac{1}{4\frac{2j+1}{4j}}=1-\frac{j}{2j+1}=\frac{j+1}{2j+1}
$$
$$
\delta_{2j+2} = 1-\frac{1}{4\delta_{2j+1}} = 1-\frac{1}{4\frac{j+1}{2j+1}}=1-\frac{2j+1}{4(j+1)}=\frac{2(j+1)+1}{4(j+1)}
$$
Donc $\mathcal{P}_{j+1}$ est vrai

---

En fait, on peut aller plus loin, en exprimant
$$
\delta_{2n}=\frac{2n+1}{4n} \textrm{ and } \delta_{2n+1}=\frac{n+1}{2n+1}
$$
en termes de $j$ pair ou impair. Si $j$ est pair
$$
\delta_j=\frac{j+1}{2j}
$$
tandis que si $j$ est impair
$$
\delta_j=\frac{(j+1)/2}{j}
$$
Mais cette dernière expression donne
$$
\delta_j=\frac{j+1}{2j}
$$
donc cette formule vaut pour tous les $j$

---

Pour les $d_j^{(k)}$'s, on a $d_k^{(k)}=1$ et
$$
d_j^{(k)} = 1-\frac{1}{4d_{j+1}^{(k)}}
$$
Donc $d_k^{(k)}=\delta_1$ et
$$
d_{k-j+1}^{(k)} = \delta_j=\frac{j+1}{2j},\quad j=2,\ldots,k
$$
L'expression
$$
d_j^{(k)} = \delta_{k-j+1}
$$
est également utile

---

En résumé

| $\delta_1$ | $\delta_2$ | $\cdots$ | $\delta_j$ | $\cdots$ | $\delta_{k-1}$ | $\delta_k$ |
|:----------:|:----------:|:--------:|:----------:|:--------:|:--------------:|:----------:|
| $d_k^{(k)}$ | $d_{k-1}^{(k)}$ | $\cdots$ | $d_{k-j+1}^{(k)}$ | $\cdots$ | $d_2^{(k)}$ | $d_1^{(k)}$ |
| 1 | $\frac 34$ | $\cdots$ | $\frac{j+1}{2j}$ | $\cdots$ | $\frac{k}{2(k-1)}$ | $\frac{k+1}{2k}$ |

Dans $J^{-1}$, on trouve les termes suivants
$$
\frac{d_{j+1}^{(k)}\cdots d_k^{(k)}}{\delta_i\cdots\delta_k},\;\forall i,\forall j>i
$$
$$
\frac{d_{i+1}^{(k)}\cdots d_k^{(k)}}{\delta_i\cdots\delta_k},\;\forall i
$$

---

On a, $\forall i$,
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

# Les CMTC en 2 mots

CMTC sont similaires aux CMTD à part dans leur façon de gérer le temps entre évènements (transitions)

CMTD: transitions (ou absence de transitions) ont lieu chaque $\Delta t$

CMTC: $\Delta t\to 0$

CMTC sont globalement équivalentes aux EDO

---

# <!--fit-->EDO vers CMTC : on considère des choses différentes

![height:250px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/flow-diagrams/figure_SIS_no_demography_ODE.png)  ![height:250px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/flow-diagrams/figure_SIS_no_demography_CTMC.png)


Poids | Transition | Effet 
--- | --- | ---
$\beta SI$ | $S\to S-1$, $I\to I+1$ | nouvelle infection d'un susceptible 
$\gamma I$ | $S\to S+1$, $I\to I-1$ | guérison d'un infectieux 


---

# Plusieurs façons de formulers les CMTC

Une chaîne de Markov en temps continu peut être formulée en termes de
- probabilités infinitésimales de transition
- processus de branchement
- temps jusqu'au prochain évènement

Ici, le temps est dans $\mathbb{R}_+$

---

Considérons un processus de naissance et mort. Pour $\Delta t$ petit,
$$
\begin{align*}
p_{ji}(\Delta t) &= \mathbb{P}\left\{I(t+\Delta)=j|I(t)=i\right\} \\
&=
\begin{cases}
B(i)\Delta t+o(\Delta t) & j=i+1 \\
D(i)\Delta t+o(\Delta t) & j=i-1 \\
1-[B(i)+D(i)]\Delta t+o(\Delta t) & j=i \\
o(\Delta t) & \textrm{sinon}
\end{cases}
\end{align*}
$$
avec $o(\Delta t)\to 0$ quand $\Delta t\to 0$

---

# Équations de Kolmogorov avancées

Supposons connu $I(0)=k$. Alors
$$
\begin{multline*}
p_i(t+\Delta t)= p_{i-1}(t)B(i-1)\Delta t+p_{i+1}(t)D(i+1)\Delta t \\
+p_i(t)[1-(B(i)+D(i))\Delta t]+o(\Delta t)
\end{multline*}
$$
Calculons $(p_i(t+\Delta t)-p_i(t))/\Delta t$ et prennons $\lim_{\Delta t\to 0}$, ce qui donne
$$
\begin{align*}
\frac d{dt}p_0 &= p_1D(1) \\
\frac d{dt}p_i &= p_{i-1}B(i-1)+p_{i+1}D(i+1)-p_i[B(i)+D(i)] \quad i=1,\ldots,N
\end{align*}
$$

Ceci constitue les **équations de Kolmogorov avancées** associées à la CMTC

---

# Forme vectorielle

Écrivons le système précédent sous la forme
$$
p'=Qp
$$
avec
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
$Q$ **matrice génératrice**. Bien sur
$$
p(t)=e^{Qt}p(0)
$$


---

# Lien entre CMTD et CMTC pour $\Delta t$ petit

CMTD:
$$
p(t+\Delta t)=P(\Delta t)p(t)
$$
avec matrice de transition $P(\Delta t)$. Supposons $\Delta t\to 0$, on obtient les équations avancées de Kolmogorov pour la CMTC
$$
\frac d{dt} p = Qp
$$
où
$$
Q=\lim_{\Delta t\to 0}\frac{P(\Delta t)-\mathbb{I}}{\Delta t}=P'(0)
$$


