library(deSolve)
library(latex2exp)
source("useful_functions.R")

rhs_SIR_KMK <- function(t, x, p) {
  with(as.list(c(x, p)), {
    dS = - beta * S * I
    dI = beta * S * I - gamma * I
    dR = gamma * I
    return(list(c(dS, dI, dR)))
  })
}

# Condition initiale pour S (pour calculer R_0)
S0 = 1000
gamma = 1/14
# On règle beta pour que R_0 = 1.5
beta = 1.5 * gamma / S0 
params = list(gamma = gamma, beta = beta)
IC = c(S = S0, I = 1, R = 0)
times = seq(0, 365, 1)

sol <- ode(IC, times, rhs_SIR_KMK, params)

png(filename = "../FIGS/sol_SIR_KMK_R015.png",
    width = 800, height = 400)
plot(sol[, "time"], sol[, "I"], type = "l",
     main = TeX("SIR de Kermack et McKendrick, $R_0=1.5$"),
     xlab = "Temps (jours)", ylab = "Prévalence")
dev.off()
crop_figure("../FIGS/sol_SIR_KMK_R015.png")

