---
marp: true
title: Petit cours d'épidémiologie mathématique - Types de modèles stochastiques utilisés en épidémiologie
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 14 - Types de modèles stochastiques utilisés en épidémiologie
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

# Petit cours d'épidémiologie mathématique<br/>Types de modèles stochastiques utilisés en épidémiologie

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
- Motivation de la stochasticité
- Quels types de systèmes stochastiques ?

--- 

# Remarque - Remerciement

Certains des transparents ici sont inspirés de transparents que Linda Allen (Texas Tech) m'a donné il y a quelques années. Je recommende les livres et articles de Linda pour plus de détails

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Motivation de la stochasticité

---

# Modèle SIS sans démographie

Population totale constante $P^\star$

<span style="display: block; margin-left: auto; margin-right: auto; width: 25%">![width:400px](figure_SIS_base_no_demography.png)</span>

Nombre de reproduction élémentaire:
$$\mathcal{R}_0 = \dfrac{\beta}{\gamma}P^\star$$

---

# Dans le monde déterministe, $\mathcal{R}_0$ fait la loi

- Si $\mathcal{R}_0=\beta P^\star/\gamma<1$, la maladie s'éteint (*ESM*)
- Si $\mathcal{R}_0>1$, la maladie converge vers un équilibre *endémique*
$$
I^\star=P^\star-\gamma/\beta=(1-1/\mathcal{R}_0)P^\star
$$

Transparents suivants: $P^\star = 100$K, $\gamma=1/5$, $\mathcal{R}_0=\{0.8,1.5,2.5\}$ (et $\beta=\gamma \mathcal{R}_0/P^\star$)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/stochastic/ODE_SIS.png)

---

# <!--fit-->Dans le monde stochastique, $\mathcal{R}_0$ fait la loi ? ($\mathcal{R}_0=1.5$)

![height:600px center](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/stochastic/several_CTMC_sims.png)

---

# <!--fit-->Lorsque $I_0=2$, les extinctions arrivent assez fréquemment

![height:600px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/stochastic/extinctions_fct_R0.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Quels types de systèmes stochastiques ?

---

# Modèles de chaines binomiales

- Modèle de Reed-Frost (circa 1920)
  - Infection propagée des individus I vers les autres après contact approprié
  - Tout individu S, après contact avec un individu I dans une période donnée, développe une infection et est infectieux pour les autres seulement dans la période de temps suivante; dans la période suivante, devient R
  - Chaque individu a une probabilité donnée d'entrer en contact avec n'importe quel autre individu dans le groupe par intervalle de temps, et cette probabilité est la même pour tout membre du groupe
  - Population close
- Nombreuses variations et améliorations depuis

---

# Chaînes de Markov en temps discret (CMTD)

- Présenté en détail dans le [Cours 15](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-15-modeles-MC.html) et, numériquement, le [Cours 16](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-16-simulation-stochastique.html)
- Équivalent des systèmes en temps discret mais incluent de la stochasticité
- Saut vers le prochain état dépend seulement de l'état actuel (le système n'a pas de *mémoire*)
- Facile à étudier en utilisant l'algèbre linéaire

---

# Chaînes de Markov en temps continu (CMTC)

- Équivalent stochastique presque exact des EDO
- Conversion des ODE vers les CMTC et vice-versa très simple pour les modèles compartimentaux
- Plus difficiles à étudier que les CMTD mais quand même assez faciles

---

# Processus de branchement

- Cas particulier des CMTC

---

# Équations différentielles stochastiques

- Je vais confesser un certain biais contre les EDS: EDO avec du bruit ajouté, pas grand chose de plus

