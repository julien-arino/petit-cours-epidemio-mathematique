---
marp: true
title: Stochastic aspects in the spread of epidemics
description: 3MC Course Epidemiological Modelling - Julien Arino - Lecture 06 - Stochastic aspects in the spread of epidemics
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
# Plan du cours
- Quels types de systèmes stochastiques?

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Quels types de systèmes stochastiques?

---

# Chain binomial models

- Reed-Frost model from circa 1920
  - Infection spread from I individuals to others after adequate contact
  - Any S individual, after contact with an I individual in a given period, develops the infection and is infectious to others only within the following time period; in subsequent time periods, become R
  - Each individual has a fixed probability of coming into adequate contact with any other specified individual in the group within one time interval, and this probability is the same for every member of the group
  - Closed population
- Many variations since

---

# Discrete time Markov chains (DTMC)

- Will discuss later
- Equivalent of discrete time system but includes stochasticity
- Jump to next state depends only on current state(*memoryless property*)
- Easy to study using linear algebra

---

# Continuous time Markov chains (CTMC)

- Almost exact stochastic equivalent to ODE
- Conversion from ODE to CTMC and vice-versa is very easy for compartmental models
- Harder to study than DTMC but still quite amenable to analysis

---

# Branching processes

- Special case of CTMC .. or are CTMC special cases of BP?

---

# Stochastic differential equations

- Will confess some bias against these: "ODEs with noise added"

