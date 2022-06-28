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

- $\mathcal{G}(\mathcal{V},\mathcal{E})$ un graphe non orienté
- $\mathcal{D}(\mathcal{V},\mathcal{A})$ un digraphe (graphe orienté)
- $\mathcal{V}$ l'ensemble des nœuds (*vertices* en anglais)
- $\mathcal{E}$ l'ensemble des arcs dans le cas non orienté (*edges* en anglais)
- $\mathcal{A}$ l'ensemble des arcs dans le graphe orienté (*arcs* en anglais)

---

# Exemple du réseau de transport aérien

- Je vais illustrer avec des données du réseau de transport aérien mondial
- Données assez bonnes (très bonnes parfois), et un avantage flagrant:
  - Quand un avion part de quelque part et arrive ailleurs, c'est quelque chose d'assez .. déterministe

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/world_graph-degree.png)


---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/Manitoba_network_schema_planar_oriented.png)


---

# Densité du graphe

Un graph (resp. digraphe) est **complet** si toute paire de nœuds est connecté (resp. est connecté par un arc dans chaque direction)

S'il y a $n=|\mathcal{V}|$ nœeuds dans le graphe, alors il y a $n(n-1)/2$ (resp. $n(n-1)$) arcs dans le graphe (resp. digraphe) complet

(On ne compte pas les connections d'un nœud sur lui même)

Densité de $\mathcal{G}$ (graphe non orienté)
$$
\mathsf{dens}_\mathcal{G}=\frac{2\ |\mathcal{E}|}{n(n-1)}
$$
Densité de $\mathcal{D}$ (graphe orienté)
$$
\mathsf{dens}_\mathcal{D}=\frac{|\mathcal{A}|}{n(n-1)}
$$

---

# Densité des digraphes considérés

| Digraphe | # nœuds | # arcs | densité |
|----------|:-------:|:------:|:-------:|
| Manitoba | 24 | 64 | 0.1159 |
| Canada | 222 | 804 | 0.0164 |
| Amérique du Nord | 934 | 7,814 | 0.009 |
| Global | 3403 | 32,576 | 0.0028 |

---

# Degré

**Degré** $d_\mathcal{G}(v)$ du nœud $v\in\mathcal{V}$ dans $\mathcal{G}$: nombre d'arcs incidents à $v$

**Degré entrant** $d^-_\mathcal{D}(v)$ du nœud $v\in\mathcal{V}$ dans $\mathcal{D}$: nombre d'arcs avec tête $v$

**Degré sortant** $d^+_\mathcal{D}(v)$ du nœud $v\in\mathcal{V}$ dans $\mathcal{D}$: nombre d'arcs avec queue $v$

**Degré** $d_\mathcal{D}(v)$ du nœud $v\in\mathcal{V}$ dans $\mathcal{D}(\mathcal{V},\mathcal{A})$: nombre d'arcs incidents à $v$ dans le graphe non orienté sous-jacent $\mathcal{G}$ de $\mathcal{D}$ (où tout arc est considérée comme un arc "bidirectionnel")

---

# Degré entrant global du réseau de transport aérien

| Ville | Pays | Degré entrant | Rang |
|------|---------|:----------:|:----:| 
| Londres | GB | 365 | 1 |
| Paris | France | 294 | 2 |
| Frankfurt | Allemagne | 287 | 3 |
| Atlanta | USA | 249 | 4 |
| New York | USA | 241 | 5 |
| Moscou | Russie | 225 | 6 |
| Amsterdam | Pays-Bas | 204 | 7 |
| Chicago | USA | 203 | 8 |
| Munich | Allemagne | 200 | 9 |
| Milan | Italie | 181 | 10 |

---

# Le degré change pendant l'année 

Les graphes sont dynamiques !

![bg right:72%](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/IATA_outdegree_YEA_2005_to_2010.png)


---

# Plus court chemin

Soit $\mathcal{D}$ un digraphe. Le (ou les) plus court(s) chemin(s) de $i$ à $j$ dans $\mathcal{V}$:
$$
d_\mathcal{D}(i,j)=\min_{p\in\mathcal{P}(i,j)} f(p)
$$
où $\mathcal{P}(i,j)$ est l'ensemble des chemins de $i$ à $j$ et $f(p)$ est un valuation des arcs dans le chemin $p$. On définit $d_\mathcal{D}(i,j)=\infty$ s'il n'existe pas de chemin de $i$ à $j$ 

$f(p)$ peut être
- le nombre d'arcs dans $p$ de $i$ à $j$ (**distance géodésique**)
- Distance du grand cercle des arcs de $p$
- durée des vols des arcs de $p$

---

# Excentricité

**Excentricité** (ou **nombre de Köonig**) du nœud $v\in\mathcal{V}$ dans $\mathcal{G}(\mathcal{V},\mathcal{E})$
$$
e(v)=\max_{v'\in\mathcal{V}}d_\mathcal{D}(v,v')
$$
**Excentricité entrante** du nœud $v\in\mathcal{V}$ dans $\mathcal{D}(\mathcal{V},\mathcal{A})$
$$
e^-(v)=\max_{v'\in\mathcal{V}}d_\mathcal{D}(v',v)
$$
**Excentricité sortante** du nœud $v\in\mathcal{V}$ dans $\mathcal{D}(\mathcal{V},\mathcal{A})$
$$
e^+(v)=\max_{v'\in\mathcal{V}}d_\mathcal{D}(v,v')
$$

---

| Graphe | $e^-(YWG)$ | $e^+(YWG)$ |
|--------|------------|------------|
| Manitoba | 2 | 3 (Lynn Lake) |
| Canada | 7 $^{(*)}$ | 7 $^{(*)}$ |
| Amérique du Nord | 7 $^{(**)}$| 8 (Stony River) |
| Global | 7 $^{(***)}$ | 8 (Stony River) |

| <!-- --> | <!-- --> |
|---|---|
| ( * ) | Peawanuck (ON), Port Hope Simpson (NL) |
( ** ) | ( * ) + Lopez Island, Kwethluk, Chuathbaluk |
( *** ) | ( ** ) + Hooker Creek, Birdsville, Beni, Balalae, Thargomindah |

---

# Rayon

**Rayon** de $\mathcal{G}$
$$
\rho_\mathcal{G}=\min_{v\in\mathcal{V}}e(v)
$$
**Rayon entrant** de $\mathcal{D}$
$$
\rho_\mathcal{D}^-=\min_{v\in\mathcal{V}}e^-(v)
$$
**Rayon sortant** de $\mathcal{D}$
$$
\rho_\mathcal{D}^+=\min_{v\in\mathcal{V}}e^+(v)
$$

rayon = $\min(\max(\cdot))$ $\rightarrow$ directionalité

---

# Rayon du réseau de transport aérien

| Graphe | $\rho^-$ | $\rho^+$ |
|--------|----------|----------|
| Manitoba | 2 | 3 |
| Canada | 6 | 6 |
| Amérique du Nord | 6 | 7 |
| Global | 7 | 7 |


---

# Centre d'un graphe

**Centre** de $\mathcal{D}$:
$$
\mathcal{C}_\mathcal{D}=\left\{v\in\mathcal{V}:e(v)=\rho_\mathcal{D}\right\}
$$

---

# Centre du réseau de transport aérien

| Graphe | $\mathcal{C}^-$ | $\\\|\mathcal{C}^-\\\|$ | $\mathcal{C}^+$ | $\\\|\mathcal{C}^+\\\|$ |
|---|---|---|---|---|
| Manitoba | 2 | 1 (YWG) | 3 | 7 |
| Canada | 6 | 1 (YTO) | 6 | 1 (YTO) |
| Amérique du Nord | 6 | 1 (YTO) | 7 | 18 |
| Global | 7 | 131 | 7 | 20 |

$\{$YYC,YEA,Halifax,Kelowna,Moncton,YMQ,YOW,Quebec,St John's,YTO,YVR, Victoria,YWG$\}\subset\mathcal{C}^-$

$\{$Toronto,Vancouver$\}\subset\mathcal{C}^+$

---

# Diamètre

**Diamètre** de $\mathcal{D}$
$$
\mathsf{diam}_\mathcal{D}=\max_{v\in\mathcal{V}}e(v)
$$

diamètre = max(max(.)) $\rightarrow$ pas de directionalité

---


Graphe | Diamètre |
|------|:--------:|
| Manitoba | 5 |
| Canada | 12 |
| Amérique du Nord | 13 |
| Global | 13 |


---

# Péripherie d'un graphe

**Péripherie** de $\mathcal{D}$ 
$$
\mathcal{P}_\mathcal{D}=\left\{v\in\mathcal{V}:e(v)=\mathsf{diam}_\mathcal{D}\right\}
$$

---

| Graphe | Péripherie entrante | Péripherie sortante |
|--------|---------------------|---------------------|
| Manitoba | Lynn Lake | Cross Lake, Red Sucker Lake, Brandon |
| Canada | Peawanuck | Peawanuck, Port Hope Simpson | Port Hope Simpson |
| Amérique du Nord | Stony River | Peawanuck, Port Hope Simpson |
| Global | Stony River, Hooker Creek, Peawanuck | Hooker Creek, Beni, Peawanuck, Port Hope Simpson |

---

# Bien d'autres mesures

- betweenness
- closeness
- $k$-cores
- $\ldots$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Cadre général des modèles en réseaux

---

- Voir par exemple 
  - Keeling & Eames. [Networks and epidemic models](https://doi.org/10.1098/rsif.2005.0051), 2005
  - Meyers, Pourbohloul, Newman, Skowronski & Brunham. [Network theory and SARS: predicting outbreak diversity](https://doi.org/10.1016/j.jtbi.2004.07.026)
  - Meyers, Newman & Pourohloul. [Predicting epidemics on directed contact networks](https://doi.org/10.1016/j.jtbi.2005.10.004), 2006
  - Bansal, Read, Pourbohloul & Meyers. [The dynamic nature of contact networks in infectious disease epidemiology](https://doi.org/10.1080/17513758.2010.503376), 2010 
  - Les autres papiers du [numéro spécial](https://www.tandfonline.com/toc/tjbd20/4/5) de JBD dans lequel est le papier précédent


---

- Typiquement, on considère un graphe (ou digraphe selon les cas) dans lequel:
  - chaque nœud est un individu 
  - l'existence d'un arc de $i$ vers $j$ indique que $i$ est en contact avec $j$ et peut lui transmettre l'infection
  - dans le cas non orienté, l'existence d'un arc de $i$ vers $j$ implique celle d'un arc (le même) de $j$ vers $i$ et établit que les deux individus sont connectés
- La connexion n'est pas permanente, mais décrit plutôt la possibilité d'une connexion: $i$ et $j$ entrent en contact de façon régulière

---

# Matrice d'adjacence

On utilisera souvent la **matrice d'adjacence** $A=[a_{ij}]$, dans laquelle $a_{ij}=1$ si le nœud $i$ a un lien vers le nœud $j$ et $a_{ij}=0$ sinon

On écrit parfois $A(\mathcal{D})$ pour indiquer que $A$ est la matrice d'adjacence du digraphe $\mathcal{D}$, et dans l'autre sens, $\mathcal{D}(A)$ pour indiquer que le graphe est construit en utilisant la matrice d'adjacence

Si le graphe est non orienté, alors $A$ est symmétrique

---

# Nature du réseau

- Parfois on dispose de données précises sur les liens entre individus (sondages, etc.)
- Souvent on idéalise des réseaux, on choisit des réseaux avec des propriétés données

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