library(deSolve)
rhs_logistic <- function(t, x, p) {
  with(as.list(x), {
    dN <- p$r * N *(1-N/p$K)
    return(list(dN))
  })
}
params = list(r = 0.1, K = 100)
IC = c(N = 50)
times = seq(0, 100, 1)
sol <- ode(IC, times, rhs_logistic, params)

rhs_logistic <- function(t, x, p) {
  with(as.list(c(x, p)), {
    dN <- r * N *(1-N/K)
    return(list(dN))
  })
}
params = list(r = 0.1, K = 100)
IC = c(N = 50)
times = seq(0, 100, 1)
sol <- ode(IC, times, rhs_logistic, params)
