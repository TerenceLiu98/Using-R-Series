## Quiz 1 ##
## Quesion One ##

## Experiment: A fair coin is tossed until three tails occur successively.
## Write a program to repeat this experiment 100 times and obtain the average number of the tosses required.

N=100;k=rep(0,N)
for (i in 1:N )
{ a<-sample(c(0,1),3,replace=T )  #A fair coin is tossed three times, let 1 denote tails
   k[i]=3
   I=(prod(a)==1) # if I equals1, there are three  tails occur successively
   while (I!=1)
  { b<-sample(c(0,1),1 )
   k[i]=k[i]+1
   a<-c(a[2:3],b)
  I=(prod(a)==1)}
}
mean(k)

## Question Two ##

# Given a vector (x1,…,xn), the sample autocorrelation of lag k is defined to be
# (See Picture Quiz1-1.png)
# Thus
# (See Picture Quiz1-2.png)
# Write a function tmpFn(xVec, k) which takes two arguments: the vector xVec and an integer k which lies between 1 and n-1 where n is the length of xVec.
# The function should return a vector of the values (r= r1,…,rk).

tmpFn<- function(xVec, k)
{
xc <- xVec - mean(xVec)
denom <- sum(xc^2)             # calculate the denominator in the formula of rk.
n <- length(x)
r<-rep(0,k)
for (i in 1:k)
 r[i]= sum( xc[(i+1):n] * xc[1:(n-i)] )/denom  # calculate the ith value of autocorrelation
return(r)
}
x<-seq(2,56,by=3)
tmpFn(x,4)
[1] 0.8421053 0.6859649 0.5333333 0.3859649
