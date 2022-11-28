---
marp: true
title: Petit cours d'épidémiologie mathématique - Modèles dans des métapopulations
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 14 - Modèles dans des métapopulations
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
# <!--fit-->Petit cours d'épidémiologie mathématique<br/>Modèles dans des métapopulations

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
- Formulation des modèles en métapopulation
- Analyse mathématique élémentaire
- $\mathcal{R}_0$ n'est pas la panacée - Un centre urbain et des villes satellites
- Problèmes spécifiques aux métapopulations
- Investigation computationnelle des grands systèmes

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Formulation des modèles en métapopulation

<div style = "position: relative; bottom: -40%; font-size:20px;">

- JA & PvdD. [Disease spread in metapopulations](https://server.math.umanitoba.ca/~jarino/publications/ArinoVdD-2006-FIC48.pdf). *Fields Institute Communications* **48**:1-13 (2006)
- JA. [Diseases in metapopulations](https://server.math.umanitoba.ca/~jarino/papers/Arino_metapopulations.pdf). In *Modeling and Dynamics of Infectious Diseases*, World Scientific (2009)
- JA. [Spatio-temporal spread of infectious pathogens of humans](https://doi.org/10.1016/j.idm.2017.05.001). *Infectious Disease Modelling* **2**(2):218-228 (2017)
</div>

---

<div style = "position: relative; top: -47%; font-size:30px">

**Propagation des maladies dans un monde juridictionnel**
</div>

![bg 90%](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/importations/importation_process3.png)

<div style = "position: relative; bottom: -45%; font-size:18px;">

- JA, Bajeux, Portet & Watmough. [Quarantine and the risk of COVID-19 importation](https://doi.org/10.1017/S0950268820002988). *Epidemiology & Infection* **148**:e298 (2020)
- JA, Bolle, Milliken & Portet. [Risk of COVID-19 variant importation - How useful are travel control measures?](https://doi.org/10.1016/j.idm.2021.06.006). *Infectious Disease Modelling* **6**:875-897 (2021)
</div>

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/spatial/J_WeightedVoronoi_zoom.png)

---

# <!--fit-->Principes généraux (1)

- $|\mathcal{P}|$ lieux géographiques (*patchs*) dans un ensemble $\mathcal{P}$  (ville, région, pays..)
- Les patchs sont les noeuds d'un graphe
- Each patch $p\in\mathcal{P}$ contient des  **compartiments** $\mathcal{C}_p\subseteq\mathcal{C}$
  - individus susceptibles à la maladie
	- individus infectés par la maladie
	- différentes espèces affectées par la maladie
	- etc.

![bg right:32% width:300px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/metapopulations/simple_graph.svg)

---

# Principes généraux (2)

- Les compartiments *peuvent* se déplacer entre patchs, vaec $m_{cqp}$ taux de mouvement des individus du compartiment $c\in\mathcal{C}$ depuis le patch $p\in\mathcal{P}$ vers le patch $q\in\mathcal{P}\setminus\{p\}$
- Mouvement instantané et pas de mortalité pendant le mouvement
- $\forall c\in\mathcal{C}$, définit un digraphe $\mathcal{G}^c$ avec arcs $\mathcal{A}^c$
- Arc de $p$ à $q$ si $m_{cqp}>0$, absent sinon
- $|\mathcal{C}|$ compartiments, donc tout $(p,q)$ peut avoir au plus $|\mathcal{C}|$ flèches $\rightarrow$ multi-digraphe


---

# Le modèle de mobilité sous-jacent

$N_{cp}$ population du compartiment $c\in\mathcal{C}$ dans le patch $p\in\mathcal{P}$

Supposons pas de naissance ni de mort. Balançons les flux entrants et sortants

$$
\begin{align}
N_{cp}' &= \left(\sum_{q\in\mathcal{P}\setminus\{p\}} m_{cpq}N_{cq}\right)-\left(\sum_{q\in\mathcal{P}\setminus\{p\}} m_{cqp}\right)N_{cp} \\
&\\
\text{ou} & \\
&\\
N_{cp}' &=  \sum_{q\in\mathcal{P}} m_{cpq}N_{cq} 
\qquad \tag{1}\label{eq:dNcp}
\end{align}
$$
si l'on écrit $m_{cpp}=-\sum_{q\in\mathcal{P}\setminus\{p\}} m_{cqp}$

---

# Le modèle SLIRS dans les patchs

![width:800px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/flow-diagrams/SLIRS.svg)

$B(N)$ est le taux de naissance (typiquement $b$ ou $bN$)

$L$ = infectés de façon latente ($\simeq E$ exposés, bien que ce terme soit ambigu)

---

# Modèle $|\mathcal{P}|$-SLIRS

$$
\begin{align}
S_{p}' &=b_p+\nu_pR_p-\Phi_p-d_pS_p 
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Spq}S_{q}} \tag{2a}\label{sys:pSLIRS_dS} \\
L_{p}' &=\Phi_p-\left( \varepsilon_{p}+d_{p}\right)L_{p}
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Lpq}L_{q}} \tag{2b}\label{sys:pSLIRS_dL} \\
I_{p}' &=\varepsilon_pL_p-(\gamma_p+d_p)I_p
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Ipq}I_{q}} \tag{2c}\label{sys:pSLIRS_dI} \\
R_{p}' &=\gamma _{p}I_{p}-\left(\nu_{p}+d_{p}\right)R_{p}
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Rpq}R_{q}} \tag{2d}\label{sys:pSLIRS_dR} 
\end{align}
$$

avec incidence 
$$
\Phi_p=\beta_p\frac{S_pI_p}{N_p^{q_p}},\qquad q_p\in\{0,1\}
\tag{2e}\label{sys:pSLIRS_incidence} 
$$


<div style = "position: relative; bottom: -12%; font-size:20px;">

- JA & PvdD. [Disease spread in metapopulations](https://server.math.umanitoba.ca/~jarino/publications/ArinoVdD-2006-FIC48.pdf). *Fields Institute Communications* **48**:1-13 (2006)
- JA. [Diseases in metapopulations](https://server.math.umanitoba.ca/~jarino/papers/Arino_metapopulations.pdf). In *Modeling and Dynamics of Infectious Diseases*, World Scientific (2009)
</div>

---

# $|\mathcal{S}|\;|\mathcal{P}|$-SLIRS (espèces multiples)

$\mathcal{S}$ un ensemble d'espèces
$$
\small
\begin{align}
S_{sp}' &= b_{sp}+\nu_{sp}R_{sp}-\Phi_{sp}-d_{sp}S_{sp}
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Sspq}S_{sq}} \tag{3a}\label{sys:spSLIRS_dS} \\
L_{sp}' &= \Phi_{sp}-(\varepsilon_{sp}+d_{sp})L_{sp}
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}}m_{Lspq}L_{sq}} \tag{3b}\label{sys:spSLIRS_dL} \\
I_{sp}' &= \varepsilon_{sp}L_{sp}-(\gamma_{sp}+d_{sp})I_{sp}
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Ispq}I_{sq}} \tag{3c}\label{sys:spSLIRS_dI} \\
R_{sp} &= \gamma _{sp}I_{sp}-(\nu_{sp}+d_{sp})R_{sp}
\color{red}{+\textstyle{\sum_{q\in\mathcal{P}}} m_{Rspq}R_{sq}} \tag{3d}\label{sys:spSLIRS_dR} 
\end{align}
$$

avec incidence
$$
\Phi_{sp}=\sum_{k\in\mathcal{S}}\beta_{skp}\frac{S_{sp}I_{kp}}{N_p^{q_p}},\qquad q_p\in\{0,1\}
\tag{3e}\label{sys:spSLIRS_incidence} 
$$

<div style = "position: relative; bottom: -6%; font-size:20px;">

- JA, Davis, Hartley, Jordan, Miller \& PvdD. [A multi-species epidemic model with spatial dynamics](https://server.math.umanitoba.ca/~jarino/papers/ArinoDavisHartleyJordanMillerVdD-2005-MMB22.pdf). *Mathematical Medicine and Biology* **22**(2):129-142 (2005) 
- JA, Jordan \& PvdD. [Quarantine in a multi-species epidemic model with spatial dynamics](https://server.math.umanitoba.ca/~jarino/publications/ArinoJordanVdD-2007-MBS206.pdf). *Mathematical Biosciences* **206**(1):46-60 (2007)
</div>

---

# $|\mathcal{P}|^2$-SLIRS (résidents-voyageurs)

$$
\small
\begin{align}
S_{pq}' =& 
b_{pq}+\nu_{pq} R_{pq}-\Phi_{pq}-d_{pq}S_{pq} \color{red}{+\textstyle{\sum_{k\in\mathcal{P}}} m_{Spqk}S_{pk}} 
\tag{4a}\label{sys:ppSLIRS_dS} \\
L_{pq}' =& \Phi_{pq}
-(\varepsilon_{pq}+d_{pq})L_{pq}
\color{red}{+\textstyle{\sum_{k\in\mathcal{P}}} m_{Lpqk}L_{pk}} 
\tag{4b}\label{sys:ppSLIRS_dL} \\
I_{pq}' =& \varepsilon_{pq} L_{pq}
-(\gamma_{pq}+d_{pq})I_{pq}
\color{red}{+\textstyle{\sum_{k\in\mathcal{P}}} m_{Ipqk}I_{pk}} 
\tag{4c}\label{sys:ppSLIRS_dI} \\
R_{pq}' =& \gamma_{pq} I_{pq}
-(\nu_{pq}+d_{pq})R_{pq}
\color{red}{+\textstyle{\sum_{k\in\mathcal{P}}} m_{Rpqk}R_{pk}}
\tag{4d}\label{sys:ppSLIRS_dR} 
\end{align}
$$

avec incidence
$$
\Phi_{pq}=\sum_{k\in\mathcal{P}}\beta_{pqk}\frac{S_{pq}I_{kq}}{N_p^{q_q}},\qquad q_q=\{0,1\}
\tag{4e}\label{sys:ppSLIRS_incidence} 
$$

<div style = "position: relative; bottom: -6%; font-size:20px;">

- Sattenspiel & Dietz. [A structured epidemic model incorporating geographic mobility among regions](https://doi.org/10.1016/0025-5564(94)00068-B) (1995)
- JA \& PvdD. [A multi-city epidemic model](https://server.math.umanitoba.ca/~jarino/publications/ArinoVdD-2003-MPS10.correct.pdf). *Mathematical Population Studies* **10**(3):175-193 (2003)
- JA \& PvdD. [The basic reproduction number in a multi-city compartmental epidemic model](https://server.math.umanitoba.ca/~jarino/papers/ArinoVdD-2003-LNCIS294.pdf). In *Positive Systems* (2003)
</div>

---

# <!--fit-->Modèles généraux en metapopulation

$\mathcal{U}\subsetneq\mathcal{C}$ compartiments **non infectés** et $\mathcal{I}\subsetneq\mathcal{C}$ compartiments **infectés**, $\mathcal{U}\cup\mathcal{I}=\mathcal{C}$ et $\mathcal{U}\cap\mathcal{I}=\emptyset$

Pour $k\in\mathcal{U}$, $\ell\in\mathcal{I}$ et $p\in\mathcal{P}$,
$$
\begin{align}
s_{kp}' &= f_{kp}(S_p,I_p)+\sum_{q\in\mathcal{P}} m_{kpq}s_{kq} 
\tag{5a}\label{sys:general_metapop_ds} \\
i_{\ell p}' &= g_{\ell p}(S_p,I_p)+\sum_{q\in\mathcal{P}} m_{\ell pq}i_{\ell q}
\tag{5b}\label{sys:general_metapop_di} 
\end{align}
$$
où $S_p=(s_{1p},\ldots,s_{|\mathcal{U}|p})$ et $I_p=(i_{1p},\ldots,i_{|\mathcal{I}|p})$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--- fit --->Analyse mathématique élémentaire

---

# Analyse - Système illustratif

Considérons le $|\mathcal{P}|$-SLIRS 
$$
\begin{align}
S_{p}' &=b_p-\Phi_p-d_pS_p+\nu_pR_p
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Spq}S_{q} 
\tag{6a}\label{sys:pSLIRS_toy_dS} \\
L_{p}' &=\Phi_p-\left( \varepsilon_{p}+d_{p}\right)L_{p}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Lpq}L_{q} 
\tag{6b}\label{sys:pSLIRS_toy_dL} \\
I_{p}' &=\varepsilon_pL_p-(\gamma_p+d_p)I_p
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Ipq}I_{q} 
\tag{6c}\label{sys:pSLIRS_toy_dI} \\
R_{p}' &=\gamma _{p}I_{p}-\left(\nu_{p}+d_{p}\right)R_{p}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Rpq}R_{q}
\tag{6d}\label{sys:pSLIRS_toy_dR} 
\end{align}
$$

et l'incidence
$$
\Phi_p=\beta_p\frac{S_pI_p}{N_p^{q_p}},\qquad q_p\in\{0,1\}
\tag{6e}\label{sys:pSLIRS_toy_incidence} 
$$

Système de $4|\mathcal{P}|$ équations

---

# La taille n'est pas si gênante ..

Système de $4|\mathcal{P}|$ équations !!!

Toutefois, beaucoup de structure: 
- $|\mathcal{P}|$ *copies* d'unités individuelles comprenant chacune 4 équations
- Dynamique des unités constitutives bien comprise
- Couplage linéaire

$\implies$ Un bon cas de système de grande taille (l'analyse matricielle est très utile ici)

---

# Notations dans ce qui suit

- $M=[m_{ij}]\in\mathcal{M}_n(\mathbb{R})=\mathbb{R}^{n\times n}$ une matrice carrée

- $M\geq\mathbf{0}$ si $m_{ij}\geq 0$ pour tout $i,j$ (pourrait être la matrice nulle); $M>\mathbf{0}$ si $M\geq\mathbf{0}$ et $\exists i,j$ avec $m_{ij}>0$; $M\gg\mathbf{0}$ si $m_{ij}>0$ $\forall i,j=1,\ldots,n$. Même notations pour les vecteurs

- $\sigma(M)=\{\lambda\in\mathbf{C}; M\lambda=\lambda\mathbf{v}, \mathbf{v}\neq\mathbf{0}\}$ **spectre** of $M$

- $\rho(M)=\max_{\lambda\in\sigma(M)}\{|\lambda|\}$ **rayon spectral**

- $s(M)=\max_{\lambda\in\sigma(M)}\{\Re(\lambda)\}$ **abscisse spectrale** (ou **module de stabilité**)

- $M$ est une **M-matrice** si c'est une **Z-matrice** ($m_{ij}\leq 0$ pour $i\neq j$) et que $M = s\mathbb{I}-A$, avec $A\geq 0$ et $s\geq \rho(A)$

---

# <!--fit-->Comportement de la population totale

Considérons le comportement de $N_p=S_p+L_p+I_p+R_p$. On a
$$
\begin{aligned}
N_p' &=b_p\cancel{-\Phi_p}-d_pS_p\cancel{+\nu_pR_p}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Spq}S_{q} \\
&\quad \cancel{+\Phi_p}-\left(\cancel{\varepsilon_{p}}
+d_{p}\right)L_{p}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Lpq}L_{q} \\
&\quad \cancel{+\varepsilon_pL_p}-(\cancel{\gamma_p}+d_p)I_p
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Ipq}I_{q} \\
&\quad \cancel{+\gamma _{p}I_{p}}
-\left(\cancel{\nu_{p}}+d_{p}\right)R_{p}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Rpq}R_{q}
\end{aligned}
$$

Donc
$$
N_p'=b_p-d_pN_p
+\sum_{X\in\{S,L,I,R\}}\sum_{q\in\mathcal{P}} m_{Xpq}X_{q}
$$

---

# <!--fit-->Forme vectorielle / matricielle de l'équation

On a
$$
N_p'=b_p-d_pN_p
+\sum_{X\in\{S,L,I,R\}}\sum_{q\in\mathcal{P}} m_{Xpq}X_{q}
$$
En forme vectorielle
$$
\tag{7}\label{sys:pSLIRS_dN_general} 
\mathbf{N}'=\mathbf{b}-\mathbf{d}\mathbf{N}+\sum_{X\in\{S,L,I,R\}}\mathcal{M}^X\mathbf{X}
$$
où $\mathbf{b}=(\mathcal{B}_1,\ldots,\mathcal{B}_{|\mathcal{P}|})^T,$ $\mathbf{N}=(N_1,\ldots,N_{|\mathcal{P}|})^T,$ $\mathbf{X}=(X_1,\ldots,X_{|\mathcal{P}|})^T\in\mathbb{R}^{|\mathcal{P}|},$ $\mathbf{d},\mathcal{M}^X$ $|\mathcal{P}|\times|\mathcal{P}|$-matrices avec 
$$
\mathbf{d}=\mathsf{diag}\left(d_1,\ldots,d_{|\mathcal{P}|}\right)
$$

---

# La matrice de mouvement

$$
\mathcal{M}^c=
\begin{pmatrix}
-\sum_{q\in\mathcal{P}} m_{cq1} & m_{c12} & & m_{c1|\mathcal{P}|} \\
m_{c21} & -\sum_{q\in\mathcal{P}} m_{cq2} & & m_{c2|\mathcal{P}|} \\
& & & \\
m_{c|\mathcal{P}|1} & m_{c|\mathcal{P}|2} & & -\sum_{q\in\mathcal{P}} m_{cq|\mathcal{P}|}
\end{pmatrix}
$$

---

<div class="theorem">

Soit un compartiment $c\in\mathcal{C}$. Alors les propriétés suivantes sont vraies:
1. $0\in\sigma(\mathcal{M}^c)$ et correspond au vecteur propre à gauche $\mathbf{1}^T_{|\mathcal{P}|}=(1,\ldots,1)$
2. $−\mathcal{M}^c$ M-matrice singulière
3. $0 = s(\mathcal{M}^c)\in\sigma(\mathcal{M}^c)$
4. $\mathcal{M}^c$ irréductible $\implies$ $s(\mathcal{M}^c)$ de multiplicité 1
</div>

<div style = "position: relative; bottom: -15%; font-size:20px;">

- JA, Bajeux \& Kirkland. [Number of source patches required for population persistence in a source-sink metapopulation with explicit movement](https://link.springer.com/epdf/10.1007/s11538-019-00593-1?author_access_token=EExdAOC94_0nwG8LMCIoG_e4RwlQNchNByi7wbcMAY6UprpSQ2NEwJhyTjNQrHljtlg8X5E8XM5_iLMsJpxIq750BJ9YXGT6yuMgh65TUuKDb_Z-g1pn0m6w5XILLO0RRY0pzrazec5gcY_GZHE85Q%3D%3D). *Bulletin of Mathematical Biology* **81**(6):1916-1942 (2019)
</div>

---

# Le cas sympa

On rappelle que
$$
\tag{7}
\mathbf{N}'=\mathbf{b}-\mathbf{d}\mathbf{N}+\sum_{X\in\{S,L,I,R\}}\mathcal{M}^X\mathbf{X}
$$

Supposons les taux de mouvement **égaux pour tous les compartiments**, i.e.,
$$
\mathcal{M}^S=\mathcal{M}^L=\mathcal{M}^I=\mathcal{M}^R=:\mathcal{M}
$$
Alors
$$
\begin{align}
\mathbf{N}' &= \mathbf{b}-\mathbf{d}\mathbf{N}+\mathcal{M}\sum_{X\in\{S,L,I,R\}}\mathbf{X}\\
&= \mathbf{b}-\mathbf{d}\mathbf{N}+\mathcal{M}\mathbf{N} \tag{8}\label{sys:pSLIRS_toy_dN}
\end{align}
$$

--- 

$$
\tag{8}
\mathbf{N}'=\mathbf{b}-\mathbf{d}\mathbf{N}+\mathcal{M}\mathbf{N}
$$

Équilibres
$$
\begin{aligned}
\mathbf{N}'=\mathbf{0} &\Leftrightarrow \mathbf{b}-\mathbf{d}\mathbf{N}+\mathcal{M}\mathbf{N}=\mathbf{0} \\
&\Leftrightarrow (\mathbf{d}-\mathcal{M})\mathbf{N}=\mathbf{b} \\
&\Leftrightarrow \mathbf{N}^\star=(\mathbf{d}-\mathcal{M})^{-1}\mathbf{b}
\end{aligned}
$$
si, bien sur, $\mathbf{d}-\mathcal{M}$ (ou, de façon équivalente, $\mathcal{M}-\mathbf{d}$) est inversible.. L'est-elle ?


---

<div class="theorem">

$\mathcal{M}$ une matrice de mouvement et $D$ une matrice diagonale. Les résultats suivants sont vrais:
1. $s(\mathcal{M}+d\mathbb{I})=d$ pour tout $d\in\mathbb{R}$
2. $s(\mathcal{M}+D)\in\sigma(\mathcal{M}+D)$ et est associé à un vecteur propre $\mathbf{v}>\mathbf{0}$. Si, de plus, $\mathcal{M}$ est irréductible, alors $s(\mathcal{M}+D)$ a multiplicité 1 et est associé à $\mathbf{v}\gg\mathbf{0}$
3. $\mathsf{diag}(D)\gg\mathbf{0}$ $\implies$ $D-\mathcal{M}$ M-matrice non singulière et $(D-\mathcal{M})^{-1}>\mathbf{0}$
4. $\mathcal{M}$ irréductible et $\mathsf{diag}(D)>\mathbf{0}$ $\implies$ $D-\mathcal{M}$ M-matrice non singulière irréductible et $(D-\mathcal{M})^{-1}\gg\mathbf{0}$
</div>

<div style = "position: relative; bottom: -3%; font-size:20px;">

- JA, Bajeux \& Kirkland. [Number of source patches required for population persistence in a source-sink metapopulation with explicit movement](https://link.springer.com/epdf/10.1007/s11538-019-00593-1?author_access_token=EExdAOC94_0nwG8LMCIoG_e4RwlQNchNByi7wbcMAY6UprpSQ2NEwJhyTjNQrHljtlg8X5E8XM5_iLMsJpxIq750BJ9YXGT6yuMgh65TUuKDb_Z-g1pn0m6w5XILLO0RRY0pzrazec5gcY_GZHE85Q%3D%3D). *Bulletin of Mathematical Biology* **81**(6):1916-1942 (2019)
</div>



---

# Non-singularité de $\mathcal{M}-\mathbf{d}$

Utilisons une translation du spectre
$$
s(\mathcal{M}-\mathbf{d})=-\min_{p\in\mathcal{P}}d_p
$$
Ceci donne une contrainte: pour que la population totale se comporte bien (en général, on veut ça), il faut que tous les taux de mortalité soient strictement positifs

Supposons qu'ils le sont (en d'autres termes, supposons que $\mathbf{d}$ non-singulière). Alors $\mathcal{M}-\mathbf{d}$ non-singulière et $\mathbf{N}^\star=(\mathbf{d}-\mathcal{M})^{-1}\mathbf{b}$ unique

---

# <!--fit-->Comportement de la population totale<br/>Cas des mouvements égaux

$\mathbf{N}^\star=(\mathbf{d}-\mathcal{M})^{-1}\mathbf{b}$ attire les solutions de
$$
\mathbf{N}'=\mathbf{b}-\mathbf{d}\mathbf{N}+\mathcal{M}\mathbf{N}=:f(\mathbf{N})
$$

En effet, on a
$$
Df=\mathcal{M}-\mathbf{d}
$$

Puisqu'on suppose à présent que $\mathbf{d}$ non-singulière, on a (translation du spectre \& propriétés de $\mathcal{M}$) $s(\mathcal{M}-\mathbf{d})=-\min_{p\in\mathcal{P}}d_p<0$

$\mathcal{M}$ irréductible $\rightarrow$ $\mathbf{N}^\star\gg 0$ (pourvu que $\mathbf{b}>\mathbf{0}$, bien sur)

---

# <!--fit-->Comportement de la population totale<br>Mouvement réductible

<div class="theorem">

Supposons $\mathcal{M}$ réductible. Soit $a$ le nombre d'ensembles minimaux absorbants dans le graphe de connection associé $\mathcal{G}(\mathcal{M})$. Alors
1. L'abscisse spectrale $s(\mathcal{M})=0$ a multiplicité $a$
2. Associaté à $s(\mathcal{M})$ est un vecteur propre positif $\mathbf{v}$ t.q.
	- $v_i>0$ si $i$ est un nœud dans un ensemble minimal absorbant
	- $v_i=0$ si $i$ est un nœud transient (au sens Markov)
</div>

<div style = "position: relative; bottom: -5%; font-size:20px;">

De Foster & Jacquez, [Multiple zeros for eigenvalues and the multiplicity of traps of a linear compartmental system](https://doi.org/10.1016/0025-5564(75)90096-6), *Mathematical Biosciences* (1975)
</div>


---

# Le cas pas si sympa

Rappelons que
$$
\mathbf{N}'=\mathbf{b}-\mathbf{d}\mathbf{N}+\sum_{X\in\{S,L,I,R\}}\mathcal{M}^X\mathbf{X}
$$

Supposons que les taux de mouvement sont **similaires pour tous les compartiments**, i.e., la structure de zéros/non-zéros dans toutes les matrices est la même, mais les entrées non-nulles peuvent différer
Soient
$$
\underline{\mathcal{M}}=\left[\min_{X\in\{S,L,I,R\}}m_{Xpq}\right]_{pq,p\neq q}\qquad 
\underline{\mathcal{M}}=\left[\max_{X\in\{S,L,I,R\}}m_{Xpq}\right]_{pq,p=q}
$$
et
$$
\overline{\mathcal{M}}=\left[\max_{X\in\{S,L,I,R\}}m_{Xpq}\right]_{pq,p\neq q}\qquad
\overline{\mathcal{M}}=\left[\min_{X\in\{S,L,I,R\}}m_{Xpq}\right]_{pq,p=q}
$$

--- 

# Cool, non ? Non !

On a alors
$$
\mathbf{b}-\mathbf{d}\mathbf{N}+\underline{\mathcal{M}}\mathbf{N}\leq\mathbf{N}'\leq\mathbf{b}-\mathbf{d}\mathbf{N}+\overline{\mathcal{M}}\mathbf{N}
$$

Moi, tous les 6 mois: *Oooh, coooool, une inclusion différentielle linéaire !*

Moi, 10 minutes plus tard: *Quel con !* 

En effet, $\underline{\mathcal{M}}$ et $\overline{\mathcal{M}}$ **ne sont pas** des matrices de mouvement (en particulier, leurs sommes de colonnes ne sont pas toutes nulles)

Pas d'ouverture de ce côté là, donc.. 

Toutefois, *non lasciate ogne speranza*, on peut quand même faire des choses !

---

# L'équilibre sans maladie (ÉSM)

Supposons le système à l'équilibre et $L_p=I_p=0$ pour $p\in\mathcal{P}$. Alors $\Phi_p=0$ et 

$$
\begin{aligned}
0 &=b_p-d_pS_p+\nu_pR_p
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Spq}S_{q} \\
0 &=-\left(\nu_{p}+d_{p}\right)R_{p}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Rpq}R_{q}
\end{aligned}
$$
On veut résoudre pour $S_p,R_p$. Ici, il est crucial de se souvenir d'un peu d'algèbre linéaire. Écrivons le système en forme vectorielle:
$$
\begin{aligned}
\mathbf{0} &=\mathbf{b}-\mathbf{d}\mathbf{S}+\mathbf{\nu}\mathbf{R}+\mathcal{M}^S\mathbf{S} \\
\mathbf{0} &=-\left(\mathbf{\nu}+\mathbf{d}\right)\mathbf{R}+\mathcal{M}^R\mathbf{R}
\end{aligned}
$$
où $\mathbf{S},\mathbf{R},\mathbf{b}\in\mathbb{R}^{|\mathcal{P}|}$, $\mathbf{d},\mathbf{\nu},\mathcal{M}^S,\mathcal{M}^R$ $|\mathcal{P}|\times|\mathcal{P}|$-matrices, $\mathbf{d},\mathbf{\nu}$ diagonales


---

# $\mathbf{R}$ en l'ÉSM

Rappelons la seconde équation:
$$
\mathbf{0} =-\left(\mathbf{\nu}+\mathbf{d}\right)\mathbf{R}+\mathcal{M}^R\mathbf{R} \Leftrightarrow (\mathcal{M}^R-\mathbf{\nu}-\mathbf{d})\mathbf{R}=\mathbf{0}
$$

Donc on a une solution unique $\mathbf{R}=\mathbf{0}$ si $\mathcal{M}^R-\mathbf{\nu}-\mathbf{d}$ inversible. L'est-elle ?

Cela me rappelle quelque chose ! 

Par translation du spectre, $s(\mathcal{M}^R-\mathbf{\nu}-\mathbf{d})=-\min_{p\in\mathcal{P}}(\nu_p+d_p)<0$

Donc, étant donné $\mathbf{L}=\mathbf{I}=\mathbf{0}$, $\mathbf{R}=\mathbf{0}$ est l'unique équilibre et
$$
\lim_{t\to\infty}\mathbf{R}(t)=\mathbf{0}
$$

$\implies$ en l'ÉSM, $\mathbf{L}=\mathbf{I}=\mathbf{R}=\mathbf{0}$

---

# $\mathbf{S}$ en l'ÉSM

ÉSM a $\mathbf{L}=\mathbf{I}=\mathbf{R}=\mathbf{0}$ et $\mathbf{b}-\mathbf{d}\mathbf{S}+\mathcal{M}^S\mathbf{S}=\mathbf{0}$, i.e.,
$$
\mathbf{S}=(\mathbf{d}-\mathcal{M}^S)^{-1}\mathbf{b}
$$
Rappel: $-\mathcal{M}^S$ M-matrice singulière. En raisonnant comme avant, $\mathbf{d}-\mathcal{M}^S$ a son **module d'instabilité** translaté vers la droite de $\min_{p\in\mathcal{P}}d_p$. Donc:
- $\mathbf{d}-\mathcal{M}^S$ inversible
- $\mathbf{d}-\mathcal{M}^S$ M-matrice non-singulière

Second point $\implies$ $(\mathbf{d}-\mathcal{M}^S)^{-1}>\mathbf{0}$ $\implies$ $(\mathbf{d}-\mathcal{M}^S)^{-1}\mathbf{b}> \mathbf{0}$  (on aurait $\gg\mathbf{0}$ si $\mathcal{M}^S$ est irréductible)

Donc l'ÉSM a un sens, avec
$$
(\mathbf{S},\mathbf{L},\mathbf{I},\mathbf{R})=\left((\mathbf{d}-\mathcal{M}^S)^{-1}\mathbf{b},\mathbf{0},\mathbf{0},\mathbf{0}\right)
$$

---

# Calcul de $\mathcal{R}_0$

On utilise la matrice de prochaine génération avec $\Xi=\{L_1,\ldots,L_{|\mathcal{P}|},I_1,\ldots,I_{|\mathcal{P}|}\}$, $\Xi'=\mathcal{F}-\mathcal{V}$
$$
\mathcal{F}=\left(\Phi_1,\ldots,\Phi_{|\mathcal{P}|},0,\ldots,0\right)^T
$$
$$
\mathcal{V}=
\begin{pmatrix}
\left( \varepsilon_{1}+d_{1}\right)L_{1}
-\sum\limits_{q\in\mathcal{P}} m_{L1q}L_{q} \\
\vdots \\
\left( \varepsilon_{|\mathcal{P}|}+d_{|\mathcal{P}|}\right)L_{|\mathcal{P}|}
-\sum\limits_{q\in\mathcal{P}} m_{L|\mathcal{P}|q}L_{q} \\
-\varepsilon_1L_1+(\gamma_1+d_1)I_1
-\sum\limits_{q\in\mathcal{P}} m_{I1q}I_{q} \\
\vdots \\
-\varepsilon_{|\mathcal{P}|}L_{|\mathcal{P}|}
+(\gamma_{|\mathcal{P}|}+d_{|\mathcal{P}|})I_{|\mathcal{P}|}
-\sum\limits_{q\in\mathcal{P}} m_{I|\mathcal{P}|q}I_{q}
\end{pmatrix}
$$

---

Différentiation p.r. à $\Xi$:
$$
D\mathcal{F}
=
\begin{pmatrix}
\dfrac{\partial\Phi_1}{\partial L_1} & \cdots &
\dfrac{\partial\Phi_1}{\partial L_{|\mathcal{P}|}} & 
\dfrac{\partial\Phi_1}{\partial I_1} & \cdots &
\dfrac{\partial\Phi_1}{\partial I_{|\mathcal{P}|}} \\
\vdots & & \vdots & \vdots & & \vdots \\
\dfrac{\partial\Phi_{|\mathcal{P}|}}{\partial L_1} & \cdots &
\dfrac{\partial\Phi_{|\mathcal{P}|}}{\partial L_{|\mathcal{P}|}} & 
\dfrac{\partial\Phi_{|\mathcal{P}|}}{\partial I_1} & \cdots &
\dfrac{\partial\Phi_{|\mathcal{P}|}}{\partial I_{|\mathcal{P}|}} \\
0 & \cdots & 0 & 0 & \cdots & 0 \\
\vdots & & \vdots & \vdots & & \vdots \\
0 & \cdots & 0 & 0 & \cdots & 0
\end{pmatrix}
$$

---

Notons que
$$
\frac{\partial\Phi_p}{\partial L_k}=\frac{\partial\Phi_p}{\partial I_k}=0
$$
dès lors que $k\neq p$, donc
$$
D\mathcal{F}
=
\begin{pmatrix}
\mathsf{diag}\left(
\frac{\partial\Phi_1}{\partial L_1},\ldots,\frac{\partial\Phi_{|\mathcal{P}|}}{\partial L_{|\mathcal{P}|}}\right) &
\mathsf{diag}\left(
\frac{\partial\Phi_1}{\partial I_1},\ldots,\frac{\partial\Phi_{|\mathcal{P}|}}{\partial I_{|\mathcal{P}|}}\right) \\
\mathbf{0} & \mathbf{0} 
\end{pmatrix}
$$

---

# Évaluons $D\mathcal{F}$ en l'ÉSM

<style scoped>
@import url('https://unpkg.com/tailwindcss@^2/dist/utilities.min.css');
</style>

<div class="grid grid-cols-2 gap-4">
<div>

Si $\Phi_p=\beta_pS_pI_p$, alors
- $\dfrac{\partial\Phi_p}{\partial L_p}=0$
- $\dfrac{\partial\Phi_p}{\partial I_p}=\beta_pS_p$
</div>

<div>

Si $\Phi_p=\beta_p\dfrac{S_pI_p}{N_p}$, alors
- $\dfrac{\partial\Phi_p}{\partial L_p}=\beta_p\dfrac{S_pI_p}{N_p^2}=0$ en l'ÉSM
- $\dfrac{\partial\Phi_p}{\partial I_p}=\beta_p\dfrac{S_p}{N_p}$ en l'ÉSM
</div>
</div>

Dans les 2 cas, le bloc $\partial/\partial L$ est zéro, donc
$$
F=D\mathcal{F}(DFE)=
\begin{pmatrix}
\mathbf{0} & \mathsf{diag}\left(
\frac{\partial\Phi_1}{\partial I_1},\ldots,\frac{\partial\Phi_{|\mathcal{P}|}}{\partial I_{|\mathcal{P}|}}\right) \\
\mathbf{0} & \mathbf{0}
\end{pmatrix}
$$

---

# Calculons $D\mathcal{V}$ et évaluons en l'ÉSM

$$
V=
\begin{pmatrix}
\mathsf{diag}_p(\varepsilon_p+d_p)-\mathcal{M}^L & \mathbf{0} \\
-\mathsf{diag}_p(\varepsilon_p) & \mathsf{diag}_p(\gamma_p+d_p)-\mathcal{M}^I
\end{pmatrix}
$$
où $\mathsf{diag}_p(z_p)=\mathsf{diag}(z_1,\ldots,z_{|\mathcal{P}|})$. Inverse de $V$ facile (bloc triangulaire inférieure $2\times 2$):
$$
V^{-1}
=
\begin{pmatrix}
\left(\mathsf{diag}_p(\varepsilon_p+d_p)-\mathcal{M}^L\right)^{-1} & \mathbf{0} \\
\tilde V_{21}^{-1} & \left(\mathsf{diag}_p(\gamma_p+d_p)-\mathcal{M}^I\right)^{-1}
\end{pmatrix}
$$
où
$$
\tilde V_{21}^{-1}=
\left(\mathsf{diag}_p(\varepsilon_p+d_p)-\mathcal{M}^L\right)^{-1} 
\mathsf{diag}_p(\varepsilon_p)
\left(\mathsf{diag}_p(\gamma_p+d_p)-\mathcal{M}^I\right)^{-1}
$$


---
# $\mathcal{R}_0$ comme $\rho(FV^{-1})$

Matrice de prochaine génération
$$
FV^{-1}=
\begin{pmatrix}
\mathbf{0} & F_{12} \\
\mathbf{0} & \mathbf{0}
\end{pmatrix}
\begin{pmatrix}
\tilde V_{11}^{-1} & \mathbf{0} \\
\tilde V_{21}^{-1} & \tilde V_{22}^{-1}
\end{pmatrix}
=
\begin{pmatrix}
F_{12}\tilde V_{21}^{-1} & F_{12}\tilde V_{22}^{-1} \\
\mathbf{0} & \mathbf{0}
\end{pmatrix}
$$
où $\tilde V_{ij}^{-1}$ est le bloc $ij$ dans $V^{-1}$. Donc
$$
\mathcal{R}_0=\rho\left(F_{12}\tilde{V}_{21}^{-1}\right)
$$
i.e.,
$$
\begin{multline}
\mathcal{R}_0=\rho\Biggl(
\mathsf{diag}\left(
\frac{\partial\Phi_1}{\partial I_1},\ldots,\frac{\partial\Phi_{|\mathcal{P}|}}{\partial I_{|\mathcal{P}|}}\right)
\left(\mathsf{diag}_p(\varepsilon_p+d_p)-\mathcal{M}^L\right)^{-1} \\
\mathsf{diag}_p(\varepsilon_p)
\left(\mathsf{diag}_p(\gamma_p+d_p)-\mathcal{M}^I\right)^{-1}
\Biggr)
\end{multline}
$$


--- 

# <!--fit-->Stabilité asymptotique locale de l'ÉSM

<div class="theorem">

Définissons $\mathcal{R}_0$ pour le $|\mathcal{P}|$-SLIRS par
$$
\begin{multline}
\mathcal{R}_0=\rho\Biggl(
\mathsf{diag}\left(
\frac{\partial\Phi_1}{\partial I_1},\ldots,\frac{\partial\Phi_{|\mathcal{P}|}}{\partial I_{|\mathcal{P}|}}\right)
\left(\mathsf{diag}_p(\varepsilon_p+d_p)-\mathcal{M}^L\right)^{-1}  \\
\mathsf{diag}_p(\varepsilon_p)
\left(\mathsf{diag}_p(\gamma_p+d_p)-\mathcal{M}^I\right)^{-1}
\Biggr)
\end{multline}
$$
Alors l'ÉSM
$$
(\mathbf{S},\mathbf{L},\mathbf{I},\mathbf{R})=\left((\mathbf{d}-\mathcal{M}^S)^{-1}\mathbf{b},\mathbf{0},\mathbf{0},\mathbf{0}\right)
$$
est localement asymptotiquement stable si $\mathcal{R}_0<1$ et instable si $\mathcal{R}_0>1$
</div>

<div style = "position: relative; bottom: -8%; font-size:20px;">

De PvdD & Watmough, [Reproduction numbers and sub-threshold endemic equilibria for compartmental models of disease transmission](https://doi.org/10.1016/S0025-5564(02)00108-6), *Bulletin of Mathematical Biology* **180**(1-2): 29-48 (2002)
</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--- fit --->$\mathcal{R}_0$ n'est pas la panacée 

# <!--- fit --->Un centre urbain et des villes satellites

<div style = "position: relative; bottom: -30%; font-size:20px;">

JA & S Portet. [Epidemiological implications of mobility between a large urban centre and smaller satellite cities](https://server.math.umanitoba.ca/~jarino/papers/ArinoPortet-2015-JMB71.pdf). *Journal of Mathematical Biology* **71**(5):1243-1265 (2015)
</div>

---

# <!--fit-->Contexte de l'étude

Winnipeg centre urbain, 3 villes satellites plus petites: Portage la Prairie, Selkirk et Steinbach

- densité de population basse à très basse hors de Winnipeg
- Réseau routier du MB bien étudié par MB Infrastructure Traffic Engineering Branch

![bg right:57%](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/spatial/MB_highways.png)

---

# Quantités connues et estimées

| Ville | Pop. (2014) | Pop. (2022) | Dist. | # moyen voyages/jour |
|:------:|:------|:-------|:------|:------|
| Winnipeg (W) | 663,617 | 749,607 | - | - |
| Portage la Prairie (1) | 12,996 | 13,270 | 88 | 4,115 |
| Selkirk (2) | 9,834 | 10,504 | 34 | 7,983 |
| Steinbach (3) | 13,524 | 17,806 | 66 | 7,505 |

---

![bg contain 95%](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/satellite_cities/SIR_flow_diagram_UrbanCentre_Satellite.png)

---

# Estimation des taux de mouvement

Supposons que $m_{yx}$ est taux de mouvement de la ville $x$ à la ville $y$. *Ceteris paribus*, $N_x'=-m_{yx}N_x$, donc $N_x(t)=N_x(0)e^{-m_{yx}t}$. Donc, après 1 jour, $N_x(1)=N_x(0)e^{-m_{yx}}$, i.e.,
$$
m_{yx}=-\ln\left(\frac{N_x(1)}{N_x(0)}\right)
$$
Maintenant, $N_x(1)=N_x(0)-T_{yx}$, où $T_{yx}$ le nombre d'individus allant de $x$ à $y$ / jour. Donc
$$
m_{yx}=-\ln\left(1-\frac{T_{yx}}{N_x(0)}\right)
$$
On calcule ça pour toutes les paires $(W,i)$ et $(i,W)$ de villes


---

# <!--fit-->Sensitivité de $\mathcal{R}_0$ aux variations de $\mathcal{R}_0^x\in[0.5,3]$

![width:800px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/satellite_cities/sensitivity_4cities.png)
*with disease*: $\mathcal{R}_0^x=1.5$; *without disease*: $\mathcal{R}_0^x=0.5$. Chaque boite et moustaches correspondantes sont 10,000 simulations


---

# <!--fit-->Une connectivité basse peut contrôler $\mathcal{R}_0$

PLP et Steinbach ont des populations comparables mais avec les paramètres utilisés, seul PLP peut induire des valeurs du $\mathcal{R}_0$ général supérieures à 1 quand $\mathcal{R}_0^W<1$

Ceci est dû aux taux de mouvement: si $\mathcal{M}=0$, alors
$$
\mathcal{R}_0=\max\{\mathcal{R}_0^W,\mathcal{R}_0^1,\mathcal{R}_0^2,\mathcal{R}_0^3\},
$$
puisque $FV^{-1}$ est alors bloc diagonale

Les taux de mouvement vers et depuis PLP sont plus bas $\rightarrow$ situation plus proche du découplage et $\mathcal{R}_0^1$ a un impact plus important sur le $\mathcal{R}_0$ général

---

# $\mathcal{R}_0$ ne raconte pas toute l'histoire !

![width:390px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/satellite_cities/invasion_WPG_from_satellites_R01_m_caseR0W05_R0.png) ![width:390px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/satellite_cities/invasion_WPG_from_satellites_R01_m_caseR0W05_attackRate.png)
Graphiques fonctions de $\mathcal{R}_0^1$ à PLP et de la réduction du mouvement entre Winnipeg et PLP. Gauche: $\mathcal{R}_0$ général. Droite: taux d'attaque à Winnipeg


---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--- fit --->Problèmes spécifiques aux métapopulations

---

# <!--fit-->Propriétés dynamiques héritées (a.k.a. je suis flemmard)

Soit
$$
\begin{aligned}
s_{kp}' &= f_{kp}(S_p,I_p) \\
i_{\ell p}' &= g_{\ell p}(S_p,I_p)
\end{aligned}
$$
avec des propriétés dynamiques connues, que sait-on de des propriétés de
$$
\begin{aligned}
s_{kp}' &= f_{kp}(S_p,I_p)+\textstyle{\sum_{q\in\mathcal{P}}} m_{kpq}s_{kq} \\
i_{\ell p}' &= g_{\ell p}(S_p,I_p)+\textstyle{\sum_{q\in\mathcal{P}}} m_{\ell pq}i_{\ell q}
\qquad ?
\end{aligned}
$$

- Existence et unicité $\checkmark$
- Invariance de $\mathbb{R}_+^\bullet$ sous le flot $\checkmark$
- Bornitude $\checkmark$
- Localisation des $\mathcal{R}_{0i}$ individuels et du $\mathcal{R}_0$ général ?
- SAG ?

---

# <!--fit-->Un problème d'héritage - Bifurcations à revers

- Supposons un modèle qui, lorsqu'il est isolé dans un patch unique, voit une bifurcation à revers
- Donc le modèle admet des équilibres endémiques sous-critiques
- Que se passe-t-il lorsque l'on couple plusieurs telles unités ensemble dans une métapopulation ?


*OUI*, coupler ensemble des unités sujettes à une bifurcation à revers peut conduire à un système qui exhibe une bifurcation à revers

<div style = "position: relative; bottom: -10%; font-size:20px;">

JA, Ducrot & Zongo. [A metapopulation model for malaria with transmission-blocking partial immunity in hosts](https://server.math.umanitoba.ca/~jarino/papers/ArinoDucrotZongo-2011-JMB.pdf). *Journal of Mathematical Biology* **64**(3):423-448 (2012) 
</div>


---

# <!--fit-->Comportements induits par les métapopulations

Problème "complémentaire" du problème d'héritage. Soit
$$
\begin{aligned}
s_{kp}' &= f_{kp}(S_p,I_p) \\
i_{\ell p}' &= g_{\ell p}(S_p,I_p)
\end{aligned}
$$
avec des propriétés connues. Est-ce que
$$
\begin{aligned}
s_{kp}' &= f_{kp}(S_p,I_p)+\textstyle{\sum_{q\in\mathcal{P}}} m_{kpq}s_{kq} \\
i_{\ell p}' &= g_{\ell p}(S_p,I_p)+\textstyle{\sum_{q\in\mathcal{P}}} m_{\ell pq}i_{\ell q}
\end{aligned}
$$
peut exhiber des comportements pas observés dans le unités du système non couplé ?

E.g.: les unités ont un comportement 
$$
\{
  \mathcal{R}_0<1\implies\text{ ÉSM GAS},\ \mathcal{R}_0>1\implies 1 \text{ ÉÉ GAS}
\}
$$
tandis que la métapopulation a des solutions périodiques

---

# <!--fit-->Comportements induits - Équilibres mixtes

Peut-il y avoir des situations dans lesquelles certains patchs sont en l'ÉSM tandis que d'autres sont en un ÉÉ ?

Ceci est le problème des **équilibres mixtes**

---

# Types d'équilibres (niveau patch)

<div class="definition">

Un patch $p\in\mathcal{P}$ à l'équilibre est **vide** si $X_p^\star=0$, à l'**équilibre sans maladie** si $X_p^\star=(s_{k_1p}^\star,\ldots,s_{k_up}^\star,0,\ldots,0)$, où $k_1,\ldots,k_u$ sont des indices avec $1\leq u\leq|\mathcal{U}|$ et $s_{k_1p}^\star,\ldots,s_{k_up}^\star$ sont strictement positifs, et à un **équilibre endémique** si $X_p\gg 0$
</div>

---

# <!--fit-->Types d'équilibres (niveau métapopulation)

<p style="margin-bottom:1cm;"></p> 

<div class="definition">

Un **équilibre de métapopulation sans population** corresponds à un équilibre où tous les patchs sont vides. Un **équilibre de métapopulation sans maladie** a tous les patchs en un ÉSM impliquant les mêmes compartiments pour tous les patchs. Un **équilibre de métapopulation endémique** a tous les patchs à un équilibre endémique
</div>

--- 

# Équilibres mixtes

<div class="definition">

Un **équilibre mixte** est un équilibre de métapopulation t.q.
- tous les patchs sont à un ÉSM mais le système n'est pas à un ÉSM de métapopulation
- ou il y a au moins 2 patchs qui sont à un équilibre de type différent (vide, ÉSM ou ÉÉ)
</div>

<p style="margin-bottom:1cm;"></p> 

E.g., 
$$
((S_1,I_1,R_1),(S_2,I_2,R_2))=((+,0,0),(+,+,+))
$$
est mixte, de même que
$$
((S_1,I_1,R_1),(S_2,I_2,R_2))=((+,0,0),(+,0,+))
$$


---

<div class="theorem">

Supposons que le mouvement soit similaire pour tous les compartiments (MSTC) et que le système soit à l'équilibre

- Si le patch $p\in\mathcal{P}$ est vide, tous les patchs dans $\mathcal{A}(p)$ (ancêtres de $p$) sont également vides
- Si le patch $p\in\mathcal{P}$ est en un ÉSM, alors le sous-système consistant de tous les patchs dans $\{p,\mathcal{A}(p)\}$ est en un ÉSM de métapopulation
- Si le patch $p\in\mathcal{P}$ est en un ÉÉ, alors tous les patchs dans $\mathcal{D}(p)$ (descendants de $p$) sont aussi en un ÉÉ
- Si $\mathcal{G}^c$ est fortement connexe pour un compartiment $c\in\mathcal{C}$, alors il n'existe pas d'équilibres mixtes
</div>

<p style="margin-bottom:1cm;"></p> 

Notons que MSTC $\implies$ $\mathcal{A}^c=\mathcal{A}$ et $\mathcal{D}^c=\mathcal{D}$ pour tout $c\in\mathcal{C}$

---

# Problèmes intéressants (AMHA)

Il faut faire plus sur le problème de l'héritage, et en particulier la SAG (Li, Shuai, Kamgang, Sallet, et des choses plus anciennes: Michel & Miller, Šiljak)

Incorporer des temps de voyage (retard) et des événements (infection, guérison, mort) pendant le voyage

Quelle est la complexité minimale des fonctions de mouvement $m$ ci-dessous 
$$
\begin{aligned}
s_{kp}' &= f_{kp}(S_p,I_p)+\textstyle{\sum_{q\in\mathcal{P}}} m_{kpq}(S,I)s_{kq} \\
i_{\ell p}' &= g_{\ell p}(S_p,I_p)+\textstyle{\sum_{q\in\mathcal{P}}} m_{\ell pq}(S,I)i_{\ell q}
\end{aligned}
$$
requise pour observer des comportements induits par la structure de métapopulation ?


---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Investigation computationnelle</br> des grands systèmes

<div style = "position: relative; bottom: -30%; font-size:20px;">

- JA. [Spatio-temporal spread of infectious pathogens of humans](https://doi.org/10.1016/j.idm.2017.05.001). *Infectious Disease Modelling* **2**(2):218-228 (2017)
- JA. [Mathematical epidemiology in a data-rich world](https://doi.org/10.1016/j.idm.2019.12.008). *Infectious Disease Modelling* **5**:161-188 (2020)
- github repo [modelling-with-data](https://github.com/julien-arino/modelling-with-data)

</div>

---

# Pas très compliqué

- Comme pour l'analyse mathématique ([Cours 12](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-12-modeles-metapopulation.html)), si l'on procède avec attention et que l'on réfléchit un peu, ça n'est pas trop compliqué
- Enfin, pas plus dur que dans le cas de la basse dimension
- Important de prendre avantage de la structure vectorielle

---

# Définissons le champ de vecteurs

```R
SLIAR_metapop_rhs <- function(t, x, p) {
  with(as.list(x), {
    S = x[p$idx_S]
    L = x[p$idx_L]
    I = x[p$idx_I]
    A = x[p$idx_A]
    R = x[p$idx_R]
    N = S + L + I + A + R
    Phi = p$beta * S * (I + p$eta * A)
    dS = S - Phi + p$M %*% S
    dL = Phi - p$epsilon * L + p$M %*% L
    dI = (1 - p$pi) * p$epsilon * L - p$gammaI * I + p$M %*% I
    dA = p$pi * p$epsilon * L - p$gammaA * A + p$M %*% A
    dR = p$gammaI * I + p$gammaA * A + p$M %*% R
    list(c(dS, dL, dI, dA, dR))
  })
}
```

---

# Mise en place des paramètres

```R
pop = c(34.017, 1348.932, 1224.614, 173.593, 93.261) * 1e+06
countries = c("Canada", "China", "India", "Pakistan", "Philippines")
T = matrix(data = 
             c(0, 1268, 900, 489, 200, 
               1274, 0, 678, 859, 150, 
               985, 703, 0, 148, 58, 
               515, 893, 144, 0, 9, 
               209, 174, 90, 2, 0), 
           nrow = 5, ncol = 5, byrow = TRUE)
```

---

# Calculons la matrice de mouvement

```R
p = list()
# Use the approximation explained in Arino & Portet (JMB 2015)
p$M = mat.or.vec(nr = dim(T)[1], nc = dim(T)[2])
for (from in 1:5) {
  for (to in 1:5) {
    p$M[to, from] = -log(1 - T[from, to]/pop[from])
  }
  p$M[from, from] = 0
}
p$M = p$M - diag(colSums(p$M))
```

---

```R
p$P = dim(p$M)[1]
p$idx_S = 1:p$P
p$idx_L = (p$P + 1):(2 * p$P)
p$idx_I = (2 * p$P + 1):(3 * p$P)
p$idx_A = (3 * p$P + 1):(4 * p$P)
p$idx_R = (4 * p$P + 1):(5 * p$P)
p$eta = rep(0.3, p$P)
p$epsilon = rep((1/1.5), p$P)
p$pi = rep(0.7, p$P)
p$gammaI = rep((1/5), p$P)
p$gammaA = rep((1/3), p$P)
# The desired values for R_0. Here we take something simple
R_0 = rep(1.5, p$P)
```

---

# Définissons les conditions initiales

```R
# On fixe les conditions initiales
# Par exemple, 2 infectieux au Canada
L0 = mat.or.vec(p$P, 1)
I0 = mat.or.vec(p$P, 1)
A0 = mat.or.vec(p$P, 1)
R0 = mat.or.vec(p$P, 1)
I0[1] = 2
S0 = pop - (L0 + I0 + A0 + R0)
# Vecteur de conditions initiales à passer au solveur
IC = c(S = S0, L = L0, I = I0, A = A0, R = R0)
# Instants auxquels renvoyer une solution 
# Tous les 0.1 jours pour 5 ans ici
tspan = seq(from = 0, to = 5 * 365.25, by = 0.1)
```

---

# On choisit $\beta$ pour éviter une explosion

On prend $\mathcal{R}_0=1.5$ pour les patchs quand ils sont isolés. Pour cela, on résoud $\mathcal{R}_0$ en fonction de $\beta$ 
$$
\beta=\frac{\mathcal{R}_0}{S(0)}
\left(
\frac{1-\pi_p}{\gamma_{Ip}}
+\frac{\pi_p\eta_p}{\gamma_{Ap}}
\right)^{-1}
$$ 

<p style="margin-bottom:2cm;"></p> 

```R
for (i in 1:p$P) {
  p$beta[i] = 
    R_0[i] / S0[i] / ((1 - p$pi[i])/p$gammaI[i] + p$pi[i] * p$eta[i]/p$gammaA[i])
}
```

---

# Et maintenant les problèmes commencent..

```R
# On appelle le solveur
sol <- deSolve::ode(y = IC, times = tspan, 
                    func = SLIAR_metapop_rhs, parms = p)
## DLSODA- At current T (=R1), MXSTEP (=I1) steps
## taken on this call before reaching TOUT
## In above message, I1 = 5000
##
## In above message, R1 = 117.498
```

La sortie au dessus indique un problème numérique lors de l'intégration. Le problème vient certainement de la différence de taille entre les pays, en particulier le Canada et la Chine

Il faut jouer avec les taux de mouvement et les conditions initiales. Je n'explique pas ici

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--- fit --->Épilogue

---

- L'espace est une composante fondamentale du processus de propagation épidémique et **ne peut pas** être ignoré, dans les modèles **et** dans les décisions de santé publique

- Une des façons de modéliser l'espace est en utilisant des modèles en métapopulation

- Les modèles en métapopulation sont faciles à analyser localement et donnent des résultats intéressants au niveau global

- Les simulations déterministes peuvent être couteuses en RAM et en CPU mais sont faciles

- Les modèles en métapopulation ne sont pas la seule solution, loin de là !!!