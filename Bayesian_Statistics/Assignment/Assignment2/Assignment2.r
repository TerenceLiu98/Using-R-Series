
library(LearnBayes)
library(lattice)

#Question One
par(mfrow=c(1,3))
a=438
b=544
post=rbeta(1000,a,b)
hist(post,breaks=50,col="grey")
hist(log((post/(1-post))),breaks=50,col="grey")
phi=(1-post)/post
hist(phi,breaks=50,col="grey")

E=0.5
SUM=2
a=E*SUM
b=SUM-a
s=438
f=544
poster=rbeta(1000,a+s,b+f)
quantile(poster,c(0.5,0.5))
quantile(poster,c(0.025,0.975))


#Question Two

#Part a
library(LearnBayes)
library(lattice)
y=c(24,25,31,31,22,21,26,20,16,22)
ybar=mean(y)
n=10
a=0
b=0
theta=rgamma(1000,n*ybar+a,n+b)
yhat=rpois(1000,theta)
quantile(yhat,c(0.025,0.975))
sort(yhat)[c(25,976)]

GE=ybar
GVar=sqrt(ybar*n)/n
E=GE
Var=GE+GVar**2
Sd=sqrt(Var)
round(c(E-1.96*Sd,E+1.96*Sd))

#part b
Pd=c(734,516,754,877,814,362,764,809,223,1066)
Dr=c(0.19,0.12,0.15,0.16,0.14,0.06,0.13,0.13,0.03,0.15)
z=(Pd/Dr)*100000000
zbar=mean(z)
n=10
a=0
b=0
theta2=rgamma(1000,n*ybar,n*zbar)
yhat2=rpois(1000,theta2*8e11)
quantile(yhat2,c(0.025,0.975))
sort(yhat2)[c(25,976)]

GE2=(n*ybar)/(zbar*n)
GVar2=(ybar*n)/((zbar*n)**2)
E2=8e11*GE2
Var2=8e11*GE2+(8e11**2)*(GVar2**2)
Sd2=sqrt(Var2)
round(c(E2-1.96*Sd2,E2+1.96*Sd2))

# part c
Pd=c(734,516,754,877,814,362,764,809,223,1066)
xbar=mean(Pd)
n=10
a=0
b=0
theta=rgamma(1000,n*xbar+a,n+b)
xhat=rpois(1000,theta)
round(quantile(xhat,c(0.025,0.975)))
sort(xhat)[c(25,976)]

GE3=xbar
GVar3=sqrt(xbar*n)/n
E3=GE3
Var3=GE3+GVar3**2
Sd3=sqrt(Var3)
round(c(E3-1.96*Sd3,E3+1.96*Sd3))

# part d
Pd=c(734,516,754,877,814,362,764,809,223,1066)
Dr=c(0.19,0.12,0.15,0.16,0.14,0.06,0.13,0.13,0.03,0.15)
w=(Pd/Dr)*100000000
wbar=mean(w)
n=10
a=0
b=0
theta4=rgamma(1000,n*xbar,n*wbar)
what=rpois(1000,theta4*8e11)
quantile(what,c(0.025,0.975))
sort(what)[c(25,976)]

GE4=(n*xbar)/(wbar*n)
GVar4=(xbar*n)/((wbar*n)**2)
E4=8e11*GE4
Var4=8e11*GE4+(8e11**2)*(GVar4**2)
Sd4=sqrt(Var4)
round(c(E4-1.96*Sd4,E4+1.96*Sd4))
