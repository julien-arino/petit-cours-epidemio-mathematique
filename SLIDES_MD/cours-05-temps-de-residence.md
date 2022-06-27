---
marp: true
title: Petit cours d'épidémiologie mathématique - Temps de résidence dans les compartiments
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 05 - Temps de résidence dans les compartiments
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

# Petit cours d'épidémiologie mathématique<br/>Temps de résidence dans les compartiments

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

- Juste ce qu'il faut de probabilité
- Distributions utilisées ici
- Un modèle simple de cohorte
- Temps de séjour dans un modèle SIS
- De l'exponentielle à l'Erlang
- Risques compétitifs

---

# Pourquoi considérer la stochasticité?

- La vie résulte des interactions entre un nombre colossal de processus

- Chaque processus contient un certain degré d'imprécision. Par exemple, lorsqu'un virus se réplique, il saute une base ici et là; quand une cellule se divise lors de la mitose, le matériau n'est pas partagé 50%-50% entre les cellules filles; vous rencontrez un autre être humain et (en ces temps de COVID-19) oubliez de *ne pas* lui serrer la main)

- Du fait de la répétition des ces imprécisions, il nait de l'incertitude

---

# Déterministe $\neq$ Stochastique

- Modèle déterministe: étant donné des conditions initiales et des paramètres, toutes les "réalisations" du processus sont identiques
- Modèle stochastique (on revient sur ça plus tard): étant donné des conditions initiales et des paramètres, aucune réalisation n'est la même

**Toutefois**: déterministe ne veut pas dire "aucune prise en compte de la stochasticité".. la stochasticité est juste cachée

Étudier les temps de séjour dans les compartiments permet de révéler cette stochasticité cachée

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Juste ce qu'il faut de probabilité

---

# Quelques références

L'objet n'est pas ici de définir "proprement" les choses. Pour cela, on consultera par exemple:
- [Rényi](https://www.gabay-editeur.com/RENYI-Calcul-des-probabilites-avec-un-appendice-sur-la-Theorie-de-lInformation-1966)
- [Velenik](http://www.unige.ch/math/folks/velenik/cours.html) (cours pdf en ligne gratuits)

---

# Contexte général

Considérons un système $\Sigma$ qui peut être dans 2 états, $S_1$ et $S_2$

- $S_1$: fonctionne, $S_2$: cassé;
- $S_1$: vivant, $S_2$: mort;
- $S_1$: infecté, $S_2$: guéri;
- $\ldots$

---

Supposons que
- au temps $t=0$, $\Sigma$ est dans l'état $S_1$
- à un instant $t=\tau$, quelque chose se passe, entraînant le passage de $\Sigma$ de l'état $S_1$ à l'état $S_2$

Une **variable aléatoire** (v.a.) est une variable qui prend des valeurs .. aléatoires

Appelons $T$ la variable aléatoire
> temps que $\Sigma$ passe dans l'état $S_1$ avant de passer dans l'état $S_2$

On veut un *modèle* pour $T$

---

On prend une collection de systèmes $\Sigma_i$ dans l'état $S_1$ et cherche à obtenir une *loi* décrivant la **distribution** des temps passés par ces systèmes dans l'état $S_1$, i.e., une loi pour $T$

Pour ce faire, on conduit une **infinité** d'expériences et on observe le temps que le système prend, dans chaque cas, pour passer de $S_1$ en $S_2$

On déduit un modèle, qui dans ce contexte est une **distribution de probabilité**

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/random_length_sample.png)

---

# Variables aléatoires discrètes ou continues

On suppose que $T$ est une v.a. **continue**, i.e., $T$ prend des valeurs continues. Exemples: 

- taille ou age si mesuré avec une très grande précision
- distance
- temps


Un autre type de v.a. sont les v.a. **discrètes**, qui prennent des valeurs dans un ensemble dénombrable. Exemples:

- pile ou face
- résultat d'un jet de dé
- taille d'une person en centimètres, âge en années (sans sous unités)

---

# Densité de probabilité

Supposons $T$ v.a.continue; elle a une **fonction de densité** $f$

- $f\geq 0$
- $\int_{-\infty}^{+\infty}f(s)ds=1$
- $\mathbb{P}(a\leq T\leq b)=\int_a^bf(t)dt$

![width:450px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/distrib_a_b.png)

---

# Fonction de répartition

La **fonction de répartition** (ou **fonction de distribution cumulative**) est une fonction $F(t)$ qui caractérise la distribution de $T$, et est définie par
$$
F(s)=\mathbb{P}(T\leq s)=\int_{-\infty}^sf(x)dx
$$

![width:500px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/cdf_auc.png)

---

# Propriétés de la fonction de répartition

- Puisque $f$ est positive, $F$ est croissante
- Puisque $f$ est une densité de probabilité, $\int_{-\infty}^{+\infty}f(s)ds=1$, et donc $\lim_{t\to\infty}F(t)=1$

![width:550px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/cdf_plot.png)

---

# Moyenne (espérance mathématique)

Pour une v.a. continue $T$ avec densité de probabilité $f$, la **moyenne** (ou **espérance mathématique**) de $T$, notée $\bar T$ ou $E(T)$, est
$$
\tag{1}\label{eq:mean_value}
E(T)=\int_{-\infty}^{+\infty} tf(t)dt
$$

---

# Fonction de survie

Une autre façon de caractériser la distribution d'une variable aléatoire $T$ est en utilisant la fonction de **survie**


La fonction de survie d'une v.a. avec densité cumulative $F$ est donnée par
$$
\begin{equation}\tag{2}\label{eq:survival}
  \mathcal{S}(t)=1-F(t)=\mathbb{P}(T>t)
\end{equation}
$$

Ceci décrit le **temps de séjour** du système dans un état donné (le temps passé dans l'état)

$\mathcal{S}$ est une fonction décroissante (puisque $\mathcal{S}=1-F$ avec $F$ une densité cumulative), et $\mathcal{S}(0)=1$ si $T$ est une v.a. à valeurs positives

---

La **durée moyenne de survie** $\tau$ est
$$
\tau=E(T)=\int_0^\infty tf(t)dt
$$
Puisque $\lim\limits_{t\to\infty}t\mathcal{S}(t)=0$,
$$
\tag{3}\label{eq:mean_sojourn_time}
\tau=\int_0^\infty \mathcal{S}(t)dt
$$

**Durée attendue de vie future**
$$
\tag{4}\label{eq:expected_future_lifetime}
\frac{1}{\mathcal{S}(t_0)} \int_0^{\infty} t\,f(t+t_0)\,dt 
$$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# Distributions utilisées ici
---

# La distribution exponentielle

La v.a. $T$ a une **distribution exponentielle** si sa densité est de la forme

$$
\begin{equation}\label{eq:exp_distrib}
f(t)=\begin{cases}0&\textrm{si }t<0,\\
\theta e^{-\theta t}&\textrm{si }t\geq 0,
\end{cases}
\end{equation}
$$
avec $\theta>0$. Alors la fonction de survie est de la forme $\mathcal{S}(t)=e^{-\theta t}$, pour $t\geq 0$, et le temps moyen de séjour est
$$
\tau=\int_0^\infty e^{-\theta t}dt=\frac 1\theta
$$

---

# La distribution de Dirac

Soit $\omega>0$ donné. Si la survie prend la forme
$$
\mathcal{S}(t)=
\left\{
\begin{array}{ll}
1, & 0\leq t\leq\omega \\
0, & \omega<t
\end{array}
\right.
$$
alors $T$ a une distribution delta de Dirac delta $\delta_\omega(t)$, et le temps moyen de séjour est
$$
\tau=\int_0^\omega dt=\omega
$$
avec une variance $\sigma^2=0$

---

# La distribution Gamma

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# Un modèle simple de cohorte

---

# Un modèle pour une cohorte avec seulement de la mortalité

Considérons une population consistant d'individus nés au même instant (une **cohorte**), par exemple, la même année

Supposons

- Au temps $t=0$, il y a $N_0>0$ individus
- On regroupe toutes les causes de mortalité
- La durée de la vie d'un individu avant son décés est une variable aléatoire continue $T$, avec densité $f(t)$ et fonction de survie $P(t)$

---

# Le modèle

Soit $N(t)$ la population au temps $t\geq 0$. Alors

$$
\begin{equation}\label{eq:N_general}\tag{8}
N(t)=N_0P(t)
\end{equation}
$$

$P(t)$ donne la proportion de la cohorte toujours vivante au temps $t$, donc $N_0P(t)$ est le nombre d'individus dans la cohorte toujours vivants au temps $t$

---

# Cas où $T$ est distribuée exponentiellement

Supposons que $T$ a une distribution exponentielle de moyenne $1/d$ (ou de paramètre $d$), $f(t)=de^{-dt}$. Alors la fonction de survie est $P(t)=e^{-dt}$, et $\eqref{eq:N_general}$ s'écrit

$$
\begin{equation}\label{eq:N}
N(t)=N_0e^{-dt}
\end{equation}
$$
Remarquons que
$$
\begin{align*}
\frac{d}{dt} N(t) &= -dN_0e^{-dt} \\
&= -dN(t)
\end{align*}
$$
avec $N(0)=N_0$

$\implies$ L'ODE $N'=-dN$ fait (implicitement) l'hypothèse que l'espérance de vie à la naissance est distribuée exponentiellement

---

# Cas où $T$ a une distribution delta de Dirac

Supposons que $T$ a une distribution delta de Dirac à $t=\omega$, soit la fonction de survie
$$
P(t)=\begin{cases}
1, & 0\leq t\leq\omega\\
0, & t>\omega
\end{cases}
$$
Alors $\eqref{eq:N_general}$ s'écrit
$$
\begin{equation}\label{eq:N2}
N(t)=\begin{cases}
N_0, & 0\leq t\leq\omega\\
0, & t>\omega
\end{cases}
\end{equation}
$$
Tous les individus survivent jusqu'au temps $t=\omega$, puis ils meurent tous au temps $t=\omega$

Ici, $N'=0$ partout sauf lorsque $t=\omega$, où la dérivée n'est pas définie

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Temps de séjour dans un modèle SIS

---

![bg 80% right:40%](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/figure_SIS_base_no_demography_general_recovery_vertical.png)

# <!--fit-->SIS avec guérison "trafiquée"

Modèle SIS EDO traditionnel suppose guérison à un taux *per capita* (souvent noté $\gamma$)

Ici, on suppose que, des individus infectés au temps $t_0$, une fraction $P(t-t_0)$ reste infectée au temps $t\geq t_0$

$\implies$ la fonction $P(t)$ est une fonction de survie pour $t\geq 0$

---

# Réduction de la dimension

On a
$$
S(t)+I(t)=N, \textrm{ ou encore, }S(t)=N-I(t)
$$

$N$ est constant (égal à la population totale au temps $t=0$), donc on peut déduire la valeur de $S(t)$, une fois $I(t)$ connu, de l'équation $S(t)=N-I(t)$

Donc on utilise $I(t)$ uniquement

---

# Modèle pour les individus infectieux

Integral equation for the number of infective individuals:
$$
\begin{equation}
I(t) = I_0(t)+ \int_0^t\beta\frac{(N-I(u))I(u)}{N} P(t-u)\ du
\label{eq:SIS_I}\tag{10}
\end{equation}
$$

- $I_0(t)$ nombre d'individus qui étaient infectieux au temps $t=0$ et le sont toujours au temps $t$
  - $I_0(t)$ positive, décroissante et t.q. $\lim_{t\to\infty}I_0(t)=0$
- Terme intégral (page suivante): nouvelles infections et guérisons

---

# Expression sous l'intégrale

Dans $\eqref{eq:SIS_I}$, le terme intégral

$$
\int_0^t\beta\frac{(N-I(u))I(u)}{N} P(t-u)\ du
$$
s'interprète comme suit:

- $\beta\frac{(N-I(u))I(u)}{N}=\beta\frac{S(u)I(u)}{N}$ taux auquel de nouveaux infectés sont crées au temps $u$
- $P(t-u)$ proportion des infectés au temps $u$ qui sont encore infectés au temps $t$

En intégrant sur $[0,t]$, on obtient le nombre d'individus infectés au temps $t$

---

# <!--fit-->Cas d'un temps de guérison exponentiallement distribué

Supposons que $P(t)$ t.q. le temps de séjour dans l'état infecté a une distribution exponentielle de moyenne $1/\gamma$, i.e., $P(t)=e^{-\gamma t}$

Supposons du reste que la fonction de condition initiale $I_0(t)$ s'écrit
$$
I_0(t)=I_0(0)e^{-\gamma t}
$$
avec $I_0(0)$ le nombre d'infectieux au temps $t=0$. Cela vient en considérant une cohorte d'individus initialement infectés et en employant un modèle comme $\eqref{eq:N_general}$

$\eqref{eq:SIS_I}$ devient
$$
\begin{equation}\label{eq:I_ODE}\tag{11}
I(t)=I_0(0)e^{-\gamma t}+\int_0^t \beta\ \frac{(N-I(u))I(u)}{N}\ e^{-\gamma (t-u)}\ du
\end{equation}
$$

---

Donc, si l'on dérive $\eqref{eq:I_ODE}$ par rapport au temps, on obtient
$$
\begin{align*}
I'(t) &= -\gamma I_0(0)e^{-\gamma t}-\gamma\int_0^t \beta\frac{(N-I(u))I(u)}{N}e^{-\gamma(t-u)}du \\
&\quad +\beta \frac{(N-I(t))I(t)}{N} \\
&= -\gamma\left(I_0(0)e^{-\gamma t}+
\int_0^t \beta\frac{(N-I(u))I(u)}{N}e^{-\gamma(t-u)}du\right) \\
&\quad +\beta \frac{(N-I(t))I(t)}{N} \\
&= \beta \frac{(N-I(t))I(t)}{N}-\gamma I(t)
\end{align*}
$$
qui est l'équation classique d'un modèle SIS en EDO en absence de démographie

---

# <!--fit-->Cas d'un temps de guérison Dirac distribué

Supposons que la durée d'infection a une fonction de survie
$$
P(t)=\begin{cases}
1, & 0\leq t\leq\omega\\
0, & t>\omega
\end{cases}
$$
i.e., le temps de séjour dans le compartiment infecté est distribué selon une loi delta de Dirac de paramètre $\omega>0$
 
Dans ce cas, $\eqref{eq:SIS_I}$ devient
$$
\begin{equation}\label{eq:I_DDE}\tag{12}
I(t)=I_0(t)+\int_{t-\omega}^t \beta\ \frac{(N-I(u))I(u)}{N}\ du
\end{equation}
$$
L'expression de $I_0(t)$ est plus compliquée à obtenir ici. On suppose toutefois que $I_0(t)$ disparait pour $t>\omega$

---

Quand on la différentie par rapport au temps, $\eqref{eq:I_DDE}$ devient, pour $t\geq\omega$
$$
I'(t)=I_0'(t)+\beta\frac{(N-I(t))I(t)}{N}
-\beta\frac{\left(N-I(t-\omega)\right)I(t-\omega)}{N}
$$
Puisque $I_0(t)$ disparait pour $t>\omega$, on obtient l'équation differentielle à retard (EDR)
$$
I'(t)=\beta\frac{(N-I(t))I(t)}{N}
-\beta\frac{(N-I(t-\omega))I(t-\omega)}{N}
$$

---

# Ce que l'on sait à ce stade

- Le temps de séjour dans les compartiments joue un rôle important dans la détermination du type de modèle que l'on considère
- Tous les modèles EDO compartimentaux, quand ils utilisent des termes de la forme $\kappa X$, font l'hypothèse que le temps de séjour dans les compartiments est distribué exponentiellement avec moyenne $1/\kappa$
- À l'autre extrémité du spectre, les EDR à retard discret $\tau$ font l'hypothèse d'un temps de séjour constant $\tau$, égal pour tous les individus
- Les deux sont probablement vrais parfois, mais la réalité est sans nul doute souvent quelque part entre les deux

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->De l'exponentielle à l'Erlang

<div style = "position: relative; bottom: -40%; font-size:20px;">

JA & Portet. [A simple model for COVID-19](http://dx.doi.org/10.1016/j.idm.2020.04.002). *Infectious Disease Modelling* **5**:309-315 (2020)
</div>

---

![contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/survival_exponential.png)

---

# Des problèmes de la distribution exponentielle

- La survie tombe vite
- La survie continue bien après la moyenne
- Acceptable si ce qui compte c'est la durée moyenne du temps de séjour dans un compartiment (par exemple, dynamique à long terme)
- Moins acceptable si on s'intéresse à une dynamique sur le court terme
- Un autre problème: l'exponentielle avec paramètre $\theta$ a une espérance $1/\theta$ et un écart type $1/\theta$, i.e., un paramètre unique contrôle la moyenne et la dispersion autour de la moyenne

---

# <!--fit-->Une "réparation" simple: faire des sommes

$X_1$ et $X_2$ 2 v.a. indépendantes et identiquement distribuées (i.i.d.) avec paramètres $\theta_1$ et $\theta_2$. Alors la densité de la v.a. $Z=X_1+X_2$ est donnée par la convolution
$$
\begin{align}
 f_Z(z) &= \int_{-\infty}^\infty f_{X_1}(x_1) f_{X_2}(z - x_1)\,dx_1\\
   &= \int_0^z \theta_1 e^{-\theta_1 x_1} \theta_2 e^{-\theta_2(z - x_1)} \, dx_1 \\
   &= \theta_1 \theta_2 e^{-\theta_2 z} \int_0^z e^{(\theta_2 - \theta_1)x_1}\,dx_1 \\
   &= \begin{cases}
        \dfrac{\theta_1 \theta_2}{\theta_2-\theta_1} \left(e^{-\theta_1 z} - e^{-\theta_2 z}\right) & \text{ si } \theta_1 \neq \theta_2 \\[0.15cm]
        \theta^2 z e^{-\theta z} & \text{ si } \theta_1 = \theta_2 =: \theta
      \end{cases}
 \end{align}
 $$

---

# La distribution d'Erlang

Densité d'une distribution d'Erlang
$$
f(x; k,\lambda)={\lambda^k x^{k-1} e^{-\lambda x} \over (k-1)!},\quad x,\lambda \geq 0
$$
$k$ **paramètre de forme**, $\lambda$ **paramètre d'intensité** (parfois on utilise le **paramètre d'échelle** $\beta = 1/\lambda$)

Donc, si $\theta_1=\theta_2$, $Z=X_1+X_2$ a la distribution
$$
f_Z(z)=\theta^2e^{-\theta z}
$$
i.e., une Erlang avec paramètre de forme $k=2$ et paramètre d'intensité $\theta$

---

# On peut continuer

$X_i$, $i=1,\ldots,N$, des v.a. exponentielles i.i.d. de paramètre $\theta$

Alors 
$$
Z = \sum_{i=1}^N X_i
$$ 
est Erlang distribuée avec paramètre d'intensité $\theta$ et paramètre de forme $N$


---

# Propriétés de la distribution d'Erlang

Une Erlang est une Gamma avec un paramètre de forme $k\in\mathbb{N}$ et récupère donc les propriétés de la Gamma. Densité ($k$ paramètre de forme, $\lambda$ paramètre d'intensité):
$$
f(t; k,\lambda)={\lambda^k t^{k-1} e^{-\lambda t} \over (k-1)!},\quad t,\lambda \geq 0
$$


Moyenne $k/\lambda$, variance $k/\lambda^2$

Survie
$$
\mathcal{S}(t; k,\lambda) = 
\sum_{n=0}^{k-1}\frac{1}{n!}e^{-\lambda t}(\lambda t)^n
$$

---

# <!--fit-->Comment utiliser dans un modèle compartimental?

- Supposons un processus à modéliser avec une durée moyenne $1/\mu$
- Si on prend un compartiment
$$
X'=-\mu X
$$
- Temps moyen passé dans $X$ est $1/\mu$

---

- Supposons un processus à modéliser avec une durée moyenne $1/\mu$
- Si on prend $N$ compartiments avec temps moyen de résidence $1/\varepsilon$ dans chaque
$$
\begin{align}
X_1' &= -\varepsilon X_1\\
&\;\;\vdots \\
X_k' &= \varepsilon X_{k-1}-\varepsilon X_k \\
&\;\;\vdots \\
X_N' &= \varepsilon X_{N-1}-\varepsilon X_N
\end{align}
$$
- Temps moyen passé dans $X_i$ est $1/\varepsilon$
- Temps moyen passé dans l'ensemble des compartiments est $N/\varepsilon$

$\implies$ si on prend $N/\varepsilon=1/\mu$, on a la même moyenne mais le temps passé dans l'ensemble des compartiments est Erlang-distribué au lieu d'être exponentiellement distribué

---

![bg contain 98%](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/figure_residence_times_expo_Erlang_fr.png)

---

![width:1000px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/expo_vs_erlang.png)

---

<div style="width:100%; height:100%">
  <iframe src="https://daytah-or-dahtah.ovh:3838/Erlang_shiny/" style="position:absolute; top:0px; left:0px; 
  width:100%; height:100%; border: none; overflow: hidden;"></iframe>
</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Risques compétitifs

---

# <!--fit-->Contexte
![bg right:41%](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/figure_competing_risks_vertical.png)

On considère un système initialement dans un état $S_0$, et qui peut passer dans 2 états, $S_1$ ou $S_2$

Ce sont des **risques compétitifs**

---

# Taux de hasard (ou d'échec)

Le **taux de hasard** (ou **taux d'échec**) est
$$
\begin{align*}
h(t) &= \lim_{\Delta t\to 0}\frac{\mathcal{S}(t)-\mathcal{S}(t+\Delta t)}{\Delta t} \\
& = \lim_{\Delta t\to 0} \frac{\mathbb{P}( T<t+\Delta t | T\geq t)}{\Delta t} \\
&= \frac{f(t)}{\mathcal{S}(t)}
\end{align*}
$$

Donne la probabilité d'échec entre $t$ et $t+\Delta t$, sachant qu'on a survécu jusqu'à $t$

On a
$$
\tag{5}\label{eq:hazard_rate}
h(t)=-\frac{d}{dt}\ln\mathcal{S}(t)
$$

