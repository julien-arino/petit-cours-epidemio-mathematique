---
marp: true
title: Petit cours d'épidémiologie mathématique - Le modèle SIS
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 04 - Le modèle SIS
theme: default
paginate: false
size: 4:3
math: mathjax
---

<style>
  /* section {
  font-size: 28px;
  padding-left: 30px;
  padding-right: 30px;
  padding-top: 20px;
  padding-bottom: 20px;
  }
  h1 {
  font-size: 35px;
  # color: #09c;
  }
  h2 {
  font-size: 40px;
  } */
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
# <!--fit-->Petit cours d'épidémiologie mathématique<br/>Le modèle SIS

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

- Modèle SIS endémique
- Analyse mathématique (version 1)
- Le nombre de reproduction élémentaire
- Analyse mathématique (version 2)
- Un peu de computationnel 

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Modèle SIS endémique

---
 
- On considère une population close (pas d'entrées ni de sorties de la population)
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

---

## Individus infectieux

- Meurent au taux *per capita* $d$, proportionnel à la population infectieuse $I$
- Guérissent au taux *per capita* $\gamma$
- On ne considère pas la mortalité induite par la maladie

---

# Fonction d'incidence

- On revient sur les fonctions d'incidence plus tard ([Cours 05](cours-05-fonctions-incidence.html))
- Pour le moment, on suppose juste que l'incidence est de la forme
$$
f(S,I) = \beta\frac{SI}{S+I}
$$
que l'on appelle *incidence proportionnelle* ou *incidence standard*

---

# Diagramme de flot du modèle

![width:600px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/figure_SIS_base_prop_incidence_birthdN.png)

---

# Le modèle

![bg right:30% width:300px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/figure_SIS_base_prop_incidence_birthdN_vertical.png)

En balançant les flux entrant et sortant dans les deux compartiments, on obtient

$$
\begin{align}
S' &= bN-dS-\beta\frac{SI}{N}+\gamma I
\tag{1a}\label{sys:SIS_base_dS}\\
I' &= \beta\frac{SI}{N}-dI-\gamma I
\tag{1b}\label{sys:SIS_base_dI}
\end{align}
$$

On considère le problème de Cauchy consistant en $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ auquel on adjoint les conditions initiales $S(0)=S_0\geq 0$ et $I(0)=I_0\geq 0$

---

# Remarques
 
- $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ est un modèle SIS (Susceptible-Infectieux-Susceptible)
- Si $\gamma=0$ (pas de guérison), le modèle est un modèle SI
  - Dans ce cas, un individu infectieux reste infectieux toute sa vie
- Des maladies présentant ce type de caractéristiques sont des maladies bactériennes telles que celles causées par  *staphylococcus aureus*, *streptococcus pyogenes*, *chlamydia pneumoniae* ou *neisseria gonorrhoeae*

---

# <!--fit-->La naissance et la mort sont *relatives*

Les notions de *naissance* et *mort* se réfèrent à la population que l'on considère

Par exemple, supposons un modèle pour l'immunodéficience humaine (VIH) dans une population à risque d'utilisateurs de drogue administrées de façon intraveineuse. Dans ce cas 
- la naissance correspond au moment du début du comportement à risque
- la mort survient au moment où le comportement à risque cesse, que ce soit parce que l'individu meurt ou parce qu'il/elle cesse d'utiliser de la drogue

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Analyse mathématique (version 1)

---

# Analyse du système

Le système $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ est planaire non-linéaire

En principe, on devrait appliquer les méthodes usuelles dans le plan. Et on le fera plus tard

Toutefois, il est ici possible de trouver une solution explicite, sous certaines conditions

**NB:** Ceci est une illustration utile, mais est une exception!! Pratiquement aucun autre modèle que nous rencontrerons ne sera intégrable de cette façon

---

# Le système est-il bien posé?

- On note que l'on a une fonction de la forme $\beta SI/N$, donc cela peut poser problème si $N\to 0$
- Normalement, on commence par vérifier que le système $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ est bien posé
- Cela fait partie de l'arsenal classique

---

# Dynamique de $N$

On a
$$
\begin{align*}
N' &= (S+I)' \\
&= bN-dS\beta\frac{SI}{N}
+\gamma I+\beta\frac{SI}{N}-dI-\gamma I \\
&= bN-d(S+I) \\
&= (b-d)N
\end{align*}
$$
Supposons que $b=d$, alors $N'=0$ et par conséquent, pour tout $t$, $N(t)\equiv N_0:=S_0+I_0$

On suppose dorénavant que $b=d$ et que $N_0>0$ (le cas $N\equiv 0$ n'est pas très captivant)

---

# Les variables en proportions

Puisque $N\equiv N_0>0$, on peut considérer
$$
s=\frac{S}{N}\quad\quad i=\frac{I}{N}
$$
Remarquons que $s+i=(S+I)/N=1$. La dérivée de $i$ est
$$
i' = \frac{I'N-IN'}{N^2}=\frac{I'}{N}-\frac{iN'}{N}
$$

---

On a
$$
i' = \frac{I'}{N}-\frac{iN'}{N}
$$
mais, puisque $N'=0$, 
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

Puisque $s+i=1$, on peut utiliser $s=1-i$ dans l'équation $\eqref{eq:SIS_proportion_di}$, ce qui donne $i'=\beta(1-i)i-(d+\gamma)i$

Par conséquent, le **système en proportions** est
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

Réécrivons $\eqref{sys:SIS_proportion_di}$ comme
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

La solution du système en proportions est donc donnée par

$$
s(t) = 
1-\frac{i_0({\color{red}\beta-(d+\gamma)})}{i_0\beta(1-e^{-({\color{red}\beta-(d+\gamma)})t})
+({\color{red}\beta-(d+\gamma)})e^{-({\color{red}\beta-(d+\gamma)})t}} 
$$
$$
i(t) =
\frac{i_0({\color{red}\beta-(d+\gamma)})}{i_0\beta(1-e^{-({\color{red}\beta-(d+\gamma)})t})
+({\color{red}\beta-(d+\gamma)})e^{-({\color{red}\beta-(d+\gamma)})t}}
$$
et l'on voit que le terme $\beta-(d+\gamma)$ joue un rôle important, et l'on identifie deux cas selon le signe de cette quantité

---

- Si $\beta-(d+\gamma)<0$, alors 
$$
\lim_{t\to\infty}e^{-(\beta-(d+\gamma))t}=+\infty
$$ 
donc $\lim_{t\to\infty}s(t)=1$ et $\lim_{t\to\infty}i(t)=0$
- Si $\beta-(d+\gamma)>0,$ alors 
$$
\lim_{t\to\infty}e^{-(\beta-(d+\gamma))t}=0
$$ 
donc $\lim_{t\to\infty}s(t)=1-(\beta-(d+\gamma))/\beta$ et $\lim_{t\to\infty}i(t)=(\beta-(d+\gamma))/\beta$

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Le nombre de reproduction élémentaire


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
 
- Si $\mathcal{R}_0< 1$, alors la maladie **s'éteint**:
  - $\lim_{t\to\infty}s(t)=1$
  - $\lim_{t\to\infty}i(t)=0$
- Si $\mathcal{R}_0>1$, alors la maladie devient **endémique**:
  - $\lim_{t\to\infty}s(t)={1}/{\mathcal{R}_0}$
  - $\lim_{t\to\infty}i(t)=1-1/{\mathcal{R}_0}$
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

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Analyse mathématique (version 2)

---

# <!--fit-->Méthode classique d'analyse du système SIS

On considère le système
$$
\begin{align}
S' &= bN-dS-\beta\frac{SI}{N}+\gamma I \tag{1a} \\
I' &= \left(\beta \frac SN-(d+\gamma)\right)I \tag{1b}
\end{align}
$$

---

# <!--fit-->Comportement de la population totale

On a déjà vu que 
$$
N'=(b-d)N
$$
La solution de cette EDO scalaire est facile:
$$
N(t)=N_0e^{(b-d)t},\quad t\geq 0
$$
Donc il y a 3 possibilités:
- si $b>d$, $N(t)\to\infty$, la population totale explose
- si $b=d$, $N(t)\equiv N_0$, la population totale reste constante
- si $b<d$, $N(t)\to 0$, la population s'effondre

---

# Donc on suppose que $b=d$

- On veut un cas raisonnable, on suppose donc que $b=d$

- Le système est donc
$$
\begin{align}
S' &= d(N-S)-\beta\frac{SI}{N}+\gamma I \tag{1a} \\
I' &= \left(\beta \frac SN-(d+\gamma)\right)I \tag{1b}
\end{align}
$$

- Puisque $N$ est constant, on pourrait simplifier et étudier le système avec seulement l'une des deux équations. On choisit toutefois de garder le système en l'état

---

# Le système est-il bien posé ?

Dans le cadre d'un modèle épidémiologique:
- les solutions de $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ existent-elles et sont-elles uniques ?
- le cône positif (quadrant ici) est-il invariant sous le flot de $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ ?
- les solutions de $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ sont-elles bornées ?
  - Il peut se trouver des modèles sans bornitude, mais ils sont plutôt rares et devront être considérés à part

---

- On évite le cas $N\equiv 0$, qui ne sert à rien
- $b=d$ et $N_0>0$ $\Rightarrow$ on évite également le cas $N\to 0$
- Donc le champ de vecteur est toujours $C^1$, ce qui entraîne que les solutions existent et sont uniques
- Vérifions maintenant que le cône positif est invariant sous le flot de $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$

---

# Invariance de $\mathbb{R}_+^2$ sous le flot (1)

Supposons pour commencer que $I=0$. Alors le système se réduit à l'équation scalaire
$$
S' = bN-dS=0
$$
puisque $S=N-I=N$ ici

Il suit que l'axe $\{I=0\}$ est invariant et toute solution initiée dans cet ensemble est constante

Cela implique qu'une solution avec $S(0)>0$ et $I(0)>0$ ne peut atteindre l'axe $\{I=0\}$

---

# Invariance de $\mathbb{R}_+^2$ sous le flot (2)

> Cela implique qu'une solution avec $S(0)>0$ et $I(0)>0$ ne peut atteindre l'axe $\{I=0\}$

Supposons que $S(0)=S_0>0$ et $I(0)=I_0>0$, et qu'il existe $t_\star>0$ tel que $S(t_\star)=S_\star$ et $I(t_\star)=0$

![width:400px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/invariance_orthant_positif.png)

---

# Invariance de $\mathbb{R}_+^2$ sous le flot (3)

Mais en $S=S_\star$ et $I=0$, il passe une autre solution, celle telle que $S(0)=S_\star$ et $I(0)=0$, puisqu'avec ces conditions initiales, on a $S(t)=S_\star$ et $I(t)=0$ pour tout $t\geq 0$

Cela contredit l'unicité des solutions $\Rightarrow$ $I(t)>0$ si $I(0)>0$

---

# Invariance de $\mathbb{R}_+^2$ sous le flot (4)

On a vu que $I(t)>0$ si $I(0)>0$

Supposons alors que $S=0$. L'équation $\eqref{sys:SIS_base_dS}$ est alors
$$
S' = dN+\gamma I>0
$$

Donc si $S(0)>0$, alors $S(t)>0$ pour tout $t$. Si, d'autre part $S(0)=0$, alors $S(t)>0$ pour $t>0$ petit; par ce qui précède, cela est aussi vrai pour tout $t>0$

On dit que le champ est *entrant*

$\implies$ $S$ ne peut pas devenir nul

---

# En résumé, pour l'invariance

- Si $(S(0),I(0))\in\mathbb{R}_+\times(\mathbb{R}_+\setminus\{0\})$, alors pour tout $t>0$,
$$(S(t),I(t))\in(\mathbb{R}_+\setminus\{0\})^2$$
- Si $(S(0),I(0))\in\mathbb{R}_+\times\{0\}$, alors pour tout $t\geq 0$, 
$$(S(t),I(t))=(S(0),0)$$

Le modèle est donc satisfaisant, en ce qu'il n'autorise pas des solutions à changer de signe

---

# Remarque

Ce genre de raisonnement a toute sa place dans une thèse de MSc ou de PhD: il faut montrer que vous savez faire

Dans un papier de recherche, cela n'est pas vraiment nécessaire, c'est souvent même superflu

---

# Bornitude

Il suit de ce qui précède que le quadrant positif $\mathbb{R}_+^2$ est (positivement) invariant sous le flot de $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$

De l'invariance et du fait que la population totale $N$ est bornée (constante, en fait), on déduit que les solutions de $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ sont bornées

---

# Recherche des équilibres

On cherche les équilibres du système en supposant $S'=I'=0$. $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ devient
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

---

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

# <!--fit-->Méthode plus efficace de calcul de $\mathcal{R}_0$

Diekmann & Heesterbeek, caractérisé dans le cas ODE par PvdD & Watmough (2002)

On considère seulement les compartiments $x$ avec des  *individus infectés* et écrivons
$$
x'=\mathcal{F}-\mathcal{V}
$$
 
- $\mathcal{F}$ entrée au sein des compartiments infectés du fait de nouvelles infections
- $\mathcal{V}$ contient tous les autres flux (attention au signe $-$)

---

On calcule les dérivées (de Fréchet) $F=D\mathcal{F}$ et $V=D\mathcal{V}$ par rapport aux variables infectées $x$ (les Jacobiennes) et on évalue en l'ESM

Alors
$$
\mathcal{R}_0=\rho(FV^{-1})
$$
où $\rho$ est le rayon spectral


---

# <!--fit-->Résultat de PvdD & Watmough (2002)

<div class="theorem">

Supposons que l'ESM existe et notons alors
$$
\mathcal{R}_0=\rho(FV^{-1})
$$
où les matrices $F$ et $V$ sont obtenues comme indiqué. Supposons que les conditions (A1) à (A5) soient satisfaites. Alors
- si $\mathcal{R}_0<1$, alors l'ESM est LAS
- si $\mathcal{R}_0>1$, alors l'ESM est instable
</div>

(Les conditions (A1)-(A5) sont explicitées dans le [Cours 07](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-07-etapes-R0-final-size.html) et nous discutons de la raison pour il est important de vérifier ces conditions dans le [Cours 11](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-11-plus-de-modelisation.html))

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
et $\mathcal{V}$ tous les autres flux, en prenant garde au signe $-$:
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

Intérêt pas forcément évident ici, mais on verra plus loin à quel point cette méthode peut simplifier les calculs

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Un peu de computationel 

---

```R
library(deSolve)
rhs_SIS <- function(t, x, p) {
  with(as.list(c(x, p)), {
    N = S + I
    dS = d*(N-S) + gamma * I - d * S - beta * S * I / N
    dI = beta * S * I / N - (d + gamma) * I
    return(list(c(dS, dI)))
  })
}
# Paramètres "connus"
d = 1/(80 * 365.25)
gamma = 1/14
# On règle beta pour que R_0 = 1.5
R_0 = 1.5
beta = R_0 * (d + gamma)
params = list(d = d, gamma = gamma, beta = beta)
IC = c(S = 1000, I = 1)
times = seq(0, 365, 1)
# On appelle l'intégrateur numérique
sol <- ode(y = IC, times = times, func = rhs_SIS, 
           parms = params, method = "ode45")
```

---

![bg contain 95%](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/sol_endemic_SIS_R015.png)

---

# Je viens de faire ...

ce que je préconise de ne pas faire: illustrer un résultat mathématique sans rien vraiment ajouter au résultat lui même

Améliorons les choses un peu. Voir le [code](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/CODE/ODE_SIS_multiple_solutions.R)

---

![bg contain 95%](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/sol_endemic_SIS_several.png)

---

On pourrait continuer, mais pour un modèle aussi simple, il y a peu de choses à faire: les 3 paramètres du système se combinent dans $\mathcal{R}_0$ et ce dernier résume bien la dynamique

On va toutefois représenter une chose importante: le schéma de bifurcation

On a vu que lorsque $\mathcal{R}_0<1$, $I\to 0$ tandis que lorsque $\mathcal{R}_0>1$, $I\to (1-1/\mathcal{R}_0)N$. Représentons ceci ([code](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/CODE/SIS_PEI_vs_R0.R))

---

![bg contain 95%](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/endemic_SIS_EE_vs_R0.png)
