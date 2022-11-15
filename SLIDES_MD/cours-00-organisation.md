---
marp: true
title: Petit cours d'épidémiologie mathématique - Organisation du cours
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 00 - Organisation du cours
theme: default
math: mathjax
paginate: false
size: 4:3
---

<style>
  section {
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
  }
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
# <!--fit-->Petit cours d'épidémiologie mathématique<br/>Organisation du cours

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/github-icon.png)](https://github.com/julien-arino)

Department of Mathematics & Data Science Nexus
University of Manitoba*

<div style = "font-size:18px; margin-top:-10px; padding-bottom:30px;"></div>

Centre canadien de modélisation des maladies (CCMM)
NSERC-PHAC EID Modelling Consortium (CANMOD, MfPH, OMNI/RÉUNIS)

<div style = "text-align: justify; position: relative; bottom: -5%; font-size:25px;">
* The University of Manitoba campuses are located on original lands of Anishinaabeg, Cree, Oji-Cree, Dakota and Dene peoples, and on the homeland of the Métis Nation.</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Au sujet du cours

---

# Quelques abbréviations

- PÉ: point d'équilibre
- ESM: équilibre sans maladie
- ÉÉ: équilibre endémique
- LAS: localement asymptotiquement stable
- SAL: stabilité asymptotique locale
- GAS: globalement asymptotiquement stable
- SAG: stabilité asymptotique globale

---

# Pour qui, ce cours?

- Étudiants en mathématiques, physique ou ingénierie désireux d'en savoir plus au sujet de la modélisation mathématique dans le domaine de l'épidémiologie
- Suppose une certaine connaissance des équations différentielles ordinaires. Je ne vais pas rentrer dans les détails et vais supposer que vous savez pourquoi, par exemple, la stabilité asymptotique locale d'un point d'équilibre est déduite de la localisation dans le plan complexe des valeurs propres de la linéarisation du système
- Peut être intéressant pour des étudiants moins portés sur les mathématiques mais nécessitera un peu de travail de fond pour comprendre certains concepts

---

- Ce cours reprend et étend les éléments du [cours 3MC](https://julien-arino.github.io/petit-cours-epidemio-mathematique/)
- Cette amélioration et traduction ont été réalisées à la demande de Mahamat Saleh Daoussa Haggar (Université de N'Djaména)

---

# Répositoire GitHub pour le cours

La plupart du matériel pour le cours est disponible depuis ce [répositoire GitHub]()

Ceci inclut les transparents, le code et des données

Ceci *n'inclut pas* les références bibliographiques citées, pour des raisons de droit de diffusion, mais il y a des liens vers les articles et les livres. J'essaie autant que possible de fournir des articles Open Access

Une remarque: je vais parfois référer à des articles sur Wikipedia. Pour le bénéfice des plus jeunes: Wikipedia est une source d'information fantastique, et peut être un point de départ pour vos recherches, mais ne peut en aucun cas se substituer à des références "classiques" dans les journaux scientifiques

---

# Ces transparents

- Les transparents sont en `Markdown` et `LaTeX` et sont diffusés en `html`; le code `html` est obtenu en utilisant l'extension [Marp](https://marp.app/) dans l'éditeur [Visual Studio Code](https://code.visualstudio.com/)

- Les fichiers image sont pour la plupart liés sur le répositoire GitHub et nécessitent un accès à Internet. Des copies locales sont fournies pour la plupart des images, mais demanderont de modifier les chemins 

- Autant que faire se peut, j'ai indiqué la provenance des images, en liant vers l'image sur le site original ou en indicant le site d'origine en commentaire dans le fichier; ces commentaires sont visibles en tant que "notes de présentation" lorsque l'on utilise la version de présentation

---

# Code

- J'utilise `R`
- Des instructions pour installer `R` et se préparer pour le cours sont disponibles dans le répositoire GitHub
- Vous trouverez du code dans le répositoire, dans le sous-répertoire `CODE`
- Pour le côté "épidémiologie classique, une référence ouverte en anglais très utile: [R for applied epidemiology and public health](https://epirhandbook.com/en/index.html)

---

# Recommendations de lecture

Ce qui suit sont *mes* références préférées. Notez que ces livres ne sont pas en accès libre.

- Waltman. [Deterministic threshold models in the theory of epidemics](https://doi.org/10.1007/978-3-642-80820-3) (1974)
- Capasso. [Mathematical structures of epidemic systems](https://doi.org/10.1007/978-3-540-70514-7) (1993)
- Hethcote. [The mathematics of infectious diseases](https://doi.org/10.1137/S0036144500371907) SIAM Review (2000)
- Daley & Gani. [Epidemic modelling]() (2001)
- Brauer, PvdD & Wu. [Mathematical Epidemiology](https://doi.org/10.1007/978-3-540-78911-6) (2008)
- Brauer, C$^3$ & Feng. [Mathematical Models in Epidemiology](https://doi.org/10.1007/978-1-4939-9828-9) (2019)

---

# Objectifs du cours

Introduction à l'épidémiologie mathématique
 - Problèmes
 - Méthodes

Nous aurons les problèmes suivants en tête:
1. Techniques de modélisation
2. Analyse mathématique des modèles
3. Analyse computationelle des modèles
4. Utilisation des données

Il est primordial de conduire ces quatres activités interactivement

---

# Au sujet de la modélisation

- C'est une étape clé, ne la négligez pas
- Soyez créatifs, ne vous laissez pas enfermer dans un dogme
- Prennez le temps
- Essayez de produire des modèles simples

---

# Étape clé: identifiez la question scientifique

- Un bon travail répond à une ou plusieurs questions
- Si vous travaillez avec des praticiens, c'est ici que le gros du boulot réside. Quelle est leur question? Comment formuler un modèle qui soit à même de répondre à cette question? 
- Important également de clarifier ce que vous pouvez et ne pouvez pas faire: ne vendez pas la lune!

---

# Au sujet de l'analyse mathématique

- Jadis le seul but de la plupart des papiers
- Reste important, mais évaluez votre audience: prouver la stabilité globale d'un équilibre, c'est bien, mais est-ce vraiment ce sur quoi se focaliser si vous voulez présenter vos résultats à quelqu'un travaillant en santé publique?
- Au minimum, il convient de conduire une analyse locale. Permet p. ex. de savoir comment régler les valeurs des paramètres lors de l'étude numérique du problème

---

# Au sujet du numérique

- Le travail numérique complémente les maths 

- Si on a la SAG d'un PÉ, il n'est pas nécessaire d'illustrer cela par une simulation dans laquelle on voit une ou plusieurs solutions converger vers ce PÉ

- Rarement utile de montrer une solution. Des exceptions: vous observez un truc étrange avant la convergence, etc.

- Utilisez plutôt le numérique pour investiguer des scenarios ou tester l'effet du changement des paramètres du modèle, etc.

- Une bonne figure raconte une histoire, il est bien de passer du temps à réflechir à la façon de produire de bonnes illustrations!

---

# Au sujet des données  

- Obtenir des données est bien plus facile que même il y a 20 ans
- En tant que modélisateur, il n'est pas nécessaire que tous les travaux soient conduits par les données (*data-driven*), mais il est nécessaire d'être conscient du contexte dans lequel le modèle est formulé; e.g., il est bien de savoir l'ordre de magnitude des grandeurs considérées

---

# Organisation du cours

- Cours 00: [Organisation du cours](cours-00-organisation.html)
- Cours 01: [Épidémies, épidémiologie et épidémiologie mathématique](cours-01-introduction.html)
- Cours 02: [Introduction à R et résolution numérique des ODE](cours-02-intro-R-ODE.html)
- Cours 03: [Collecte et utilisation des données](cours-03-donnees.html)
- Cours 04: [Le modèle SIS](cours-04-modele-SIS.html)
- Cours 05: [Fonctions d'incidence](cours-05-fonctions-incidence.html)
- Cours 06: [Le modèle de Kermack et McKendrick](cours-06-modele-KMK.html)
- Cours 07: [Étapes de l'analyse mathématique des modèles, $R_0$ et la taille finale d'une épidémie](cours-07-etapes-R0-final-size.html)
- Cours 08: [Le modèle SLIRS](cours-08-modele-SLIRS.html)

---

# Organisation du cours (suite)

- Cours 09: [Temps de résidence dans les compartiments](cours-09-temps-de-residence.html)
- Cours 10: [Quelques modèles épidémiques](cours-10-modeles-epidemiques.html)
- Cours 11: [Plus de modélisation](cours-11-plus-de-modelisation.html) 
- Cours 12: [Propagation dans des groupes et propagation spatio-temporelle des épidémies](cours-10-heterogeneite-groupe-et-spatiale.html)
- Cours 13: [Modèles de groupes](cours-13-modeles-groupes.html)
- Cours 14: [Modèles dans des métapopulations](cours-14-modeles-metapopulation.html)
- Cours 15: [Modèles spatiaux en EDP](cours-15-modeles-EDP.html)
- Cours 16: [Types de modèles stochastiques utilisés en épidémiologie](cours-16-stochasticite.html)

---

# Organisation du cours (suite)

- Cours 17: [Modèles en chaînes de Markov](cours-17-modeles-MC.html)
- Cours 18: [Simulation des systèmes stochastiques](cours-18-simulation-stochastique.html)
- Cours 19: [Modèles en réseaux](cours-19-modeles-reseaux.html)
- Cours 20: [Modèles agents-centrés](cours-20-modeles-agents.html)
- Cours 21: [Ajustement des paramètres](cours-21-ajustement-parametres.html) 
- Cours 22: [Publier](cours-22-publier.html)

---

# Note - durée et organisation des unités

- J'ai essayé de construire des unités relativement équilibrées en terme de contenu
- Je n'ai pas particulièrement bien réussi 
- Certaines unités sont plus longues que d'autres
- Les durées des vidéos sont indicatives du poids d'une unité

---

# <!--fit-->Code couleur de l'organisation du cours

![bg](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/bg_colour_red.png) 
![bg](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/bg_colour_yellow.png) 
![bg](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/bg_colour_green.png)

Ce beau drapeau guinéen est accidentel ☺️, mais sert à illustrer comment j'indique les différents niveaux d'organisation du cours:
- rouge: plus haut niveau (différents chapitres du cours)
- jaune: sections
- vert: sous-sections
