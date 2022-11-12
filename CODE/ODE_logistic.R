# On charge la librairie
library(deSolve)

# Les differentes versions du champ de vecteurs
rhs_logistic_1 <- function(t, x, p) {
  dN <- p$r * x[1] *(1-x[1]/p$K)
  return(list(dN))
}

rhs_logistic_2 <- function(t, x, p) {
  with(as.list(x), {
    dN <- p$r * N *(1-N/p$K)
    return(list(dN))
  })
}

rhs_logistic_3 <- function(t, x, p) {
  with(as.list(c(x, p)), {
    dN <- r * N *(1-N/K)
    return(list(dN))
  })
}

# Les paramètres
params = list(r = 0.1, K = 100)
# L'intervalle de temps d'intégration et les points de temps en lesquels
# on renvoie une valeur de la solution
times = seq(0, 100, 1)

# Les conditions initiales. Pour illustrer, on met aussi une forme qui ne 
# marchera qu'avec la première forme du champ de vecteurs
IC_1 = 50
IC = c(N = 50)

# On appelle le solveur
sol_1 <- ode(IC, times, rhs_logistic_1, params)
sol_2 <- ode(IC, times, rhs_logistic_2, params)
sol_3 <- ode(IC, times, rhs_logistic_3, params)

# Et pour compléter: la première commande devrait marcher, la seconde devrait 
# générer une erreur
sol_1_1 <- ode(IC_1, times, rhs_logistic_1, params)
sol_2_1 <- ode(IC_1, times, rhs_logistic_2, params)
