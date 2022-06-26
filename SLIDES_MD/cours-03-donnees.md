---
marp: true
title: Petit cours d'épidémiologie mathématique - Collecte et utilisation des données
description: Julien Arino - Petit cours d'épidémiologie mathématique - Cours 03 - Collecte et utilisation des données
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

# Petit cours d'épidémiologie mathématique<br/>Collecte et utilisation des données

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

- Les données..

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!--fit-->Les données


<div style = "position: relative; bottom: -35%; font-size:20px;">

- JA. [Mathematical epidemiology in a data-rich world](http://dx.doi.org/10.1016/j.idm.2019.12.008). *Infectious Disease Modelling* **5**:161-188 (2020)
- Voir aussi le [répo GitHub](https://github.com/julien-arino/modelling-with-data) pour ce papier..

</div>

---

# Il est important d'être au courant des données

- Avec R (ou Python), il est très facile de récupérer des données sur le web, e.g., depuis des sources Open Data
- De plus en plus d'endroits ont une politique Open Data
- En tant que modélisateur, il n'est pas nécessaire d'avoir des données partout, mais il est très important d'être au minimum conscient du domaine dans lequel on opère
- Si vous voulez que votre travail ait un impact, par exemple en santé publique, vous ne pouvez pas être complètement déconnecté de la réalité

---

# Les données sont partout

## Données fermées (a.k.a. données propriétaires)

- Générées par des compagnies, gouvernements, laboratoires de recherche
- Quand elles sont disponibles, sont utilisables avec de multiples restrictions

## Données ouvertes ou libres (Open Data)

- Souvent générées par les mêmes entités mais "libérées" après une certaine période
- De plus en plus fréquent avec les gouvernements/entités publiques
- Grande variété de licenses, attention! (Libre $\neq$ utilisables n'importe comment)
- La qualité varie beaucoup, attention!

---

# Initiatives Open Data

Mouvement récent (5-10 years): gouvernements (locaux ou plus haut) créent des portails où les données sont centralisées et publiées

- [Winnipeg](https://data.winnipeg.ca/)
- [Alberta](https://open.alberta.ca/opendata)
- [Canada](https://ouvert.canada.ca/fr/donnees-ouvertes)
- [Europe](https://data.europa.eu/euodp/data/)
- [ONU](http://data.un.org/)
- [Banque Mondiale](https://data.worldbank.org/)
- [OMS](https://www.who.int/gho/database/en/)

---

# Méthode de collecte des données

- "À la main"
- En utilisant des programmes tels que [Engauge Digitizer](http://markummitchell.github.io/engauge-digitizer/) ou [g3data](https://github.com/pn2200/g3data)
- En utilisant des APIs
- En utilisant des méthodes de traitement du langage naturel (NLP) ou d'autres méthodes de web scraping
- En utilisant des packages R ou Python

---

# Exemple: population du Tchad

```R
library(wbstats)
pop_data_CTRY <- wb_data(country = "TCD", indicator = "SP.POP.TOTL",
                         mrv = 100, return_wide = FALSE)
y_range = range(pop_data_CTRY$value)
y_axis <- make_y_axis(y_range)
png(file = "pop_TCD.png", width = 800, height = 400)
plot(pop_data_CTRY$date, pop_data_CTRY$value * y_axis$factor,
     xlab = "Year", ylab = "Population", type = "b", lwd = 2,
     yaxt = "n")
axis(2, at = y_axis$ticks, labels = y_axis$labels, las = 1)
dev.off()
crop_figure("pop_TCD.png")
```

---

![bg contain](https://raw.githubusercontent.com/julien-arino/petit-cours-epidemio-mathematique/main/FIGS/pop_TCD.png)

---

![bg right:35%](https://upload.wikimedia.org/wikipedia/commons/f/f4/Eastern_forest_insects_%281175%29_%2820946246870%29.jpg)
# Graphiose de l'orme 

- Maladie fungique qui affecte les ormes
- Causée par le fungus *Ophiostoma ulmi* 
- Transmise par le scolyte américain de l'orme (*Hylurgopinus rufipes*) et d'autres espèces (*Scolytus schevyrewi*)
- A décimé les forêts urbaines d'ormes en Amérique du Nord

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/WinnipegOpenDataPortal.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/WODTreeMap.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/WODTreeMapZoom.png)

---

# Obtenir les données des arbres

```R
allTrees = 
  read.csv("https://data.winnipeg.ca/api/views/hfwk-jp4h/rows.csv?accessType=DOWNLOAD")
```

Après ça, on a

```R
> dim(allTrees)
[1] 300846 15
```

Note: la connexion ici vers Winnipeg n'est pas très bonne. On peut changer la durée du `timeout` (temps pendant lequel le programme essaie de charger), en faisant `options(timeout=300)` par exemple

---

# Nettoyons un petit peu

```R
elms_idx = grep("American Elm", allTrees$Common.Name, ignore.case = TRUE)
elms = allTrees[elms_idx, ]
```

Il nous reste 54,036 ormes américains

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/Recap_Diagram.png)

---

# Calcul des interactions des systèmes racinaires

(Nécessite une machine relativement grosse - environ 50GB RAM)

- Si les racines d'un arbre infecté touchent les racines d'un arbre susceptible, le fungus est transmis
- L'étendue du système racinaire d'un arbre dépend de sa hauteur (dans les données, on a le diamètre à hauteur de poitrine - diameter at breast height, DBH - pour tous les arbres)
- La façon dont sont construites les routes interdit le contact des systèmes racinaires d'arbres séparés par une route

---

# Distances entre tous les arbres

```R
elms_xy = cbind(elms$X, elms$Y)
D = dist(elms_xy)
idx_D = which(D<50)
```

`indices_LT` est une grosse matrice de taille $N(N-1)/2\times 2$ avec indices (orig,dest) les arbres dans une paire d'orme, donc `indices_LT[idx_D]` sont les paires que l'on considère

On garde un peu plus..

```R
indices_LT_kept = as.data.frame(cbind(indices_LT[idx_D,],
                                D[idx_D]))
colnames(indices_LT_kept) = c("i","j","dist")
```

---

# <!--fit-->Créons des segments de droite entre toutes les paires d'arbres

```R
tree_locs_orig = cbind(elms_latlon$lon[indices_LT_kept$i],
                       elms_latlon$lat[indices_LT_kept$i])
tree_locs_dest = cbind(elms_latlon$lon[indices_LT_kept$j],
                       elms_latlon$lat[indices_LT_kept$j])
tree_pairs = do.call(
  sf::st_sfc,
  lapply(
    1:nrow(tree_locs_orig),
    function(i){
      sf::st_linestring(
        matrix(
          c(tree_locs_orig[i,],
            tree_locs_dest[i,]), 
          ncol=2,
          byrow=TRUE)
      )
    }
  )
)
```

---

# Un peu de carto(graphie)

```R
library(tidyverse)
# Polygone envelope de Winnipeg
bb_poly = osmdata::getbb(place_name = "winnipeg", 
                         format_out = "polygon")
# On récupère les routes
roads <- osmdata::opq(bbox = bb_poly) %>%
  osmdata::add_osm_feature(key = 'highway', 
                           value = 'residential') %>%
  osmdata::osmdata_sf () %>%
  osmdata::trim_osmdata (bb_poly)
# Et les rivières
rivers <- osmdata::opq(bbox = bb_poly) %>%
  osmdata::add_osm_feature(key = 'waterway', 
                           value = "river") %>%
  osmdata::osmdata_sf () %>%
  osmdata::trim_osmdata (bb_poly)
```

---

# En on finit tranquillement

- On a les paires d'arbres potentiellement en contact
- On a les routes et les rivières dans la ville, qui forme un ensemble de segments de droite
- Si il y a intersection entre une paire d'arbre et une route/rivière, alors on peut oublier cette paire d'arbre, leurs racines ne peuvent être en contact

```R
st_crs(tree_pairs) = sf::st_crs(roads$osm_lines$geometry)
iroads = sf::st_intersects(x = roads$osm_lines$geometry,
                           y = tree_pairs)
irivers = sf::st_intersects(x = rivers$osm_lines$geometry,
                            y = tree_pairs)
```

---

```R
tree_pairs_roads_intersect = c()
for (i in 1:length(iroads)) {
  if (length(iroads[[i]])>0) {
    tree_pairs_roads_intersect = c(tree_pairs_roads_intersect,
                                   iroads[[i]])
  }
}
tree_pairs_roads_intersect = sort(tree_pairs_roads_intersect)
to_keep = 1:dim(tree_locs_orig)[1]
to_keep = setdiff(to_keep,tree_pairs_roads_intersect)
```

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/pairs_postproc_zoom.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/selected_trees.png)

---

# ¨Data wrangling¨: `dplyr` vs `sqldf`

`dplyr` fait partie du `tidyverse` (ensemble de librairies). Charger en particulier `magrittr` et sa pipe `%>%`

`sqldf` permet de faire tourner des requêtes SQL sur une data frame.. alternative intéressante si vous connaissez le SQL

---

```R
library(sqldf)
library(dplyr)

SARS = read.csv("../DATA/SARS-CoV-1_data.csv")

## Trois façons de ne garder les données que d'un pays
ctry = "Canada"
# La version de base
idx = which(SARS$country == ctry)
SARS_selected = SARS[idx,]
# La voie sqldf
SARS_selected = sqldf(paste0("SELECT * FROM SARS WHERE country = '", 
                             ctry, "'"))
# La voie dplyr
SARS_selected = SARS %>%
  filter(country == ctry)
```

---

```R
# Écrivons l'incidence pour le pays choisi. diff fait les différences une à une,
# donc génère une entrée de moins que le vecteur à laquelle on l'applique, 
# donc on ajoute un zéro.
SARS_selected$incidence = c(0, diff(SARS_selected$totalNumberCases))
# Gardons seulement les incidences strictement positives
SARS_selected = SARS_selected %>%
  filter(incidence > 0)

# Représentons graphiquement le résultat.
# Avant ça, nous devons faire en sorte que les dates soient reconnues comme telles
SARS_selected$toDate = lubridate::ymd(SARS_selected$toDate)
EpiCurve(SARS_selected,
         date = "toDate", period = "day",
         freq = "incidence",
         title = "Incidence de la SARS-CoV-1 au Canada en 2003")
```

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/SARS-CoV-1_cases_CAN.png)

