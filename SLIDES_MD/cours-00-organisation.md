---
marp: true
title: Organisation du Petit cours d'épidémiologie mathématique
description: Petit cours d'épidémiologie mathématique - Julien Arino - Cours 00 - Organisation du cours
theme: default
math: mathjax
paginate: false
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

# Petit cours d'épidémiologie mathématique

# Organisation du cours

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/github-icon.png)](https://github.com/julien-arino)

Department of Mathematics & Data Science Nexus
University of Manitoba*

<div style = "font-size:18px; margin-top:-10px; padding-bottom:30px;"></div>

Centre canadien de modélisation des maladies (CCDM/CCMM)
Canadian COVID-19 Mathematical Modelling Task Force
NSERC-PHAC EID Modelling Consortium (CANMOD, MfPH, OMNI/RÉUNIS)

<div style = "text-align: justify; position: relative; bottom: -5%; font-size:18px;">
* The University of Manitoba campuses are located on original lands of Anishinaabeg, Cree, Oji-Cree, Dakota and Dene peoples, and on the homeland of the Métis Nation.</div>

---

![bg right:40%](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/FredBrauer_2007-05-13.jpg)
# In Memoriam - Fred Brauer

Fred Brauer était un ami et mentor pour nombre de personnes de par le monde et une *éminence grise* de l'épidémiologie mathématique au Canada

J'ai eu le privilège d'apprendre de lui et d'enseigner l'épidémiologie mathématique avec lui dans un grand nombre de lieux

Fred est décédé le 17 octobre 2021. Ce cours est dédié à sa mémoire!

> When you learn to use a hammer, everything looks like a nail

---

<!-- _backgroundImage: "linear-gradient(to bottom, #85110d, 20%, white)" -->
# <!--fit-->Au sujet du cours

---

# Pour qui, ce cours?

- Étudiants en mathématiques, physique ou ingénierie désireux d'en apprendre plus au sujet de la modélisation mathématique dans le domaine de l'épidémiologie
- Suppose une certaine connaissance des équations différentielles ordinaires. Je ne vais pas rentrer dans les détails et vais supposer que vous savez pourquoi, par exemple, la stabilité asymptotique locale d'un point d'équilibre est déduite de la localisation dans le plan complexe des valeurs propres de la linéarisation du système
- Peut être intéressant pour des étudiants moins portés sur les mathématiques mais nécessitera un peu de travail de fond pour comprendre certains concepts

Ce cours reprend et étend les éléments du cours 3MC  .. Cette amélioration et traduction ont été réalisées à la demande de Mahamat Saleh Daoussa Haggar, Président de l'université de N'Djaména

---

# Répositoire GitHub pour le cours

La plupart du matériel pour le cours est disponible depuis ce [répositoire GitHub](https://julien-arino.github.io/3MC-course-epidemiological-modelling)

Ceci inclut les transparents, le code et des exemples de données

Ceci *n'inclut pas* le texte des références bibliographiques, pour des raisons de droit de diffusion, mais il y a des liens vers les articles et les livres. J'essaie autant que possible de fournir des articles Open Access

Une remarque: je vais par moment référer à des articles sur Wikipedia. Pour le bénéfice des plus jeunes ici: Wikipedia est une source fantastique d'information, et peut être un point de départ pour vos recherches, mais ne peut en aucun cas se substituer à des références "classiques" dans les journaux scientifiques

---

# Transparents

- Let transparents sont écrits en `Markdown` et `LaTeX` et sont diffusés en `html`; le code `html` est obtenu en utilisant l'extension [Marp](https://marp.app/) dans l'éditeur [Visual Studio Code](https://code.visualstudio.com/)

- Les fichiers image sont pour la plupart liés sur le répositoire GitHub et nécessitent par conséquent un accès à Internet. Des copies locales sont toutefois fournies pour la plupart des images, mais demanderont de modifier les chemins 

- Autant que faire se peut, j'ai indiqué la provenance des images, en liant vers l'image sur le site original ou en indicant le site d'origine en commentaire dans le fichier; ces commentaires sont visibles en tant que "notes de présentation" lorsque l'on utilise la version de présentation

---

# Code

- J'utilise `R`
- Des instructions pour installer `R` et se préparer pour le cours sont disponibles dans le répositoire GitHub
- Vous trouverez du code dans le répositoire, dans le sous-répertoire `CODE`
- Pour le côté "épidémiologie classique, une référence ouverte en anglais très utile: [R for applied epidemiology and public health](https://epirhandbook.com/en/index.html)

---

# Recommendations de lecture (épi mathématique)

Ce qui suit sont *mes* références préférées, il y en a bien d'autres tout aussi valables. Notez que ces livres ne sont pas en accès libre.

- Waltman. [Deterministic threshold models in the theory of epidemics](https://doi.org/10.1007/978-3-642-80820-3) (1974)
- Capasso. [Mathematical structures of epidemic systems](https://doi.org/10.1007/978-3-540-70514-7) (1993)
- Hethcote. [The mathematics of infectious diseases](https://doi.org/10.1137/S0036144500371907) SIAM Review (2000)
- Daley & Gani. [Epidemic modelling]() (2001)
- Brauer, PvdD & Wu. [Mathematical Epidemiology](https://doi.org/10.1007/978-3-540-78911-6) (2008)
- Brauer & C$^3$. [Mathematical Models in Population Biology and Epidemiology](https://doi.org/10.1007/978-1-4614-1686-9) (2012)
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

# Étape clé: identifiez la question scientifique

Un bon travail répond à une ou plusieurs questions. Si vous travaillez avec des praticiens, c'est ici que le gros du boulot réside. Quelle est leur question? Comment formuler un modèle qui soit à même de répondre à cette question? Important également de clarifier ce que vous pouvez et ne pouvez pas faire: ne vendez pas la lune!

---

# Au sujet de l'analyse mathématique

- Jadis, c'était le seul but de la plupart des papiers
- Cela reste important, mais évaluez votre audience: prouver la stabilité globale d'un équilibre, cést bien, mais est-ce vraiment ce sur quoi se focaliser si vous voulez présenter vos résultats à quelqu'un travaillant en santé publique?
- Au minimum, toutefois, il convient de conduire une analyse locale. Cela permet par exemple de savoir comment régler les valeurs des paramètres lors d'une étude numérique du problème

---

# Au sujet du numérique

- Le travail numérique doit complémenter le travail mathématique, pas le confirmer

- Si vous avez prouvé la stabilité globale d'un point d'équilibre, il n'est pas nécessaire d'illustrer cela par une simulation dans laquelle on voit une ou plusieurs solutions converger vers ce point d'équilibre

- Il est en fait rarement utile de montrer une solution. Des exceptions: avant d'aller à zero, le nombre d'infectieux fait quelque chose d'inhabituel, vous observez un doublement de période, etc.

- Uilisez plutot le numérique pour investiguer des scenarios ou tester l'effet du changement des paramètres du modèle, etc.

- Une bonne figure raconte une histoire, il est bien de passer du temps à réflechir à la façon de produire de bonnes illustrations!

---

# Au sujet des données

- Obtenir des données est bien plus facile que même il y a 20 ans
- En tant que modélisateur, il n'est pas nécessaire que tous les travaux soient conduits par les données (data-driven), mais il est nécessaire d'être conscient du contexte dans lequel le modèle est formulé (il est de bon ton de savoir quel est l'ordre de magnitude des grandeurs que vous considérez, par exemple)

---

# Organisation du cours

L1: Épidémies, épidémiologie et épidémiologie mathématique
L2: Modèle SIS et modèle SIR de Kermack et McKendrick
P1: Introduction to R. Collecting data. Solving ODEs in R
L3: Epidemics spreading among groups. Epidemics spreading in space and time                                     
L4: Group models
L5: Metapopulation models
P2: Model analysis, studying large-scale models in R
L6: Stochastic aspects in the spread of epidemics
L7: Stochastic epidemic models
L8: Agent-based models
P3: Analysis, studying stochastic models in R. Simulating agent-based models                   
L9: Some recent mathematical models for COVID-19, HIV/AIDS, TB, Malaria, etc.

---

# Note - durée et organisation des unités

- J'ai essayé de construire des unités relativement équilibrées en terme de contenu, mais n'ai pas réussi particulièrement bien
- Certaines unités sont donc plus longues que d'autres
- Les durées des vidéos, postées sur le site web, sont indicatives du poids d'une unité
- Dans le cours d'origine ([lien]()), les unités étaient entre unités de cours et unités de travaux pratiques. J'ai décidé ici de ne faire que des unités de cours, mais certaines de ces unités de cours doivent être comprises comme relevant plutôt du TP/TD

---

# <!--fit-->Code couleur de l'organisation du cours

![bg](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/bg_colour_red.png) 
![bg](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/bg_colour_yellow.png) 
![bg](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/bg_colour_green.png)