---
marp: true
title: Petit cours d'épidémiologie mathématique - Ajustement des paramètres
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 19 - Ajustement des paramètres
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

# Petit cours d'épidémiologie mathématique
# Ajustement des paramètres

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

- Principes généraux

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Principes généraux

---

# Example - Fitting to data

- Note that this is a super simplified version of what to do
- Much more elaborate procedures exist
  - Roda. [Bayesian inference for dynamical systems](https://doi.org/10.1016/j.idm.2019.12.007)
  - Portet. [A primer on model selection using the Akaike Information Criterion](https://doi.org/10.1016/j.idm.2019.12.010)
- Let us grab some epi data online and fit an SIR model to it
- Don't expect anything funky, as I said, this is the baby version
- Also, keep in mind that any identification procedure is subject to risks due to *identifiability issues*; see, e.g., Roda et al, [Why is it difficult to accurately predict the COVID-19 epidemic?](https://doi.org/10.1016/j.idm.2020.03.001)

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

- In epi data for infectious diseases, we typically have incidence, i.e., number of new cases per unit time
- In SIR model, this is $\beta SI$, so, if using incidence and Euclidean norm
$$
E(p)=\sum_{i=1}^N(\beta S(t_i)I(t_i)-y_i)^2
$$