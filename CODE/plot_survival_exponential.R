 # Plot of the exponential distribution survival function 
 # 

d_1 = 1/80 
y_1 = seq(0, 200, 0.1)
S_1 = 1-pexp(y_1, d_1)

idx_50_years = max(which(y_1<=50))
idx_80_years = max(which(y_1<=80))
idx_100_years = min(which(y_1>=100))
idx_150_years = min(which(y_1>=150))

d_2 = 1/4
y_2 = seq(0, 20, 0.05)
S_2 = 1-pexp(y_2, d_2)

idx_1_days = max(which(y_2<=1))
idx_10_days = max(which(y_2<=10))



png("survival_exponential.png",
    res = 150,
    width = 1900, height = 1000)
par(mfrow = c(1,2))

# png("survival_exponential_4days.png", 
#     res = 150,
#     width = 1000, height = 600)
plot(y_2, S_2,
     type = "l", lwd = 3,
     xaxs = "i", yaxs = "i",
     ylim = c(0, 1.02),
     xlab = "t (Day)", ylab = "S(t)")
abline(v = 4, lwd = 2, lty = 3, col = "red")
lines(x = c(1, 1), y = c(0, S_2[idx_1_days]),
      lty = 3, lwd = 1)
lines(x = c(0, 1), y = c(S_2[idx_1_days], S_2[idx_1_days]),
      lty = 3, lwd = 1)
lines(x = c(10, 10), y = c(0, S_2[idx_10_days]),
      lty = 3, lwd = 1)
lines(x = c(0, 10), y = c(S_2[idx_10_days], S_2[idx_10_days]),
      lty = 3, lwd = 1)
points(x = 1, y = S_2[idx_1_days], pch = 19)
points(x = 10, y = S_2[idx_10_days], pch = 19)
text(x = 1, y = S_2[idx_1_days], 
     labels = paste0(round(S_2[idx_1_days], 2)),
     pos = 4)
text(x = 10, y = S_2[idx_10_days], 
     labels = paste0(round(S_2[idx_10_days], 2)),
     pos = 3)
text(x = 4, y = 0.8, 
     labels = "4 days avg.", col = "red",
     pos = 4)
# dev.off()
# crop_figure("survival_exponential_4days.png")

# png("survival_exponential_80years.png", 
#     res = 150,
#     width = 1000, height = 600)
plot(y_1, S_1,
     type = "l", lwd = 3,
     xaxs = "i", yaxs = "i",
     ylim = c(0, 1.02),
     xlab = "t (Year)", ylab = "S(t)")
abline(v = 80, lwd = 2, lty = 3, col = "red")
lines(x = c(50, 50), y = c(0, S_1[idx_50_years]),
      lty = 3, lwd = 1)
lines(x = c(0, 50), y = c(S_1[idx_50_years], S_1[idx_50_years]),
      lty = 3, lwd = 1)
lines(x = c(100, 100), y = c(0, S_1[idx_100_years]),
      lty = 3, lwd = 1)
lines(x = c(0, 100), y = c(S_1[idx_100_years], S_1[idx_100_years]),
      lty = 3, lwd = 1)
lines(x = c(150, 150), y = c(0, S_1[idx_150_years]),
      lty = 3, lwd = 1)
lines(x = c(0, 150), y = c(S_1[idx_150_years], S_1[idx_150_years]),
      lty = 3, lwd = 1)
points(x = 50, y = S_1[idx_50_years], pch = 19)
points(x = 100, y = S_1[idx_100_years], pch = 19)
points(x = 150, y = S_1[idx_150_years], pch = 19)
text(x = 50, y = S_1[idx_50_years], 
     labels = paste0(round(S_1[idx_50_years], 2)),
     pos = 4)
text(x = 100, y = S_1[idx_100_years], 
     labels = paste0(round(S_1[idx_100_years], 2)),
     pos = 3)
text(x = 150, y = S_1[idx_150_years], 
     labels = paste0(round(S_1[idx_150_years], 2)),
     pos = 3)
text(x = 80, y = 0.8, 
     labels = "80 years avg.", col = "red",
     pos = 4)
#dev.off()
#crop_figure("survival_exponential_80years.png")

dev.off()
crop_figure("survival_exponential.png")
