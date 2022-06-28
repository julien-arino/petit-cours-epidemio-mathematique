---
marp: true
title: Petit cours d'épidémiologie mathématique - Propagation dans des groupes et propagation spatio-temporelle
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 10 - Propagation dans des groupes et propagation spatio-temporelle des épidémies
theme: default
paginate: false
math: mathjax
size: 16:9
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
# Petit cours d'épidémiologie mathématique<br/>Propagation dans des groupes et propagation spatio-temporelle des épidémies

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
- Hétérogénéité de la propagation au sein d'une population
- La mobilité et la propagation spatio-temporelle des maladies infectieuses
- Les vagues de COVID-19

---
<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Hétérogénéité de la propagation au sein d'une population

- Structure d'âge
- Structure sociale
- Hétérogénéité des pathogènes

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Structure d'âge

---

# <!-- fit -->Bien des maladies affectent différemment des âges différents

- Maladies infantiles conférant une immunité à vie: rougeole (*measles*), mumps, etc.
- Maladies pour lesquelles une immunité est acquise par exposition répétée à l'agent pathogène: paludisme
- Maladies pour lesquelles des contacts répétés sont importants: enfants jouant ensemble, adultes rencontrant d'autres adultes, adultes avec jeunes enfants contractant une maladie à l'école (concept important: WAIFW - who acquires infection from whom, qui acquiert la maladie de qui)

---

![bg left:69%](https://www.cdc.gov/mmwr/preview/mmwrhtml/figures/m6013a1f.gif "https://www.cdc.gov/mmwr/preview/mmwrhtml/mm6013a1.htm")

# Cas de rougeole parmi des voyageurs rentrant aux USA

<!-- Measles cases among travellers returning to the US https://www.cdc.gov/mmwr/preview/mmwrhtml/mm6013a1.htm -->

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/malaria-deaths-by-age.png)

<!-- Max Roser and Hannah Ritchie (2019) - 'Malaria'. Published online at OurWorldInData.org. Retrieved from: 'https://ourworldindata.org/malaria' [Online Resource] -->

---

# Patterns de contact de la population aux USA pendant la pandémie de COVID-19

![bg right:65%](https://media.springernature.com/full/springer-static/image/art%3A10.1038%2Fs41467-021-20990-2/MediaObjects/41467_2021_20990_Fig3_HTML.png?as=webp)

<!-- https://doi.org/10.1038/s41467-021-20990-2 -->

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Structure sociale

---

# <!--fit-->La structure sociale joue aussi un rôle prépondérant

- L'âge est déterminant de la structure sociale et donc des contacts:
  - École
  - Travail
  - Évènements sociaux
- Dans les pays à forte immigration: nouveaux immigrants vs population plus établie, p.ex., TB
- Groupes à risque: utilisateurs de drogue (VIH)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/pnas.202112605fig01.jpg "Within and between classroom transmission patterns of seasonal influenza among primary school students in Matsumoto city, Japan https://doi.org/10.1073/pnas.2112605118")

<!-- Within and between classroom transmission patterns of seasonal influenza among primary school students in Matsumoto city, Japan https://doi.org/10.1073/pnas.2112605118 -->

---

![bg right:71%](https://erj.ersjournals.com/content/erj/38/4/895/F1.large.jpg "https://doi.org/10.1183/09031936.00196610")

# Arrivées au CAN depuis des pays dans des groupes ayant une incidence par 100K ..

---

![bg contain](https://www.cdc.gov/mmwr/preview/mmwrhtml/figures/m6410a2f2.gif "https://www.cdc.gov/mmwr/preview/mmwrhtml/mm6410a2.htm")

---

![bg contain](https://www.cdc.gov/hiv/images/basics/statistics/infographics/cdc-hiv-statistics-diagnoses-category-1200x630.png "https://www.cdc.gov/hiv/basics/statistics.html")

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# <!--fit-->Hétérogénéité des pathogènes

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/ppat.1008984.g001.png "Characterising the epidemic spread of influenza A/H3N2 within a city through phylogenetics https://doi.org/10.1371/journal.ppat.1008984")

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/InfluenzaStrainsCAN_2019-2020.png)

---

<div style="width:100%; height:100%">
  <iframe src="https://covariants.org/per-country?country=South+Africa" style="position:absolute; top:0px; left:0px; 
  width:100%; height:100%; border: none; overflow: hidden;"></iframe>
</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# La mobilité et la propagation spatio-temporelle des maladies infectieuses

---

# <!-- fit -->On sait les pathogènes mobile depuis longtemps

<!--<div style = "text-align: justify">-->
Le mal, dit-on, fit son apparition en **Ethiopie**, au-dessus de l'Egypte : de là il descendit en **Egypte** et en **Libye** et se répandit sur la majeure partie des territoires du Roi [de **Perse**]. Il se déclara subitement à **Athènes** et, comme il fit au **Pirée** ses premières victimes, on colporta le bruit que les Péloponnésiens avaient empoisonné les puits ; car au Pirée il n'y avait pas encore de fontaines. Il atteignit ensuite la **ville haute** et c'est là que la mortalité fut de beaucoup la plus élevée.
<!--</div>-->

<div style = "text-align: right; position: relative; bottom: -10%; ">

[Thucydide](https://fr.wikipedia.org/wiki/Thucydide) (c. 460 AEC - c. 395 AEC)
[Histoire de la guerre du Péloponnèse](http://remacle.org/bloodwolf/historiens/thucydide/livre2.htm#XLVIII)
</div>

![bg 90% right:30%](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/various/Thucydides-bust-noBG.png)

---

# <!-- fit -->La mobilité est compliquée et induit la spatialisation des maladies

**La mobilité est compliquée**:

- Nombreuses modalités: marche, vélo, véhicule personnel, bus, train, bateau, avion
- Durées variées: épicier du coin $\neq$ aller au travail $\neq$ voyages de plusieurs jours (travail ou plaisir) $\neq$ relocalisation, immigration ou demande d'asile
- Volumes difficiles à appréhender

Néanmoins, la **mobilité conduit la propagation spatio-temporelle**:
- La grande peste (1347-1353) est arrivée en Europe et s'est propagée le long des routes commerciales
- SARS-CoV-1 s'est répandu depuis HKG en suivant le réseau aérien
- Khan, Arino, Hu *et al*, [Spread of a novel influenza A (H1N1) virus via global airline transportation](https://www.nejm.org/doi/pdf/10.1056/NEJMc0904559), *New England Journal of Medicine* (2009)
</div>

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/transportation/trade_routes_1212AD.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/epidemio/Peste-Delumeau.jpg)

---

![bg contain](https://www.usu.edu/markdamen/1320hist&civ/slides/06plague/map.jpg)

---

# <!--fit-->La grande peste: quelques faits

- Première des pestes du moyen âge à atteindre l'Europe
- Affecte l'Afro-Eurasie de 1346 à 1353
- Europe 1347-1351
- Tue 75–200M en Eurasie & Afrique du Nord
- Tue 30-60% de la population Européenne

![bg right:35%](https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Yersinia_pestis_fluorescent.jpeg/1036px-Yersinia_pestis_fluorescent.jpeg)

---

# Mesures de contrôle de la peste

- Lazzarettos de Dubrovnik 1377 (30 jours)
- Quarantena de Venise 1448 (40 jours)
- Isolation des cas connus ou suspectés et de toute personne ayant été en contact avec eux, d'abord pour 14 jours puis graduellemt augmenté à 40 jours
- Amélioration des conditions sanitaires: alimentation en eau propre, collecte des déchets, inspection de la nourriture
- .. Trouvez et tuez un serpent, coupez le en bouts et badigeonnez les bubons avec. (Le serpent, associé à Satan, attire le mal hors du corps, puisque le mal attire le mal)

![bg left:24%](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Nuremberg_chronicles_-_Dance_of_Death_%28CCLXIIIIv%29.jpg/1201px-Nuremberg_chronicles_-_Dance_of_Death_%28CCLXIIIIv%29.jpg)

---

# La propagation spatio-temporelle des pathogènes a évolué avec la mobilité

- Les pathogènes suivent les routes de commerce

- Jadis, les routes de commerce étaient relativement faciles à appréhender

- Celà a changé avec l'accélération et la globalisation de la mobilité

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/transportation/duration_Paris_Bordeaux.png)

---

![bg 100%](https://upload.wikimedia.org/wikipedia/commons/b/bf/High_Speed_Railroad_Map_of_Europe.svg)
![bg 100%](https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Rail_map_of_China_%28high_speed_highlighted%29_WP.svg/1280px-Rail_map_of_China_%28high_speed_highlighted%29_WP.svg.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/transportation/world_graph-degree.png)

---

![bg contain](https://www.cmaj.ca/content/cmaj/182/6/579/F2.large.jpg)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/transportation/passengers_transported_worldwide.png)

---

# <!--fit-->Un paysage juridictionnel fragmenté

- Divisions politiques (juridictions): groupes de nations (p.ex., EU), nations, provinces/états, régions, départements, villes..
- Déplacement entre juridictions peut être compliqué voire impossible
- Données intégrées au niveau juridictionnel
- Politique décidée au niveau juridictionnel

![bg right:40%](https://compote.slate.com/images/af3c1e4a-9ca9-4caa-8cbb-7f4f34c9ac88.jpeg?width=1440&rect=1560x1040&offset=0x0)

---

# <!--fit-->La mobilité est importante dans le contexte de la santé

```
Tout migrant ou voyageur transporte en lui son "historique de santé"
```

- infections latentes et/ou actives (TB, H1N1, polio)
- immunisations (les programmes varient par pays)
- pratiques de santé/nutrition practices (KJv)
- méthodes de traitement (antiviraux)

```
Les pathogènes ignorent les frontières et la politique
```

- Politiques de traitement antiviral du Canada et des USA
- SARS-CoV-2, ça vous dit quelque chose?

---

# SARS-CoV-1 (2002-2003)

## Impact global

- Cas index pour la propagation internationale arrive à HKG le 21 février 2003

- Dernier pays (Taiwan) avec de la transmission locale retiré de la liste le 5 juillet 2003

- 8273 cas dans 28 pays

- (De ces cas, 1706 étaient des travailleurs de la santé)

- 775 morts (CFR 9.4%)

![bg right:45%](https://www.cdc.gov/sars/lab/images/coronavirus2.gif)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/sars-cov-1/SARS_countries_with_time.png)


---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/polio/polio_vaccine_coverage_Africa_2003.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/polio/West_Central_Africa_Polio_2000_2006_noNGA.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/polio/West_Central_Africa_Polio_2000_2006.png)

---

![bg contain](https://www.nejm.org/na101/home/literatum/publisher/mms/journals/content/nejm/2006/nejm_2006.355.issue-24/nejmp068200/production/images/img_medium/nejmp068200_f1.jpeg)

<div style = "position: relative; bottom: -57%; padding-bottom:0px; font-size:25px; text-align: right;">
Propagation polio 2002-2006. Pallansch & Sandhu, N Engl J Med 2006; 355:2508-2511
</div>

---
<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Les vagues de COVID-19

<div style = "position: relative; bottom: -40%; font-size:20px;">

JA. [Describing, modelling and forecasting the spatial and temporal spread of COVID-19 - A short review](https://server.math.umanitoba.ca/~jarino/publications/Arino-2022-FIC85.pdf). *Fields Institute Communications* **85**:25-51 (2022)
</div>

---

# Amplification à Wuhan (Province du Hubei)

- Détails de l'émergence et timeline précis avant début de l'amplification inconnus
- Amplification à Wuhan
	- Cluster de cas de pneumonie principalement liés auHuanan Seafood Market
	- 27 décembre 2019: premier rapport au gouvernement local
	- 31 décembre 2019: publication
	- 8 janvier 2020: identification du SARS-CoV-2 cmme agent causatif
-  $\sim$ 23 January 2020: lockdown Wuhan et province du Hubei + mandats de masques

Le 29 janvier, le virus est présent dans toutes les proinces de Chine

---

# Premières détections hors de Chine

<style scoped>
table {
    height: 100%;
    width: 100%;
    font-size: 20px;
}
</style>

| Date | Lieu | Note (date arrivée cas, etc.) |
|------|----------|------|
| 13 Jan. | Thailande | Arrivé 8 Jan. |
| 16 Jan. | Japon | Arrivé 6 Jan. |
| 20 Jan. | Republique de Corée | Détecté aéroport le 19 Jan. |
| 20 Jan. | USA | Arrivé Jan. 15 |
| 23 Jan. | Népal | Arrivé 13 Jan. |
| 23 Jan. | Singapour | Arrivé 20 Jan. |
| 24 Jan. | France | Arrivé 22 Jan. |
| 24 Jan. | Vietnam | Arrivé 13 Jan. |
| 25 Jan. | Australie | Arrivé 19 Jan. |
| 25 Jan. | Malaisie | Arrivé 24 Jan. |

---

# Un bémol : évidence de propagation plus tôt

- Rapport aux autorités de Wuhan le 27 décembre 2019
- Premières exportation détectées en Thailande et au Japon les 13 et 16 janvier 2020 (avec importations les 8 et 6 janvier)

$\implies$ amplification doit avoir commencé plus tôt

- France: échantillon prélevé d'un homme de 42 ans (dernier voyage en Algérie en aout 2019) qui se présente aux urgences le 27 décembre 2019
- Études rétrospectives en GB et Italie montrent aussi des cas de COVID-19 non détectés dans la période pré-pandémique

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/sars-cov-2/CT_extent_2020-07-30.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/sars-cov-2/VOC_countries_reporting_by_date_2022_04_07.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/sars-cov-2/VOC_countries_reporting_since_first_case_2022_04_07.png)

