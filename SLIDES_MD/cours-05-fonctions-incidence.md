---
marp: true
title: Petit cours d'épidémiologie mathématique - Fonctions d'incidence
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 05 - Fonctions d'incidence
theme: default
paginate: false
size: 4:3
math: mathjax
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
# <!--fit-->Petit cours d'épidémiologie mathématique<br/>Fonctions d'incidence

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

- Fonctions d'incidence
- Un bestiaire de fonctions
- Exemple de problème lié aux fonctions d'incidence
- Un peu plus sur les changements d'incidence

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Fonctions d'incidence

---

Avant de continuer, discutons un peu les **fonctions d'incidence**, qui décrivent la façon dont les contacts entre individus ont lieu et comment ils se traduisent en transmissions de la maladie

Voir en particulier McCallum, Barlow & Hone, [How should pathogen transmission be modelled?](https://doi.org/10.1016/S0169-5347(01)02144-9), Trends in Ecology & Evolution **16** (2001)

---

# <!--fit-->Fonction d'incidence versus force d'infection

Deux formes différentes de la fonction représentant le taux de mouvement d'individus du compartiment $S$ vers les compartiments infectés:

- $S'=-f(S,I,N)$ est une **fonction d'incidence**
- $S'=-\lambda(S,I,N)S$ est une **force d'infection**

Les deux sont équivalentes, c'est le contexte qui tend à conduire au choix de la forme utilisée. Par exemple, les modèles en EDP structurés en âge d'infection doivent intégrer $I(t,a)$ sur l'âge et par conséquent utilisent fréquemment la force d'infection

---

# Interactions - Infection

- Le taux auquel des nouveaux cas apparaissent est la **fonction d'incidence**
$$
\tag{1}
f(S,I,N)
$$
- Depend du nombre $S$ de susceptibles, $I$ d'infectieux et parfois, de la population totale $N$
- Une fonction d'incidence inclut deux composantes:
  - un décompte du nombre de contacts ayant lieu
  - une description de la probabilité qu'un tel contact, quand il a lieu, entraîne la transmission du pathogène

---

Le choix d'une bonne fonction est difficile et est probablement l'une des parties les plus "instables" dans la modélisation de la propagation des maladies infectieuses

---

# Les deux fonctions d'incidence les plus usitées

Les deux fonctions d'incidence les plus usitées sont   l'**incidence en action de masse**
$$\tag{2}
f(S,I)=\beta SI
$$
et l'**incidence standard** (ou **proportionnelle**)
$$\tag{3}
f(S,I)=\beta\frac{SI}{S+I}
$$

Dans les deux cas, $\beta$ est le **coefficient de transmission de la maladie**, bien que son interprétation exacte varie

---

# Des unités de $\beta$

Si $X(t)$ est la population du compartiment $X$ au temps $t$, alors $X'$ a pour unités nombre/temps

Dans une équation différentielle, les termes à gauche et à droite du signe "$=$" doivent avoir les mêmes unités

La fonction d'incidence a donc unités nombre/temps

(Et si on utilise une force d'infection, les unités sont 1/temps)

---

### Incidence en action de masse

$$
\beta SI \propto 
\beta\times\text{nombre}\times\text{nombre}
$$
a pour unités nombre/temps si $\beta$ a pour unités $1/(\text{nombre}\times\text{temps})$

### Incidence standard

$$
\beta SI/N \propto 
\beta\times\text{nombre}\times\text{nombre}/\text{nombre} \propto \beta \times \text{nombre}
$$
a pour unités nombre/temps si $\beta$ a pour unités $1/\text{temps}$

---

# Incidence en action de masse

$$
\begin{equation}
\tag{2}\label{eq:incidence_mass_action}
f(S,I)=\beta SI
\end{equation}
 $$

- Le mélange des susceptibles et infectieux est homogène 
- Ceci est une hypothèse forte: le nombre de contacts est le produit du nombre de susceptibles et du nombre d'infectieux, donc chaque individu susceptible peut potentiellement rencontrer chaque individu infectieux

(d'où le nom, par analogie avec la dynamique des gas en chimie/physique) 

Quand la population est grande, cette hypothèse devient irréaliste

---

# <!--fit-->Incidence standard (proportionnelle) 

Autre forme de fonction d'incidence très utilisée
$$
\begin{equation}
\tag{3}\label{eq:incidence_proportional}
f(S,I,N)=\beta\frac{SI}{N}
\end{equation}
$$

Chaque susceptible rencontre une fraction des infectieux

Ou vice-versa! Voir, p.ex., Hethcote, [Qualitative analyses of communicable disease models](https://doi-org.uml.idm.oclc.org/10.1016/0025-5564(76)90132-2), *Mathematical Biosciences* (1976)

Cas d'une population plus grande

---

# <!--fit-->Population constante $\implies$ $\eqref{eq:incidence_mass_action}$ $\equiv$ $\eqref{eq:incidence_proportional}$

Quand la population totale est constante, bien des fonctions d'incidence sont équivalentes qualitativement 

Supposons que $N(t)\equiv N_0$, alors
$$
\beta SI = \tilde\beta\frac{SI}{N}
\iff \tilde\beta=N_0\beta
$$
avec ce $\tilde\beta$, $\eqref{eq:incidence_mass_action}$ et $\eqref{eq:incidence_proportional}$ sont identiques

Rappelez-vous que les unités diffèrent, toutefois

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Un bestiaire de fonctions

---

# Incidence générale

$$
\tag{4}
f(S,I,N)=\beta S^q I^p
$$
Ces fonctions furent introduites avec pour but l'ajustement aux données: pour ajuster, cela ajoute deux paramètres $p,q$. On verra toutefois que bien du travail théorique utilise cette incidence

---

# Incidence avec refuge

Effet de refuge; une proportion $0<q<1$ de la population est vraiment susceptible, par exemple du fait d'hétérogénéités spatiales

$$
\tag{5}
f(S,I,N)=
\begin{cases}
\beta I\left(N-\dfrac Iq\right),&\textrm{si }I<qN \\
0,&\textrm{si }I\geq qN
\end{cases}
$$


---

# Incidence binomiale négative

$$
\tag{6}
f(S,I,N)=kS\ln\left(1+\beta\frac Ik\right)
$$
Pour des petites valeurs de $k$, ceci décrit un processus d'infection très concentré, tandis que lorsque $k\to\infty$, on tend vers une incidence en action de masse

---

# Contact asymptotique

$$
\tag{7}
f(S,I,N)
=\frac{N}{1-\varepsilon+\varepsilon N}
\frac{F(S,I)}{N}
$$
où $F$ est l'une des fonctions déjà décrites

Quand $\varepsilon=0$, les contacts sont proportionnels à $N$, tandis que lorsque $\varepsilon=1$, les contacts sont indépendants de $N$

---

# Transmission asymptomatique 

$$
\tag{8}
f(S,I,N)
=\beta\frac{SI}{c+S+I}
$$
où $c$ est une constante. Par ex., 
$$
\frac{C(N)}N F(S,I)
$$
avec $C(N)=N/(1-\varepsilon+\varepsilon N)$ la fonction décrivant le taux de contact et $F(S,I)$ la fonction décrivant la propagation de la maladie, que l'on suppose ici être une incidence binomiale négative

---

# Incidence changeante

$$
\tag{9}
F(S,I,N) = 
\begin{cases}
\beta SI & \textrm{si }N\leq \hat N \\
\beta \dfrac{SI}{N} & \textrm{si }N> \hat N
\end{cases}
$$

<div style = "position: relative; bottom: -35%; font-size:20px;">

Arino & McCluskey, [Effect of a sharp change of the incidence function on the dynamics of a simple disease](https://doi.org/10.1080/17513751003793017), *Journal of Biological Dynamics* (2010)
</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Exemple de problème lié aux fonctions d'incidence<br/>Changer de forme ou saturer?

<div style = "position: relative; bottom: -35%; font-size:20px;">

C. Kribs-Zaleta. [To switch or taper off: the dynamics of saturation](https://doi.org/10.1016/j.mbs.2004.11.001), *Mathematical Biosciences* (2004)
</div>

---

# <!--fit-->Deux fonctions d'incidence différentes

On va considérer le rôle de deux fonctions différentes: une fonction continue et différentiable
$$
\beta_{sm}(N)=\beta_0\frac{N}{N+A}
\tag{10}\label{eq:CK_1}
$$
et une continue mais avec un *switch* (transition abrupte?)
$$
\beta_{sw}(N)=
\begin{cases}
\beta_0\dfrac{N}{A},& N<A \\
\beta_0,& N\geq A
\end{cases}
\tag{11}\label{eq:CK_2}
$$
Ces fonctions représentent la saturation de façon différente

![center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/1-s2.0-S0025556404001555-gr1.gif)

---

# Le modèle

Modèle SIS en population non constante
$$
\begin{align}
I' &= \beta(N)(N-I)\frac{I}{N}-(d+\gamma+\delta)I \\
N' &= bN\left(1-\frac{N}{K}\right)-dN-\delta I
\end{align}
$$

---

# Adimensionalisation du modèle

Soient $\bar N=(1-\frac{d}{b})K$, $i=I/N$ et $n=N/\bar N.$ Alors
$$
\begin{align}
i' &= (\beta(\bar N n)-\delta)i(1-i)-(b+\gamma)i
+(b-d)xn \tag{12a}\\
n' &= (b-d)n(1-n)-\delta xn\tag{12b}
\end{align}
$$

---

# <!--fit-->Le nombre de reproduction élémentaire

Quelle que soit la fonction d'incidence utilisée
$$
\mathcal{R}_0
=\frac{\beta(\bar N)}{d+\gamma+\delta}
$$

---

Avec $\beta = \beta_{sw}$, il y a 2 sous-modèles

**Cas I** $\beta(N) = \beta_0N/A$; 3 équilibres $(x^\star,n^\star)$ dans $[0,1]^2$: 
- l'origine, toujours instable
- l'ÉSM $(0, 1)$, GAS quand $\mathcal{R}_0$
- un ÉE unique qui existe et est LAS quand $\mathcal{R}_0 > 1$

**Cas II** $\beta(N) = \beta_0$. On a 4 équilibres $(x^\star,n^\star)$: 
- l'origine, toujours instable
- l'ÉSM (), GAS quand $\mathcal{R}_0 < 1$
- un ÉE unique qui existe et est LAS quand $\mathcal{R}_0 > 1$
-  un PÉ d'extinction () qui existe quand $\beta\geq b+\gamma+\delta$ et est LAS ssi, i.e., quand $\mathcal{R}_0 > 1$ mais l'ÉE n'existe pas

---

Soit $a=A/\bar N$

Si $a>1$, tous les équilibres sont sous le point de changement et le modèle se réduit au Cas I (modèle sans saturation)

Si $a<1$, il y a un seul ÉSM (ainsi que l'équilibre trivial instable) et il y a un ÉE unique qui est l'ÉE du Cas I ssi 
$$
a>1-\frac 1k\left(1-\frac{d+\gamma+\delta}{\beta_0}\right)
$$
et l'ÉE du Cas II sinon

Le modèle avec switch n'a pas le PÉ d'extinction du Cas II

---

Dans le modèle avec switch
$$
\mathcal{R}_0
=\frac{\beta_0}{d+\gamma+\delta}
\;
\frac{1}{\max(a,1)}
$$

---

Dans le modèle avec saturation différentiable $\eqref{eq:CK_1}$
$$
\mathcal{R}_0
=\frac{\beta_0}{d+\gamma+\delta}
\;
\frac{1}{\delta+1}
$$

On a le PÉ trivial (instable), l'ÉSM (GAS lorsque $\mathcal{R}_0<1$) et un ÉE unique qui existe et est LAS lorsque $\mathcal{R}_0>1$

---

La $\neq$ principale entre les modèles est quantitative: le lieu où $\mathcal{R}_0<1$ change; ceci reflète que $\beta_{sm}<\beta_{sw}$

Les deux modèles prédisent l'éradication de la maladie pour une grande région de l'espace des paramètres et excluent la possibilité d'extinction que permet le modèle classique avec incidence standard

Aussi, dans les 2 cas, l'ÉE est t.q. 
$$
\lim_{\mathcal{R}_0\to\infty}i^\star = \min(k,1)
$$
i.e., pour $k < 1$ (i.e., $r < d + \delta$), la prévalence en l'ÉE n'approche jamais 100% parce que la résilience reproductrice de la population est si basse que la population devient trop petite pour que la maladie se propage à tous, quelle que soit la valeur de $\mathcal{R}_0$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Un peu plus sur les changements d'incidence

- Le modèle de base
- Incidence dépendante de la densité de population
- Cas où l'infection dépasse les capacités de traitement

<div style = "position: relative; bottom: -35%; font-size:20px;">

JA & McCluskey [Effect of a sharp change of the incidence function on the dynamics of a simple disease](https://doi.org/10.1080/17513751003793017), *Journal of Biological Dynamics* (2010)
</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Le modèle de base

---

# Le modèle de base

$$
\begin{align}
S' &= bN-dS-F(S,I)+\gamma I \tag{13a} \\
I' &= F(S,I)-(d+\delta+\gamma) I \tag{13b}
\end{align}
$$

Donc la dynamique de la population totale est
$$
N' = (b-d)N-\delta I
$$
et le système a des ÉE ssi $d<b<d+\delta$

---

On passe au système en proportions $s=S/N$ et $i=I/N$. La population totale n'est pas constante et on considère donc

$$
\begin{align}
i' &= f(i,N)-(b+\delta+\gamma)i+\delta i^2 \tag{14a}\label{sys:switch_JACCMC_prop_di} \\
N' &= (b-d-\delta i)N \label{sys:switch_JACCMC_prop_dN}\tag{14b}
\end{align}
$$
avec
$$
f(i,N) = \frac{F(S,I)}{N}
$$
et où on définit
$$
f(i,0)=\lim_{N\to 0}f(i,N)
$$
et l'on suppose que cette limite existe (on exclut par exemple que $F(\alpha S,\alpha I)$ soit sous-linéaire en $\alpha$ près de 0)

---

<div class="theorem">

Les solutions de $\eqref{sys:switch_JACCMC_prop_di}$-$\eqref{sys:switch_JACCMC_prop_dN}$ dans la bande positivement invariante
$$
\mathcal{D}=\left\{
(i,N):\quad 0\leq i\leq 1,\;N\geq 0  
\right\}
$$
existent pour tout $t>0$
</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Incidence dépendante de la densité de population

---

# <!--fit-->Incidence dépendante de la densité de population

Le premier cas qu'on considère est celui avec une incidence de la forme qu'on a déjà vu
$$
\tag{9}
F(S,I,N) = 
\begin{cases}
\beta SI & \textrm{si }N\leq \hat N \\
\beta \dfrac{SI}{N} & \textrm{si }N> \hat N
\end{cases}
$$
où l'on normalise pour que $\hat N=1$

On note $\mathcal{D}_L$ la partie de $\mathcal{D}$ où $N\leq 1$ et $\mathcal{D}_H$ celle où $N\geq 1$

---

Dans $\mathcal{D}_H$, on a une solution explicite

<div class="theorem">

Supposons qu'à l'instant $t=\tau\geq 0$, on ait $(i_\tau,N_\tau):=(i(\tau),N(\tau))\in\mathcal{D}_H$. Alors il existe un intervalle potentiellement infini $\mathcal{I}$ avec extremité gauche le point $t=\tau$, tel que pour tout $t\in\mathcal{I}$, on a $(i(t),N(t))\in\mathcal{D}_H$ avec
$$
\begin{align}
i(t) &= \frac{Ki_\tau}{\Psi(t-\tau)} \\
N(t) &= N_\tau e^{(b-d)(t-\tau)}\exp\left(
  -\delta Ki_\tau\int_\tau^t\frac{du}{\Psi(u-\tau)}
\right)
\end{align}
$$
où $K=\beta-(d+\gamma+\delta)$ et 
$$
\Psi(u)=i_\tau(\beta-\delta)(1-e^{-Ku})+Ke^{-Ku}
$$
</div>

---

<div class="theorem">

Soit
$$
N_\Delta=\delta(d+\delta+\gamma)/\beta(d+\delta-b)
$$
Pour toutes les valeurs des paramètres, l'ÉSM est
$$
e_0:=(i_0,N_0)=(0,0)
$$
- Si $b<d$, il n'y a pas d'autre PÉ et $e_0$ est GAS
- Si $d<b$, $e_0$ est instable
- Si $d<b<d+\delta$, alors la présence d'ÉE $e_\star=(i_\star,N_\star)$, $i_\star=b-d/\delta$ dépend de 
  - Si $N_\Delta<1$, $e_\star=(i_\star,N_\Delta)$ LAS
  - Si $N_\Delta=1$, $e_\star=(i_\star,N)$ pour tout $N\geq 1$
  - Si $N_\Delta>1$, $e_\star$ n'existe pas
- Si $d+\delta\leq b$, il n'y a pas d'ÉE
</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Cas où l'infection dépasse les capacités de traitement

---

# <!--fit-->Cas où l'infection dépasse les capacités de traitement

Supposons
$$
\tag{15}\label{eq:overcome_capacity}
F(S,I,N) = 
\begin{cases}
\beta_1 \dfrac{SI}{N} & \textrm{si }I\leq \hat I \\
\beta_1 \dfrac{SI}{N}+\beta_2 S(I-\hat I) & \textrm{si }I> \hat I
\end{cases}
$$
soit, en proportions, $f(i,N)$ est de la forme
$$
\tag{16}\label{eq:overcome_capacity_proportions}
\begin{cases}
\beta_1 (1-i)i & \textrm{si }iN\leq \hat I \\
\beta_1 (1-i)i+\beta_2 (1-i)(iN-\hat I) & \textrm{si }iN> \hat I
\end{cases}
$$

---

# Les régions dans le plan

Ici, le changement ne se fait pas pour une valeur de $N$ mais le long de l'hyperbole $N=\hat I/i$, pour $i\in]0,1]$, et on adapte les régions $\mathcal{D}_L$ et $\mathcal{D}_H$

---

# Équilibres

On a potentiellement 3 PÉ
$$
e_0=(0,0)\quad \bar e=(i_{LS},0)\quad e_\star=(i_N,N_{HS}(i_N))
$$
avec
$$
i_{LS}=1-\frac{b+\gamma}{\beta_1-\delta},
\quad i_N=\frac{b-d}{\delta}
$$
et
$$
N_{HS}(i) = \frac{\hat I}{i}+\frac{b+\gamma}{\beta_2(1-i)}
-\frac{\beta_1-\delta}{\beta_2}
$$

---

<div class="theorem">

Le système  $\eqref{sys:switch_JACCMC_prop_di}$-$\eqref{sys:switch_JACCMC_prop_dN}$ avec incidence $\eqref{eq:overcome_capacity_proportions}$ a, potentiellement, 3 PÉ, dont la stabilité est donnée par la table sur le transparent suivant, dans laquelle on utilise
$$
\mathcal{E}=\frac{\beta_1}{b+\delta+\gamma}
$$
et 
$$
\mathcal{S}_N=
\frac{(b+\gamma)(b-d)}{d+\delta-b}
+\frac{\beta_2\hat I(d+\delta-b)}{d-b}
$$
</div>

---
<style>
    .heatMap {
        overflow:scroll;
        font-size: 21px;
    }
    .heatMap th {
        background: grey;
    }
    .heatMap tr:nth-child(1) { background: lightgreen;}
    .heatMap tr:nth-child(2) { background: lightgreen;}
    .heatMap tr:nth-child(3) { background: lightblue;}
    .heatMap tr:nth-child(4) { background: lightblue;;}
    .heatMap tr:nth-child(5) { background: lightblue;;}
    .heatMap tr:nth-child(6) { background: yellow;}
</style>

<div class="theorem">
<div class="heatMap">

|| $e_0$ | $\bar e$ | $e_\star$ |
|---|:---:|:---:|:---:|
| $b<d,\mathcal{E}<1$ | GAS | N'existe pas | N'existe pas |
|$b<d,\mathcal{E}>1$ | Instable | GAS | N'existe pas |
|$d<b<d+\delta$, $i_{LS}<i_N$, $\mathcal{S}_N>0$ | Instable | Instable | LAS |
|$d<b<d+\delta$, $i_{LS}<i_N$, $\mathcal{S}_N<0$ | Instable | Instable | Instable |
|$d<b<d+\delta$, $i_{LS}>i_N$ | Instable | GAS | N'existe pas |
|$d+\delta<b$ | Instable | Instable | N'existe pas |
</div>
</div>

La SAG est obtenue en utilisant une extension du Théorème de Dulac prennant en compte l'existence, dans un champ $C^1$, d'une courbe sur laquelle le champ est $C^0$

---

# <!--fit-->Ce système admet des solutions périodiques

<style>
  .table2 {
        overflow:scroll;
        font-size: 25px;
  }
  .table2 th {
    background: grey;
  }
  .table2 tr:nth-child(1) { background: lightblue;}
  .table2 tr:nth-child(2) { background: yellow;}
</style>

On se place dans le cas

<div class="table2">

|| $e_0$ | $\bar e$ | $e_\star$ |
|---|:---:|:---:|:---:|
|$d<b<d+\delta$, $i_{LS}<i_N$, $\mathcal{S}_N>0$ | Instable | Instable | LAS |
|$d<b<d+\delta$, $i_{LS}<i_N$, $\mathcal{S}_N<0$ | Instable | Instable | Instable |
</div>

<div class="theorem">

Pour tout $\varepsilon>0$ et tout $\mathcal{S}_N^0>0$, il existe $\bar{\mathcal{S}}_N\in ]-\mathcal{S}_N^0,0[$ t.q. le système $\eqref{sys:switch_JACCMC_prop_di}$-$\eqref{sys:switch_JACCMC_prop_dN}$ avec incidence $\eqref{eq:overcome_capacity_proportions}$ a une orbite périodique non triviale dans $\mathcal{B}_\varepsilon(e_\star)$ (boule ouverte centrée en $e_\star$ et de rayon $\varepsilon$) pour $\mathcal{S}_N=\bar{\mathcal{S}}_N$
</div>

---

![bg contain 50%](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/tjbd_a_479823_o_f0002g.jpeg)

---

![bg contain 95%](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/tjbd_a_479823_o_f0003g.jpeg)
