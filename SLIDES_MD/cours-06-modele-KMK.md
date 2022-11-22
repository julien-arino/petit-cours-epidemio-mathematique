---
marp: true
title: Petit cours d'épidémiologie mathématique - Le modèle de Kermack et McKendrick
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 06 - Le modèle de Kermack et McKendrick
theme: default
paginate: false
size: 4:3
math: mathjax
---

<style>
  /* section {
  font-size: 28px;
  padding-left: 40px;
  padding-right: 50px;
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
# <!--fit-->Petit cours d'épidémiologie mathématique<br/>Le modèle de Kermack et McKendrick

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/github-icon.png)](https://github.com/julien-arino)

Department of Mathematics & Data Science Nexus
University of Manitoba*

<div style = "font-size:18px; margin-top:-10px; padding-bottom:30px;"></div>

Centre canadien de modélisation des maladies (CCMM)
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

- Modèle SIR épidémique de Kermack et McKendrick
- Taille finale d'une épidémie

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Modèle SIR épidémique de Kermack et McKendrick

---

# Ceci est un cas particulier !

La série de papiers vaut le coup
- Kermack & McKendrick. [A contribution to the mathematical theory of epidemics](https://doi.org/10.1098/rspa.1927.0118) (1927)

Suivi de "Contributions to the mathematical theory of epidemics."
- [II. The problem of endemicity](https://doi.org/10.1098/rspa.1932.0171) (1932)
- [III. Further studies of the problem of endemicity](https://doi.org/10.1098/rspa.1933.0106) (1933)
- [IV. Analysis of experimental epidemics of the virus disease mouse ectromelia](https://doi.org/10.1017/S0022172400034902) (1937)
- [V. Analysis of experimental epidemics of mouse-typhoid; a bacterial disease conferring incomplete immunity](https://doi.org/10.1017/S0022172400011918) (1939)

---

# <!--fit-->Quelle est la *taille* d'une épidémie?

- Si l'on s'intéresse à la possibilité d'un pic épidémique
  - A-t-il toujours lieu?
  - S'il a lieu, quelle est son intensité?
- Si une épidémie traverse une population, est-ce que tout le monde est infecté?

---

# Le modèle SIR sans démographie

- La période de temps que l'on considère est suffisamment courte que l'on peut négliger la démographie (on parle aussi de modèle *sans dynamique vitale*)
- Différent du modèle précédent, qui incorpore la démographie mais la considère constante
- Les individus dans la populations sont soit *susceptibles*, soit *infectieux* avec la maladie. Après guérison ou mort, on les *retire* du compartiment infectieux ($R$)
- Incidence du type action de masse $\beta SI$

---

Le modèle que nous considérons maintenant est typiquement appelé modèle SIR de Kermack-McKendrick (KMK)
$$
\begin{align}
S' &= -\beta SI \tag{1a}\label{sys:KMK_dS} \\
I' &= (\beta S-\gamma)I  \tag{1b}\label{sys:KMK_dI} \\
R' &= \gamma I  \tag{1c}\label{sys:KMK_dR}
\end{align}
$$

![width:600px center](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/SIR_KMK_ODE.png)

---

# Reduction du problème

3 compartiments, mais quand on inspecte en détail, on remarque que les *retirés* n'ont pas d'influence directe sur la dynamique de $S$ ou $I$, dans le sens où $R$ n'apparaît pas dans $\eqref{sys:KMK_dS}$ ou $\eqref{sys:KMK_dI}$

De plus, la population totale (incluant les morts qui sont aussi classés dans $R$) $N=S+I+R$ satisfait
$$
N'=(S+I+R)'=0
$$
Par conséquent, $N$ est constant et la dynamique de $R$ peut être déduite de $R=N-(S+I)$
Donc on considère à présent
$$
\begin{align}
S' &= -\beta SI \tag{2a}\\
I' &= (\beta S-\gamma)I  \tag{2b}
\end{align}
$$

---

# Équilibres

Considérons les équilibres de
$$
\begin{align}
S' &= -\beta SI \tag{2a}\label{sys:KMK_2d_dS} \\
I' &= (\beta S-\gamma)I  \tag{2b}\label{sys:KMK_2d_dI}
\end{align}
$$

De $\eqref{sys:KMK_2d_dI}$
- soit $\bar S=\gamma/\beta$
- ou $\bar I=0$

Substituant dans $\eqref{sys:KMK_2d_dS}$
- dans le premier cas, $(\bar S,\bar I)=(\gamma/\beta,0)$
- dans le second cas, n'importe quel $\bar S\geq 0$ est un équilibre (on a un *continuum* d'équilibres)

Le second cas est un **problème**: la linéarisation usuelle ne fonctionne pas puisque les équilibres ne sont pas isolés!


---

# <!--fit-->Une autre approche - On étudie $dI/dS$

Quelle est la dynamique de $dI/dS$? On a
$$
\tag{3}\label{eq:KMK_dI_over_dS}
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

# <!--fit-->Le nombre de reproduction élémentaire $\mathcal{R}_0$

Supposons que la population totale $N$ soit normalisée, i.e., $N=1$. Alors $R=1-(S+I)$

Définissons
$$
\begin{equation}\label{eq:R0_KMK}\tag{4}
\mathcal{R}_0=\frac{\beta}{\gamma}
\end{equation}
$$

---

<div class="theorem">

Soit $(S(t),I(t))$ une solution à $\eqref{sys:KMK_dS}$-$\eqref{sys:KMK_dR}$ en proportions et $\mathcal{R}_0$ défini par $\eqref{eq:R0_KMK}$

- Si $\mathcal{R}_0
S_0\leq 1$, alors $I(t)\to 0$ quand $t\to\infty$ en étant toujours décroissant
- Si $\mathcal{R}_0
S_0>1$, alors $I(t)$ atteint d'abord un maximum 
$$
1-\frac 1{\mathcal{R}_0}-\frac{\ln(\mathcal{R}_0 S_0)}{\mathcal{R}_0}
$$
puis tend vers 0 quand $t\to\infty$
</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Taille finale d'une épidémie

---

# <!--fit-->Calcul de la taille finale de l'épidémie

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
calculons la somme de $\eqref{sys:KMK_dS}$ et $\eqref{sys:KMK_dI}$, en prenant garde de bien faire apparaître la dépendance en le temps
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

Soit $(S(t),I(t))$ une solution de $\eqref{sys:KMK_dS}$-$\eqref{sys:KMK_dR}$ en proportions et $\mathcal{R}_0$ défini comme dans $\eqref{eq:R0_KMK}$.

La proportion $S(t)$ de susceptibles est une fonction décroissante et sa limite $S(\infty)$ est l'unique solution dans $(0,1/\mathcal{R}_0)$ de l'équation 
$$
1-S(\infty)+\frac{\ln[S(\infty)/S_0]}{\mathcal{R}_0}=0
$$
</div>

---

```R
rhs_SIR_KMK <- function(t, x, p) {
  with(as.list(c(x, p)), {
    dS = - beta * S * I
    dI = beta * S * I - gamma * I
    dR = gamma * I
    return(list(c(dS, dI, dR)))
  })
}
# Condition initiale pour S (pour calculer R_0)
S0 = 1000
gamma = 1/14
# On règle beta pour que R_0 = 1.5
beta = 1.5 * gamma / S0 
params = list(gamma = gamma, beta = beta)
IC = c(S = S0, I = 1, R = 0)
times = seq(0, 365, 1)
sol <- ode(IC, times, rhs_SIR_KMK, params)
```

---

```
plot(sol[, "time"], sol[, "I"], type = "l",
     main = TeX("SIR de Kermack et McKendrick, $R_0=1.5$"),
     xlab = "Temps (jours)", ylab = "Prévalence")
```

![height:500px center](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/sol_SIR_KMK_R015.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->En conclusion

---

# Normaliser ou pas?

- Dans le SIS du [Cours 04]() et ici, puisque la population totale est constante, on peut normaliser à $N=1$
- Cela simplifie pas mal certains calculs
- Toutefois, je ne suis pas très fan: il est important de toujours garder en tête les grandeurs biologiques
- Si vous normalisez, en tout cas, pour un papier à visée biomathématique, pensez à exprimer vos résultats en grandeur réelle


---

# Là où nous en sommes
- Un modèle SIS *endémique* dans lequel le seuil $\mathcal{R}_0=1$ est t.q. quand $\mathcal{R}_0<1$, la maladie s'éteint, tandis que lorsque $\mathcal{R}_0>1$, la maladie s'établit dans la population
- Un modèle SIR *épidémique* (le KMK SIR) dans lequel la présence ou absence de vague épidémique est caractérisée par la valeur de $\mathcal{R}_0$
- Le SIS et le KMK SIR sont intégrables dans un certain sens. **C'est une exception!!!**

