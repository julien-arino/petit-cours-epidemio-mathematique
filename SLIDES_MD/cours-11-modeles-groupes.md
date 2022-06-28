---
marp: true
title: Petit cours d'épidémiologie mathématique - Modèles de groupes
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 11 - Modèles de groupes
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
# Petit cours d'épidémiologie mathématique<br/>Modèles de groupes

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/github-icon.png)](https://github.com/julien-arino)

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

- Formulation de modèles de groupes
    - Modèles structurés en âge
    - Modèles incorporant une structure sociale
    - Modèles avec hétérogénéité du pathogène
- Analyse des modèles de groupes
- Simulation des modèles de groupes

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Formulation de modèles de groupes

---

# Limitations des modèles EDO pour une population

- Comme discuté dans le [Cours](https://julien-arino.github.io/petit-cours-epidemio-mathematique/2022_04_3MC_EpiModelling_L03_SpreadInGroups_SpreadInSpace.html), les modèles EDO élémentaires supposent que tous les individus dans un compartiment sont grosso modo les mêmes
- Les individus peuvent passer des temps différents dans un compartiment (voir le [Cours](https://julien-arino.github.io/petit-cours-epidemio-mathematique/2022_04_3MC_EpiModelling_L09_RecentMathematicalModels.html)), mais leurs caractéristiques sont plus ou moins les mêmes
- On a vu de façon flagrante avec COVID-19 que, par exemple, des groupes d'âge différents sont affectés différemment

---

# <!--fit-->Les groupes peuvent être utilisés pour bien des choses

Les groupes permettent d'introduire de la structure sans utiliser des EDP

- Structure d'âge
- Structure sociale
- Hétérogénéité du pathogène
- Hétérogénéité des hôtes (e.g., *super spreaders*)

Dans ce cours, on ne considère pas l'*hétérogénéité spatiale*, qui fait l'objet du [Cours 12](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-12-modeles-metapopulation.html)

On décrira peu l'analyse, qui est assez similaire à celle des métapopulations du [Cours 12](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-12-modeles-metapopulation.html), mais on montrera quelques exemples

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Modèles structurés en âge

---

# D'abord une remarque

En terme de modélisation, les EDO ne sont pas la meilleure façon d'incorporer l'âge, si l'âge doit évoluer pendant l'utilisation du modèle

Ce qui suit est une utilisation "propre" de l'âge en utilisant des EDP 

---

# <!--fit-->[A multi-group SIS model with age structure](https://doi.org/10.1016/j.jde.2004.10.009), par Feng, Huang & C$^3$

Pour $i=1,\ldots,n$ sous-groupes différents
$$
\begin{align*}
\left(
\frac{\partial}{\partial t}+\frac{\partial}{\partial a}
\right)S_i
&= 
-\mu_i(a)S_i(t,a)-\Lambda_i(a,I(t,\cdot))S_i(t,a)+\gamma_i(a)I_i(t,a) \\
\left(
\frac{\partial}{\partial t}+\frac{\partial}{\partial a}
\right)I_i
&= 
-\mu_i(a)I_i(t,a)+\Lambda_i(a,I(t,\cdot))S_i(t,a)-\gamma_i(a)I_i(t,a)
\end{align*}
$$
où
$$
\Lambda_i(a,I(\cdot,t)):=K_i(a)I_i(a,t)+\sum_{j=1}^n
\int_0^\omega K_{ij}(a,s)I_j(s,t)\ ds
$$

---

avec des conditions au bord et initiales, pour $i=1,\ldots,n$

$$
\begin{align*}
S_i(t,0) &= \int_0^\omega b_i(a)[S_i(t,a)+(1-q_i)I_i(t,a)]\ da \\
I_i(t,0) &= q_i\int_0^\omega b_i(a)I_i(t,a)\ da,\quad 0<q_1<1 \\
S_i(0,a) &= \psi(a) \\
I_i(0,a) &= \varphi(a)
\end{align*}
$$
($q_i$ fraction des nouveaux nés infectés)

Nombre de reproduction élémentaire dans le groupe $i=1,\ldots,n$
$$
\mathcal{R}_i = \int_0^\omega b_i(a)\exp\left(
-\int_0^a \mu_i(\tau)d\tau
\right)\ da
$$

---

- Les auteurs obtiennent des résultats de stabilité globale
- Ont besoin de simplifier pour avancer l'analyse
- Pas de numérique, le numérique peut être compliqué pour ce type de modèle

---

# Prennons la voie EDO

- Les EDO sont moins satisfaisantes que les EDP mais peuvent être utilisées en l'état et sont beaucoup plus faciles numériquement
- Un **bémol -** Comme discuté plus tôt, les modèles EDO avec structuration en âge sont *intrinsiquement faux*, puisque les temps de séjour dans les classes d'âge sont distribués exponentiellement plutôt que selon une Dirac ! (Voir le [Cours 05](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-05-temps-de-residence.html) sur les temps de résidence)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Modèles incorporant une structure sociale

---

# TB dans la population canadienne née à l'étranger

Preventing tuberculosis in the foreign-born population of Canada: a mathematical modelling study.  Varughese, Langlois-Klassen, Long, & Li. [International Journal of Tuberculosis and Lung Disease](https://doi.org/10.5588/ijtld.13.0625) **18** (2014)

- Les nouveaux immigrants au Canada viennent surtout de pays où la TB est très active
- Il est observé que les gens développent la TB active pendant les premières années de leur présence au CAN
- Veulent étudier ça, de même que l'effet de plusieurs politiques de test

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/VarugheseLangloisklassenLongLi-2014-TB-flow_diagram.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Modèles avec hétérogénéité du pathogène

---

# Importation d'un nouveau variant de SARS-CoV-2

[Risk of COVID-19 variant importation – How useful are travel control measures?](https://doi.org/10.1016/j.idm.2021.06.006) Arino, Boëlle, Milliken & Portet. *Infectious Disease Modelling* **6** (2021)

- Considère ce qui se passe quand un nouveau variant N arrive dans un lieu où un variant O est déjà en circulation

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/importation_model_2variants.jpg)

---

# Couplage par la force d'infection

- Pour le moment, on a discuté des *fonctions d'incidence* $f(S,I,N)$
- Ici, on utilise une *force d'infection* $\Phi_X$, pour $X\in\{O,N\}$
- Force d'infection met $S$ "hors" de la function: c'est la pression d'infection, qui s'applique aux individus susceptibles $S$ et provoque leur infection
- Bien entendu, les deux formes sont équivalentes, mais dans certains contextes, cela a plus de sens (e.g., modèles en EDP)
- Ici, pour $X\in\{O,N\}$
$$
\Phi_X = \beta_X(\eta_{X}L_{X_C2}+\xi_X(D_{X_C1}+D_{X_C2})+U_{X_C1}+U_{X_C2})
$$

---

# Ajoutons des groupes - La "couche d'importation"

- Comment évaluer la contribution des "importations" à la propagation dans un lieu ?
- Si un individu arrive dans un nouveau lieu en étant porteur de la maladie, on le place dans un groupe spécial, la *couche d'importation*
- Dans la couche d'importation, les individus sont en contact avec le reste de la population, mais ils restent dans ce groupe jusqu'à leur guérison ou leur mort
- C'est un artifice comptable utile !

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/importation_model_2variants_import_layer.jpg)

---

# Force d'infection avec couche d'importation

Pour $X\in\{O,N\}$
$$
\Phi_X = \Phi_{X_I}+\Phi_{X_I}
$$
where, for $X\in\{O,N\}$ and $Z\in\{I,C\}$

$$
\Phi_{X_Z} = \beta_X(\eta_{X}L_{X_Z2}+\xi_X(D_{X_Z1}+D_{X_Z2})+U_{X_Z1}+U_{X_Z2})
$$


---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Modèles avec composante immunologique

Global dynamics of a general class of multistage models for infectious diseases. Guo, Li & Shuai. [SIAM Journal on Applied Mathematics](https://doi.org/10.1137/110827028) **72** (2012)

- Les virus comme le VIH restent dans le corps pendant longtemps, potentiellement la vie entière
- Pendant le cours de ce séjour, la charge virale change et avec elle, les symptômes et l'infectiosité

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/GuoLiShuai-2012-multistage-flow_diagram.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Analyse des modèles de groupes

---

# Modèle de Guo, Li & Shuai

- Pour des considérations générales sur une méthodologie, voir Lu & Shuai, [Global-stability problem for coupled systems of differential equations on networks](https://doi.org/10.1016/j.jde.2009.09.003), *JDE* **248** (2010)
- Techniques utilisent une combinaise de théorie "classique" des EDO, de l'algèbre linéaire et de la théorie des graphes
- Ils montrent SAG quand $\mathcal{R}_0\leq 1$ et SAG sous conditions lorsque $\mathcal{R}_0>1$
- Utilisent fonction de Liapounoff $L=\sum_{i=1}^nw_iI_i$ pour l'ESM quand $\mathcal{R}_0\leq 1$
- Pour l'ÉÉ, utilisent une fonction de Liapounoff de type Goh
$$
V=\tau_1
\int_{S^*}^{S}
\dfrac{\Phi(\xi)-\Phi(S^*)}{\Phi(\xi)}d\xi
+\sum_{i=1}^n
\tau_i
\int_{I_i^*}^{I_i}
\dfrac{\psi(\xi)-\psi(I_i^*)}{\psi(\xi)}d\xi
$$
- Utilisent le "Kirchhoff’s matrix tree theorem" pour montrer que $V'$ est définie négative

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Simulation des modèles de groupes

---

- Activité similaire à la simulation des modèles en métapopulations. Décrit dans le [Cours 13](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-13-EDO-en-R.html)
- La simulation du modèle avec importation de variant sera discuté dans le [Cours 16](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-16-simulation-stochastique.html) sur la simulation des modèles stochastiques