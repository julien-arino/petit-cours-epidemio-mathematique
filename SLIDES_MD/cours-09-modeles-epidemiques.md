---
marp: true
title: Petit cours d'épidémiologie mathématique - Quelques modèles épidémiques
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 08 - Quelques modèles épidémiques
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

# Petit cours d'épidémiologie mathématique
# Quelques modèles épidémiques

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/github-icon.png)](https://github.com/julien-arino)

Department of Mathematics & Data Science Nexus
University of Manitoba*

<div style = "font-size:18px; margin-top:-10px; padding-bottom:30px;"></div>

Canadian Centre for Disease Modelling
Canadian COVID-19 Mathematical Modelling Task Force
NSERC-PHAC EID Modelling Consortium (CANMOD, MfPH, OMNI/RÉUNIS)

<div style = "text-align: justify; position: relative; bottom: -5%; font-size:18px;">
* The University of Manitoba campuses are located on original lands of Anishinaabeg, Cree, Oji-Cree, Dakota and Dene peoples, and on the homeland of the Métis Nation.</div>

---

# Extensions du modèle KMK

Beaucoup de travaux (en particulier depuis COVID-19) ont utilisé des modèles de type KMK

- Brauer. [The Kermack–McKendrick epidemic model revisited](https://doi.org/10.1016/j.mbs.2005.07.006) (2005)


---

<!-- _backgroundImage: "radial-gradient(white,80%,#f1c40f)" -->
# Plan du cours

- Modèles type SLIAR
- Un modèle $SL_1L_2I_1I_2A_1A_2R$ "simple" pour COVID-19
- Un modèle avec vaccination
- Exemples où la méthode ne marche pas

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Modèles type SLIAR

- Sans transmission par les individus latents
- Avec transmission par les individus latents

---

# Limitations du modèle KMK

SIR est un peu simple pour de nombreuses maladies:

- Pas de période d'incubation
- Beaucoup de maladies infectieuses (en particulier réspiratoires) ont des formes modérées et des formes graves, selon les individus

$\implies$ modèles avec SIR mais aussi L(atents) et (A)symptomatiques et dans lesquels I sont infectieux et symptomatiques

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

--- 

# The SLIAR model

- Paper we have already seen:
  - Arino, Brauer, PvdD, Watmough & Wu. [Simple models for containment of a pandemic](http://dx.doi.org/10.1098/rsif.2006.0112) (2006)
- However, suppose additionally that $L$ are also infectious

---

![width:1200px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/SLIAR_infectiousL.png)

---

Here, $\mathbf{S}=S$, $\mathbf{I}=(L,I,A)^T$ and $\mathbf{R}=R$, so $m=1$, $n=3$ and 
$$
\mathbf{h}=[\varepsilon\; 1\; \delta],
\quad
\mathbf{D}=1,
\quad 
\mathbf{\Pi}
=\begin{pmatrix}
1 \\ 0 \\0
\end{pmatrix}
\quad\text{and}\quad
\mathbf{V}=
\begin{pmatrix}
\kappa & 0 & 0 \\
-p\kappa & \alpha & 0 \\
-(1-p)\kappa & 0 & \eta
\end{pmatrix}
$$
Incidence is mass action so $\beta(\mathbf{E}_0)=\beta$ and thus
$$
\begin{align}
\mathcal{R}_0
&=
\beta\mathbf{h}\mathbf{V}^{-1}\mathbf{\Pi}\mathbf{D}\mathbf{S}_0 \\
&=
\beta\;
[\varepsilon\; 1\; \delta]
\begin{pmatrix}
1/\kappa & 0 & 0 \\
p/\alpha & 1/\alpha & 0 \\
(1-p)/\eta & 0 & 1/\eta
\end{pmatrix}
\begin{pmatrix}
1 \\ 0 \\0
\end{pmatrix}
S_0 \\
&=
\beta S_0\left(
\frac{\varepsilon}{\kappa}
+\frac{p}{\alpha}
+\frac{\delta(1-p)}{\eta}
\right)
\end{align}
$$

---

For final size, since $m=1$, we can use $\eqref{eq:final_size_m1}$:
$$
\ln\left(
\frac{S_0}{S_\infty}
\right)
=\frac{\mathcal{R}_0}{S_0}
(S_0-S_\infty)+\beta\mathbf{h}\mathbf{V}^{-1}\mathbf{I}_0
$$
Suppose $\mathbf{I}_0=(0,I_0,0)$, then
$$
\ln\left(
\frac{S_0}{S_\infty}
\right)
=\mathcal{R}_0\frac{S_0-S_\infty}{S_0}
+\frac{\beta}{\alpha}I_0
$$
If $\mathbf{I}_0=(L_0,I_0,A_0)$, then
$$
\ln\left(
\frac{S_0}{S_\infty}
\right)
=\mathcal{R}_0\frac{S_0-S_\infty}{S_0}
+\beta\left(
\frac{\varepsilon}{\kappa}
+\frac{p}{\alpha}
+\frac{\delta(1-p)}{\eta}
\right)L_0
+\frac{\beta\delta}{\eta}A_0
+\frac{\beta}{\alpha}I_0
$$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Un modèle $SL_1L_2I_1I_2A_1A_2R$ "simple" pour COVID-19

---

# <!--fit-->Example - $SL_1L_2I_1I_2A_1A_2R$ "simple" COVID-19 model

- Arino & Portet. [A simple model for COVID-19](http://dx.doi.org/10.1016/j.idm.2020.04.002) (2020)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Un modèle avec vaccination

---

# <!--fit-->Un modèle avec vaccination

Fraction $\gamma$ of $S_0$ are vaccinated before the epidemic; vaccination reduces probability and duration of infection, infectiousness and reduces mortality

$$
\begin{align}
S_U' &= -\beta S_U[I_U+\sigma_II_V] \\
S_V' &= -\sigma_S\beta S_V[I_U+\sigma_II_V] \\
L_U' &= \beta S_U[I_U+\sigma_II_V]-\kappa_UL_U\\
L_V' &= \sigma_S\beta S_V[I_U+\sigma_II_V]-\kappa_VL_V \\
I_U' &= \kappa_UL_U-\alpha_UI_U \\
I_V' &= \kappa_VL_V-\alpha_VI_V \\
R' &= f_U\alpha_UI_I+f_V\alpha_VI_V
\end{align}
$$
with $S_U(0)=(1-\gamma)S_0$ and $S_V(0)=\gamma S_0$

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/SLIR_epidemic_with_vaccination.png)

---

Here, $m=2$, $n=4$,
$$
\mathbf{h} = [0\;0\;1\;\sigma_I],\quad
\mathbf{D}=\begin{pmatrix}
1 & 0 \\ 0 & \sigma_S
\end{pmatrix},\quad
\mathbf{\Pi}=
\begin{pmatrix}
1 & 0 \\ 0 & 1 \\ 0 & 0 \\ 0 & 0
\end{pmatrix}
\quad\text{and}\quad
\mathbf{V}=
\begin{pmatrix}
\kappa_U & 0 & 0 & 0 \\
0 & \kappa_V & 0 & 0 \\
-\kappa_U & 0 & \alpha_U & 0 \\
0 & -\kappa_V & 0 & \alpha_V
\end{pmatrix}
$$
So
$$
\mathbf{\Gamma}=\left[
\frac{\beta}{\alpha_U}\; \frac{\sigma_I\sigma_S\beta}{\alpha_V}
\right],
\quad
\mathcal{R}_c = S_0\beta\left(
\frac{1-\gamma}{\alpha_U}+\frac{\sigma_I\sigma_S\gamma}{\alpha_V}
\right)
$$
and the final size relation is
$$
\begin{align}
\ln\left(
\frac{(1-\gamma)S_U(0)}{S_U(\infty)}
\right)
&= 
\frac{\beta}{\alpha_U}[(1-\gamma)S_U(0)-S_U(\infty)]
+\frac{\sigma_I\beta}{\alpha_V}[\gamma S_V(0)-S_V(\infty)]+\frac{\beta}{\alpha_U}I_0 \\
S_V(\infty) &= \gamma S_U(0)\left(
\frac{S_U(\infty)}{(1-\gamma)S_0}
\right)^{\sigma_S}
\end{align}
$$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Exemples où la méthode ne marche pas

---

# Where things go awry, final size-wise!

- Summer 2021 work of Aaron Shalev (U of M)
- Consider the very simple 2-patch metapopulation (see [Lecture 05](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_L05_MetapopulationModels.html))

$$
\begin{align*}
S_1' &= -\beta_1 S_1I_1 \\
I_1' &= \beta_1 S_1I_1-\gamma_1 I_1-m_{21}I_1 \\
R_1' &= \gamma_1I_1 \\
S_2' &= -\beta_2 S_2I_2 \\
I_2' &= \beta_2 S_2I_2-\gamma_2 I_2+m_{21}I_1 \\
R_2' &= \gamma_2I_2
\end{align*}
$$

- Unidirectional movement from patch 1 to patch 2
- $\mathbf{\beta}$ **cannot** be scalar-valued here!

