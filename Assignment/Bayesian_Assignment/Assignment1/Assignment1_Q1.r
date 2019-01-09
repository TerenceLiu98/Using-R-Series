y <- seq(-7,10,.02)
density <- 0.5*dnorm(y,1,2) + 0.5*dnorm(y,2,2)
plot (y, density, ylim=c(0,1.1*max(density)))
