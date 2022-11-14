---
marp: true
title: Petit cours d'épidémiologie mathématique - Fonctions d'incidence
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 05 - Fonctions d'incidence
theme: default
paginate: false
size: 16:9
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

<!-- _backgroundImage: "linear-gradient(to top, #85110d, 1%, white)" -->
# <!--fit-->Petit cours d'épidémiologie mathématique<br/>Le modèle SIS, le modèle de Kermack et McKendrick

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/github-icon.png)](https://github.com/julien-arino)

Department of Mathematics & Data Science Nexus
University of Manitoba*

<div style = "font-size:18px; margin-top:-10px; padding-bottom:30px;"></div>

Centre canadien de modélisation des maladies (CCDM/CCMM)
NSERC-PHAC EID Modelling Consortium (CANMOD, MfPH, OMNI/RÉUNIS)

<div style = "text-align: justify; position: relative; bottom: -5%; font-size:25px;">
* The University of Manitoba campuses are located on original lands of Anishinaabeg, Cree, Oji-Cree, Dakota and Dene peoples, and on the homeland of the Métis Nation.</div>

<style>
img[alt~="center"] {
  display: block;
  margin: 0 auto;
}
</style>

---

<!-- _backgroundImage: "radial-gradient(white,80%,#f1c40f)" -->
# Plan de ce cours

- Fonctions d'incidence

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Fonctions d'incidence

---

Avant de continuer, discutons un peu les **fonctions d'incidence**, qui décrivent la façon dont les contacts entre individus ont lieu et comment ils se traduisent en transmissions de la maladie

Voir en particulier McCallum, Barlow & Hone, [How should pathogen transmission be modelled?](https://doi.org/10.1016/S0169-5347(01)02144-9), Trends in Ecology & Evolution **16** (2001)

---

# <!--fit-->Remarque - Fonction d'incidence versus force d'infection

Deux formes différentes de la fonction représentant le taux de mouvement d'individus du compartiment $S$ vers les compartiments infectés:

- $S'=-f(S,I,N)$ est une **fonction d'incidence**
- $S'=-\lambda(S,I,N)S$ est une **force d'infection**

Les deux sont équivalentes, c'est le contexte qui tend à conduire au choix de la forme utilisée. Par exemple, les modèles en EDP structurés en âge d'infection doivent intégrer $I(t,a)$ sur l'âge et par conséquent utilisent fréquemment la force d'infection

---

# Interactions - Infection

- Le taux auquel des nouveaux cas apparaissent est la **fonction d'incidence**
$$
\tag{12}
f(S,I,N)
$$
- Depend du nombre $S$ de susceptibles, $I$ d'infectieux et parfois, de la population totale $N$
- Une fonction d'incidence inclut deux composantes:
  - un décompte du nombre de contacts ayant lieu
  - une description de la probabilité qu'un tel contact, quand il a lieu, entraîne la transmission du pathogène
- Le choix d'une bonne fonction est difficile et est probablement l'une des parties les plus "instables" dans la modélisation de la propagation des maladies infectieuses

---

# Les deux fonctions d'incidence les plus usitées

Les deux fonctions d'incidence les plus usitées sont   l'**incidence en action de masse**
$$\tag{13}
f(S,I)=\beta SI
$$
et l'**incidence standard** (ou **proportionnelle**)
$$\tag{14}
f(S,I)=\beta\frac{SI}{S+I}
$$

Dans les deux cas, $\beta$ est le **coefficient de transmission de la maladie**, bien que son interprétation exacte varie

---

# Des unités de $\beta$

Si $X(t)$ est la population du compartiment $X$ au temps $t$, alors $X'$ a pour unités $\text{nombre}/\text{temps}$

Dans une équation différentielle, les termes à gauche et à droite du signe $=$ doivent avoir les mêmes unités, donc..

### Incidence en action de masse

$$
\beta SI \propto 
\beta\times\text{nombre}\times\text{nombre}
$$
a pour unités nombre/temps si $\beta$ a pour unités $1/(\text{nombre}\times\text{temps})$

### Incidence standard

$$
\beta SI/N \propto 
\beta\times\text{nombre}\times\text{nombre}/\text{nombre} \propto \beta \times \text{nombre}
$$
a pour unités nombre/temps si $\beta$ a pour unités $1/\text{temps}$

---

# Mass action incidence

$$
\begin{equation}
\tag{13}\label{eq:incidence_mass_action}
f(S,I)=\beta SI
\end{equation}
 $$

- Le mélange des susceptibles et infectieux est homogène 
- Ceci est une hypothèse forte: le nombre de contacts est le produit du nombre de susceptibles et du nombre d'infectieux, donc chaque individu susceptible peut potentiellement rencontrer chaque individu infectieux

(d'où le nom, par analogie avec la dynamique des gas en chimie/physique) 

Quand la population est grande, cette hypothèse devient irréaliste

---

# Incidence standard (proportionnelle) 

Autre forme de fonction d'incidence très utilisée
$$
\begin{equation}
\tag{14}\label{eq:incidence_proportional}
f(S,I,N)=\beta\frac{SI}{N}
\end{equation}
$$

Chaque susceptible rencontre une fraction des infectieux

Ou vice-versa! Voir, p.ex., Hethcote, [Qualitative analyses of communicable disease models](https://doi-org.uml.idm.oclc.org/10.1016/0025-5564(76)90132-2), *Mathematical Biosciences* (1976)

Cas d'une population plus grande

---

# Population constante $\implies$ $\eqref{eq:incidence_mass_action}$ $\equiv$ $\eqref{eq:incidence_proportional}$

Quand la population totale est constante, bien des fonctions d'incidence sont équivalentes qualitativement (aux unités près)

Supposons que $N(t)\equiv N_0$, alors
$$
\beta SI = \tilde\beta\frac{SI}{N}
\iff \tilde\beta=N_0\beta
$$
et si le terme de droite est vrai, alors $\eqref{eq:incidence_mass_action}$ et $\eqref{eq:incidence_proportional}$ sont identiques

Rappelez-vous que les unités diffèrent, toutefois

---

# Incidence générale

$$
\tag{15}
f(S,I,N)=\beta S^q I^p
$$
Ces fonctions furent introduites avec pour but l'ajustement aux données: pour ajuster, cela ajoute deux paramètres $p,q$. On verra toutefois que bien du travail théorique utilise cette incidence

---

# Incidence avec refuge

Effet de refuge; une proportion $0<q<1$ de la population est vraiment susceptible, par exemple du fait d'hétérogénéités spatiales

$$
\tag{16}
f(S,I,N)=
\begin{cases}
\beta I\left(N-\dfrac Iq\right),&\textrm{si }I<qN \\
0,&\textrm{si }I\geq qN
\end{cases}
\qquad\qquad
$$


---

# Incidence binomiale négative

$$
\tag{17}
f(S,I,N)=kS\ln\left(1+\beta\frac Ik\right)
$$
Pour des petites valeurs de $k$, ceci décrit un processus d'infection très concentré, tandis que lorsque $k\to\infty$, on tend vers une incidence en action de masse

---

# Contact asymptotique

$$
\tag{18}
f(S,I,N)
=\frac{N}{1-\varepsilon+\varepsilon N}
\frac{F(S,I)}{N}
$$
où $F$ est l'une des fonctions déjà décrites

Quand $\varepsilon=0$, les contacts sont proportionnels à $N$, tandis que lorsque $\varepsilon=1$, les contacts sont indépendants de $N$

---

# Transmission asymptomatique 

$$
\tag{19}
f(S,I,N)
=\beta\frac{SI}{c+S+I}
$$
où $c$ est une constante. Par ex., 
$$
\frac{C(N)}N F(S,I)
$$
avec $C(N)=N/(1-\varepsilon+\varepsilon N)$ la fonction décrivant le taux de contact et $F(S,I)$ la fonction décrivant la propagation de la maladie, que l'on suppose ici être une incidence binomiale négative

---

# Incidence changeante

$$
\tag{20}
F(S,I,N) = 
\begin{cases}
\beta SI & \textrm{if }N\leq \hat N \\
\beta \dfrac{SI}{N} & \textrm{if }N> \hat N
\end{cases}
$$

<div style = "position: relative; bottom: -40%; font-size:20px;">

Arino & McCluskey, [Effect of a sharp change of the incidence function on the dynamics of a simple disease](https://doi.org/10.1080/17513751003793017), *Journal of Biological Dynamics* (2010)
</div>


