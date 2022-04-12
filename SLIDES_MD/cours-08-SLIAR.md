---
marp: true
title: Petit cours d'épidémiologie mathématique - Le modèle SLIAR
description: Petit cours d'épidémiologie mathématique - Julien Arino - Cours 04 - Le modèle SLIAR, la taille finale d'une épidémie
theme: default
paginate: false
size: 4K
math: mathjax
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

# Petit cours d'épidémiologie mathématique - Le modèle SLIAR, la taille finale d'une épidémie

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/github-icon.png)](https://github.com/julien-arino)

Department of Mathematics & Data Science Nexus
University of Manitoba*

<div style = "font-size:18px; margin-top:-10px; padding-bottom:30px;"></div>

Canadian Centre for Disease Modelling
Canadian COVID-19 Mathematical Modelling Task Force
NSERC-PHAC EID Modelling Consortium (CANMOD, MfPH, OMNI/RÉUNIS)

<div style = "text-align: justify; position: relative; bottom: -5%; font-size:18px;">
* The University of Manitoba campuses are located on original lands of Anishinaabeg, Cree, Oji-Cree, Dakota and Dene peoples, and on the homeland of the Métis Nation.</div>

<style>
img[alt~="center"] {
  display: block;
  margin: 0 auto;
}
</style>

---

---

# Extensions of the KMK model

Many many works (especially since COVID-19) have used KMK-type models

- Brauer. [The Kermack–McKendrick epidemic model revisited](https://doi.org/10.1016/j.mbs.2005.07.006) (2005)
- Arino, Brauer, PvdD, Watmough & Wu. [Simple models for containment of a pandemic](http://dx.doi.org/10.1098/rsif.2006.0112) (2006), which we'll look into now
- Arino & Portet. [A simple model for COVID-19](http://dx.doi.org/10.1016/j.idm.2020.04.002) (2020)

---

# An extension of KMK - SLIAR models

SIR is a little too simple for many diseases:

- No incubation period
- A lot of infectious diseases (in particular respiratory) have mild and less mild forms depending on the patient

$\implies$ model with SIR but also L(atent) and (A)symptomatic individuals, in which I are now symptomatic individuals

Arino, Brauer, PvdD, Watmough & Wu. [Simple models for containment of a pandemic](http://dx.doi.org/10.1098/rsif.2006.0112) (2006)

---

![width:1200px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/SLIAR.png)

---

## Basic reproduction number
$$
\tag{5}
\mathcal{R}_0=S_0\beta
\left(
\frac{p}{\alpha}+\frac{\delta(1-p)}{\eta}
\right)
=\frac{S_0\beta\rho}{\alpha}
$$
where 
$$
\rho = \alpha
\left(
\frac{p}{\alpha}+\frac{\delta(1-p)}{\eta}
\right)
$$

## Final size relation

$$\tag{6}
S_0(\ln S_0-\ln S_\infty) =
\mathcal{R}_0(S_0-S_\infty)+\frac{\mathcal{R}_0I_0}{\rho}
$$

