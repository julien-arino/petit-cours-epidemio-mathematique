---
marp: true
title: Petit cours d'épidémiologie mathématique - Ajustement des paramètres
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 21 - Ajustement des paramètres
theme: default
paginate: false
math: mathjax
size: 16:9
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
# Petit cours d'épidémiologie mathématique<br/>Ajustement des paramètres

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

- Principes généraux
- Problème de l'identifiabilité des paramètres

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Principes généraux

---

# Example - Ajuster un modèle aux données

- Ceci est une version très simplifiée de ce qu'on fait en pratique
- Il existe des procédures bien plus élaborées
  - Roda. [Bayesian inference for dynamical systems](https://doi.org/10.1016/j.idm.2019.12.007)
  - Portet. [A primer on model selection using the Akaike Information Criterion](https://doi.org/10.1016/j.idm.2019.12.010)
- On va récuperer des données en ligne et ajuster un modèke SIR dessus
- Don't expect anything funky, as I said, this is the baby version

---

# Principe

- Les données consistent en un ensemble de points $(t_i,y_i)$, $i=1,\ldots,N$, où $t_i\in\mathcal{I}$, un intervalle
- Solution de l'EDO est $(t,x(t))$ pour $t\in\mathcal{I}$
- Supposons que les paramètres du modèle sont $p\in\mathcal{P}$
- On veut minimiser la fonction d'erreur
$$
E(p) = \sum_{i=1}^N \|x(t_i)-y_i\|
$$
- La norme est typiquement la norme euclidienne, mais pourrait être différente en fonction des objectifs
- Étant donné un point $p$ dans (une partie admissible de) l'espace des paramètres, on calcule la solution de l'EDO, ce qui permet ensuite de calculer $E(p)$
- En utilisant un algorithme de minimisation, on cherche un minimum de $E(p)$ en faisant varier $p$

---

# Que valent $y_i$ et $x(t_i)$ ici?

- Dans les données pour les maladies infectieuses, on a typiquement l'incidence, i.e., le nombre de nouveaux cas pas unité de temps
- Dans un modèle SIR, l'incidence est $\beta SI$, donc, si on utilise une incidence en en action de masse et la norme euclidienne
$$
E(p)=\sum_{i=1}^N(\beta S(t_i)I(t_i)-y_i)^2
$$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Problème de <br>l'identifiabilité<br> des paramètres

Roda et al, [Why is it difficult to accurately predict the COVID-19 epidemic?](https://doi.org/10.1016/j.idm.2020.03.001)

---

- On a vu que l'on cherche $p$ qui minimise la fonction d'erreur
$$
E(p) = \sum_{i=1}^N \|x(t_i)-y_i\|
$$
- Il est tout à fait possible (et même probable) que plusieurs valeurs de $p$ minimisent la fonction d'erreur
- Il est aussi possible que l'on trouve plusieurs valeurs de $p$ minimisant $p$ sans être assuré qu'il s'agit d'un minimum global
- Ces problèmes sont liés à ce que l'on appelle l'**identifiabilité**