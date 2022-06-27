---
marp: true
title: Petit cours d'épidémiologie mathématique - Les modèle SIS et SIR
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 04 - Le modèle SIS, le modèle de Kermack et McKendrick
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

<!-- _backgroundImage: "linear-gradient(to top, #85110d, 1%, white)" -->
# <!--fit-->Petit cours d'épidémiologie mathématique<br/>Le modèle SIS, le modèle de Kermack et McKendrick, le modèle SIRS

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/github-icon.png)](https://github.com/julien-arino)

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
# Plan de ce cours

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
- $I(t)$ nombre d'infectieux au temps $t$
- $N(t)=S(t)+I(t)$ la population totale

Les hypothèses qui suivent décrivent une maladie pour laquelle la durée de la période d'incubation est très courte voire inexistante

On suppose aussi que l'infection ne persiste pas chez un individu et qu'aussitôt après s'être remis, les individus sont de nouveau susceptibles

---

# Type de compartiments

## Individus susceptibles

- Naissent au taux *per capita* $d$ proportionnel à la population totale $N$
- Meurent au taux *per capita* $d$, proportionnel à la population susceptible $S$
- Les nouveaux nés sont susceptibles (on ignore la *transmission verticale*)

## Individus infectieux

- Meurent au taux *per capita* $d$, proportionnel à la population infectieuse $I$
- Guérissent au taux *per capita* $\gamma$
- On ne considère pas la mortalité induite par la maladie

---

# Diagramme de flot du modèle

![width:600px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/figure_SIS_base_prop_incidence_birthdN.png)

---

# Le modèle

![bg right:34% width:400px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/figure_SIS_base_prop_incidence_birthdN_vertical.png)

On utilise une fonction d'incidence standard (voir plus loin) et en balançant les flux entrant et sortant dans les deux compartiments, on obtient

$$
\begin{align}
S' &= \underbrace{dN}_\textrm{naissance}
-\underbrace{dS}_\textrm{mort} 
-\underbrace{\beta\frac{SI}{N}}_\textrm{infection}
+\underbrace{\gamma I}_\textrm{gu\'erison}
\tag{1a}\label{sys:SIS_base_dS}\\
I' &= \underbrace{\beta\frac{SI}{N}}_\textrm{infection}
-\underbrace{dI}_\textrm{mort} 
-\underbrace{\gamma I}_\textrm{gu\'erison} 
\tag{1b}\label{sys:SIS_base_dI}
\end{align}
$$

On considère le problème de Cauchy consistant en ce système auquel on adjoint les conditions initiales $S(0)=S_0\geq 0$ et $I(0)=I_0\geq 0$

---

# Remarques
 
- $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ est un modèle SIS (Susceptible-Infectieux-Susceptible)
- Si $\gamma=0$ (pas de guérison), le modèle est un modèle SI
  - Dans ce cas, un individu infectieux reste infectieux toute sa vie
- Des maladies présentant ce type de charactéristiques sont des maladies bactériennes telles que celles causées par  *staphylococcus aureus*, *streptococcus pyogenes*, *chlamydia pneumoniae* ou *neisseria gonorrhoeae*

---

# La naissance et la mort sont *relatives*

Les notions de *naissance* et *mort* se réfèrent à la population que l'on considère

Par exemple, supposons un modèle pour l'immunodéficience humaine (VIH) dans une population à risque d'utilisateurs de drogue administrées de façon intraveineuse. Dans ce cas 
- la naissance correspond au moment du début du comportement à risque
- la mort survient au moment où le comportement à risque cesse, que ce soit parce que l'individu meurt ou parce qu'il/elle cesse d'utiliser de la drogue

---

# Analyse du système

Le système $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ est planaire non-linéaire

En principe, on devrait appliquer les méthodes usuelles dans le plan. 

Toutefois, il est ici possible de trouver une solution explicite

**NB:** Ceci est une illustration utile, mais est une exception!! Pratiquement aucun autre modèle que nous rencontrerons ne sera intégrable de cette façon

---

# Le système est-il bien posé?

- Normalement, on devrait commencer par vérifier que le système $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ est bien posé
- On note toutefois que l'on a une fonction de la forme $\beta SI/N$, donc voyons tout d'abord si cela peut poser problème

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

# Le système est-il bien posé? (bis)

- On va éviter le cas $N\equiv 0$, qui ne sert à rien
- Donc le champ de vecteur est toujours $C^1$, ce qui entraîne que les solutions existent et sont uniques
- Vérifions maintenant que le cône positif est invariant sous le flot de $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$

---

# Invariance sous le flot (1)

Supposons pour commencer que $I=0$. Alors le système se réduit à l'équation scalaire
$$
S' = bN-dS=0
$$
puisque $N=S$ ici. Il suit que l'axe $\{I=0\}$ est invariant et toute solution initiée dans cet ensemble est constante. Cela implique qu'une solution avec $S(0)>0$ et $I(0)>0$ ne peut atteindre l'axe $\{I=0\}$

En effet, supposons que $S(0)=S_0>0$ et $I(0)=I_0>0$, et qu'il existe $t_*>0$ tel que $S(t_*)=S_*$ et $I(t_*)=0$

Mais en S=S_*$ et $I=0$, il passe une autre solution, celle telle que $S(0)=S_*$ et $I(0)=0$, puisqu'avec ces conditions initiales, on a $S(t)=S_*$ et $I(t)=0$ pour tout $t\geq 0$

Cela contredit l'unicité des solutions $\implies$ $I(t)>0$ si $I(0)>0$

---

# Invariance sous le flot (2)

On a vu que $I(t)>0$ si $I(0)>0$

Supposons alors que $S=0$. L'équation $\eqref{sys:SIS_base_dS}$ est alors
$$
S' = \gamma I>0
$$

$\implies$ $S$ ne peut pas devenir nul

---

# Remarque

Ce genre de raisonnement a toute sa place dans une thèse de MSc ou de PhD: il faut montrer que vous savez faire

Dans un papier de recherche, cela n'est pas vraiment nécessaire, c'est souvent même superflu

---

# Les variables en proportions

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

Un facteur intégrant est 
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
\tag{6a}\label{sys:SIS_solution_s}
s(t)=1-\frac{i_0(\beta-(d+\gamma))}{i_0\beta(1-e^{-(\beta-(d+\gamma))t})
  +(\beta-(d+\gamma))e^{-(\beta-(d+\gamma))t}}
$$
et
$$
\tag{6b}\label{sys:SIS_solution_i}
i(t)=\frac{i_0(\beta-(d+\gamma))}{i_0\beta(1-e^{-(\beta-(d+\gamma))t})
  +(\beta-(d+\gamma))e^{-(\beta-(d+\gamma))t}}
$$

---

En observant $\eqref{sys:SIS_solution_s}$-$\eqref{sys:SIS_solution_i}$, on déduit deux cas: 
 
- Si $\beta-(d+\gamma)<0$, alors $\lim_{t\to\infty}e^{-(\beta-(d+\gamma))t}=+\infty$, donc $\lim_{t\to\infty}s(t)=1$ et $\lim_{t\to\infty}i(t)=0$
- Si $\beta-(d+\gamma)>0$, alors $\lim_{t\to\infty}e^{-(\beta-(d+\gamma))t}=0$; donc $\lim_{t\to\infty}s(t)=1-(\beta-(d+\gamma))/\beta$ et $\lim_{t\to\infty}i(t)=(\beta-(d+\gamma))/\beta$



---

# Le nombre de reproduction élémentaire $\mathcal{R}_0$

Reformulons le résultat en termes épidémiologiques en utilisant le **nombre de reproduction élémentaire**
$$
\tag{7}\label{eq:SIS_R0}
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
 
- Si $\mathcal{R}_0< 1$, alors
  - $\lim_{t\to\infty}s(t)=1$
  - $\lim_{t\to\infty}i(t)=0$, la maladie **s'éteint**
- Si $\mathcal{R}_0>1$, alors
  - $\lim_{t\to\infty}s(t)={1}/{\mathcal{R}_0}$
  - $\lim_{t\to\infty}i(t)=1-1/{\mathcal{R}_0}$, la maladie devient **endémique**
</div>

On dit que le modèle SIS est un **modèle endémique** du fait de la possibilité d'observer ce second équilibre

---
 
 # <!--fit-->Quelques remarques additionnelles au sujet de $\mathcal{R}_0$

- $\mathcal{R}_0$ determine la propension d'une maladie à s'établir dans une population
- Les politiques de contrôle ont par conséquent pour objectif de réduire $\mathcal{R}_0$ à des valeurs plus petites que 1
- La définition "verbale" de $\mathcal{R}_0$ est *le nombre moyen de cas secondaires d'infection produits par l'introduction d'un unique individu infectieux dans une population complètement naïve*
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

# Méthode classique d'analyse du système SIS

On considère le système
$$
\begin{align}
S' &= d(N-S)-\beta\frac{SI}{N}+\gamma I \tag{1a} \\
I' &= \left(\beta \frac SN-(d+\gamma)\right)I \tag{1b}
\end{align}
$$

Puisque $N$ est constant, on pourrait simplifier et étudier le système avec seulement l'une des deux équations. On choisit toutefois de garder le système en l'état

---

# Le système est-il bien posé ?

Dans le cadre d'un modèle épidémiologique:
- les solutions de $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ existent-elles et sont-elles uniques ?
- le cône positif (quadrant ici) est-il invariant sous le flot de $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ ?
- les solutions de $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ sont-elles bornées ?
  - Il peut se trouver des modèles sans bornitude, mais ils sont plutôt rares et devront être considérés à part

---

# Invariance de $\mathbb{R}_+^2$ sous le flot du système

Tout d'abord, remarquons que $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ est $C^1$, ce qui implique que les solutions existent et sont uniques

Si $S=0$, alors $\eqref{sys:SIS_base_dS}$ devient
$$
S' = dN+\gamma I >0
$$
$\implies$ $S$ ne peut jamais devenir nul: si $S(0)>0$, alors $S(t)>0$ pour tout $t$. Si, d'autre part $S(0)=0$, alors $S(t)>0$ pour $t>0$ petit; par ce qui précède, cela est aussi vrai pour tout $t>0$

---

Pour $I$, on remarque que si $I=0$, alors $I'=0$ $\implies$ $\{I=0\}$ est positivement invariant: si $I(0)=0$, alors $I(t)=0$ pour tout $t>0$. 

En pratique, les valeurs de $S(t)$ de toute solution dans $\{I=0\}$ sont "portée" par l'une des 4 solutions suivantes:
1. $S(0)=0$: reste identiquement nulle
2. $S(0)\in(0,N)$: augmente vers $S=N$
3. $S(0)=N$: reste égale à $N$
4. $S(0)>N$: décroit vers $S=N$

Par conséquent, aucune solution avec $I(0)>0$ ne peut pénétrer dans $\{I=0\}$. Supposons $I(0)>0$ et $\exists t_*>0$ t.q. $I(t_*)=0$ et notons $S(t_*)$ la valeur de $S$ lorsque $I$ devient nul

L'existence de $t_*$ contredit l'unicité des solutions, puisque en $(S(t_*),I(t_*))$, il passe alors deux solutions: celle initiée dans $\{I=0\}$ et celle initiée avec $I(0)>0$

---

# Bornitude

Il suit de ce qui précède que le quadrant positif $\mathbb{R}_+^2$ est (positivement) invariant sous le flot de $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$

On pourrait détailler plus (strictement positif $\implies$..) mais c'est suffisant ici

De l'invariance et du fait que la population totale $N$ est bornée (constante, en fait), on déduit que les solutions de $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ sont bornées

---

# Recherche des équilibres

On cherche les equilibres du système en supposant $S'=I'=0$. $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ devient
$$
\begin{align}
0 &= d(N-S)-\beta\frac{SI}{N}+\gamma I 
\tag{8a}\label{sys:SIS_DFE_S} \\
0 &= \left(\beta \frac SN-(d+\gamma)\right)I 
\tag{8b}\label{sys:SIS_DFE_I}
\end{align}
$$

---

$$
\begin{align}
0 &= d(N-S)-\beta\frac{SI}{N}+\gamma I 
\tag{8a} \\
0 &= \left(\beta \frac SN-(d+\gamma)\right)I 
\tag{8b}
\end{align}
$$

De $\eqref{sys:SIS_DFE_I}$, on déduit que
$$
\beta\frac SN -(d+\gamma)=0
\iff S=\frac{d+\gamma}\beta N
$$
ou alors $I=0$. Substituant $I=0$ dans $\eqref{sys:SIS_DFE_S}$, il vient que $d(N-S)=0$, i.e, $S=N$. C'est l'équilibre sans maladie (ESM)
$$
\tag{9}\label{eq:SIS_DFE}
E_0 : (S,I)=(N,0)
$$

---

De la relation
$$
S=\frac{d+\gamma}\beta N
$$
on déduit l'équilibre endémique $E_*$: substituant cette valeur de $S$ dans $\eqref{sys:SIS_DFE_S}$,
$$
\begin{aligned}
0 &= d\left(N-\frac{d+\gamma}\beta N\right)
-\beta \frac{\frac{d+\gamma}\beta NI}{N}+\gamma I \\
&=dN\left(1-\frac{d+\gamma}{\beta}\right)
-(d+\gamma)I+\gamma I \\
&=dN\left(1-\frac{d+\gamma}{\beta}\right)-dI
\end{aligned}
$$
d'où il suit que
$$
I=\left(1-\frac{d+\gamma}{\beta}\right)N
$$

---

Par conséquent, l'équilibre endémique est
$$
E_*:(S,I)
=\left(
  \frac{d+\gamma}\beta N, 
  1-\frac{d+\gamma}\beta N
\right)
$$

Notant que $(d+\gamma)/\beta=1/\mathcal{R}_0$, il vient
$$
\tag{10}\label{eq:SIS_EEP}
E_*:(S,I)
=\left(
  \frac{1}{\mathcal{R}_0}N, 
  \left(1-\frac{1}{\mathcal{R}_0}\right)N
\right)
$$

---

# Méthode classique de calcul de $\mathcal{R}_0$

$\mathcal{R}_0$ est la courbe dans l'espace des paramètres où ESM perd sa stabilité locale. Pour trouver $\mathcal{R}_0$, on étudie donc la stabilité asymptotique locale de ESM

En un point arbitraire $(S,I)$, la matrice Jacobienne de $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ prend la forme
$$
\tag{11}\label{eq:SIS_Jacobian_SI}
J_{(S,I)} =
\begin{pmatrix}
-d -\beta \frac IN & \gamma-\beta\frac SN \\
\beta \frac IN & \beta\frac SN-(d+\gamma)
\end{pmatrix}
$$
La stabilité asymptotique locale de ESM dépend du signe de la partie réelle des valeurs propres de $\eqref{eq:SIS_Jacobian_SI}$ en cet équilibre, donc on évalue
$$
J_{E_0} =
\begin{pmatrix}
-d & \gamma-\beta \\
0 & \beta-(d+\gamma)
\end{pmatrix}
$$
Matrice triangulaire $\implies$ valeurs propres sont $-d<0$ et $\beta-(d+\gamma)$ $\implies$ stabilité asymptotique locale ESM déterminée par le signe de $\beta-(d+\gamma)$, donnant $\eqref{eq:SIS_R0}$ 

---

# Méthode plus efficace de calcul de $\mathcal{R}_0$

Diekmann & Heesterbeek, caracterisé dans le cas ODE par PvdD & Watmough (2002)

On considère seulement les compartiments $x$ avec des  *individus infectés* et écrivons
$$
x'=\mathcal{F}-\mathcal{V}
$$
 
- $\mathcal{F}$ entrée au sein des compartiments infectés du fait de nouvelles infections
- $\mathcal{V}$ contient tous les autres flux (attention au signe $-$)

On calcule les dérivées (de Fréchet) $F=D\mathcal{F}$ et $V=D\mathcal{V}$ par rapport aux variables infectées $x$ (les Jacobiennes) et on évalue en l'ESM

Alors
$$
\mathcal{R}_0=\rho(FV^{-1})
$$
où $\rho$ est le rayon spectral


---

# Résultat de PvdD & Watmough (2002)

<div class="theorem">

Supposons que l'ESM existe et notons alors
$$
\mathcal{R}_0=\rho(FV^{-1})
$$
où les matrices $F$ et $V$ sont obtainues comme indiqué. Supposons que les conditions (A1) à (A5) soient satisfaites. Alors
- si $\mathcal{R}_0<1$, alors l'ESM est LAS
- si $\mathcal{R}_0>1$, alors l'ESM est instable
</div>

(Les conditions (A1)-(A5) sont explicitées dans le [TP 02](2022_04_3MC_EpiModelling_P02_Analysis_LargeScaleModels.html) et nous discutons de la raison pour il est important de vérifier ces conditions dans le [Cours](https://julien-arino.github.io/petit-cours-epidemio-mathematique/2022_04_3MC_EpiModelling_L09_RecentMathematicalModels.html))

---

# <!--fit-->Calcul de $\mathcal{R}_0$ par matrice de prochaine génération

Ce calcul se substitue à celui de la matrice Jacobienne. Lorsque l'on a trouvé l'ESM, on ne considère que les variable infectées de $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$, c'est à dire $I$ 

$$
I' = \beta \frac{SI}N-(d+\gamma)I
$$
On écrit cette equation sous la forme
$$
x'=\mathcal{F}-\mathcal{V}
$$
avec $x=I$, $\mathcal{F}$ les nouvelles infections, i.e.,
$$
\mathcal{F}=\beta \frac{SI}N
$$
et $\mathcal{V}$ tous les autres flux, en prennant garde au signe $-$:
$$
\mathcal{V}=(d+\gamma)I
$$

---

On calcule les matrices Jacobiennes de $\mathcal{F}$ et $\mathcal{V}$ (ici, des scalaires puisque $\mathcal{F}$ et $\mathcal{V}$ sont scalaires)
$$
D\mathcal{F}=\frac{\partial}{\partial I}\mathcal{F}
=\beta\frac SN
$$
et
$$
D\mathcal{V}=\frac{\partial}{\partial I}\mathcal{V}
=d+\gamma
$$
On obtient $F$ et $V$ en évaluant ces dérivées en l'ESM,
$$
F=D\mathcal{F}_{E_0} = \beta \frac SN=\beta,
\qquad
V=D\mathcal{V}_{E_0} = d+\gamma
$$
Enfin, on inverse $V$, soit, ici, $V^{-1}=1/(d+\gamma)$

Notons que si les conditions (A1)-(A5) du théorème sont satisfaites, on récupère aussi le fait que ESM est LAS

---

On trouve donc comme $\eqref{eq:SIS_R0}$
$$
\mathcal{R}_0 =\rho(FV^{-1})
=\rho\left(\frac{\beta}{d+\gamma}\right)
=\frac{\beta}{d+\gamma}
$$

Intérêt pas forcémment évident ici, mais on verra plus loin à quel point cette méthode peut simplifier les calculs

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


---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Modèle SIR épidémique de Kermack et McKendrick

---

# Ceci est un cas particulier !

K-MK ont formulé un modèle beaucoup plus général que le modèle qui suit, qui est un cas particulier

Cela vaut vraiment le coup de regarder la série de papiers!
- Kermack & McKendrick. [A contribution to the mathematical theory of epidemics](https://doi.org/10.1098/rspa.1927.0118) (1927)

---

# <!--fit-->Question sous-jacente: quelle est la *taille* d'une épidémie?

- Si l'on s'intéresse à la possibilité d'un pic épidémique
  - A-t-il toujours lieu?
  - S'il a lieu, quelle est son intensité?
- Si une épidémie traverse une population, est-ce que tout le monde est infecté?

---

# Le modèle SIR sans démographie

- La période de temps que l'on considère est suffisamment courte que l'on peut négliger la démographie (on parle aussi de modèle *sans dynamique vitale*)
- Différent du modèle précédent, qui incorpore la démographie mais la considère constante
- Les individus dans la populations sont soit *susceptibles* ($S$), soit *infectieux* avec la maladie ($I$). Après guérison ou mort, on les *retire* du compartiment infectieux ($R$)
- Incidence du type action de masse $\beta SI$

Le modèle que nous considérons maintenant est typiquement appelé modèle SIR de Kermack-McKendrick (KMK)
$$
\begin{align}
S' &= -\beta SI \tag{21a}\label{sys:KMK_dS} \\
I' &= (\beta S-\gamma)I  \tag{21b}\label{sys:KMK_dI} \\
R' &= \gamma I  \tag{21c}\label{sys:KMK_dR}
\end{align}
$$

---

# Reduction du problème

3 compartiments, mais quand on inspecte en détail, on remarque que les *retirés* n'ont pas d'influence directe sur la dynamique de $S$ ou $I$, dans le sens où $R$ n'apparaît pas dans $\eqref{sys:KMK_dS}$ ou $\eqref{sys:KMK_dI}$

De plus, la population totale (incluant potentiellement les morts qui sont aussi classés dans $R$) $N=S+I+R$ satisfait
$$
N'=(S+I+R)'=0
$$
Par conséquent, $N$ est constant et la dynamique de $R$ peut être déduite de $R=N-(S+I)$

Donc on considère à présent
$$
\begin{align}
S' &= -\beta SI \tag{22a}\\
I' &= (\beta S-\gamma)I  \tag{22b}
\end{align}
$$

---

# Équilibres

Considérons les équilibres de
$$
\begin{align}
S' &= -\beta SI \tag{22a}\label{sys:KMK_2d_dS} \\
I' &= (\beta S-\gamma)I  \tag{22b}\label{sys:KMK_2d_dI}
\end{align}
$$

De $\eqref{sys:KMK_2d_dI}$
- soit $\bar S=\gamma/\beta$
- ou $\bar I=0$

Substituant dans $\eqref{sys:KMK_2d_dS}$
- dans le premier cas, $(\bar S,\bar I)=(\gamma/\beta,0)$
- dans le second cas, n'importe quel $\bar S\geq 0$ est un équilibre (on a un *continuum* d'équilibres)

Le second cas est un **problème**: la linéarisation usuelle ne fonctionne pas puisque les équilibres ne sont pas isolés! (Voir [TP 02](https://julien-arino.github.io/petit-cours-epidemio-mathematique/2022_04_3MC_EpiModelling_P02_Analysis_LargeScaleModels.html))


---

# Une autre approche - On étudie $dI/dS$

Quelle est la dynamique de $dI/dS$? On a
$$
\tag{23}\label{eq:KMK_dI_over_dS}
\frac{dI}{dS}
=\frac{dI}{dt}\frac{dt}{dS}
=\frac{I'}{S'}
=\frac{\beta SI-\gamma I}{-\beta SI}
=\frac{\gamma}{\beta S}-1
$$
pourvu que $S\neq 0$

**Attention!** Il convient de se souvenir que $S$ et $I$ sont $S(t)$ et $I(t)$.. l'équation $\eqref{eq:KMK_dI_over_dS}$ décrit ainsi la relation entre $S$ et $I$ le long de solutions de l'EDO d'origine $\eqref{sys:KMK_2d_dS}$-$\eqref{sys:KMK_2d_dI}$

---

On intègre $\eqref{eq:KMK_dI_over_dS}$ sans aucun mal et on obtient des trajectoires dans l'espace d'état
$$
I(S)=\frac\gamma\beta \ln S-S+C
$$
avec $C\in\mathbb{R}$

La condition initiale $I(S_0)=I_0$ donne $C=S_0+I_0-\dfrac \gamma\beta \ln S_0$, et la solution de $\eqref{sys:KMK_dS}$-$\eqref{sys:KMK_dR}$ est, en tant que fonction de $S$
$$
\begin{align*}
I(S)&=S_0+I_0-S+\frac\gamma\beta \ln \frac S{S_0} \\
R(S)&=N-S-I(S)=R_0-\frac\gamma\beta \ln \frac S{S_0}
\end{align*}
$$

---

Trajectoires dans l'espace des phases $(S,I)$ avec CI $(S_0,1-S_0)$ et $\beta/\gamma=2.5$

![width:1200px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/KMK_planar_trajectories.png)

---

# Le nombre de reproduction élémentaire $\mathcal{R}_0$

Supposons que la population totale $N$ soit normalisée, i.e., $N=1$. Alors $R=1-(S+I)$

Définissons
$$
\begin{equation}\label{eq:R0_KMK}\tag{24}
\mathcal{R}_0=\frac{\beta}{\gamma}
\end{equation}
$$

---

# Calcul de la taille finale de l'épidémie

Pour la fonction à valeurs positives et intégrable $w(t)$,  notons
$$
w_\infty = \lim_{t\to\infty}w(t),\qquad\hat w = \int_0^\infty w(t)\ dt
$$
On note aussi $w_0=w(0)$. Dans le sous-système
$$
\begin{align}
S' &= -\beta SI \tag{21a} \\
I' &= (\beta S-\gamma)I  \tag{21b} 
\end{align}
$$
prennons la somme de $\eqref{sys:KMK_dS}$ et $\eqref{sys:KMK_dI}$, en prennant garde de bien faire apparaître la dépendance en le temps
$$
\frac{d}{dt}(S(t)+I(t))=-\gamma I(t)
$$

---

Intégrons de 0 à $\infty$:
$$
\int_0^\infty\frac{d}{dt}(S(t)+I(t))\ dt=-\int_0^\infty\gamma I(t)dt 
$$
Le terme de gauche donne
$$
\int_0^\infty\frac{d}{dt}(S(t)+I(t))\ dt
= S_\infty+I_\infty-S_0-I_0 = S_\infty-S_0-I_0
$$
car $I_\infty=0$

Le terme de droite prend la forme
$$
-\int_0^\infty\gamma I(t)dt = -\gamma \hat I
$$
On a donc
$$
\tag{22}\label{eq:KMK_final_size_step1}
S_\infty-S_0-I_0 = -\gamma\hat I
$$

---

Considérons maintenant $\eqref{sys:KMK_dS}$:
$$
S' = -\beta SI
$$
Divisons les deux cotés par $S$:
$$
\frac{S'(t)}{S(t)} = -\beta I(t)
$$
Intégrons de 0 a $\infty$:
$$
\tag{23}\label{eq:KMK_final_size_step2}
\ln S_0-\ln S_\infty = -\beta \hat I
$$
Exprimons $\eqref{eq:KMK_final_size_step1}$ et $\eqref{eq:KMK_final_size_step2}$ en termes de $-\hat I$ et égalisons
$$
\frac{\ln S_0-\ln S_\infty}{\beta}
=
\frac{S_\infty-S_0-I_0}{\gamma}
$$
On a donc (**vérifier** $\mathcal{R}_0$ ou avec un $S_0$)
$$
S_0+I_0-S_\infty+\frac{\ln S_0-\ln S_\infty}{\mathcal{R}_0} = 0
$$

---

<div class="theorem">

Soit $(S(t),I(t))$ une solution de $\eqref{sys:KMK_dS}$-$\eqref{sys:KMK_dR}$ en proportions et $\mathcal{R}_0$ défini comme dans $\eqref{eq:R0_KMK}$. Si $\mathcal{R}_0 S_0\leq 1$, alors $I(t)$ tend vers 0 quand $t\to\infty.$ Si $\mathcal{R}_0 S_0>1$, alors $I(t)$ atteint d'abord un maximum
$$
1-\frac 1{\mathcal{R}_0}-\frac{\ln(\mathcal{R}_0 S_0)}{\mathcal{R}_0}
$$
puis tend vers 0 quand $t\to\infty$

La proportion $S(t)$ de susceptibles est une fonction décroissante et sa limite $S(\infty)$ est l'unique solution dans $(0,1/\mathcal{R}_0)$ de l'équation 
$$
1-S(\infty)+\frac{\ln[S(\infty)/S_0]}{\mathcal{R}_0}=0
$$
</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->En conclusion

---

# Normaliser ou pas?

- Dans les deux modèles, puisque la population totale est constante, on aurait pu normaliser à $N=1$
- Cela simplifie pas mal certains calculs
- Toutefois, je ne suis pas très fan: je pense qu'il est important de toujours garder en tête les grandeurs biologiques
- Si vous normalisez, en tout cas, pour un papier à visée biomathématique, pensez à exprimer vos ŕesultats en grandeur réelle


---

# Là où nous en sommes
- Un modèle SIS *endémique* dans lequel le seuil $\mathcal{R}_0=1$ est t.q. quand $\mathcal{R}_0<1$, la maladie s'éteint, tandis que lorsque $\mathcal{R}_0>1$, la maladie s'établit dans la population
- Un modèle SIR *épidémique* (le KMK SIR) dans lequel la présence ou absence de vague épidémique est caracterisée par la valeur de $\mathcal{R}_0$
- Le SIS et le KMK SIR sont intégrables dans un certain sens. **C'est une exception!!!**

