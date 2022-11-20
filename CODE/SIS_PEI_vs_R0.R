# Prévalence vs R_0

# Pour pouvoir utiliser des commandes LaTeX
library(latex2exp)

# Calcul des PÉ
valeur_PE = function(R_0, N) {
  PE_I = ifelse(R_0 < 1, 0, (1-1/R_0)*N)
  return(PE_I)
}

R_0 = seq(0.5, 5, by = 0.01)
PE_I = valeur_PE(R_0, N = 1000)
# On représente aussi l'ESM quand R_0>1, donc on prépare ça
R_0_geq_1 = R_0[which(R_0>=1)]
ESM = rep(0, length(R_0_geq_1))

png(file = "../FIGS/endemic_SIS_EE_vs_R0.png",
    width = 1200, height = 800, res = 200)
plot(R_0, PE_I,
     type = "l", lwd = 2,
     xlab = TeX("$R_0$"),
     las = 1,
     ylab = "Prévalence à l'équilibre")
lines(R_0_geq_1, ESM,
      type = "l", lwd = 2,
      lty = 2)
legend("topleft", legend = c("PÉ LAS", "PÉ instable"),
       lty = c(1, 2), lwd = c(2,2),
       bty = "n")
dev.off()
crop_figure(file = "../FIGS/endemic_SIS_EE_vs_R0.png")
