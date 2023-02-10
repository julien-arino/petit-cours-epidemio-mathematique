---
marp: true
title: Petit cours d'épidémiologie mathématique - Plus de modélisation
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 11 - Plus de modélisation
theme: default
paginate: false
math: mathjax
size: 4:3
---

<style>
  section {
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
  }
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
# <!--fit-->Petit cours d'épidémiologie mathématique<br/>Plus de modélisation

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/github-icon.png)](https://github.com/julien-arino)

Department of Mathematics & Data Science Nexus
University of Manitoba*

<div style = "font-size:18px; margin-top:-10px; padding-bottom:30px;"></div>

Centre canadien de modélisation des maladies (CCDM/CCMM)
NSERC-PHAC EID Modelling Consortium (CANMOD, MfPH, OMNI/RÉUNIS)

<div style = "text-align: justify; position: relative; bottom: -5%; font-size:25px;">
* The University of Manitoba campuses are located on original lands of Anishinaabeg, Cree, Oji-Cree, Dakota and Dene peoples, and on the homeland of the Métis Nation.</div>

<style>
img[alt~="center"] {
  display: block;
  margin: 0 auto;
}
</style>

---

<!-- _backgroundImage: "radial-gradient(white,80%,#f1c40f)" -->
# Plan de ce cours

- Un "problème" avec la méthode de l'opérateur de prochaine génération
- Modèle de tuberculose (TB) avec comportement non-trivial à l'origine
- SIRS avec population non constante
- États bistables

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# Un "problème" avec la méthode de l'opérateur de prochaine génération

### (Modèle de malaria avec vecteurs transgéniques)

<div style = "position: relative; bottom: -35%; font-size:20px;">

JA, Bowman, Gumel & Portet. [Effect of pathogen-resistant vectors on the transmission dynamics of a vector-borne disease](http://dx.doi.org/10.1080/17513750701605614). *Journal of Biological Dynamics* **1**:320-346 (2007)
</div>

---

# Avant-propos

- Ceci n'est pas un problème avec la méthode elle-même, mais une illustration de la raison pour laquelle il est important de vérifier les conditions d'applicabilité (A1)-(A5) quand on utilise la méthode de  [PvdD & Watmough (2002)](https://doi.org/10.1016/S0025-5564(02)00108-6)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/flow_diagram_transgenic_mosquitoes.jpg)

---


# Hypothèses sur les moustiques (vecteurs)

- **H1** Les vecteurs résistants sont complètement immuns au pathogène
- **H2-a**  Une proportion $p_1$ de la progéniture résultant de la reproduction d'un parent sauvage et d'un parent resistant sont résistants au pathogène
- **H2-b**  Une proportion $p_2$ de la progéniture résultant de la reprpduction de deux parents résistants sont résistants
- **H3** En absence de maladie, les vecteurs sauvages sont mieux adaptés à la compétition que les vecteurs résistants
- **H4** Les vecteurs sauvages sont moins adaptés à la compétition lorsqu'ils sont infectés par le parasite

---

# Le modèle

$$
\begin{align}
S' &= B_W(S,I,T) - (d_W+\kappa_SV)S-f_V \\
I' &= f_V-(d_W+\delta_W+\kappa_IV)I \\
T' &= B_T(S,I,T)-(d_T+\kappa_TV)T \\
S_H' &= \Pi+\nu R_H-f_H-d_HS_H \\
I_H' &= f_H-(d_H+\delta_H+\gamma)I_H \\
R_H' &= \gamma I_H-(d_H+\nu)R_H
\end{align}
$$

- $f_V,f_H\in C^1$
- $f_V,f_H\geq 0$
- $f_V=0$ si $S=0$ ou $I_H=0$
- $f_H=0$ si $S_H=0$ ou $I=0$

---

# Coexistence des vecteurs

- Est-ce que les vecteurs sauvages peuvent coexister avec les vecteurs transgéniques?

$$
\begin{align}
S' &= \frac{\alpha_1}{2}S+(1-p_2)\frac{\alpha_3}{2}T
+(1-p_1)\alpha_5\frac{ST}{S+T}
-(d_W+\kappa_S(S+T))S \\
T' &= p_2\frac{\alpha_3}{2}T
+p_1\alpha_5\frac{ST}{S+T}
-(d_T+\kappa_T(S+T))T
\end{align}
$$

Fitness (il suit d'hypothèses non détaillées que $\mathbb{F}_S\geq\mathbb{F}_T$):
$$
\mathbb{F}_S=
\frac{\alpha_1-2d_W}{2\kappa_S}
\quad\textrm{and}\quad
\mathbb{F}_T=
\frac{p_2\alpha_3-2d_T}{2\kappa_T}
$$

On trouve 2 équilibres frontière $\bar E_0=(S,T)=(0,0)$ et $\bar E_W=(S,T)=(\mathbb{F}_S,0)$ et un équilibre de coexistence $\bar E_C$. En absence de perte de résistance chez la progéniture de deux parents résistants ($p_2=1$), il y a un autre equilibre frontière $\bar E_T=(0,\mathbb{F}_T)$

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/transgenic_mosquitoes_stability_regions.jpg)

---

# Là où le problème a lieu

Il y a jusqu'à 4 équilibres pour les vecteurs, qui sont indépendants de la population hôte lorsque la maladie est absente

$\implies$ le système couplé avec vecteurs *et* hôtes a jusqu'à 4 ESM

On peut utiliser la méthode de [PvdD & Watmough (2002)](https://doi.org/10.1016/S0025-5564(02)00108-6) en chacun de ces ESM pour déduire les propriétés de stabilité locale de ces ESM

En $\bar E_0$, on trouve $\mathcal{R}_0=0$, ce qui n'a pas de sens. Qu'est-ce qui cloche?

---

Problème avec (A5): si on calcule la Jacobienne du système en $(S,T)$ et qu'on évalue en $\bar E_0$, on trouve les valeurs propres $\lambda_1=\kappa_S\mathbb{F}_S>0$ et $\lambda_2=\kappa_T\mathbb{F}_T$, donc $\bar E_0$ est toujours instable 

$\implies$ (A5) ne peut jamais être satisfaite en $\bar E_0$ et la condition pour la SAL donnée par [PvdD & Watmough (2002)](https://doi.org/10.1016/S0025-5564(02)00108-6) n'est pas utilisable

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# Modèle de tuberculose (TB) avec comportement non-trivial à l'origine


## (Modèle avec recrutement compliqué)

<div style = "position: relative; bottom: -35%; font-size:20px;">

McCluskey & PvdD. [Global Analysis of Two Tuberculosis Models](https://doi.org/10.1023/B:JODY.0000041283.66784.3e). *Journal of Dynamics and Differential Equations* **16**:139–166 (2004)
</div>

---

# Modèle démographique

En absence de maladie, supposons que la population totale est gouvernée par
$$
N'=B(N)-dN
$$
où $B(N)$ satisfait

- $\exists$ $N_0>0$ unique t.q. $B(N_0)-dN_0=0$
- $B'(N)<B(N)/N$ pour $N\in ]0,N_0]$
- $b_0:=\lim_{N\to 0^+}B(N)/N >d$, où $b_0\in\overline{\mathbb{R}}$

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/SEI_TB.png)

---

Puisque $N=S+E+I$, on écrit le modèle en utilisant $N$, $E$ et $I$ as
$$
\begin{align}
N' &= B(N)-dN-\delta I \tag{1a}\label{sys:SEI_TB_dN}\\
E' &= c\beta\frac{(N-E-I)I}{N}-(\varepsilon+\rho_1+d)E \tag{1b}\label{sys:SEI_TB_dE}\\
I' &= \varepsilon E-(\rho_2+\delta+d)I \tag{1c}\label{sys:SEI_TB_dI}
\end{align}
$$

---

Le problème ici est en l'ESM: on peut avoir des solutions limitant en $(0,0,0)$. Considérons le système en proportions
$$
\begin{align}
N' &= \left(\frac{B(N)}{N}-d-\delta i\right)N \tag{2a}\label{sys:SEI_TB_prop_dN} \\
e' &=
c\beta(1-e-i)i-\left(\varepsilon+\rho_1+\frac{B(N)}{N}+di\right)e  \tag{2a}\label{sys:SEI_TB_prop_de} \\
i' &= \varepsilon e-\left(\delta+\rho_2+\frac{B(N)}{N}+\delta
  i\right)i \tag{2a}\label{sys:SEI_TB_prop_di} 
\end{align}
$$
Étendons le système en $\{N=0\}$ en remplaçant $\left.\frac{B(N)}{N}\right|_{N=0}$ par $b_0$ (3ème hypothèse sur $B$)

---

Région d'intérêt biologiquement est l'ensemble compact positivement invariant
$$
\mathcal{B}=\{(N,e,i)\in\mathbb{R}^3_+: N\leq N_0,e+i\leq 1\}
$$
Si $b_0=\infty$ ($B(N)=\Lambda$ constant), $N=0$ est instable, donc on le considère fini désormais

Deux équilibres avec $N=0$:
 
- $A_0=(0,0,0)$
- $A_*=(0,e_*,i_*)$, avec $e_*,i_*>0$

Donc, en $A_*$, la population s'éteint, mais de façon "controllée"

---

Soit
$$
\mathcal{R}_0=\frac{c\beta\varepsilon}
{(\delta+\rho_2+d)(\varepsilon+\rho_1+d)}
$$
$$
\mathcal{R}_1=\frac{c\beta\varepsilon}
{(\delta+\rho_2+b_0)(\varepsilon+\rho_1+b_0)}
$$
et, si $\mathcal{R}_0>1$,
$$
\mathcal{R}_2=\frac{b_0}{d+\delta i_*}
$$

---

# Équilibres

$X_0=(N_0,0,0)$, $X_*=(N_*,E_*,I_*)$ (unique)

| | $A_0$ | $X_0$ | $A_*$ | $X_*$ |
|:---|:---:|:---:|:---:|:---:|
| $\mathcal{R}_0<1$ | instable | LAS | | |
| $\mathcal{R}_2<1<\mathcal{R}_0,\mathcal{R}_1$ | instable | instable | LAS | |
| $\mathcal{R}_1<1<\mathcal{R}_0,\mathcal{R}_2$ | instable | instable | | LAS |
| $1<\mathcal{R}_0,\mathcal{R}_1,\mathcal{R}_2$ | instable | instable | instable | LAS |

---

# Résultats globaux

<div class="theorem">

L'équilibre $A_0=(0,0,0)$ n'est jamais un point oméga-limite d'une solution de $\eqref{sys:SEI_TB_prop_dN}$-$\eqref{sys:SEI_TB_prop_di}$ avec condition initiale t.q. $N>0$, $e,i\geq 0$ et $e+i\leq 1$
</div>

<div class="theorem">

Si $\mathcal{R}_1<1$, alors $(0,0,0)$ n'est pas un point oméga-limite d'une solution de $\eqref{sys:SEI_TB_dN}$-$\eqref{sys:SEI_TB_dI}$ avec condition initiale dans $\mathbb{R}^3_+\setminus\{(0,0,0)\}$
</div>

<div class="theorem">

Pour le système $\eqref{sys:SEI_TB_dN}$-$\eqref{sys:SEI_TB_dI}$, si $\mathcal{R}_0\leq 1$ alors $X_0=(N_0,0,0)$ est GAS
</div>

Dans le cas $\mathcal{R}_0,\mathcal{R}_2>1$, la SAG de $X_*$ est établie dans des conditions "ésotériques"..

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->SIRS avec population non constante

# (Des solutions périodiques)

<div style = "position: relative; bottom: -35%; font-size:20px;">

Liu, Levin & Iwasa. [Influence of nonlinear incidence rates upon the behavior of SIRS epidemiological models](https://doi.org/10.1007/BF00276956). J. Math. Biology **23** (1986)

</div>

---

# Contexte général

Modèle SIRS de la forme

$$
\begin{align*}
S' &= B(N)-dS-f(S,I)I+\nu R \\
I' &= f(S,I)I-(d+\gamma)I \\
R' &= \gamma I-(d+\nu)R
\end{align*}
$$

$f$ différentiable et t.q. $f(0,I)=0$ pour tout $I$ et $\partial f/\partial S>0$

Supposent que la composante démographique du système 
$$
N'=B(N)-dN
$$
admet un équilibre stable $N_0$ t.q. $N_0=dN_0$

Puisque $N$ converge, ils réduisent ensuite la dimension

---

# Cas d'une incidence $f(S,I)=\beta I^{p-1}S^q$

Ils établissent des conditions génériques conduisant à l'existence d'une bifurcation de Hopf, puis considèrent le système lorsque l'incidence est de la forme
$$
f(S,I)=\beta I^{p-1}S^q
$$

## Exemple $p=2$ et $q=1$

Après quelques transformations, obtiennent le système
$$
\begin{align}
I' &= aI^2S - I, \tag{9"} \\
R' &= r(I - R/h)  \tag{10"}
\end{align} 
$$

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/LiuLevinIwasa_p10.png)


---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# États bistables

### (Conséquences indésirées de la vaccination)

<div style = "position: relative; bottom: -35%; font-size:20px;">

Arino, McCluskey & PvdD. [Global results for an epidemic model with vaccination that exhibits backward bifurcation](http://dx.doi.org/10.1137/S0036139902413829). SIAM J Applied Math (2003)

</div>

---

# Un autre modèle SIRS avec vaccination

![width:1000px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/SIRV_newborns.png)

---

# Modèle SIRSV

$$
\begin{align}
S' &= (1-\alpha)dN-dS-\beta\frac{SI}{N}-\phi S+\theta
V+\nu R \qquad\qquad\\
I' &= \beta\frac{SI}{N}
+\sigma\beta\frac{VI}{N} -(d+\gamma)I \\
R' &= \gamma I-(d+\nu)R \\
V' &= \alpha dN+\phi S-(d+\theta)V
-\sigma\beta\frac{VI}{N} 
\end{align}
$$

- $\alpha$ proportion des nouveaux nés vaccinés
- $\phi$ taux de vaccination des susceptibles
- $\theta$ taux de perte de l'efficacité vaccinale
- $1-\sigma$ efficacité vaccinale


---

Puisque la population totale est constante, le système en proportions s'écrit
$$
\begin{align}
S' &= (1-\alpha)d-dS-\beta SI-\phi S+\theta
(1-S-I-R)+\nu R \qquad \tag{14a} \label{sys:vacc_3dS} \\
I' &= \beta SI
+\sigma\beta(1-S-I-R)I -(d+\gamma)I \tag{14b}\label{sys:vacc_3dI}\\
R' &= \gamma I-(d+\nu)R \tag{14c}\label{sys:vacc_3dR} \\
V &= 1-(S+I+R)
\end{align}
$$
où $S$, $I$, $R$, $V$ sont les proportions d'individus qui sont susceptibles, infectieux, guéris et vaccinés, respectivement

---

# Équilibres et bifurcations

Le système $\eqref{sys:vacc_3dS}$-$\eqref{sys:vacc_3dR}$ a toujours l'ESM
$$
(S,I,R,V)=\left(
\frac{\theta+d(1-\alpha)}{d+\theta+\phi},0,0,
\frac{\phi+d\alpha}{d+\theta+\phi}
\right)
$$

On considère maintenant le ou les équilibre(s) endémique(s) où $I=I^\star >0$

Quand le vaccin est 100% efficace ($\sigma=0$), il y a *au plus* un équilibre endémique. On suppose dorénavant que $0<\sigma<1$, i.e., le vaccin n'est pas 100% efficace (réaliste)

---

# Existence d'équilibres endémiques

L'existence d'ÉÉ est déterminé par le nombre de racine positives du polynôme
$$
P(I)=AI^2+BI+C
$$
où
$$
A=-\sigma\beta^2\frac{d+\nu+\gamma}{d+\nu}<0
$$
$$
B=\sigma\beta^2-\beta(d+\theta+\sigma(d+\gamma+\phi))
-\frac{\beta\gamma}{d+\nu}(d+\theta+\sigma\phi)
$$
$$
C=(d+\theta+\sigma\phi-d\alpha(1-\sigma))\beta
-(d+\gamma)(d+\theta+\phi)
$$

---

# Cas d'une bifurcation *à l'endroit*

![width:390px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/PI_vs_I_forward.png) ![width:390px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/SIRV_bif_forward.png)


---

# Cas d'une bifurcation *à revers*

![width:390px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/PI_vs_I_backward.png)  ![width:390px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/SIRV_bif_backward.png)

---

# Région de bistabilité
 
- Concavité de la courbe déterminée (puisque $A<0$), donc un condition nécessaire pour l'existence de 2 équilibres endémiques est: 
  - $P'(0)=B>0$ et $P(0)=C<0$
  - Les racines de $P(I)$ doivent être réelles

$\implies$ région de bistabilité est $\Delta=B^2-4AC\geq 0$, $B>0$ et $C<0$

---

# Bifurcation dans le plan $(\sigma,\phi)$

![width:800px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/bif_sigma_vs_phi.png)

---

# ÉÉ

S'il y a de telles solutions $I^\star$ à $P(I)=0$ (potentiellement une racine double), ÉÉ de $\eqref{sys:SIR_vacc_AMV}$ sont $(S,I,R,V)=$

$$
\left(
\frac{(1-\alpha)d+\frac{(\nu-\theta)\gamma
    I^\star }{d+\nu}+(1-I^\star )\theta}{d+\beta
  I^\star +\phi+\theta},I^\star ,\frac{\gamma
  I^\star }{d+\nu},1-S^\star -I^\star -R^\star  
\right)
$$

---

# $\mathcal{R}_0$

En utilisant la méthode de la matrice de prochaine génération, le nombre de reproduction avec vaccination est

$$
\mathcal{R}_\phi=\mathcal{R}_0
\frac{d+\theta+\sigma\phi-d\alpha(1-\sigma)}{d+\theta+\phi}
$$
où
$$
\mathcal{R}_0=\frac{\beta}{d+\gamma}
$$
et par conséquent
$$
\mathcal{R}
(\alpha,\phi,1,\theta)=\mathcal{R}_0
$$

---

# Stabilité - ESM
 
- Par le théorème de PvdD & Watmough (2002), l'ESM est
  - LAS si $\mathcal{R}_\phi<1$
  - instable si $\mathcal{R}_\phi>1$
- De plus, lorsque $\mathcal{R}_0<1$, en utilisant $I$ comme fonction de Liapounoff, il est facile de montrer que l'ESM est GAS

---

# SAL - ÉÉ

En linéarisant $\eqref{sys:vacc_3dS}$-$\eqref{sys:vacc_3dR}$ en l'ÉÉ
 
- au plus petit des $I$, la matrice jacobienne a sa trace strictement négative et son déterminant strictement positif $\implies$ une des valeurs propres est strictement positive et la branche basse de la bifurcation est instable
- Sur la branche haute, on conclut de la linéarisation qu'il y a soit 1 soit 3 valeurs propres à partie réelle négative $\implies$ la stabilité est indéterminée. D'une étude numérique, il semble que la branche supérieure soint LAS

---

# Abscisse spectrale

Abscisse spectrale $s(J)$ (maximum des parties réelles des valeurs propres) de la linéarisation en l'ESM et en les 2 ÉÉ, en fonction de $\theta$

![width:500px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/evalues_SIRbif.png)



---

# Comportement global

<div class="theorem">

Supposons que dans $\eqref{sys:vacc_3dS}$-$\eqref{sys:vacc_3dR}$, les paramètres vérifient
$$
\begin{aligned}
  \theta &< d + 2 \nu                   \\
2 \gamma &< d + \phi + \theta + \nu     \\
  \gamma &< d + \phi + \nu
\end{aligned}
$$
Alors toutes les semi-trajectories strictement positives de $\eqref{sys:vacc_3dS}$-$\eqref{sys:vacc_3dR}$ dans $\bar D$, où
$$
D=\{(S,I,R): S,R\geq 0, I>0, S+I+R\leq 1\}
$$
limitent en un PÉ unique
</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, #85110d, 20%, white)" -->
# <!--fit-->Quelques modèles (récents?)

---

<!-- _backgroundImage: "radial-gradient(white,80%,#f1c40f)" -->
# Quelques modèles (récents?)

- VIH: sexe, drogue et matrices
- VIH: un modèle complexe ancien
- VIH: test universel pour le VIH suivi de TAR
- VIH: suivi de la charge virale et des patients au Malawi
- Paludisme: un modèle très classique
- Paludisme: un modèle classique
- Paludisme: analyse de sensitivité
- Paludisme et COVID-19: contrôle optimal

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->VIH: sexe, drogue et matrices

<div style = "position: relative; bottom: -40%; font-size:20px;">

Abramson & Rothschild. [Sex, drugs and matrices: Mathematical prediction of HIV infection](https://doi.org/10.1080/00224498809551447). *The Journal of Sex Research* **25** (1988)
</div>

---

- Les données liées aux contacts sexuels et aux pratiques sexuelles sont souvent peu fiables ou ambiguës
- Un modèle simple pour illustrer ca
- Suggère que l'épidémiologie du VIH/SIDA est particulièrement sensible aux limitations dans l'évaluation des comportements sexuels ou de prise de drogues
- Étude numérique uniquement

---

Pour le groupe $G_i$, $i=1,\ldots,m$, $n_i$ est la taille du groupe et $x_i$ est le nombre d'individus de $G_i$ qui sont séropositifs. $Q=[q_{ij}]$ taux auquel des individus sains de $G_i$ sont infectés lors d'interactions avec des individus infectés de $G_j$; taux proportionnel au nombre d'individus sains dans $G_i$ et la proportion de $G_j$ qui est séropositive. $B_{ij}$ recrutement dans $G_i$ depuis les autres groupes (e.g., d'un groupe de risque différent), $a_i$ taux de mortalité dû au SIDA, $d_i$ mort pour tout autre cause. (Les naissances sont relatives au groupe, par forcément une vraie naissance/mort)
$$
\begin{aligned}
x_i' &= (n_i-x_i)\sum_{j=1}^m q_{ij}\frac{x_j}{n_j}-(d_i+a_i)x_i \\
n_i' &= \sum_{j=1}^m b_{ij}n_j -d_in_i-a_ix_i
\end{aligned}
$$



---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->VIH: un modèle complexe ancien

<div style = "position: relative; bottom: -40%; font-size:20px;">

Hethcote [A Model for HIV Transmission and AIDS](https://doi.org/10.1007/978-3-642-46693-9_13) (1989)
</div>

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/Hethcote1989_HIV_part.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/Hethcote1989_AIDS_part.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->VIH: test universel pour le VIH suivi de TAR

<div style = "position: relative; bottom: -40%; font-size:20px;">

Granich, Gilks, Dye, De Cock & Williams. [Universal voluntary HIV testing with immediate antiretroviral therapy as a strategy for elimination of HIV transmission: a mathematical model](https://doi.org/10.1016/S0140-6736(08)61697-9). *The Lancet* **373** (2009)
</div>

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/1-s2.0-S0140673608616979-gr2_lrg.gif)

<!--Transmission model for HIV infection and antiretroviral therapy (ART) provision

N represents population aged 15 years and above. People enter into the susceptible class (S) at a rate βN, become infected at a rate λSJ/N, progress through four stages of HIV (Ii, i=1–4) at a rate ρ between each stage, and then die (D). The background mortality rate is μ and people are tested at a rate τ. If they are tested and put onto ART, they move to the corresponding ART box Ai (i=1–4), where they progress through four stages at a rate σ and then die. The term governing transmission contains the factor J α (Ii+ɛAi) where ɛ allows for the fact that people receiving ART are less infectious than are those who are not. They might also stop treatment or the treatment might become ineffective, in which case they return to the corresponding non-ART state at a rate φ. To allow for heterogeneity in sexual behaviour and for the observed steady state prevalence of HIV, we let the transmission decrease with the prevalence, P. If n=1, the decrease is exponential; if n=∞, the decrease is a step function. Both have been used in previous models-->

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->VIH: suivi de la charge virale et des patients au Malawi

<div style = "position: relative; bottom: -40%; font-size:20px;">

Estill, Kerr, Blaser, Salazar-Vizcaya, Tenthani, Wilson, Keiser. [The Effect of Monitoring Viral Load and Tracing Patients Lost to Follow-up on the Course of the HIV Epidemic in Malawi: A Mathematical Model](https://doi.org/10.1093/ofid/ofy092). *Open Forum Infectious Diseases* **5** (2018) 
</div>

---

- Simulations individus-centrées de la progression de la maladie et modèle déterministe de transmission
- Utilise le paquet `R` `gems` pour déveloper un modèle de simulation IBM de progression de la maladie dans les patients sous TAR (traitement antirétroviral)
- Modèle de transmission déterministe pour représenter l'épidémie de VIH au Malawi de 1975 à 2050: 40 compartiments representant le status VIH (susceptible; infection primaire, chronique asymptomatique ou chronique symptomatique; TAR; SIDA), âge (enfants <15 ans, adultes 15–49 ans, adultes ≥50 ans), sexe (non différencié pour les enfants), comportement de risque (haut ou faible, à part pour les enfant, les adultes agés et les patients SIDA)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/ofy09201.jpeg)

<!--Schematic representation of the mathematical model. A, Flow of patients in the treatment model. White boxes represent stages with suppressed viral load, and gray boxes represent stages with continuously elevated viral load. “Discordant” immunological failure refers to a decline in CD4 cell count fulfilling the failure criteria under suppressed viral load; this condition will not reverse upon switch to second-line therapy. The flow described on the upper half is applicable to patients on ART, including those who returned after ART interruption. While progressing along the stages of treatment response (upper graph), the patients may also interrupt and restart treatment or die (lower graph). B, Transmission model. The upper graph shows the course of the HIV infection, and the lower graph the flow through age, sex, and risk group. Black arrows show flows between compartments, and gray lines show sexual contact patterns. Abbreviation: ART, antiretroviral therapy.-->

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Paludisme: un modèle très classique

<div style = "position: relative; bottom: -40%; font-size:20px;">

Dietz, Molineaux & Thomas. [A malaria model tested in the African savannah](https://www.ncbi.nlm.nih.gov/pubmed/4613512). *Bulletin of the WHO* **50** (1974)
</div>

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/DietzMolineauxThomas_flow_diagram.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/DietzMolineauxThomas_equations.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/DietzMolineauxThomas_biting_rates.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/DietzMolineauxThomas_positives.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Paludisme: un modèle classique

<div style = "position: relative; bottom: -40%; font-size:20px;">

Ngwa & Shu. [A mathematical model for endemic malaria with variable human and mosquito populations](https://doi.org/10.1016/S0895-7177(00)00169-2). *Mathematical and Computer Modelling* **32** (2000)
</div>

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/NgwaShu_contact_scaling.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/NgwaShu_system.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Paludisme: analyse de sensitivité

<div style = "position: relative; bottom: -40%; font-size:20px;">

Chitnis, Hyman & Cushing. [Determining Important Parameters in the Spread of Malaria Through the Sensitivity Analysis of a Mathematical Model](https://doi.org/10.1007/s11538-008-9299-0). *Bulletin of Mathematical Biology* **70** (2008)
</div>

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/ChitnisHymanCushing_flow_diagram.png)

---

- Considèrent deux scénarios de transmission pour des régions à taux de transmission *élevé* et *bas*
- Font une analyse de sensitivité
- Très bon papier si vous cherchez des valeurs pour paramétriser un modèle de paludisme

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/ChitnisHymanCushing_sensitivity_table.png)


---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Paludisme et COVID-19: contrôle optimal

<div style = "position: relative; bottom: -40%; font-size:20px;">

Tchoumi, Diagne, Rwezaura & Tchuenche. [Malaria and COVID-19 co-dynamics: A mathematical model and optimal control](https://doi.org/10.1016/j.apm.2021.06.016). *Applied Mathematical Modelling* **99** (2021)
</div>

---

![bg 90%](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/Tchoumi_etal_flow1.jpg)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/Tchoumi_etal_flow2.jpg)

---

- Considérations variées
- Contrôle optimal utilisant la fonctionnelle de coût
$$
J(u_1,u_2) =
\int_0^T
A_1(I_m+I_{mE_c})+A_2(I_c+I_{cE_m})+A_3I_{mc}+A_4N_{v}
+B_1u_1^2(t)+B_2u_2^2(t)\; dt
$$
où
1. $u_1(t)$ utilisation de mesures de protection personnelle (MPP) pour empêcher les piqures de moustiques pendant le jour et la nuit, p.ex. utilisation de moustiquaires de lit imprégnées d'insecticide, insectifuge sur la peau ou insecticide
2. $u_2(t)$ utilisation de MPP pour se protéger contre SARS-CoV-2: masques, gel hydro alcoolique, lavage des mains au savon, etc.

---

![bg 75% left](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/Tchoumi_etal_optimalC_u1.jpg) ![right](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/Tchoumi_etal_optimalC_u2.jpg)

