---
marp: true
title: Petit cours d'épidémiologie mathématique - Modèles en réseaux
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 17 - Modèles en réseaux
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

# Modèles en réseaux

6 April 2022 

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

- Pourquoi des modèles en réseaux
- Les réseaux sociaux
- Cadre général des modèles en réseaux
- La librairie EpiModel

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Pourquoi des modèles en réseaux

---

# Comprendre les processus de contact

- Les modèles classiques permettent une certaine flexibilité (voir par exemple la section dans le [Cours 04](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-04-modeles-SIS-SIR.html) sur les fonctions d'incidence ou le [Cours 11](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-11-modeles-groupes.html) sur les modèles de groupes), mais cela reste limité et une approximation
- De la même manière que les modèles agents ([Cours 18](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-18-modeles-agents.html)), les modèles en réseaux sont considérés pour rendre plus réaliste la description des processus de contact dans la transmission des agents pathogènes

---

# La vie humaine s'organise en réseaux

- Famille
- Cercles d'amis
- Réseau professionel
- ...
- Théorie des réseaux sociaux existe et est utilisée depuis des années, par exemple dans le cadre professionnel (e.g., comment fluidifier les interactions dans une entreprise)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Les réseaux sociaux

---

- Avant de considérer des épidémies dans des réseaux, quelques notions de réseaux sociaux, parce que c'est utile de façon générale pour comprendre les réseaux
- Les méthodes en réseaux sociaux introduisent des mesures qui permettent d'évaluer certaines propriétés des graphes et qui sont utiles à connaître
- Un réseau est un graphe (mathématique), orienté ou non, dans lequel les arcs représentent les connections (quelles qu'elles soient) entre les individus, qui sont les nœuds du graphe

---

# Contexte

- $\mathcal{G}(\mathcal{V},\mathcal{A})$ un graphe, orienté ou non (on fera la distinction lorsque c'est nécessaire)
- $\mathcal{V}$ l'ensemble des nœuds (*vertices* en anglais)
- $\mathcal{A}$ l'ensemble des arcs, i.e., les liens entre nœuds. En anglais, on distingue *arcs* dans le cas orienté et *edges* dans le cas non orienté


---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Cadre général des modèles en réseaux

---

- Voir par exemple Keeling & Eames, [Networks and epidemic models](https://doi.org/10.1098/rsif.2005.0051), 2005

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->La librairie EpiModel

<div style = "text-align: justify; position: relative; bottom: -35%; font-size:18px;">

Jenness SM, Goodreau SM and Morris M. [EpiModel: An R Package for Mathematical Modeling of Infectious Disease over Networks](https://doi.org/10.18637%2Fjss.v084.i08). Journal of Statistical Software. 2018; 84(8): 1-47
</div>

---

# EpiModel

- Librairie R qui fournit des outils pour simuler et analyser des modèles épidémiologiques en réseaux
- Fournissent deux types d'approches:
  - Simulation des modèles compartimentaux EDO (pas très intéressant)
  - Simulation des modèles réseaux
- Leur [site web](https://www.epimodel.org) contient quelques tutoriaux utiles
- Fait partie de la méta-librairie [statnet](http://statnet.org/)