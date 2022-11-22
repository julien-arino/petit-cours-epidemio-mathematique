---
marp: true
title: Petit cours d'épidémiologie mathématique - Modèles dans des métapopulations
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 14 - Modèles dans des métapopulations
theme: default
paginate: false
math: mathjax
size: 4:3
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
# <!--fit-->Petit cours d'épidémiologie mathématique<br/>Modèles dans des métapopulations

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
- Considérations sur la stabilité globale
- Du numérique

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Considérations sur la stabilité globale

---

# <!--fit-->Remarques sur la SAG dans les métapopulations

- Contrairement à l'analyse locale, il n'y a pas d'algorithme permettant de considérer ce problème de façon systématique
- On procède au cas par cas. Deux exemples dans le reste de ce cours
- Des éléments de théorie globale systématique: travail de Zhisheng Shuai et collaborateurs, principalement
- La question, comme souvent: la SAG est-elle vraiment importante ? Cela dépend du contexte du travail..

---

# Modèle $|\mathcal{P}|$-SLIRS

Considérons un cas particulier de $\eqref{sys:pSLIRS_dS}$-$\eqref{sys:pSLIRS_dR}$ avec naissance constante
$$
\begin{align}
S_{p}' &=b_p+\nu_pR_p-\Phi_p-d_pS_p
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Spq}S_{q}
\tag{9a}\label{sys:pSLIRS_GAS_dS} \\
L_{p}' &=\Phi_p-\left( \varepsilon_{p}+d_{p}\right)L_{p}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Lpq}L_{q}
\tag{9b}\label{sys:pSLIRS_GAS_dL} \\
I_{p}' &=\varepsilon_pL_p-(\gamma_p+d_p)I_p
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Ipq}I_{q}
\tag{9c}\label{sys:pSLIRS_GAS_dI} \\
R_{p}' &=\gamma _{p}I_{p}-\left(\nu_{p}+d_{p}\right)R_{p}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{Rpq}R_{q}
\tag{9d}\label{sys:pSLIRS_GAS_dR}
\end{align}
$$
et incidence standard
$$
\tag{9e}
\Phi_p=\beta_p\frac{S_pI_p}{N_p}
$$


<div style = "position: relative; bottom: -4%; font-size:20px;">

- JA & PvdD. [Disease spread in metapopulations](https://server.math.umanitoba.ca/~jarino/publications/ArinoVdD-2006-FIC48.pdf). *Fields Institute Communications* **48**:1-13 (2006)
- JA. [Diseases in metapopulations](https://server.math.umanitoba.ca/~jarino/papers/Arino_metapopulations.pdf). In *Modeling and Dynamics of Infectious Diseases*, World Scientific (2009)
</div>

---

Le résultat de SAL de l'ÉSM lorsque $\mathcal{R}_{0}<1$ peut être rendu global

<div class="theorem">

Calculons $\mathcal{R}_0$ comme expliqué précédemment. Si $\mathcal{R}_0<1,$ alors l'ÉSM du système $|\mathcal{P}|$-SLIRS $\eqref{sys:pSLIRS_GAS_dS}$-$\eqref{sys:pSLIRS_GAS_dR}$ est globalement asymptotiquement stable
</div>

---

# Preuve

Puisque $S_{p}\leq N_{p}$ pour tout $t$, il suit que $\Phi_p\leq\beta_pN_pI_p/N_p=\beta_pI_p,$ et l'équation $\eqref{sys:pSLIRS_GAS_dL}$ donne l'inégalité
$$
\begin{equation}
L_p' \leq \beta_pI_p-(\varepsilon_p+d_p)L_p+\sum_{q\in\mathcal{P}}m_{Lpq}L_{q} \tag{10}\label{eq:ineq_dL}
\end{equation}
$$
Pour utiliser un théorème de comparaison, définissons un système linéaire consistant de $\eqref{eq:ineq_dL}$ et $\eqref{sys:pSLIRS_GAS_dI}$
$$
\begin{align}
L_p' &= \beta_pI_p-(\varepsilon_p+d_p)L_p+\sum_{q\in\mathcal{P}}m_{Lpq}L_q 
\tag{11a}\label{sys:pSLIRS_bounding_dL} \\
I_p' &= \varepsilon_pL_p-(\gamma_p+d_p+\delta_p)I_p+\sum_{q\in\mathcal{P}}m_{Ipq}I_q
\tag{11b}\label{sys:pSLIRS_bounding_dI} 
\end{align}
$$

---

- Le système linéaire $\eqref{sys:pSLIRS_bounding_dL}$-$\eqref{sys:pSLIRS_bounding_dI}$ a la matrice $F-V$ comme matrice de coefficients, donc (par des arguments dans la preuve du résultat sur $\mathcal{R}_0$ de van den Driessche & Watmough) vérifie $\lim\limits_{t\rightarrow \infty }L_{p}=0$ et $\lim\limits_{t\rightarrow \infty }I_{p}=0$ pour $\mathcal{R}_{0}=\rho (FV^{-1})<1$ 
- En utilisant un théorème de comparaison, il suit que ces limites sont aussi vérifées pour le sous-système non linéaire $\eqref{sys:pSLIRS_GAS_dL}$-$\eqref{sys:pSLIRS_GAS_dI}$
- Il suit par le même raisonnement que plus avant que $\lim\limits_{t\rightarrow \infty }R_{p}=0$ et $\lim\limits_{t\rightarrow \infty }S_{p}=N_{p}^\star$

Donc, lorsque $\mathcal{R}_{0}<1,$ l'ÉSM est GAS, la maladie s'éteint

---

# $|\mathcal{S}|\;|\mathcal{P}|$-SLIRS (espèces multiples)

On considère $\eqref{sys:spSLIRS_dS}$-$\eqref{sys:spSLIRS_dR}$ avec population totale constante, mouvement égal pour tous les états et irréductible

$$
\begin{align}
S_{sp}' &= d_{sp}N_{sp}+\nu_{sp}R_{sp}-\Phi_{sp}-d_{sp}S_{sp}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{spq}S_{sq} 
\tag{12a}\label{sys:spSLIRS_GAS_dS} \\
L_{sp}' &= \Phi_{sp}-(\varepsilon_{sp}+d_{sp})L_{sp}
+\textstyle{\sum_{q\in\mathcal{P}}}m_{spq}L_{sq}
\tag{12b}\label{sys:spSLIRS_GAS_dL} \\
I_{sp}' &= \varepsilon_{sp}L_{sp}-(\gamma_{sp}+d_{sp})I_{sp}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{spq}I_{sq}
\tag{12c}\label{sys:spSLIRS_GAS_dI} \\
R_{sp} &= \gamma _{sp}I_{sp}-(\nu_{sp}+d_{sp})R_{sp}
+\textstyle{\sum_{q\in\mathcal{P}}} m_{spq}R_{sq}
\tag{12d}\label{sys:spSLIRS_GAS_dR} 
\end{align}
$$

et incidence standard
$$
\tag{12e}
\Phi_{sp}=\sum_{k\in\mathcal{S}}\beta_{skp}\frac{S_{sp}I_{kp}}{N_p}
$$

<div style = "position: relative; bottom: -3%; font-size:20px;">

- JA, Davis, Hartley, Jordan, Miller \& PvdD. [A multi-species epidemic model with spatial dynamics](https://server.math.umanitoba.ca/~jarino/papers/ArinoDavisHartleyJordanMillerVdD-2005-MMB22.pdf). *Mathematical Medicine and Biology* **22**(2):129-142 (2005) 
- JA, Jordan \& PvdD. [Quarantine in a multi-species epidemic model with spatial dynamics](https://server.math.umanitoba.ca/~jarino/publications/ArinoJordanVdD-2007-MBS206.pdf). *Mathematical Biosciences* **206**(1):46-60 (2007)
</div>

---

<div class="theorem">

Pour le modèle $|\mathcal{S}|\;|\mathcal{P}|$-SLIRS $\eqref{sys:spSLIRS_GAS_dS}$-$\eqref{sys:spSLIRS_GAS_dR}$, définissons $\mathcal{R}_0$ en utilisant la méthode décrite plus haut. Si $\mathcal{R}_0<1$, alors l'ÉSM est GAS
</div>

---

# Preuve

Pour établir la SAG de l'ÉSM lorsque $\mathcal{R}_0<1$, considérons le système **non autonome** consistant de $\eqref{sys:spSLIRS_GAS_dL}$-$\eqref{sys:spSLIRS_GAS_dR}$, dans lequel on écrit $\eqref{sys:spSLIRS_GAS_dL}$ sous la forme
$$
\begin{equation}\label{sys:nonauton_E}\tag{13}
\begin{aligned}
L_{sp}' =& \sum_{j\in\mathcal{S}}
\beta_{sjp}(N_{sp}-L_{sp}-I_{sp}-R_{sp})\frac{I_{jp}}{N_{jp}} \\
&-(d_{sp}+\varepsilon_{sp})L_{sp} \\
&+\sum_{q\in\mathcal{P}} m_{spq}L_{sq}
-\sum_{q\in\mathcal{P}} m_{sqp}L_{sp}
\end{aligned}
\end{equation}
$$
i.e., où l'on a remplacé $S_{sp}$ par $N_{sp}-L_{sp}-I_{sp}-R_{sp}$, et $N_{sp}$ est solution de l'équation pour la population totale
$$
\begin{equation}
\frac{d}{dt}N_{sp}=
\sum_{q\in\mathcal{P}}m_{spq}N_{sq}
\end{equation}
$$

--- 

On a (par raisonnement similaire à celui de la SAL de l'ÉSM)
$$
\lim_{t\to\infty}N_{sp}(t)=N_{sp}^\star>0
$$
Écrivons le système non autonome $\eqref{sys:nonauton_E}$-$\eqref{sys:spSLIRS_GAS_dI}$-$\eqref{sys:spSLIRS_GAS_dR}$ comme
$$
\begin{equation}\label{sys:nonauton}\tag{14}
x' = f(t,x)
\end{equation}
$$
où $x$ vecteur $3|\mathcal{S}||\mathcal{P}|$-dimensionnel des $L_{sp}$, $I_{sp}$ et $R_{sp}$ 

L'ÉSM pour $\eqref{sys:spSLIRS_GAS_dL}$-$\eqref{sys:spSLIRS_GAS_dR}$ correspond au PÉ $x=0$ de $\eqref{sys:nonauton}$

$\eqref{sys:nonauton}$ dépend de $N_{sp}(t)$, mais $N_{sp}(t)$ peut être considéré independemment des variables épidémiologiques, et l'on a vu que $N_{sp}(t)\to N_{sp}^\star$ quand $t\to\infty$

---

Substituons la limite $N_{sp}^\star$ à $N_{sp}$ dans $\eqref{sys:nonauton_E}$
$$
\begin{equation}\label{sys:asympt_auton_E}\tag{15}
\begin{aligned}
L_{sp}' =& \sum_{j\in\mathcal{S}}
\beta_{sjp}(N_{sp}^\star-L_{sp}-I_{sp}-R_{sp})\frac{I_{jp}}{N_{jp}^\star} \\
&-(d_{sp}+\varepsilon_{sp})L_{sp}+\sum_{q\in\mathcal{P}} m_{spq}L_{sq}
\end{aligned}
\end{equation}
$$

Il suit que le système non autonome $\eqref{sys:nonauton}$ est *asymptotiquement autonome*, avec système limite
$$
\begin{equation}\label{sys:asympt_auton}\tag{16}
x' = g(x)
\end{equation}
$$

---

Pour montrer que 0 est GAS pour le système limite $\eqref{sys:asympt_auton}$, considérons le système linéaire
$$
\begin{equation}\label{sys:linear}\tag{17}
x'=\mathcal{L}x
\end{equation}
$$
où $x$ est le vecteur $3|\mathcal{S}||\mathcal{P}|$-dimensionnel consistant des $L_{sp}$, $I_{sp}$ et $R_{sp}$. Dans $\mathcal{L}$, on remplace $S_{sp}/N_{jp}$ par $N_{sp}^\star/N_{jp}^\star$. Les équations $\eqref{sys:spSLIRS_GAS_dI}$ et $\eqref{sys:spSLIRS_GAS_dR}$ ne sont pas affectées par cette transformation, tandis que $\eqref{sys:spSLIRS_GAS_dL}$ devient
$$ 
\begin{equation}\label{sys:lin_E}\tag{18}
\begin{aligned}
L_{sp}' &= \sum_{j\in\mathcal{S}}
\beta_{sjp}\frac{N_{sp}^*}{N_{jp}^*}I_{jp}
-(d_{sp}+\varepsilon_{sp})L_{sp}\\
&+\sum_{q\in\mathcal{P}} m_{spq}L_{sq}
\end{aligned}
\end{equation}
$$
Si l'on compare $\eqref{sys:asympt_auton_E}$ et $\eqref{sys:lin_E}$, on note que $g(x)\leq\mathcal{L}x$ pour tout $x \in \mathbb{R}_+^{3|\mathcal{S}||\mathcal{P}|}$

---

Dans $\eqref{sys:linear}$, les équations pour $L_{sp}$ et $I_{sp}$ n'impliquent pas $R_{sp}$. Soit $\tilde x$ la partie du vecteur $x$ correspondant aux variables $E_{sp}$ et $I_{sp}$, et soit $\tilde{\mathcal{L}}$ la sous-matrice de $\mathcal{L}$ correspondante

La méthode utilisée pour prouver la SAL peut être appliquée pour prouver la stabilité de $\tilde x=0$ pour le sous-système $\tilde x'=\tilde{\mathcal{L}}\tilde x$, avec $\tilde{\mathcal{L}}=F-V$

Si $\mathcal{R}_0<1$, alors $\tilde x=0$ est un équilibre stable du sous-système $\tilde x'=\tilde{\mathcal{L}}\tilde x$. Quand $\tilde x=0$, $\eqref{sys:spSLIRS_GAS_dR}$ prend la forme
$$
R_s' = (\mathcal{M}_s-D_s)R_s
$$
avec $R_s=(R_{s1},\ldots,R_{s|\mathcal{P}|})^T,$ $D_s=\mathsf{diag}(d_{s1},\ldots,d_{s|\mathcal{P}|})$

---

On sait, par les résultats vus avant, que $-\mathcal{M}_s$ est une M-matrice singulière et que $-\mathcal{M}_s+D_s$ est une M-matrice non-singulière pour tout $D_s$

Donc l'équilibre $R_s=0$ de ce système linéaire est stable

Par conséquent, l'équilibre $x=0$ de $\eqref{sys:linear}$ est stable quand $\mathcal{R}_0<1$

En utilisant un théorème de comparaison standard, il suit que 0 est un équilibre GAS de $\eqref{sys:asympt_auton}$

---

Lorsque $\mathcal{R}_0<1$, le système linéaire $\eqref{sys:lin_E}$ et $\eqref{sys:spSEIRS_GAS_dI}$ a un équilibre unique (l'ÉSM) puisque sa matrice de coefficients $F-V$ est non-singulière

La SAG suit par utilisation de résultats sur les systèmes asymptotiquement autonomes

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Investigation computationnelle</br> des grands systèmes

<div style = "position: relative; bottom: -30%; font-size:20px;">

- JA. [Spatio-temporal spread of infectious pathogens of humans](https://doi.org/10.1016/j.idm.2017.05.001). *Infectious Disease Modelling* **2**(2):218-228 (2017)
- JA. [Mathematical epidemiology in a data-rich world](https://doi.org/10.1016/j.idm.2019.12.008). *Infectious Disease Modelling* **5**:161-188 (2020)
- github repo [modelling-with-data](https://github.com/julien-arino/modelling-with-data)

</div>

---

# Pas très compliqué

- Comme pour l'analyse mathématique ([Cours 12](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-12-modeles-metapopulation.html)), si l'on procède avec attention et que l'on réfléchit un peu, ça n'est pas trop compliqué
- Enfin, pas plus dur que dans le cas de la basse dimension
- Important de prendre avantage de la structure vectorielle

---

# Définissons le champ de vecteurs

```R
SLIAR_metapop_rhs <- function(t, x, p) {
  with(as.list(x), {
    S = x[p$idx_S]
    L = x[p$idx_L]
    I = x[p$idx_I]
    A = x[p$idx_A]
    R = x[p$idx_R]
    N = S + L + I + A + R
    Phi = p$beta * S * (I + p$eta * A)
    dS = S - Phi + p$M %*% S
    dL = Phi - p$epsilon * L + p$M %*% L
    dI = (1 - p$pi) * p$epsilon * L - p$gammaI * I + p$M %*% I
    dA = p$pi * p$epsilon * L - p$gammaA * A + p$M %*% A
    dR = p$gammaI * I + p$gammaA * A + p$M %*% R
    list(c(dS, dL, dI, dA, dR))
  })
}
```

---

# Mise en place des paramètres

```R
pop = c(34.017, 1348.932, 1224.614, 173.593, 93.261) * 1e+06
countries = c("Canada", "China", "India", "Pakistan", "Philippines")
T = matrix(data = 
             c(0, 1268, 900, 489, 200, 
               1274, 0, 678, 859, 150, 
               985, 703, 0, 148, 58, 
               515, 893, 144, 0, 9, 
               209, 174, 90, 2, 0), 
           nrow = 5, ncol = 5, byrow = TRUE)
```

---

# Calculons la matrice de mouvement

```R
p = list()
# Use the approximation explained in Arino & Portet (JMB 2015)
p$M = mat.or.vec(nr = dim(T)[1], nc = dim(T)[2])
for (from in 1:5) {
  for (to in 1:5) {
    p$M[to, from] = -log(1 - T[from, to]/pop[from])
  }
  p$M[from, from] = 0
}
p$M = p$M - diag(colSums(p$M))
```

---

```R
p$P = dim(p$M)[1]
p$idx_S = 1:p$P
p$idx_L = (p$P + 1):(2 * p$P)
p$idx_I = (2 * p$P + 1):(3 * p$P)
p$idx_A = (3 * p$P + 1):(4 * p$P)
p$idx_R = (4 * p$P + 1):(5 * p$P)
p$eta = rep(0.3, p$P)
p$epsilon = rep((1/1.5), p$P)
p$pi = rep(0.7, p$P)
p$gammaI = rep((1/5), p$P)
p$gammaA = rep((1/3), p$P)
# The desired values for R_0. Here we take something simple
R_0 = rep(1.5, p$P)
```

---

# Définissons les conditions initiales

```R
# On fixe les conditions initiales
# Par exemple, 2 infectieux au Canada
L0 = mat.or.vec(p$P, 1)
I0 = mat.or.vec(p$P, 1)
A0 = mat.or.vec(p$P, 1)
R0 = mat.or.vec(p$P, 1)
I0[1] = 2
S0 = pop - (L0 + I0 + A0 + R0)
# Vecteur de conditions initiales à passer au solveur
IC = c(S = S0, L = L0, I = I0, A = A0, R = R0)
# Instants auxquels renvoyer une solution 
# Tous les 0.1 jours pour 5 ans ici
tspan = seq(from = 0, to = 5 * 365.25, by = 0.1)
```

---

# On choisit $\beta$ pour éviter une explosion

On prend $\mathcal{R}_0=1.5$ pour les patchs quand ils sont isolés. Pour cela, on résoud $\mathcal{R}_0$ en fonction de $\beta$ 
$$
\beta=\frac{\mathcal{R}_0}{S(0)}
\left(
\frac{1-\pi_p}{\gamma_{Ip}}
+\frac{\pi_p\eta_p}{\gamma_{Ap}}
\right)^{-1}
$$ 

<p style="margin-bottom:2cm;"></p> 

```R
for (i in 1:p$P) {
  p$beta[i] = 
    R_0[i] / S0[i] / ((1 - p$pi[i])/p$gammaI[i] + p$pi[i] * p$eta[i]/p$gammaA[i])
}
```

---

# Et maintenant les problèmes commencent..

```R
# On appelle le solveur
sol <- deSolve::ode(y = IC, times = tspan, 
                    func = SLIAR_metapop_rhs, parms = p)
## DLSODA- At current T (=R1), MXSTEP (=I1) steps
## taken on this call before reaching TOUT
## In above message, I1 = 5000
##
## In above message, R1 = 117.498
```

La sortie au dessus indique un problème numérique lors de l'intégration. Le problème vient certainement de la différence de taille entre les pays, en particulier le Canada et la Chine

Il faut jouer avec les taux de mouvement et les conditions initiales. Je n'explique pas ici

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--- fit --->Épilogue

---

- L'espace est une composante fondamentale du processus de propagation épidémique et **ne peut pas** être ignoré, dans les modèles **et** dans les décisions de santé publique

- Une des façons de modéliser l'espace est en utilisant des modèles en métapopulation

- Les modèles en métapopulation sont faciles à analyser localement et donnent des résultats intéressants au niveau global

- Les simulations déterministes peuvent être couteuses en RAM et en CPU mais sont faciles

- Les modèles en métapopulation ne sont pas la seule solution, loin de là !!!