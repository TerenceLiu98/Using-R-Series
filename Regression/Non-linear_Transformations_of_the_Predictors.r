### Non-linear Transformations of the Predictors ###

library(MASS)
library(ISLR)

names(Boston)
lm.fit <- lm(medv~lstat)
lm.fit <- lm(medv~lstat,data = Boston)
attach(Boston) # same as the data = Boston
lm.fit <- lm(medv~lstat)

lm.fit.nonlinear <- lm(medv~lstat + I(lstat^2)) # this model performs a
#regression of `medv` on to `lstat` and `lstat^2`
summary(lm.fit.nonlinear)

anova(lm.fit, lm.fit.nonlinear) # anova function to further quantify the extent
#to which the quadratic fit is superior to the linear fit

par(mfrow = c(2,2))
plot(lm.fit.nonlinear)

lm.fit.nonlinear_5 <- lm(medv~poly(lstat,5)) # lstat's power of 5
summary(lm.fit.nonlinear_5)
