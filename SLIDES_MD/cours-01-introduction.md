---
marp: true
title: Introduction au Petit cours d'épidémiologie mathématique
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 01 - Introduction
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

# Petit cours d'épidémiologie mathématique<br/><!--fit-->Épidémies, épidémiologie et épidémiologie mathématique

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

- Épidémies
- Épidémiologie
- Épidémiologie mathématique
- Épidémiologie computationnelle
- Utilisation de données en épidémiologie

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Épidémies

---

# Considérations historiques

- Les épisodes épidémiques sont parmi les premiers évenements rapportés dans l'histoire
- Mise en garde: je discute peu ici de l'aspect spatio-temporel de la propagation, qui fait l'objet de cours spécifiques [Cours 03](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_L03_SpreadInGroups_SpreadInSpace.html) et [Cours 05](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_L05_MetapopulationModels.html)

---

# Premières épidémies connues ([Wikipedia](https://en.wikipedia.org/wiki/List_of_epidemics))

<style scoped>
table {
    height: 100%;
    width: 100%;
    font-size: 20px;
}
</style>

| Evènement | Date | Lieu | Maladie | Mortalité (estimée) |
|---|---|---|---|---|
| Peste de Megiddo | 1350 AEC | Megiddo, terre de Canaan | ? | ? | 
| [Peste d'Athène](https://en.wikipedia.org/wiki/Plague_of_Athens) | 429–426 AEC | Grèce, Libye, Égypte, Éthiopie | Typhus, fièvre typhoide ou FHV ? |  75 000–10 000 |
| [Épidémie 412 AEC](https://en.wikipedia.org/wiki/412_BC_epidemic) |412 AEC | Grèce, République romaine | Influenza ? | ? |
| [Antonine Plague](https://en.wikipedia.org/wiki/Antonine_Plague) | 165–180 EC (jusqu'à 190 EC ?) | Empire romain | Variole ? | 5–10 million |
| Peste de Jian'an | 217 EC | Dynastie Han | Fièvre typhoide ou FHV ? | ? |
| [Plague of Cyprian](https://en.wikipedia.org/wiki/Plague_of_Cyprian) | 250–266 EC | Europe | Variole ? | ? |
| [Plague of Justinian](https://en.wikipedia.org/wiki/Plague_of_Justinian) (1ère pandémie de peste) | 541–549 EC | Europe et Asie de l'Ouest | Peste bubonique | 15–100 million (25–60% de la population Européenne) | 
| [Roman Plague of 590](https://en.wikipedia.org/wiki/Roman_Plague_of_590) (1ère pandémie de peste) | 590 EC | Rome, Empire Byzantin | Peste bubonique | ? |
| [Plague of Sheroe](https://en.wikipedia.org/wiki/Plague_of_Sheroe) (1ère pandémie de peste) | 627–628 EC | Bilad al-Sham | Peste bubonique | 25 000+ |
| [Plague of Amwas](https://en.wikipedia.org/wiki/Plague_of_Amwas) (1ère pandémie de peste) | 638–639 EC | Empire Byzantin, Asie de l'Ouest, Afrique | Peste bubonique | 25 000+ |
| [Plague of 664](https://en.wikipedia.org/wiki/Plague_of_664) (1ère pandémie de peste)  | 664–689 EC | Iles Britiniques | Peste bubonique | ? |
| Peste de 698–701 (1ère pandémie de peste) | 698–701 EC | Empitre Byzantin, Asie de l'Ouest, Syrie, Mésopotamie | Peste bubonique | ? |
| [Épidémie japonaise de variole de 735–737](https://en.wikipedia.org/wiki/735%E2%80%93737_Japanese_smallpox_epidemic) | 735–737 EC | Japon | Variole | 2 million (approx. 1/3 de la population japonaise) | 
| Peste de 746–747 (1ère pandémie de peste) | 746–747 EC | Empire Byzantin, Asie de l'Ouest, Afrique | Peste bubonique | ? |

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Épidémiologie

- Qui, quand et où?
- Lutte contre les infections

---

# Définition

> **Epidemiology** is the study and analysis of the distribution (who, when, and where), patterns and determinants of health and disease conditions in defined populations [[Wikipedia](https://en.wikipedia.org/wiki/Epidemiology)]

> Epidemiology is the study of how often diseases occur in different groups of people and why. Epidemiological information is used to plan and evaluate strategies to prevent illness and as a guide to the management of patients in whom disease has already developed [[BMJ](https://www.bmj.com/about-bmj/resources-readers/publications/epidemiology-uninitiated/1-what-epidemiology)]

Étymologie: *the study of what is upon the people*, du Grec $\varepsilon\pi\iota$ (*upon, among*), $\delta\varepsilon\mu\omega\sigma$ (*people, district*) and $\lambda\omega\gamma\omega\sigma$ (*study, word, discourse*)


---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Qui, quand et où?

---

# Qui, quand et où?

Recall part of the definition on Wikipedia
> **Epidemiology** is the study and analysis of the distribution (who, when, and where)

---

Domaine terminologiquement lourd. Quelques pistes pour les mathématiciens:
- Milwid et al. [Toward standardizing a lexicon of infectious disease modeling terms](https://doi.org/10.3389/fpubh.2016.00213). Frontiers in Public Health 2016
- Moghadas and Laskowski. [Review of terms used in modelling influenza infection](https://nccid.ca/wp-content/uploads/sites/2/2015/03/ReviewTermsFluWEB.pdf). NCCID 2014

---

# Qui?

- **Épidémiologie** est le terme typiquement employé lorsque l'on parle d'humains, bien qu'il soit aussi employé parfois quand on cherche une description simple; p.ex., épidémiologie des maladies des plantes
- **Épizootique**: denoting or relating to a disease that is temporarily prevalent and widespread in an animal population
- **Panzootic** is like a pandemic for animals
- **One Health**: considers health of humans, animals and their environment (including plants)

---

![bg contain 55%](https://els-jbs-prod-cdn.jbs.elsevierhealth.com/cms/attachment/f4abefee-9839-4a6c-8e19-57ce0e85c304/gr1_lrg.jpg "https://doi.org/10.1016/S0140-6736(20)31027-8")

---

# Incidence & Prévalence (quand?)

**Incidence**: nombre de nouveaux cas dans une population générés pendant une certaine période de temps

**Prévalence**: nombre de cas d'une maladie présents dans une population à un certain instant

---

# Courbes épidémiques

- Utilisées pour compter les nouveaux cas en fonction du temps
- Peu de cas: typiquement "individualisées" (diagrammes en batons)
- Beaucoup de cas: courbe continue

---

![bg contain](https://media.springernature.com/full/springer-static/image/art%3A10.1038%2Fs41591-020-1092-0/MediaObjects/41591_2020_1092_Fig1_HTML.png?as=webp "https://doi.org/10.1038/s41591-020-1092-0")

---

![bg contain](https://www.science.org/cms/10.1126/science.abf8832/asset/c20b60b8-4867-4cbb-80ba-a4e6a80135e1/assets/graphic/371_27_f1.jpeg "https://doi.org/10.1126/science.abf8832")

---

# Un peu de terminologie pour "où?"

- **Épidémie**: maladies qui *traversent* une population
- **Pandémie**: épidémie qui s'est étendue à une grande région, p.ex., plusieurs continents ou le monde entier
- **Endémie**: maladies qui *résident dans* une population
- On ne dit pas "panendémie"

---

![bg left:50%](https://upload.wikimedia.org/wikipedia/commons/c/c7/Snow-cholera-map.jpg)

# <!--fit-->Où? [Épidémie de cholera de 1854](https://en.wikipedia.org/wiki/1854_Broad_Street_cholera_outbreak)

Épidémie de cholera près de Broad Street, Londres (GB)

Étudiée par [John Snow](https://en.wikipedia.org/wiki/John_Snow)

> I found that nearly all the deaths had taken place within a short distance of the [Broad Street] pump

---

# [Phases OMS d'une pandémie (influenza)](https://www.ncbi.nlm.nih.gov/books/NBK143061/)

<style>
    .heatMap {
        overflow:scroll;
    }
    .heatMap th {
        background: grey;
    }
    .heatMap tr:nth-child(1) { background: green;}
    .heatMap tr:nth-child(2) { background: green;}
    .heatMap tr:nth-child(3) { background: yellow;}
    .heatMap tr:nth-child(4) { background: yellow;}
    .heatMap tr:nth-child(5) { background: orange;}
    .heatMap tr:nth-child(6) { background: red;}
</style>

<div class="heatMap">

| Période | Phase | Description |
|:---|:---:|:---|
| Interpandémie | 1 | Pas de rapports d'infection d'humains par un virus influenza animal circulant dans une population animale |
| | 2 | Un virus influenza animal circulant dans une population domestiquée ou sauvage a été observé comme causant des infections chez les humains et a par conséquent un potentiel pandémique |
| Alerte pandémique | 3 | Animal or human-animal influenza reassortant virus has caused sporadic cases or small clusters of disease in people, but has not resulted in H2H transmission sufficient to sustain community-level outbreaks |
| | 4 | Une transmission humain-à-humain (H2H) d'un virus influenza recombinant animal ou humain-animal capable de propagation soutenue au niveau des communautés, est vérifiée |
| | 5 | Le virus identifié a provoqué des explosions (*outbreaks*) soutenues au niveau des communautés dans au moins 2 pays dans 1 région OMS |
| Pandémie | 6 | En plus des critères de la Phase 5, le même virus a provoqué des explosions soutenues au niveau des communautés dans au moins 1 autre pays dans une région OMS différente |
</div>

---

![bg contain](https://upload.wikimedia.org/wikipedia/commons/c/c1/Difference_between_outbreak%2C_endemic%2C_epidemic_and_pandemic-en.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Lutte contre les infections

---

# Lutte contre les infections

> Epidemiological information is used to plan and evaluate **strategies to prevent illness** and as a guide to the **management of patients** in whom disease has already developed

- Prévention des maladies
    - Mesures prophylactiques
    - Vaccination
- Gestion de la maladie
    - Prévention de la propagation (e.g., en hôpital)
    - Traitement

---

# Immunisation

- Variole première maladie pour laquelle le procédé est connu
- Mentionné dans un livre chinois de 1549
- Chine: vésicules pulvérisées soufflées dans le nez des individus sains; mortalité induite par la variolation non négligeable (0.5-2%) mais plus bas que normal (20%)
- 1798:  Edward Jenner introduit une inoculation plus sûre avec la variole de la vache (vaccination)
- 1880s: Pasteur étend la vaccination au cholera du poulet et l'anthrax chez l'animal et la rage chez l'humain

L'*immunité de groupe* n'était pas un concept à cette époque, on utilisait donc ça pour la protection individuelle seulement

---

<div style = "position: relative; top: -54%; padding-bottom:60px; font-size:40px">

Cas de rougeole (*measles*) aux USA
</div>

![bg contain](https://julien-arino.github.io/assets/img/measles_US_1944_2019.png)

--- 

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Épidémiologie mathématique

---

# Un domaine assez ancient ..

.. mais qui a vraiment émergé seulement assez récemment!

---

![bg right:40%](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/Bernoulli-1760-first_page.jpg)

# Daniel Bernoulli (1760)

- [BNF scan](https://gallica.bnf.fr/ark:/12148/bpt6k3558n/f220.item) ou [pdf](https://julien-arino.github.io/assets/pdf/Bernoulli-1760.pdf)
- Probablement le premier modèle épidémique
- Traite de l'inoculation conre la petite vérole (*smallpox*)

---

![bg left:30%](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/RonaldRoss_WellcomeCollection.jpg)
# Ross (début 20ème siècle)

- 20 aout 1897: observe des parasites du paludisme (*malaria*) dans le système digestif d'un moustique nourri quelques jours auparavant sur un humain positif au palu
- Prix Nobel de médicine 1902
- S'intéresse à des modèles mathématiques pour l'éradication du palu; voir [ce papier de 2012](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3320609/pdf/ppat.1002588.pdf) pour un peu d'histoire

---

# Kermack et McKendrick (1927+)

- Probablement l'un des plus grands tournants en épi-math
- Nous passons ceci en détail dans le [Cours 02](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_L02_BasicMathEpi.html)
- Série de papiers commençant en 1927
  - On considère un cas particulier, le plus connu, mais c'est juste la partie émergée de l'iceberg de leur travail

---

# <!--fit-->De l'activité plus tard, mais peu avant les années 1990

- Notons toutefois que les grandes lignes directrices ont été déjà mises en évidence depuis les années 1970
- Une erreur terminologique sur laquelle je reviendrai ($E$ pour *individus exposés* qui devraient être *individus latents*) date de cette première *période héroique* :)
- Explosion ces dernières années
- Depuis le début de COVID-19: c'est dingue..!

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Épidémiologie computationnelle

---

# Une tendance plus récente

- Quelques travaux numériques $\leq$ 1980s, principalement simulation de modèles mathématiques
  - Baroyan, Rvachev et al. [Computer modelling of influenza epidemics for the whole country (USSR)](https://doi.org/10.2307/1426167). *Advances in Applied Probability* (1971)
  - Rvachev & Longini. [A mathematical model for the global spread of influenza](https://doi.org/10.1016/0025-5564(85)90064-1). *Mathematical Biosciences* (1986)
  - Flahault, Letrait et al. [Modelling the 1985 influenza epidemic in France](https://doi.org/10.1002/sim.4780071107). *Statistics in Medicine* (1988)
- De plus en plus fréquent, au point que maintenant certaines études sont uniquement basées sur les simulations

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Utilisation de données en épidémiologie

---

# <!-- fit -->A toujours eu lieu, en cours de transformation

- L'épidémiologie a depuis longtemps utilisé et nécessité des données
- Bien des avancées en statistiques y ont leur motivation
- Les données sont en général meilleures pour les maladies chroniques que pour les maladies infecieuses
- Surveillance quasi-temps-réel des maladies infectieuses a lieu depuis les années 1980 (p.ex., Réseau Sentinelles)
- SARS-CoV-1 a vu le début d'un mouvement vers une disponibilité temps-réel des données de maladies infectieuses
- Avec SARS-CoV-2, le système a vraiment progressé et impliquee maintenant de la "science citoyenne" et des initiatives gouvernementales type Open Data