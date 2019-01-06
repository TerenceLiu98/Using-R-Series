###################################################
##### college student sleeping time             ###
###################################################


library(lattice)
library(LearnBayes)

# part 1: calculate by hand
x1=0.6*choose(27,11)*0.2^11*0.8^16
x2=0.3*choose(27,11)*0.4^11*0.6^16
x3=0.1*choose(27,11)*0.7^11*0.3^16
p1=x1/(x1+x2+x3)
p2=x2/(x1+x2+x3)
p3=x3/(x1+x2+x3)

## part 2: calculate by R, prior discrete probability

#p= c(0.2, 0.4, 0.7)
#prior = c(0.6, 0.3, 0.1)

p = seq(0.05, 0.95, by = 0.1)
prior = c(1, 5.2, 8, 7.2, 4.6, 2.1, 0.7, 0.1, 0, 0)
prior = prior/sum(prior)
plot(p, prior, type = "h", ylab="Prior Probability")

data = c(1, 6)
post = pdisc(p, prior, data)
round(cbind(p, prior, post),2)

PRIOR=data.frame("prior",p,prior)
POST=data.frame("posterior",p,post)
names(PRIOR)=c("Type","P","Probability")
names(POST)=c("Type","P","Probability")
data=rbind(PRIOR,POST)
xyplot(Probability~P|Type,data=data,layout=c(1,2), type="h",lwd=3,col="blue")
