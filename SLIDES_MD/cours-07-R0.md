---
marp: true
title: R0
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 06 - R0 et la taille finale
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
# $\mathcal{R}_0$ et la taille finale d'une épidémie

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

- $\mathcal{R}_0$
- $\mathcal{R}_0$ par la méthode de la matrice de prochaine génération
- Variation sur la méthode de la matrice de prochaine génération
- Taille finale d'une épidémie dans le cas épidémique

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->$\mathcal{R}_0$

---

# Le nombre de reproduction élémentaire $\mathcal{R}_0$

Indicateur très utilisé en épidémiologie. Définition verbale

> nombre moyen de nouveaux cas générés par un individu infectieux introduit dans une population complètement naÏve
 
Si $\mathcal{R}_0>1$, alors chaque individu infectieux infecte en moyenne plus d'une personne et une épidémie est probable

---

# Calcul de $\mathcal{R}_0$

Mathematiquement, $\mathcal{R}_0$ est

> un paramètre de bifurcation qui agrège les paramètres du système, et tel que l'équilibre sans maladie (ESM) perd sa stabilité *locale* lorsque l'on franchit $\mathcal{R}_0=1$ de gauche à droite

- Obtenu en considérant la linéarisation du système en l'ESM
- Devient rapidement ingérable (taille de la matrice) et on obtient une forme souvent non unique (pas grave en tant que seuil, mais peu indicatif en dehors du seuil)

---

# Quelques valeurs de $\mathcal{R}_0$ (estimées)

| Maladie | Lieu | Période | $\mathcal{R}_0$ |
|:---|:---|:---|:---|
| Rougeole | Cirencester, Angleterre | 1947-50 | 13-14 |
|| Angleterre & Pays de Galle | 1950-68 | 16-18 |
|| Kansas, USA | 1918-21 | 5-6 |
|| Ontario, Canada | 1912-3 | 11-12 |
|| Willesden, Angleterre | 1912-3 | 11-12 |
|| Ghana | 1960-8 | 14-15 |
|| Est du Nigeria | 1960-8 | 16-17 |

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->$\mathcal{R}_0$ par la méthode de la matrice de prochaine génération

---

# TL;DR - Matrice de prochaine génération

Diekmann & Heesterbeek, caractérisé dans le cas ODE par [PvdD & Watmough (2002)](https://doi.org/10.1016/S0025-5564(02)00108-6)

On considère uniquement les compartiments $x$ avec des individus infectés et on écrit
$$
x'=\mathcal{F}-\mathcal{V}
$$
 
- $\mathcal{F}$ flux entrant du fait des nouvelles infections
- $\mathcal{V}$ tous les autres flux (¡attention au signe!)

On calcule les dérivées (Frechet) $F=D\mathcal{F}$ et $V=D\mathcal{V}$ par rapport aux variables infectées $x$ (les matrices jacobiennes) et on évalue en l'ESM

Alors
$$
\mathcal{R}_0=\rho(FV^{-1})
$$
où $\rho$ est le rayon spectral

---

# Cadre général

$x=(x_1,\ldots,x_n)^T$, $x_i\geq 0$, où les premiers $m<n$ compartiments sont ceux contenant des individus infectés

$X_s$ l'ensemble de tous les états sans maladie: 
$$
X_s=\{x\geq 0| x_i=0, i=1,\ldots,m\}
$$

Distinguons nouvelles infections des autres facteurs de changement de la population
- $F_i(x)$ taux d'apparition de nouvelles infections dans le compartiment $i$
- $V_i^+(x)$ taux de transfer d'individus vers le compartiment $i$ par tout autre moyen
- $V_i^-(x)$ taux de transfer d'individus hors du compartiment $i$

Fonctions continuement différentiables au moins 2 fois par rapport à chaque variable

$$
x_i' = f_i(x)=F_i(x)-V_i(x),\quad i=1,\ldots,n
$$
où $V_i=V_i^--V_i^+$

---

# Des hypothèses


- **(A1)** Si $x\geq 0$, alors $F_i,V_i^+,V_i^-\geq 0$ pour $i=1,\ldots,n$

> Puisque chaque fonction représente un transfer dirigé d'individus, elles sont toutes positives


- **(A2)** Si $x_i=0$ alors $V_i^-=0$. En particulier, si $x\in X_s$, alors $V_i^-=0$ pour $i=1,\ldots,m$

> Si un compartiment est vide, il ne peut y avoir de transfer d'individus hors du compartiment du fait de la mort, l'infection ou tout autre moyen

---

- **(A3)** $F_i=0$ si $i>m$

> L'incidence est nulle pour des compartiments non infectés

- **(A4)** Si $x\in X_s$ alors $F_i(x)=0$ et $V_i^+(x)=0$ pour $i=1,\ldots,m$

> On suppose que si la maladie est absente de la population, alors la population restera sans maladie, i.e., il n'a pas de d'immigration (densité indépendante) d'infectieux

---

# Une dernière petite hypothèse pour la route?

Soit $x_0$ un ESM du système, i.e., un équilibre (localement) asymptotiquement stable du modèle sans maladie, i.e., le système restreint à $X_s$. Il n'est pas nécessaire de supposer que le modèle a un ESM unique

Soit $Df(x_0)$ la matrice Jacobienne $[\partial f_i/\partial x_j]$. Certaines des dérivées sont d'un seul côté puisque $x_0$ est sur la frontière du domaine

- **(A5)** Si $F(x)$ est forcé à zéro, alors toutes les valeurs propres de $Df(x_0)$ sont à parties réelles négatives

Note: si la méthode devait ne pas fonctionner, c'est en général parce que (A5) n'est pas vérifiée

---

# Un résultat de van den Driessche & Watmough


<div align=justify 
style="background-color:#16a085;
border-radius:20px;
padding:10px 20px 10px 20px;
box-shadow: 0px 1px 5px #999;">

Supposons que l'ESM existe. Soit alors
$$
\mathcal{R}_0=\rho(FV^{-1})
$$
où les matrices $F$ et $V$ sont obtenues comme indiqué. Supposons vérifiées les conditions (A1) à (A5) hold. Alors
- si $\mathcal{R}_0<1$, alors l'ESM est LAS
- si $\mathcal{R}_0>1$, alors l'ESM est instable
</div>

Important de noter la nature *locale* de la stabilité qui est déduite de ce résultat. On verra plus tard que même lorsque $\mathcal{R}_0<1$, il peut y avoir plusieurs équilibres

---

# Direction de la bifurcation en $\mathcal{R}_0=1$

$\mu$ un paramètre de bifurcation t.q. $\mathcal{R}_0<1$ pour $\mu<0$ et $\mathcal{R}_0>1$ pour $\mu>0$ et $x_0$ soit un ESM $\forall\mu$. On considère le système
$$
\tag{6}\label{eq:sys_PvdDW}
x'=f(x,\mu)
$$

Écrivons
$$
D_xf(x_0,0)=
\left. 
  D(\mathcal{F}(x_0)-\mathcal{V}(x_0))
\right|_{\mathcal{R}_0=1}
$$
sous la forme de matrices par blocs
$$
D\mathcal{F}(x_0)
=\begin{pmatrix}
F & 0 \\ 0 & 0
\end{pmatrix},
\quad
D\mathcal{V}(x_0)
=\begin{pmatrix}
V & 0 \\ J_3 & J_4
\end{pmatrix}
$$

---

Soit $[\alpha_{\ell k}]$, $\ell=m+1,\ldots,n$, $k=1,\ldots,m$ le $(\ell-m,k)$-élément de $-J_4^{-1}J_3$ et soient $v$ et $w$ les vecteurs propres à gauche et à droite de $D_xf(x_0,0)$ t.q. $vw=1$

Soient
$$
\tag{7}\label{eq:PvdDW_a}
a =\sum_{i,j,k=1}^m
v_iw_jw_k
\left(
\frac 12 
\frac{\partial^2f_i}{\partial x_j\partial x_k}(x_0,0)
+\sum_{\ell=m+1}^n
\alpha_{\ell k}
\frac{\partial^2f_i}{\partial x_j\partial x_\ell}(x_0,0)
\right)
$$

$$
\tag{8}\label{eq:PvdDW_b}
b
=vD_{x\mu}f(x_0,0)w
=\sum_{i,j=1}^n v_iw_j
\frac{\partial^2f_i}{\partial x_j\partial\mu}
(x_0,0)
$$

---

<div class="theorem">

Considérons $\eqref{eq:sys_PvdDW}$ avec $f(x,\mu)$ satisfaisant les conditions (A1)–(A5) et $\mu$ comme définit plus haut

Supposons que la valeur propre 0 de $D_xf(x_0,0)$ soit simple

Définissons $a$ et $b$ par $\eqref{eq:PvdDW_a}$ et $\eqref{eq:PvdDW_b}$; supposons que $b\neq 0$. Alors $\exists\delta > 0$ t.q.
- si $a < 0$, alors il y a des équilibres endémiques LAS près de $x_0$ pour $0 < \mu < \delta$
- si $a > 0$, alors il y a des équilibres endémiques instables près de $x_0$ pour $-\delta < \mu < 0$
</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# Variation sur la méthode de la matrice de prochaine génération

---

# Une autre méthode pour calculer $\mathcal{R}_0$

- Arino, Brauer, PvdD, Watmough & Wu. [A final size relation for epidemic models](https://julien-arino.github.io/assets/pdf/papers/ArinoBrauerVdDWatmoughWu-2007-MBE4.pdf) (2007)
- Méthode très similaire à la précédente, mais fournit un résultat plus net parfois
- Utile dans le cas d'un modèle épidémique pour calculer la taille finale de l'épidémie
- Par contre, méthode pas universelle! Marche dans une classe relativement étendue de modèles, mais pas partout. Lorsque la méthode ne marche pas, on utilisera la méthode de la matrice de prochaine génération
- Je change les notations du papier pour rendre les choses plus claires

---

# Forme standard du système

Supposons que l'on peut écrire le système sous la forme

$$
\begin{align}
\mathbf{S}' &= \mathbf{b}(\mathbf{S},\mathbf{I},\mathbf{R})-\mathbf{D}\mathbf{S}\beta(\mathbf{S},\mathbf{I},\mathbf{R})\mathbf{h}\mathbf{I} 
\tag{3a}\label{sys:SIR_general_dS} \\
\mathbf{I}' &= \mathbf{\Pi}\mathbf{D}\mathbf{S}\beta(\mathbf{S},\mathbf{I},\mathbf{R})\mathbf{h}\mathbf{I}-\mathbf{V}\mathbf{I} 
\tag{3b}\label{sys:SIR_general_dI} \\
\mathbf{R}' &= \mathbf{f}(\mathbf{S},\mathbf{I},\mathbf{R})+\mathbf{W}\mathbf{I}
\tag{3c}\label{sys:SIR_general_dR}
\end{align}
$$

où $\mathbf{S}\in\mathbb{R}^m$, $\mathbf{I}\in\mathbb{R}^n$ et $\mathbf{R}\in\mathbb{R}^k$ sont les compartiments de susceptibles, infectés et retirés, respectivement

Les CI sont $\geq 0$ avec au moins une des composantes de $\mathbf{I}(0)$ strictement positive

---

$$
\tag{3a}
\mathbf{S}' = \mathbf{b}(\mathbf{S},\mathbf{I},\mathbf{R})-\mathbf{D}\mathbf{S}\beta(\mathbf{S},\mathbf{I},\mathbf{R})\mathbf{h}\mathbf{I}
$$
- $\mathbf{b}:\mathbb{R}_+^m\times\mathbb{R}_+^n\times\mathbb{R}_+^k\to\mathbb{R}^m$ fonction continue encodant le recrutement et la mort des individus non infectés
- $\mathbf{D}\in\mathbb{R}^{m\times m}$ matrice diagonale avec entrées $\sigma_i>0$ les susceptibilités relatives des compartiments susceptibles, avec la convention que $\sigma_1=1$
- $\beta:\mathbb{R}_+^m\times\mathbb{R}_+^n\times\mathbb{R}_+^k\to\mathbb{R}_+$ fonction à valeurs scalaires representant l'infectivité, avec, e.g., $\beta(\mathbf{S},\mathbf{I},\mathbf{R})=\beta$ pour la loi d'action de masse
- $\mathbf{h}\in\mathbb{R}^{n}$ vecteur ligne de la transmission horizontale relative

---

$$
\tag{3b}
\mathbf{I}' = \mathbf{\Pi}\mathbf{D}\mathbf{S}\beta(\mathbf{S},\mathbf{I},\mathbf{R})\mathbf{h}\mathbf{I}-\mathbf{V}\mathbf{I} \\
$$

- $\mathbf{\Pi}\in\mathbb{R}^{n\times m}$ a pour élément $(i,j)$ la fraction des individus dans le $j^{\textrm{eme}}$ compartiment susceptible qui entrent dans le $i^{\textrm{eme}}$ compartiment infectés après avoir été infectés
- $\mathbf{D}\in\mathbb{R}^{m\times m}$ matrice diagonale avec entrées $\sigma_i>0$ les susceptibilités relatives des compartiments susceptibles, avec la convention que $\sigma_1=1$
- $\beta:\mathbb{R}_+^m\times\mathbb{R}_+^n\times\mathbb{R}_+^k\to\mathbb{R}_+$ fonction à valeurs scalaires representant l'infectivité, avec, e.g., $\beta(\mathbf{S},\mathbf{I},\mathbf{R})=\beta$ pour la loi d'action de masse
- $\mathbf{h}\in\mathbb{R}^{n}$ vecteur ligne de la transmission horizontale relative
- $\mathbf{V}\in\mathbb{R}^{n\times n}$ décrit les transitions entre états infectés et les transitions hors de ces états du fait de la guérison ou la mort

---

$$
\tag{3c}
\mathbf{R}' = \mathbf{f}(\mathbf{S},\mathbf{I},\mathbf{R})+\mathbf{W}\mathbf{I}
$$

- $\mathbf{f}:\mathbb{R}_+^m\times\mathbb{R}_+^n\times\mathbb{R}_+^k\to \mathbb{R}^k$ fonction continue encodant les flux vers et hors des compartiments retirés du fait de l'immunisation ou de processus similaires
- $\mathbf{W}\in\mathbb{R}^{k\times n}$ a pour $(i,j)$-élément le taux de mouvement des individus dans le $j^{\textrm{eme}}$ compartiment infecté vers le $i^{\textrm{eme}}$ compartiment retiré

---

Supposons que $\mathbf{E}_0$ soit un ESM LAS du système sans maladie, i.e., un point d'équilibre de
$$
\begin{align*}
\mathbf{S}' &= \mathbf{b}(\mathbf{S},\mathbf{0},\mathbf{R}) \\
\mathbf{R}' &= \mathbf{f}(\mathbf{S},\mathbf{0},\mathbf{R}) \\
\end{align*}
$$

<div class="theorem">

Soit
$$
\mathcal{R}_0 = 
\beta(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0)
\mathbf{h}\mathbf{V}^{-1}
\mathbf{\Pi}\mathbf{D}\mathbf{S}_0
$$
- Si $\mathcal{R}_0<1$, l'ESM $\mathbf{E}_0$ est un équilibre LAS de $\eqref{sys:SIR_general_dS}$-$\eqref{sys:SIR_general_dR}$
- Si $\mathcal{R}_0>1$, l'ESM $\mathbf{E}_0$ de $\eqref{sys:SIR_general_dS}$-$\eqref{sys:SIR_general_dR}$ est instable
</div>

En l'absence de démographie (modèle épidémique), alors pas de conclusion sur la stabilité, bien sur

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Taille finale d'une épidémie dans le cas épidémique

---

# <!--fit-->Forme standard du système en absence de démographie

Sans démographie, la méthode suppose que l'on puisse écrire le système comme
$$
\begin{align}
\mathbf{S}' &= -\mathbf{D}\mathbf{S}\beta(\mathbf{S},\mathbf{I},\mathbf{R})\mathbf{h}\mathbf{I} 
\tag{4a}\label{sys:SIR_epi_dS} \\
\mathbf{I}' &= \mathbf{\Pi}\mathbf{D}\mathbf{S}\beta(\mathbf{S},\mathbf{I},\mathbf{R})\mathbf{h}\mathbf{I}-\mathbf{V}\mathbf{I} 
\tag{4b}\label{sys:SIR_epi_dI} \\
\mathbf{R}' &= \mathbf{W}\mathbf{I}
\tag{4c}\label{sys:SIR_epi_dR} 
\end{align}
$$
avec les termes définis avant

Pour une fonction continue $w(t)\in\mathbb{R}_+^n$, soient
$$
w_\infty = \lim_{t\to\infty}w(t)\quad\text{et}\quad
\hat{w}=\int_0^\infty w(t)\ dt
$$

---

Définissons le vecteur ligne
$$
\mathbb{R}^m\ni\mathbf{\Gamma}
=(\Gamma_1,\ldots,\Gamma_m)=\beta(\mathbf{S}_0,\mathbf{0},\mathbf{R}_0)\mathbf{h}\mathbf{V}^{-1}\mathbf{\Pi}\mathbf{D}
$$

On a alors
$$
\mathcal{R}_0=\mathbf{\Gamma}\mathbf{S}(0)
$$

---

Supposons que l'incidence soit en action de masse, i.e., $\beta(\mathbf{S},\mathbf{I},\mathbf{R})=\beta$ et que $m>1$

Alors, pour $i=1,\ldots,m$, on exprime $\mathbf{S}_i(\infty)$ en fonction de $\mathbf{S}_1(\infty)$ en utilisant
$$
\mathbf{S}_i(\infty)  = 
\mathbf{S}_i(0) \left(
\frac{\mathbf{S}_1(\infty)}{\mathbf{S}_1(0)}
\right)^{\sigma_i/\sigma_1}
$$
puis on substitue dans
$$
\frac{1}{\sigma_i}
\ln\left(\frac{\mathbf{S}_i(0)}{\mathbf{S}_i(\infty)}\right)
=
\mathbf{\Gamma}\mathbf{D}^{-1}\left(\mathbf{S}(0)-\mathbf{S}(\infty)\right)
+\beta\mathbf{h}\mathbf{V}^{-1}\mathbf{I}(0)
= 
\frac{1}{\sigma_1}
\ln\left(\frac{\mathbf{S}_1(0)}{\mathbf{S}_1(\infty)}\right)
$$
qui est une relation en taille finale pour le système général quand $\mathbf{S}_i(0)>0$

---

Si l'incidence est en action de masse et que $m=1$ (un seul compartiment susceptible), se réduit à la forme KMK
$$
\tag{5}\label{eq:final_size_m1}
\ln\left(
\frac{S_0}{S_\infty}
\right)
=\frac{\mathcal{R}_0}{S_0}
(S_0-S_\infty)+\beta\mathbf{h}\mathbf{V}^{-1}\mathbf{I}_0
$$

---

Dans le cas d'autres fonctions d'incidence, les relations de taille finale sont des inégalités de la forme, pour $i=1,\ldots,m$,
$$
\ln\left(\frac{\mathbf{S}_i(0)}{\mathbf{S}_i(\infty)}\right)
\geq
\sigma_i\mathbf{\Gamma}\mathbf{D}^{-1}\left(\mathbf{S}(0)-\mathbf{S}(\infty)\right)
+\sigma_i\beta(K)\mathbf{h}\mathbf{V}^{-1}\mathbf{I}(0)
$$
où $K$ est la population totale initiale

---

# Extensions

- Dans certains des cas où la méthode ici ne s'applique pas parce que le modèle ne peut pas s'écrire sous la forme standard $\eqref{sys:SIR_epi_dS}$-$\eqref{sys:SIR_epi_dR}$, on consultera, e.g.,
  - Andreasen. [The final size of an epidemic and its relation to the basic reproduction number](https://doi.org/10.1007/s11538-010-9623-3). *Bulletin of Mathematical Biology* **73**(10):2305-2321 (2011)
  - Lunelli & Pugliese. [Final attack ratio in SIR epidemic models for multigroup populations](https://doi.org/10.1007/s11587-017-0349-5). *Ricerche di Matematica* **67**:49-68 (2017)
  - Magal, Seydi & Webb. [Final size of a multi-group SIR epidemic model: Irreducible and non-irreducible modes of transmission](https://doi.org/10.1016/j.mbs.2018.03.020). *Mathematical Biosciences* **301**:59-67 (2018)
  

