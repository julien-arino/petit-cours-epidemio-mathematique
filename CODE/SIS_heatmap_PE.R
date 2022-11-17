# Une "heatmap" montrant comment la valeur de l'équilibre varie en fonction de
# la valeur de deux paramètres

library(latex2exp)

# Calcul des PÉ
valeur_PE = function(params) {
  with(as.list(c(params)), {
    OUT = list()
    if (R_0<1) {
      OUT$S_EP = Pop
      OUT$E_EP = 0
      OUT$col = "dodgerblue4"
    } else {
      OUT$S_EP = 1/R_0*Pop
      OUT$E_EP = (1-1/R_0)*Pop
      OUT$col = "darkorange4"
    }
    return(OUT)
  })
}

# On fait un data.frame avec les variations des deux paramètres que l'on veut 
# étudier
p = expand.grid(
  R_0 = seq(1, 3, length.out = 100),
  gamma = seq(1/30, 1/3, length.out = 100)
)

# On adjoint à ces valeurs les valeurs des autres paramètres
p$d = rep(1/(80 * 365.25), dim(p)[1])
p$beta = 
