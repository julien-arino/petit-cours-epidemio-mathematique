# SLIAR_metapop
#
# Sans adaptation additionnelle, les résultats fournis par ce script seront
# complètement irréalistes, le but est seulement de fournir un canevas
# opérationnel.


# On charge la librairie requise. 
# Si besoin, installer en faisant install.packages("deSolve").
library(deSolve)


# Le champs de vecteurs
SLIAR_metapop_rhs <- function(t, x, p) {
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
    Phi = beta * S * (I + eta * A) / N
    dS = - Phi + MS %*% S
    dL = Phi - epsilon * L + p$ML %*% L
    dI = (1 - pi) * epsilon * L - gammaI * I + MI %*% I
    dA = pi * epsilon * L - gammaA * A + MA %*% A
    dR = gammaI * I + gammaA * A + MR %*% R
    dx = list(c(dS, dL, dI, dA, dR))
    return(dx)
  })
}

# Les données suivantes sont le nombre moyen de voyageurs initiant un voyage 
# dans un pays (ligne) et terminant dans un autre pays (colonne), par jour.
# La moyenne est calculée sur un mois (non spécifié ici). 
# Le vecteur pop contient la population des pays utilisés il y a quelques
# années.
pop = c(34.017,1348.932,1224.614,173.593,93.261)*1e6
countries = c("Canada","China","India","Pakistan","Philippines")
T = matrix(data = c(0,1268,900,489,200,
                    1274,0,678,859,150,
                    985,703,0,148,58,
                    515,893,144,0,9,
                    209,174,90,2,0),
           nrow = 5, ncol = 5, byrow = TRUE)

# On stocke les paramètres dans une liste
p = list()

# Pour calculer les taux de mouvement, on utilise la méthode présentée dans 
# Arino & Portet, JMB 2015.
p$M = mat.or.vec(nr = dim(T)[1], nc = dim(T)[2])
for (from in 1:5) {
  for (to in 1:5) {
    p$M[to,from] = -log(1-T[from,to]/pop[from])
  }
  p$M[from,from] = 0
}
p$MS = p$M-diag(colSums(p$M))
# Supposons que le mouvement soit le même pour tous les compartiments.
p$ML = p$MS
p$MI = p$MS
p$MA = p$MS
p$MR = p$MS
# Nombre de patchs. (MS devrait être carrée.)
p$P = dim(p$MS)[1]

# On prend des valeurs plus ou moins aléatoires pour les autres paramètres
p$nu = rep(0.1,p$P)
p$epsilon = rep(0.01,p$P)
p$d = rep(1/(70*365.25),p$P) # Pourrait utiliser les données de la Banque 
                             # Mondiale pour être plus juste
p$gammaI = rep(0.05,p$P)
p$gammaA = rep(0.06,p$P)
p$eta = rep(1,p$P)
p$pi = runif(p$P, min = 0.2, max = 0.8)
# Set beta by assuming R0=1.5 in all patches in isolation
p$beta = 1.5 * p$gammaI * 2

# On stocke les indices des vecteurs de variables d'état dans le vecteur x, qui
# les comprend toutes. Cela nous permet par exemple de dire
# S = x[p$idx_S]
# pour definir le vecteur des valeurs de S
p$idx_S = 1:p$P
p$idx_L = (p$P+1):(2*p$P)
p$idx_I = (2*p$P+1):(3*p$P)
p$idx_A = (3*p$P+1):(4*p$P)
p$idx_R = (4*p$P+1):(5*p$P)
# Posons les conditions initiales. Dans cet exemple, on part avec I=2 au Canada.
L0 = mat.or.vec(p$P,1)
I0 = mat.or.vec(p$P,1)
I0[1] = 2
A0 = mat.or.vec(p$P,1)
R0 = mat.or.vec(p$P,1)
S0 = pop-(L0+I0+A0+R0)
# Vecteur de conditions initiales à passer au solveur.
IC = c(S = S0, L = L0, I = I0, A = A0, R = R0)
# Durée de la simulation (5 ans), avec retour de résultat tous les 0.1 jours.
tspan = seq(from = 0, to = 5*365.25, by = 0.1)

# On appelle le solveur.
sol <- ode(y = IC, 
           times = tspan, 
           func = SLIAR_metapop_rhs, 
           parms = p,
           method = "ode45")

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
for (i in 2:p$P) {
  lines(times,I[,i]/N[,i]*1e5, col = i)
}
legend("topleft",legend = countries, col = 1:p$P, lty = 1)

# The (potential) issue with not having death (and birth to counterbalance it)
ylim = c(0,max(N))
plot(times, N[,1], 
     col = 1, type = "l",
     ylim = ylim,
     xlab = "Time (days)", ylab = "Total population")
for (i in 2:p$P) {
  lines(times,N[,i], col = i)
}
legend("left",legend = countries,col = 1:p$P, lty = 1)

