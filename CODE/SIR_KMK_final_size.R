source("useful_functions.R")

final_size = function(S_inf, S0 = 999, I0 = 1, R_0 = 2.5) {
  OUT = S0*(log(S0)-log(S_inf)) - (S0+I0-S_inf)*R_0
  return(OUT)
}

uniroot(f = final_size, interval = c(0.05, 999))

N0 = 1000
I0 = 1
S0 = N0-I0
R_0 = 2.4

S = seq(0.1, S0, by = 0.1)
fs = final_size(S, S0 = S0, I0 = I0, R_0 = R_0)
S_inf = uniroot(f = function(x) final_size(S_inf = x, 
                                           S0 = S0, I0 = I0, 
                                           R_0 = R_0),
                interval = c(0.05, S0))

png("../FIGS/KMK_final_size_R0_2p4.png", width = 1200, height = 800, res = 200)
plot(S, fs, type = "l", ylab = "Valeur de l'équation (8)")
abline(h = 0)
points(x = S_inf$root, y = 0, pch = 19)
text(x = S_inf$root, y = 0, labels = "S_inf", adj = c(-0.25,-1))
dev.off()
crop_figure("../FIGS/KMK_final_size_2p4.png")

