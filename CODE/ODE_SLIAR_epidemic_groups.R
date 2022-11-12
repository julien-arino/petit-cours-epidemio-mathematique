# SLIAR_groups
#
# Sans adaptation additionnelle, les résultats fournis par ce script seront
# complètement irréalistes, le but est seulement de fournir un canevas
# opérationnel.


# On charge la librairie requise. 
# Si besoin, installer en faisant install.packages("deSolve").
library(deSolve)


# Le champs de vecteurs
SLIAR_groups_rhs <- function(t, x, p) {
  with(as.list(p), {
    # Ici, on ne peut pas faire with(as.list(x,p)), puisque x est vectoriel
    # et les noms de sortent pas bien. On doit donc décomposer x en ses 
    # composantes, qui ont été définies dans les paramètres.
    S = x[idx_S]
    L = x[idx_L]
    I = x[idx_I]
    A = x[idx_A]
    R = x[idx_R]
    N = S + L + I + A + R
    Phi = sum(beta * (I + eta * A))
    dS = - Phi * S
    dL = Phi * S - kappa * L
    dI = p * kappa * L - delta * I
    dA = (1-p) * kappa * L - mu * A
    dR = (1-f) * delta * I + eta * A
    dx = list(c(dS, dL, dI, dA, dR))
    return(dx)
  })
}

# Donnees pour les pays
countries = c("CAN","TCD")
pyramids = list()
pyramids$CAN = read.csv("../DATA/Canada-2019.csv")
pyramids$TCD = read.csv("../DATA/Chad-2019.csv")

age_groups = list("0-4" = "0-4",
                  "5-19" = c("5-9", "10-14", "15-19"),
                  "20-29" = c("20-24", "25-29"),
                  "30-39" = c("30-34", "35-39"),
                  "40-49" = c("40-44", "45-49"),
                  "50-64" = c("50-54", "55-59", "60-64"),
                  "65-74" = c("65-69", "70-74"),
                  "75-84" = c("75-79", "80-84"),
                  "85+" = c("85-89", "90-94", "95-99", "100+"))

for (ctry in countries) {
  name_pyr = sprintf("%s_simplified", ctry)
  pyramids[[name_pyr]] = NULL
  for (ages in age_groups) {
    f = 0
    m = 0
    for (c in ages) {
      f = f + as.numeric(pyramids[[ctry]][which(pyramids[[ctry]]$Age == c), "F"])
      m = m + as.numeric(pyramids[[ctry]][which(pyramids[[ctry]]$Age == c), "M"])
    }
    pyramids[[name_pyr]] = rbind(pyramids[[name_pyr]], c(m, f))
  }
  pyramids[[name_pyr]] = cbind(pyramids[[name_pyr]], 
                               pyramids[[name_pyr]][, 1]+pyramids[[name_pyr]][, 2])
  colnames(pyramids[[name_pyr]]) = c("M", "F", "Total")
  rownames(pyramids[[name_pyr]]) = names(age_groups)
}

CTRY = "TCD"

# On stocke les paramètres dans une liste
p = list()

# Nombre de groupes
p$C = length(age_groups)

# On prend des valeurs plus ou moins aléatoires pour les autres paramètres
p$delta = rep(0.1,p$C)
p$kappa = rep(1/4,p$C)
p$eta = rep(1/6, p$C)
p$mu = rep(1/10, p$C)
p$f = rep(0.05, p$C)
p$p = runif(p$C, min = 0.2, max = 0.8)
# Set beta by assuming R0=1.5 in all patches in isolation
p$beta = 1.5 * p$kappa

# On stocke les indices des vecteurs de variables d'état dans le vecteur x, qui
# les comprend toutes. Cela nous permet par exemple de dire
# S = x[p$idx_S]
# pour definir le vecteur des valeurs de S
p$idx_S = 1:p$C
p$idx_L = (p$C+1):(2*p$C)
p$idx_I = (2*p$C+1):(3*p$C)
p$idx_A = (3*p$C+1):(4*p$C)
p$idx_R = (4*p$C+1):(5*p$C)
# Posons les conditions initiales. Dans cet exemple, on part avec I=2 dans 
# la deuxième classe d'âge.
L0 = mat.or.vec(p$C,1)
I0 = mat.or.vec(p$C,1)
I0[2] = 2
A0 = mat.or.vec(p$C,1)
R0 = mat.or.vec(p$C,1)
S0 = pyramids[[sprintf("%s_simplified", CTRY)]][, "Total"] - (L0+I0+A0+R0)
# Vecteur de conditions initiales à passer au solveur.
IC = c(S = S0, L = L0, I = I0, A = A0, R = R0)
# Durée de la simulation (5 ans), avec retour de résultat tous les 0.1 jours.
tspan = seq(from = 0, to = 50, by = 1)

# On appelle le solveur.
sol <- ode(y = IC, 
           times = tspan, 
           func = SLIAR_groups_rhs, 
           parms = p)

# Put solution in an easier to use form.
times = sol[,"time"]
S = sol[,p$idx_S]
L = sol[,p$idx_L]
I = sol[,p$idx_I]
A = sol[,p$idx_A]
R = sol[,p$idx_R]
N = S+L+I+A+R

# A sample (and simple) plot: number infected per 100,000 inhabitants.
xlim = range(times)
ylim = c(0,max(I/N*1e5))
plot(times,I[,1]/N[,1]*1e5, 
     col = 1, type = "l",
     xlim = xlim, ylim = ylim,
     xlab = "Time (days)", ylab = "Number infectious per 100,000")
for (i in 2:p$C) {
  lines(times,I[,i]/N[,i]*1e5, col = i)
}
legend("topleft",legend = countries, col = 1:p$C, lty = 1)
