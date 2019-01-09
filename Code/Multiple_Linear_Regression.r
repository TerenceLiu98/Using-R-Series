### Multiple Linear Regression ###
library(MASS)
library(ISLR)

lm.fit <- lm(medv~lstat + age, data <- Boston) # multiple variable ( lstat and age)
summary(lm.fit)

# The Boston data set has 13 vriable, we can put them all in the model

lm.fit.all <- lm(medv~., data <- Boston) # . can represent for the whole data set
summary(lm.fit.all)
names(lm.fit.all) # we can access the individual components of a summary object

library(car)
vif(lm.fit) # vif is to compute variance inflation factors
lm.fit.all_1 <- lm(medv~.-age, data <- Boston) # the new fitting model without age components
lm.fit.all_1=update(lm.fit.all, ∼.-age) # same as the above command
