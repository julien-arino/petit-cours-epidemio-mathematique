library(lattice)
library(latticeExtra)
library(viridis)
source("useful_functions.R")


final_size_eq = function(S_inf, S0 = 999, I0 = 1, R_0 = 2.5) {
  OUT = S0*(log(S0)-log(S_inf)) - (S0+I0-S_inf)*R_0
  return(OUT)
}

final_size = function(L) {
  with(as.list(L), {
  S_inf = uniroot(f = function(x) final_size_eq(S_inf = x, 
                                                S0 = S0, I0 = I0, 
                                                R_0 = R_0),
                  interval = c(0.05, S0))
  return(S_inf$root)
  })
}

uniroot(f = final_size_eq, interval = c(0.05, 999))

N0 = 1000
I0 = 1
S0 = N0-I0
R_0 = 0.8

S = seq(0.1, S0, by = 0.1)
fs = final_size_eq(S, S0 = S0, I0 = I0, R_0 = R_0)
S_inf = uniroot(f = function(x) final_size_eq(S_inf = x, 
                                           S0 = S0, I0 = I0, 
                                           R_0 = R_0),
                interval = c(0.05, S0))

png("../FIGS/KMK_final_size_R0_0p8.png", width = 1200, height = 800, res = 200)
plot(S, fs, type = "l", ylab = "Valeur de l'équation (8)")
abline(h = 0)
points(x = S_inf$root, y = 0, pch = 19)
text(x = S_inf$root, y = 0, labels = "S_inf", adj = c(0.75,-1))
dev.off()
crop_figure("../FIGS/KMK_final_size_R0_0p8.png")

valeurs = expand.grid(
  R_0 = seq(0.01, 3, by = 0.01),
  I0 = seq(1, 100, 1)
)
valeurs$S0 = N0-valeurs$I0
L = split(valeurs, 1:nrow(valeurs))
valeurs$S_inf = sapply(X = L, FUN = final_size)
valeurs$taille_finale = valeurs$S0-valeurs$S_inf+valeurs$I0
valeurs$taux_attaque = (valeurs$taille_finale / N0)*100

png("../FIGS/KMK_taux_attaque.png", 
    width = 1200, height = 800, res = 200)
p = levelplot(taux_attaque ~ R_0*I0, data = valeurs, 
              xlab="R_0", ylab = "I0",
              col.regions = viridis(100))
print(p)
dev.off()
crop_figure("../FIGS/KMK_taux_attaque.png")
