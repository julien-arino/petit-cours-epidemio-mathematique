final_size = function(S_inf, S0 = 999, I0 = 1, R_0 = 2.5) {
  OUT = S0*(log(S0)-log(S_inf)) - (S0+I0-S_inf)*R_0
  return(OUT)
}

N0 = 1000
I0 = 1
S0 = N0-I0

S = seq(0.1, S0, by = 0.1)

fs = final_size(S, S0 = S0, I0 = I0, R_0 = 5)

plot(S, fs,
     type = "l")
abline(h = 0)

print(tail(fs))