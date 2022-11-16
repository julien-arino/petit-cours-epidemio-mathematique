library(deSolve)
source("useful_functions.R")

rhs_SIS <- function(t, x, p) {
  with(as.list(c(x, p)), {
    N = S + I
    dS = b + gamma * I - d * S - beta * S * I / N
    dI = beta * S * I / N - (d + gamma) * I
    return(list(c(dS, dI)))
  })
}

# Paramètres "connus"
d = 1/(80 * 365.25)
gamma = 1/14
# On règle la natalité pour que b/d = 1000
b = 1000 * d
# On règle beta pour que R_0 = 1.5
R_0 = 1.5
beta = R_0 * (d + gamma)

params = list(b = b, d = d, gamma = gamma, beta = beta)

IC = c(S = 1000, I = 1)
times = seq(0, 365, 1)

sol <- ode(y = IC, times = times, func = rhs_SIS, 
           parms = params, method = "ode45",
           atol = 1e-15, rtol = 1e-15)

png(filename = sprintf("../FIGS/sol_endemic_SIS_R0%d.png", round(R_0*10)),
    width = 800, height = 400)
plot(sol[, "time"], sol[, "I"], type = "l",
     xlab = "Temps (jours)", ylab = "Prévalence")
dev.off()
crop_figure(sprintf("../FIGS/sol_endemic_SIS_R0%d.png", round(R_0*10)))
