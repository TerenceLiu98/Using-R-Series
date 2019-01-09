###################################################
##### college student sleeping time             ###
###################################################


library(lattice)
library(LearnBayes)

## prior: beta distribution

quantile2=list(p=.9,x=.5)
quantile1=list(p=.5,x=.3)
para=beta.select(quantile1,quantile2)

a = para[1]
b = para[2]

s = 11
f = 16
curve(dbeta(x,a+s,b+f), from=0, to=1,xlab="p",ylab="Density",lty=1,lwd=4)
curve(dbeta(x,s+1,f+1),add=TRUE,lty=2,lwd=4)
curve(dbeta(x,a,b),add=TRUE,lty=3,lwd=4)
legend(.7,4,c("Prior","Likelihood","Posterior"),lty=c(3,2,1),lwd=c(3,3,3))

1 - pbeta(0.5, a + s, b + f)
qbeta(c(0.05, 0.95), a + s, b + f)


#simulate the posterior distribution

ps = rbeta(1000, a + s, b + f)
hist(ps,xlab="p",main="")
sum(ps >= 0.5)/1000
quantile(ps, c(0.05, 0.95))


#################################################
#  compare different cases                      #
#                                               #
#################################################

alpha = 4
beta = 3
y = 2
n = 5
curve(dbeta(x,alpha+y,beta+n-y), from=0, to=1,xlab="p",ylab="Density",lty=1,lwd=4)
curve(dbeta(x,y+1,n-y+1),add=TRUE,lty=2,lwd=4)
curve(dbeta(x,alpha,beta),add=TRUE,lty=3,lwd=4)
legend("topright",c("Prior","Likelihood","Posterior"),lty=c(3,2,1),lwd=c(3,3,3))

ps = rbeta(10000, alpha+y, beta+n-y)
mean(ps)
var(ps)
sd(ps)
