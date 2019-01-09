### Simple Linear regression ###
library(MASS)
library(ISLR)

names(Boston)
lm.fit <- lm(medv~lstat)
lm.fit <- lm(medv~lstat,data = Boston)
attach(Boston) # same as the data = Boston
lm.fit <- lm(medv~lstat)
lm.fit
summary(lm.fit)
names(lm.fit)
coef(lm.fit)
confint(lm.fit) # get the confident interval
predict(lm.fit,data.frame(lstat=(c(5,10,15))), interval="confidence") # give the predicted confident interval
predict(lm.fit,data.frame(lstat=(c(5,10,15))), interval="prediction") # give the predicted predict interval
plot(lstat,medv)
abline(lm.fit) # plot the least square line
abline(lm.fit,lwd=3) # plot the least square line and its wideth is 3
abline(lm.fit,lwd=3,col="red") # plot the least square line and its color is red
plot(lstat,medv,col="red") # plot the scatter plot and the color is red
plot(lstat,medv,pch=20) # plot the scatter plot and the point's shape is 20
plot(lstat,medv,pch="+") # plot the scatter plot and the point's shape is +
plot(1:20,1:20,pch=1:20) # plot the point's shape 1 to 20
par(mfrow=c(2,2)) # create a 2 times 2 block
plot(lm.fit) # plot the least square method's four graph
plot(predict(lm.fit), residuals(lm.fit)) # plot the residuals from the linear regression.
plot(predict(lm.fit), rstudent(lm.fit)) # plot the return the studentized residuals.
plot(hatvalues(lm.fit)) # calculate the Leverage statistics and plot it
which.max(hatvalues(lm.fit))
# which.max function identifies the index of the
#lagest elements of a vector. In this case, it tells us which oberservation has
#the lagest leverage statistic
