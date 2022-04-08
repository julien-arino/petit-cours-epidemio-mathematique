---
marp: true
title: Petit cours d'épidémiologie mathématique - Le modèle SLIRS
description: Petit cours d'épidémiologie mathématique - Julien Arino - Cours 02 - Le modèle SIS, le modèle de Kermack et McKendrick, le modèle SIRS
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

# Petit cours d'épidémiologie mathématique - Le modèle SIS, le modèle de Kermack et McKendrick, le modèle SIRS

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

<!-- _backgroundImage: "radial-gradient(white,80%,#f1c40f)" -->
# Plan du cours

- Modèle SIS endémique
- Fonctions d'incidence
- Modèle SIR épidémique de Kermack et McKendrick
- Modèle SIRS endémique

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Modèle SIS endémique

---
 
- On considère une population close dans laquelle il n'y a ni naissance ni mort
- Supposons que les individus dans la population sont dans l'un de deux états:
  - **susceptibles** (à la maladie) s'ils ne sont pas en ce moment porteurs du pathogène
  - **infectieux** (et *infectés*) s'ils ont été infectés par la maladie et participent à sa propagation

$\implies$ il y a deux **compartiments** et le but de la modélisation est de décrire l'évolution du nombre d'individus dans chacun des compartiments

--- 
 
- $S(t)$ nombre de susceptibles au temps $t$
- $I(t)$ nombre d'infectieux/infectés au temps $t$
- $N(t)=S(t)+I(t)$ la population totale

Les hypothèses qui suivent décrivent une maladie pour laquelle la durée de la période d'incubation est très courte voire inexistante

On suppose aussi que l'infection ne persiste pas chez un individu et qu'aussitot après s'être remis, les individus sont de nouveau susceptibles

---

# Type de compartiments

## Individus susceptibles

- Nés au taux *per capita* $d$ proportionnel à la population totale $N$
- Meurent au taux *per capita* $d$, proportionnel à la population susceptible $S$
- Les nouveaux nés sont susceptibles (on ignore la *transmission verticale*)

## Individus infectieux

- Meurent au taux *per capita* $d$, proportionnel à la population infectieuse $I$
- Guérissent au taux *per capita* $\gamma$
- On ne considère pas la mortalité induite par la maladie

---

# Diagramme de flot du modèle

![width:1000px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/SIS.png)

---

# Le modèle

On utilise une fonction d'incidence standard (voir plus loin) et en balançant les flux entrant et sortant dans les deux compartiments, on obtient

$$
\begin{align}
S' &= \underbrace{bN}_\textrm{naissance}
-\underbrace{dS}_\textrm{mort} 
-\underbrace{\beta\frac{SI}{N}}_\textrm{infection}
+\underbrace{\gamma I}_\textrm{guérison}
\tag{1a}\label{sys:SIS_base_dS}\\
I' &= \underbrace{\beta\frac{SI}{N}}_\textrm{infection}
-\underbrace{dI}_\textrm{mort} 
-\underbrace{\gamma I}_\textrm{guérison} 
\tag{1b}\label{sys:SIS_base_dI}
\end{align}
$$

On considère le problème de Cauchy consistant en ce système auquel on adjoint les conditions initiales $S(0)=S_0\geq 0$ et $I(0)=I_0\geq 0$

---

# Remarques
 
- Dans ce qui suit, on suppose que $b=d$ pour que la population totale reste constante
- $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ est un modèle SIS (Susceptible-Infectieux-Susceptible)
- Si $\gamma=0$ (pas de guérison), le modèle est un modèle SI
  - Dans ce cas, un individu infectieux reste infectieux toute sa vie
- Des maladies présentant ce type de charactéristiques sont des maladies bactériennes telles que celles causées par  *staphylococcus aureus*, *streptococcus pyogenes*, *chlamydia pneumoniae* ou *neisseria gonorrhoeae*

---

# La naissance et la mort sont *relatives*

Les notions de *naissance* et *mort* se réfèrent à la population que l'on considère

Par exemple, supposons un modèle pour l'immunodéficience humaine (VIH) dans une population à risque d'utilisateurs de drogue administrées de façon intravéneuse. Dans ce cas 
- la naissance correspond au moment du début du comportement à risque
- la mort survient au moment où le comportement à risque cesse, que ce soit parce que l'individu meurt ou parce qu'il/elle cesse d'utiliser de la drogue

---

# Analyse du système

Système $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ est planaire nonlinéaire

En principe, on devrait appliquer les m\'ethodes usuelles dans le plan. 

Toutefois, il est ici possible de trouver une solution explicite

**NB:** Ceci est une illustration utile, mais est une exception!! Pratiquement aucun autre modèle que nous rencontrerons ne sera intégrable de cette façon

---

# Dynamique de $N$

On a
$$
\begin{align*}
N' &= (S+N)' \\
&= dN-dS\beta\frac{SI}{N}
+\gamma I+\beta\frac{SI}{N}-dI-\gamma I \\
&= dN-d(S+I) \\
&=0
\end{align*} 
$$
Par conséquent, pour tout $t$, $N(t)\equiv N_0:=S_0+I_0$

---

# Proportions

$$
s=\frac{S}{N}\quad\quad i=\frac{I}{N}
$$
Remarquons que $s+i=(S+I)/N=1$. La dérivée de $i$ est
$$
i' = \frac{I'N-IN'}{N^2}=\frac{I'}{N}-\frac{iN'}{N}
$$
Puisque $N'=0$, 
$$
i'=\frac{I'}{N}
$$
En substituant le coté droit de $\eqref{sys:SIS_base_dI}$ dans cette équation, on obtient
$$
\tag{2}\label{eq:SIS_proportion_di}
i'=\beta\frac{SI}{N^2}-d\frac{I}{N}-\gamma\frac{I}{N}=\beta si-(d+\gamma)i
$$

---

# Le système en proportions

Puisque $s+i=1$, on peut utiliser $s=1-i$ dans l'équation $\eqref{eq:SIS_proportion_di}$, ce qui donne $i'=\beta(1-i)i-(d+\gamma)i$. Par conséquent, le **système en proportions** est
$$
\begin{align}
s &= 1-i
\tag{3a}\label{sys:SIS_proportion_ds} \\
i' &= \beta(1-i)i-(d+\gamma)i 
\tag{3b}\label{sys:SIS_proportion_di}
\end{align}
$$

Puisque $N$ est constant, les solutions de $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ sont déduites directement de celles de $\eqref{sys:SIS_proportion_ds}$-$\eqref{sys:SIS_proportion_di}$ et on considère maintenant $\eqref{sys:SIS_proportion_ds}$-$\eqref{sys:SIS_proportion_di}$

---

Réecrivons $\eqref{sys:SIS_proportion_di}$ comme
$$
\begin{equation} 
\tag{4}\label{eq:SIS_i_as_Bernoulli}
i'-(\beta-(d+\gamma))i=-\beta i^2
\end{equation}
$$
Ceci est une équation de Bernoulli et le changement de variables $u=i^{-1}$ donne l'équation linéaire
$$
-u'-(\beta-(d+\gamma))u=-\beta
$$
Donc enfin
$$
\begin{equation}
\tag{5}\label{eq:SIS_true_Bernoulli}
u'+(\beta-(d+\gamma))u=\beta
\end{equation}
$$

---

Un facteur integrant est 
$$
\mu(t)=\exp\left(\int P(t)dt\right)=e^{(\beta-(d+\gamma))t}
$$
et par conséquent
$$
\mu(t)u=\frac{\beta}{\beta-(d+\gamma)}e^{(\beta-(d+\gamma))t}+C
$$
avec $C\in\mathbb{R}$, donc enfin
$$
u=\frac{\beta}{\beta-(d+\gamma)}+Ce^{-(\beta-(d+\gamma))t}
$$

---

La condition initiale $i_0=I_0/N$ prend la forme $u(0)=1/i_0$. Par conséquent,
$$
u(0)=\frac{1}{i_0}=\frac{\beta}{\beta-(d+\gamma)}+C
$$
ce qui implique que
$$
C=\frac{\beta-(d+\gamma)-i_0\beta}{i_0(\beta-(d+\gamma))}
$$

---

Par conséquent, la solution de $\eqref{eq:SIS_true_Bernoulli}$ est
$$
\begin{aligned}
u &= \frac{i_0\beta+(\beta-(d+\gamma)-i_0\beta)e^{-(\beta-(d+\gamma))t}}
{i_0(\beta-(d+\gamma))} \\
&= \frac{i_0\beta(1-e^{-(\beta-(d+\gamma))t})
  +(\beta-(d+\gamma))e^{-(\beta-(d+\gamma))t}}{i_0(\beta-(d+\gamma))}
\end{aligned}
$$
et celle de $\eqref{eq:SIS_i_as_Bernoulli}$ est
$$
i(t)=\frac{i_0(\beta-(d+\gamma))}{i_0\beta(1-e^{-(\beta-(d+\gamma))t})
  +(\beta-(d+\gamma))e^{-(\beta-(d+\gamma))t}}
$$

---

En résumé, la solution du système en proportions est donnée par
$$
s(t)=1-\frac{i_0(\beta-(d+\gamma))}{i_0\beta(1-e^{-(\beta-(d+\gamma))t})
  +(\beta-(d+\gamma))e^{-(\beta-(d+\gamma))t}}
$$
et
$$
i(t)=\frac{i_0(\beta-(d+\gamma))}{i_0\beta(1-e^{-(\beta-(d+\gamma))t})
  +(\beta-(d+\gamma))e^{-(\beta-(d+\gamma))t}}
$$

---

En observant ces solutions, on déduit deux cas: 
 
- Si $\beta-(d+\gamma)<0$, alors $\lim_{t\to\infty}e^{-(\beta-(d+\gamma))t}=+\infty$, donc $\lim_{t\to\infty}s(t)=1$ et $\lim_{t\to\infty}i(t)=0$
- Si $\beta-(d+\gamma)>0$, alors $\lim_{t\to\infty}e^{-(\beta-(d+\gamma))t}=0$; donc $\lim_{t\to\infty}s(t)=1-(\beta-(d+\gamma))/\beta$ et $\lim_{t\to\infty}i(t)=(\beta-(d+\gamma))/\beta$



---

# Le nombre de reproduction élémentaire $\mathcal{R}_0$

Reformulons le résultat en termes épidémiologiques en utilisant le **nombre de reproduction élémentaire**
$$
\mathcal{R}_0=\frac{\beta}{d+\gamma}
$$
On a alors les équivalences suivantes
$$
\begin{gathered}
\mathcal{R}_0< 1 \Leftrightarrow \beta-(d+\gamma)< 0 \\
\mathcal{R}_0>1 \Leftrightarrow \beta-(d+\gamma)>0
\end{gathered}
$$
Aussi,
$$
\frac{\beta-(d+\gamma)}{\beta}=1-\frac{1}{\mathcal{R}_0}
$$

---

On a prouvé le résultat suivant

<div class="theorem">

L'alternative suivante a lieu pour le système $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$
 
- Si $\mathcal{R}_0< 1$, alord
  - $\lim_{t\to\infty}s(t)=1$
  - $\lim_{t\to\infty}i(t)=0$, la maladie **s'éteint**
- Si $\mathcal{R}_0>1$, alors
  - $\lim_{t\to\infty}s(t)={1}/{\mathcal{R}_0}$
  - $\lim_{t\to\infty}i(t)=1-1/{\mathcal{R}_0}$, la maladie devient **endémique**
</div>

On dit que le modèle SIS est un *modèle endémique* du fait de la possibilité d'observer ce second équilibre

---
 
 # <!--fit-->Quelques remarques additionnelles au sujet de $\mathcal{R}_0$

- $\mathcal{R}_0$ determine la propension d'une maladie à s'établir dans une population
- Les politiques de contrôle ont par conséquent pour objecti de réduire $\mathcal{R}_0$ à des valeurs plus petites que 1
- La définition "verbale" de $\mathcal{R}_0$ est *le nombre moyen de cas secondaires d'infection produits par l'introduction d'un unique individu infectieux dans une population complètement naïve 
- Dans notre modèle, $1/(d+\gamma)$ est le temps moyen de séjour dans le compartiment $I$ avant de guérir ou de mourir et $\beta$ est la probabilité d'infection 

---

# Quelques valeurs de $\mathcal{R}_0$ (estimées)

| Maladie | Lieu | Période | $\mathcal{R}_0$ |
|:---|:---|:---|:---|
| Rougeole | Cirencester, Angleterre | 1947-50 | 13-14 |
|| Angleterre & Pays de Galle | 1950-68 | 16-18 |
|| Kansas, USA | 1918-21 | 5-6 |
|| Ontario, Canada | 1912-3 | 11-12 |
|| Willesden, Angleterre | 1912-3 | 11-12 |
|| Ghana | 1960-8 | 14-15 |
|| Est du Nigeria | 1960-8 | 16-17 |

---

# Méthode classique de calcul de $\mathcal{R}_0$
Pour simplifier, normalisons le SIS $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ à $N=1$ 
$$
\begin{align*}
S' &= d-dS-\beta SI+\gamma I \\
I' &= \beta SI-(d+\gamma)I 
\end{align*}
$$
DFE: $(\bar S,\bar I)=(1,0)$
$$
J_{DFE}=\begin{pmatrix}
-d & \gamma-\beta\bar S \\
\beta\bar I & \beta\bar S-(d+\gamma)
\end{pmatrix}
=
\begin{pmatrix}
-d & \gamma-\beta \\
0 & \beta-(d+\gamma)
\end{pmatrix}
$$
Let valeurs propres sont $-d<0$ et $\beta-(d+\gamma)$
$\Rightarrow$
Stabilité asymptotique locale de l'équilibre sans maladie (ESM) est déterminée par le signe de $\beta-(d+\gamma)$. On trouve donc le même $\mathcal{R}_0$ qu'auparavant

---

# Méthode plus efficace de calcul de $\mathcal{R}_0$

Diekmann & Heesterbeek, caracterisé dans le cas ODE par PvdD & Watmough (2002)

On considère seulement les compartiments $x$ avec des  *individus infectés* et écrivons
$$
x'=\mathcal{F}-\mathcal{V}
$$
 
- $\mathcal{F}$ entrée au sein des compartiments infectés du fait de nouvelles infections
- $\mathcal{V}$ contient tous les autres flux (attention au signe $-$)

On calcule les dérivées (de Frechet) $F=D\mathcal{F}$ et $V=D\mathcal{V}$ par rapport aux variables infectées $x$ (les Jacobiennes) et on évalue en l'ESM

Alors
$$
\mathcal{R}_0=\rho(FV^{-1})
$$
où $\rho$ est le rayon spectral


---

# Résultat de PvdD and Watmough (2002)

<div class="theorem">

Supposons que l'ESM existe et notons alors
$$
\mathcal{R}_0=\rho(FV^{-1})
$$
où les matrices $F$ et $V$ sont obtainues comme indiqué. Supposons que les conditions (A1) à (A5) soient satisfaites. Alors
- si $\mathcal{R}_0<1$, alors l'ESM est LAS
- si $\mathcal{R}_0>1$, alors l'ESM est instable
</div>

(Les conditions (A1)-(A5) sont explicitées dans le [TP 02](2022_04_3MC_EpiModelling_P02_Analysis_LargeScaleModels.html) et nous discutons de la raison pour il est important de vérifier ces conditions dans le [Cours](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_L09_RecentMathematicalModels.html))

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Fonctions d'incidence

---

Avant de continuer, discutons un peu les **fonctions d'incidence**, qui décrivent la façon dont les contacts entre individus ont lieu et comment ils se traduisent en transmissions de la maladie

Voir en particulier McCallum, Barlow & Hone, [How should pathogen transmission be modelled?](https://doi.org/10.1016/S0169-5347(01)02144-9), Trends in Ecology & Evolution **16** (2001)

---

# <!--fit-->Remarque - Fonction d'incidence versus force d'infection

Two different forms for the rate of movement of $S$ individuals from $S$ to whatever infected compartment they end up in:

- $S'=-f(S,I,N)$ is an **incidence function**
- $S'=-\lambda(S,I,N)S$ is a **force of infection**

The two are of course essentially equivalent, the context tends to drive the form used. Advanced PDE models that consider for instance an age-of-infection structure need to integrate over $I(t,a)$ and thus often use force of infection, others are somewhat random..

---

# Interactions - Infection

- Rate at which new cases appear per unit time is the *incidence function*
$$
\tag{7}
f(S,I,N)
$$
- Depends of the number $S$ of susceptible individuals, $I$ of infectious individuals and, sometimes, of the total population $N$
- Incidence includes two main components:
  - a denumeration of the number of contacts taking place
  - a description of the probability that such a contact, when it takes place, results in the transmission of the pathogen
- Choosing an appropriate function is hard and probably one of the flunkiest part of epidemic modelling

---

# Two most frequently used functions

The two most frequently used incidence functions are  **mass action incidence**
$$\tag{8}
f(S,I)=\beta SI
$$
and **standard** (or **proportional**) **incidence**
$$\tag{9}
f(S,I)=\beta\frac{SI}{S+I}
$$

In both cases, $\beta$ is the *disease transmission coefficient*

---

# Units of $\beta$

Recall that if $X(t)$ is the population in compartment $X$ at time $t$, then $X'$ has units $\text{number}/\text{time}$

In a differential equation, left and right hand side must have same units, so..

### Mass action incidence

$$
\beta SI \propto 
\beta\times\text{number}\times\text{number}
$$
has units number/time if $\beta$ has units $1/(\text{number}\times\text{time})$

### Standard incidence

$$
\beta SI/N \propto 
\beta\times\text{number}\times\text{number}/\text{number} \propto \beta \text{number}
$$
has units number/time if $\beta$ has units $1/\text{time}$

---

# Mass action incidence

$$
\begin{equation}
\tag{8}\label{eq:incidence_mass_action}
f(S,I)=\beta SI
\end{equation}
 $$

- There is homogenous mixing of susceptible and infectious individuals 
- Strong hypothesis: each individual potentially meets every other individual

In this case, one of the most widely accepted interpretations is that all susceptible individuals can come across all infectious individuals (hence the name, by analogy with gas dynamics in chemistry/physics) 

When population is large, the hypothesis becomes unrealistic

---

# Standard (proportional) incidence 

The other form used frequently:
$$
\begin{equation}
\tag{9}\label{eq:incidence_proportional}
f(S,I,N)=\beta\frac{SI}{N}
\end{equation}
$$

Each susceptible individual meets a fraction of the infectious individuals

Or vice-versa! See, e.g., Hethcote, [Qualitative analyses of communicable disease models](https://doi-org.uml.idm.oclc.org/10.1016/0025-5564(76)90132-2), *Mathematical Biosciences* (1976)

Case of a larger population

---

# Constant population $\implies$ $\eqref{eq:incidence_mass_action}$ $\equiv$ $\eqref{eq:incidence_proportional}$

When the total population is constant, a lot of incidence function are equivalent (to units)

Suppose $N(t)\equiv N_0$, then
$$
\beta SI = \tilde\beta\frac{SI}{N}
\iff \tilde\beta=N_0\beta
$$
and if the right hand side is satisfied, then $\eqref{eq:incidence_mass_action}$ and $\eqref{eq:incidence_proportional}$ identical

Keep in mind units are different, though

---

# General incidence

$$
\tag{10}
f(S,I,N)=\beta S^q I^p
$$
These functions were introduced with data fitting in mind: fitting to data, find the $p,q$ best matching the available data

---

# Incidence with refuge

The following implements a refuge effect; it assumes that a proportion $0<q<1$ of the population is truly susceptible, because of, e.g., spatial heterogenities

$$
\tag{11}
f(S,I,N)=
\begin{cases}
\beta I\left(N-\dfrac Iq\right),&\textrm{si }I<qN \\
0,&\textrm{si }I\geq qN
\end{cases}
\qquad\qquad
$$


---

# Negative binomial incidence

$$
\tag{12}
f(S,I,N)=kS\ln\left(1+\beta\frac Ik\right)
$$
For small values of $k$, this function describes a very concentrated infection process, while when $k\to\infty$, this function reduces to a mass action incidence

---

# Asymptotic contact

$$
\tag{13}
f(S,I,N)
=\frac{N}{1-\varepsilon+\varepsilon N}
\frac{F(S,I)}{N}
$$
where $F$ is one of the functions we just described

When $\varepsilon=0$, contacts are proportionnal to $N$, whereas when $\varepsilon=1$, contacts are independent from $N$

---

# Asymptomatic transmission

$$
\tag{14}
f(S,I,N)
=\beta\frac{SI}{c+S+I}
$$
where $c$ is a constant. E.g., 
$$
\frac{C(N)}N F(S,I)
$$
with $C(N)=N/(1-\varepsilon+\varepsilon N)$ the function describing the contact rate and $F(S,I)$ the function describing disease spread, assumed here to be of negative binomial incidence-type

---

# Switching incidence

Arino & McCluskey, [Effect of a sharp change of the incidence function on the dynamics of a simple disease](https://doi.org/10.1080/17513751003793017), *Journal of Biological Dynamics* (2010)

Scale population so switch occurs at $N=1$ and suppose
$$
\tag{15}
F(S,I,N) = 
\begin{cases}
\beta SI & \textrm{if }N\leq 1 \\
\beta \dfrac{SI}{N} & \textrm{if }N> 1
\end{cases}
$$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Modèle SIR épidémique de Kermack et McKendrick

---

# This is a particular case!

K-MK formulated the model that follows in a much more general work

Really worth taking a look at this series of papers!
- Kermack & McKendrick. [A contribution to the mathematical theory of epidemics](https://doi.org/10.1098/rspa.1927.0118) (1927)

---

# <!--fit-->The underlying question - What is the *size* of an epidemic?

- Suppose we consider the occurrence of an epidemic peak
  - Does it always take place?
  - When it occurs, how bad is it?
  - If an epidemic moves through a population, is everyone infected?

---

# The SIR model without demography

- The time interval under consideration is sufficiently small that demography can be omitted (we say there is *no vital dynamics*)
- Individuals in the population can be susceptible ($S$) or infected and infectious with the disease ($I$). Upon recovery or death, they are *removed* from the infectious compartment ($R$)
- Incidence is mass action $\beta SI$

Consider the following model, usually called the Kermack-McKendrick model
$$
\begin{align}
S' &= -\beta SI \tag{1a}\label{sys:KMK_dS} \\
I' &= (\beta S-\gamma)I  \tag{1b}\label{sys:KMK_dI} \\
R' &= \gamma I  \tag{1c}\label{sys:KMK_dR}
\end{align}
$$

---

# Reducing the problem

3 compartments, but inspection shows that *removed* individuals do not influence the dynamics of $S$ or $I$

Furthermore, total population $N=S+I+R$ satisfies
$$
N'=(S+I+R)'=0
$$
so $N$ is constant and dynamics of $R$ can deduced from that of $R=N-(S+I)$

So now consider
$$
\begin{align}
S' &= -\beta SI \tag{2a}\\
I' &= (\beta S-\gamma)I  \tag{2b}
\end{align}
$$

---

# Equilibria


Consider the equilibia of
$$
\begin{align}
S' &= -\beta SI \tag{2a}\label{sys:KMK_2d_dS} \\
I' &= (\beta S-\gamma)I  \tag{2b}\label{sys:KMK_2d_dI}
\end{align}
$$

From $\eqref{sys:KMK_2d_dI}$
- either $\bar S=\gamma/\beta$
- or $\bar I=0$

Substitute into $\eqref{sys:KMK_2d_dS}$
- in the first case, $(\bar S,\bar I)=(\gamma/\beta,0)$
- in the second case, any $\bar S\geq 0$ is an equilibrium (*continuum* of EP)

Second case is a **problem**: usual linearisation does not work as EP are not isolated! (See [Practicum 02](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_P02_Analysis_LargeScaleModels.html))


---

# Workaround - Study $dI/dS$

What is the dynamics of $dI/dS$? We have
$$
\tag{3}\label{eq:KMK_dI_over_dS}
\frac{dI}{dS}
=\frac{dI}{dt}\frac{dt}{dS}
=\frac{I'}{S'}
=\frac{\beta SI-\gamma I}{-\beta SI}
=\frac{\gamma}{\beta S}-1
$$
provided $S\neq 0$

**Careful!** Remember that $S$ and $I$ are $S(t)$ and $I(t)$.. equation $\eqref{eq:KMK_dI_over_dS}$ thus describes the relationship between $S$ and $I$ along solutions to the original ODE $\eqref{sys:KMK_2d_dS}$-$\eqref{sys:KMK_2d_dI}$

---

We can integrate equation $\eqref{eq:KMK_dI_over_dS}$, giving trajectories in phase space
$$
I(S)=\frac\gamma\beta \ln S-S+C
$$
with $C\in\mathbb{R}$

The initial condition $I(S_0)=I_0$ gives $C=S_0+I_0-\frac \gamma\beta \ln S_0$, and the solution to $\eqref{sys:KMK_dS}$-$\eqref{sys:KMK_dR}$ is thus, as a function of $S$,
$$
\begin{align*}
I(S)&=S_0+I_0-S+\frac\gamma\beta \ln \frac S{S_0} \\
R(S)&=N-S-I(S)=R_0-\frac\gamma\beta \ln \frac S{S_0}
\end{align*}
$$

---

Trajectories in phase plane $(S,I)$ corresponding to IC $(S_0,1-S_0)$ and $\beta/\gamma=2.5$

![width:1200px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/KMK_planar_trajectories.png)

---

# The basic reproduction number $\mathcal{R}_0$

Suppose total population $N$ is normalised, i.e., $N=1$. Then $R=1-(S+I)$

Define
$$
\begin{equation}\label{eq:R0_KMK}\tag{4}
\mathcal{R}_0=\frac{\beta}{\gamma}
\end{equation}
$$


---

<div class="theorem">

Let $(S(t),I(t))$ be a solution to $\eqref{sys:KMK_dS}$-$\eqref{sys:KMK_dR}$ in proportions and $\mathcal{R}_0$ be defined as in $\eqref{eq:R0_KMK}$. If $\mathcal{R}_0
S_0\leq 1$, then $I(t)$ tends to 0 when $t\to\infty.$ If $\mathcal{R}_0
S_0>1$, then $I(t)$ first reaches a maximum 
$$
1-\frac 1{\mathcal{R}_0}-\frac{\ln(\mathcal{R}_0 S_0)}{\mathcal{R}_0}
$$
then tends to 0 when $t\to\infty$

The proportion $S(t)$ of susceptibles is a nonincreasing function and its limit $S(\infty)$ is the unique solution in $(0,1/\mathcal{R}_0)$ of the equation 
$$
1-S(\infty)+\frac{\ln[S(\infty)/S_0]}{\mathcal{R}_0}=0
$$
</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->SLIAR extension of the KMK model

---

# Summary thus far
- An SIS *endemic* model in which the threshold $\mathcal{R}_0=1$ is such that when $\mathcal{R}_0<1$, the disease goes extinct, whereas when $\mathcal{R}_0>1$, the disease becomes established in the population
- An SIR *epidemic* model (the KMK SIR) in which the presence or absence of an epidemic wave is characterised by the value of $\mathcal{R}_0$
- Both the KMK SIR and the SIS are integrable in some sense. **This is an exception!!!**