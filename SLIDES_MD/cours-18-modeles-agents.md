---
marp: true
title: Petit cours d'épidémiologie mathématique - Modèles agents
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 18 - Modèles agents
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

# Petit cours d'épidémiologie mathématique<br/>Modèles agents-centrés

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/github-icon.png)](https://github.com/julien-arino)

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

- Qu'est-ce qu'un modèle agent (ABM)
- Quand utiliser un ABM
- Quand ne pas utiliser un ABM
- Quelques exemples
- Simulation des modèles agents

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Qu'est-ce qu'un modèle agent (ABM)

---

# ABM $\neq$ IBM

- Au début de l'utilisation de ce type de modèles, on les appelait souvent IBM, pour *individual-based models*
- Depuis, une distinction "philosophique" a émergé:
  - IBM sont des modèles mathématiques qui considèrent les individus comme les unités et sont typiquement stochastiques; e.g., CMTD, CMTC, processus de branchement, etc.
  - ABM sont des modèles computationnels dont l'étude est, pour la plupart, possible seulement de façon numérique

---

# ABM vs modèles en réseaux

- Les modèles en réseaux donnent des propriétés aux nœuds et les couplent au sein de graphes
- Peuvent être des ABM, mais il est également possible d'étudier certains réseaux analytiquement
- Voir le [Cours 17](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-17-modeles-reseaux.html) sur les modèles en réseaux

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Quand utiliser un ABM

---

# Les ABM sont utiles pour décrypter les processus de contact

- Les modèles mathématiques classiques capturent le processus de contact en faisant des approximations
- Les modèles classiques permettent une certaine flexibilité (voir par exemple la section dans le [Cours 04](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-04-modeles-SIS-SIR.html) sur les fonctions d'incidence ou le [Cours 11](https://julien-arino.github.io/petit-cours-epidemio-mathematique/cours-11-modeles-groupes.html) sur les modèles de groupes), mais cela reste limité et une approximation
- Les ABM peuvent modéliser les "trajectoires" des individus, donc étant donné une définition de ce qui constitue un contact (e.g., à quelle distance, pendant combien de temps), permettent de compter les contacts
- Cela reste des modèles, comme la phrase *étant donné une définition de ce qui constitue un contact* au dessus met en évidence

---

# <!--fit-->Les ABM sont utiles pour comprendre les réponses comportementales

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Quand ne pas utiliser un ABM

---

# Comme avec _tous_ les outils, attention !

- Il y a un effet *loi des grands nombres* qui joue souvent: si il y a beaucoup d'agents, hormis si un comportement émergent a lieu, on obtient souvent le même type de résultat qu'avec des EDO...

# Avec ce type d'outil en particulier, attention !

- Il y a une tendance chez certains informaticiens à développer un nouvel outil et de chercher à faire utiliser cet outil, donc pour commencer au moins, utilisez des outils établis (comme ça il y a une communauté sur le web sur laquelle s'appuyer pour obtenir de l'aide)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Quelques exemples

- Résistance aux antibiotiques dans un hôpital
- Efficacité du suivi des contacts (contact tracing)
- Contacts pendant le Hajj

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Résistance aux antibiotiques dans un hôpital

<div style = "position: relative; bottom: -30%; font-size:20px;">

D’Agata, Magal, Olivier, Ruand & Webb. [Modeling antibiotic resistance in hospitals: The impact of minimizing treatment duration](https://doi.org/10.1016/j.jtbi.2007.08.011), Journal of Theoretical Biology (2007)
</div>

---

# Un IBM qui est presque un ABM (ou vice-versa)

- Travail qui illustre bien la "proximité culturelle" entre IBM et ABM
- Modèle stochastique et basé sur l'individu, avec suffisamment de tenue qu'il est possible de dériver des EDO approximant son comportement
- Permet toutefois de suivre très spécifiquement la progression des individus dans le processus (ABM, dans ce sens)

---

# Le contexte et le modèle

- Trois processus:
  1. admission et sortie des patients
  2. infection des patients par les HCW (*health care workers*, travailleurs de santé) 
  3. contamination des HCW par les patients
- La contamination des HCW est "transiante": ils portent le pathogène, mais s'ils se lavent les mains correctement, ils ne sont plus porteurs
- Les HCW sont en 3/8 (chaque jour a 3 périodes de 8 heures)
- Les patients sont mis en contact avec le pathogène par les actes de soin des HCW
- Des règles établissent la probabilité de contamination par unité de temps

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS//Dagata_etal_patients_profiles.jpg)

<!-- Diagramme de contacts patient–HCW pour 4 patients et 1 HCW pendant la période de travail du HCW. Statut des patients: non infecté (vert), infecté avec la souche non résistante (jaune), infecté avec la souche résistante (rouge). Statut du HCW: non contaminé (______ ), contaminé avec la souche non résistante strain (………), contaminé avec la souche résistante (- - - - - ) -->

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS//Dagata_etal_comparisons.jpg)

<!-- La figure de gauche (resp. de droite) correspond à 1 trajectoire (resp. la moyenne de 80 trajectoires) de l'IBM pendant la période de travail, sans sortie ni admission de patients, et pas de changement du statut d'infection des patients -->

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Efficacité du suivi des contacts (contact tracing)

<div style = "position: relative; bottom: -30%; font-size:20px;">

Tian, Osgood, Al-Azem & Hoeppner. [Evaluating the Effectiveness of Contact Tracing on Tuberculosis Outcomes in Saskatchewan Using Individual-Based Modeling](https://doi-org.uml.idm.oclc.org/10.1177%2F1090198113493910), Health Education & Behavior (2013)
</div>

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS//TianOsgood_etal_TB_CT.jpeg)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS//TianOsgood_etal_state_flow_agent.jpeg)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS//TianOsgood_etal_model_CT.jpeg)

---

Ils formulent des scénarios de suivi des cas

![height:60%](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS//TianOsgood_etal_scenarios.jpeg)

Et évaluent ensuite ces scénarios et comparent les résultats

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS//TianOsgood_etal_scenario_results.jpeg)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Contacts pendant le Hajj

<div style = "position: relative; bottom: -30%; font-size:20px;">

Tofighi, Asgary, Tofighi, Najafabadi, Arino, Amiche, Rahman, McCarthy, Bragazzi, Thommes,  Coudeville, Grunnill, Bourouiba and Wu. [Estimating Social Contacts in Mass Gatherings for Disease Outbreak Prevention and Management (Case of Hajj Pilgrimage)](http://dx.doi.org/10.2139/ssrn.3678581), Tropical Diseases, Travel Medicine and Vaccines
</div>

---

# <!--fit-->Contexte - les groupements de masse (*mass gatherings*)

- Nombreuses raisons: manifestations, évènements culturels, sportifs, religieux ..
- Phénomène ancien mais accentué par la facilité de voyager loin
- De nombreuses personnes entrent en contact
- Les participants viennent souvent de beaucoup de régions différentes (du monde), qui sont, à un instant donné, sujettes à des pressions infectieuses variées
- Si de la propagation a lieu pendant l'évènement, ceci a la capacité de répandre un pathogène dans une zone dont il était absent, lorsqu'un individu infecté pendant le groupement rentre à la maison

---

# Contacts pendant le Hajj

- Hajj est un évènement annuel et l'un des plus grands groupements de masse 
- (Kumbh Mela en Inde, tous les 12 ans. Ardh Kumbh Mela de 2019 à Allahabad: 200 millions de participants, dont 50 millions un jour)
- Participants viennent de la majorité des pays du monde
- Les contacts pendant une partie de l'évènement sont vraiment spécifiques à la configuration des lieux où l'évènement a lieu
- Avantage (*pour la santé publique*): il faut un visa pour participer, donc on sait d'où viennent les participants

---

# Le contexte - Tawaf et Sa'ee

- (Je m'excuse par avance: je suis un peu flou sur les détails !)
- Les pèlerins entrent dans la mosquée Masjid Al-Haram par plusieurs "portes"
- Se rendent vers le Mataaf (zone autour de la Kaaba), font 7 fois le tour de la Kaaba dans le sens trigonométrique direct (le *Tawaf*)
- Font ensuite 7 voyages entre les monts Safâ et Marwah (le *Sa'ee*)


---

![bg contain](https://upload.wikimedia.org/wikipedia/commons/a/aa/As_pilgrims_prepare_to_return_to_their_homes%2C_Saudi_authorities_begin_to_prep_for_next_year%27s_Hajj_-_Flickr_-_Al_Jazeera_English.jpg)

---

![bg contain](https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Great_Mosque_of_Mecca.jpg/1280px-Great_Mosque_of_Mecca.jpg)

---

![bg contain](https://upload.wikimedia.org/wikipedia/commons/0/0d/Sa%27yee_To_return.jpg)

<!---

# Tawaf dans les temps pre-COVID-19

<iframe width="800" height="450" src="https://www.youtube.com/embed/L-YyR1oN66w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Tawaf - Version socialement distancée

<iframe width="800" height="450" src="https://www.youtube.com/embed/Rl8a0wQePCo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Sa'ee dans les temps pre-COVID-19

<iframe width="800" height="450" src="https://www.youtube.com/embed/r1qM-mHj2d0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Sa'ee - Version socialement distancée

<iframe width="800" height="450" src="https://www.youtube.com/embed/JVges7Q2Mow" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
-->

---

- De ceci ont déduit:
  - Typiquement foule en haute densité
  - Patterns de contact très spécifiques
- Opportunités de transmission sont élevées
- Toutefois, des mécanismes de contrôle sont aussi disponibles, du fait de la spécificité du processus

$\implies$ comprendre les patterns et la fréquence des contact est très important

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS//ABM_Hajj_MAH_3Dmodel.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS//ABM_Hajj_setup.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS//ABM_Hajj_config_tawaf.png)

---

<iframe width="800" height="450" src="https://www.youtube.com/embed/_oOf4uNIghw?loop=1&modestbranding=1&origin=https://julien-arino.github.io/&rel=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; loop" allowfullscreen>
</iframe>

---

<iframe width="800" height="450" src="https://www.youtube.com/embed/qcWBi17qKnU?start=9&loop=1&modestbranding=1&origin=https://julien-arino.github.io/&rel=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; loop" allowfullscreen>
</iframe>



---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Simulation des modèles agents


---

# Systèmes de simulation "clé en main"

- [NetLogo](http://ccl.northwestern.edu/netlogo/). GPL (Open Source)
- [AnyLogic](https://www.anylogic.com/). Version personnelle (limitée) gratuite, pas Open Source

# Des librairies R