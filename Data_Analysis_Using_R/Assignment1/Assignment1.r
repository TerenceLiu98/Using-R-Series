#Assignment 1 

# Question One
# part one
comm_time <- c(17,16,20,24,22,15,21,15,17,22) #input the data
max(comm_time) # get the maximum element of the sequence = 24
mean(comm_time) # get the sequence's mean = 18.9
min(comm_time) # get the minimum element of the sequence = 15

# part two
comm_time[which(comm_time == 24)] <- 18
print(comm_time) # the result is  [1] 17 16 20 18 22 15 21 15 17 22
# This first command can disintegrate into two commands:
# substitute <- which(comm_time == 24)
# comm_time[substitute] <- 18

# part three
comm_time <- c(17,16,20,24,22,15,21,15,17,22)
comm_time[which(comm_time >= 20)] # the result is: [1] 20 24 22 21 22
# first loop is get the serial number of those who are larger than 20
# second step is to print them out

# part four
less_17_comm_time <- comm_time[which(comm_time < 17)]
sprintf("%.1f%%", length(less_17_comm_time) / length(comm_time) * 100)
# use `sprintf` can output a percentage mode number

# Question Two
radius_Q2 <- c(seq(from = 3, to = 20, by = 1)) # store the radius data
volume <- c(3 / 4 * pi * (radius_Q2 ^ 3)) # calculate the volume of spheres of radius_Q2
DF_1 <- data.frame(radius, volume) # create the data frame with columns radius and volume
print(DF_1) # print out the data frame

# Question Three
install.packages("DAAG","lattice")
library(DAAG)
names(ais) # get the names of the columns
names(ais$sport) # we can get there are B_Ball Field Gym Netball Row Swim T_400m T_Sprnt Tennis W_Polo
sport <- c('B_Ball','Field','Gym','Netball','Row','Swim','T_400m','T_Sprnt','Tennis','W_Polo')
i <- 1
for (i in seq(from = 1, to = length(sport))){
  print(paste("There are",length(which(ais$sex[which(ais$sport == sport[i])] == 'f')),"females in",sport[i]))
  i = i + 1
}
for (i in seq(from = 1, to = length(sport))){
  print(paste("There are",length(which(ais$sex[which(ais$sport == sport[i])] == 'm')),"males in",sport[i]))
  i = i + 1
}

# Question Four 
matrix_Q4 <- matrix(sample(1:100,100,replace = T),nrow = 5, ncol = 4)
mean_col <- rep(0,4)
sd_col <- rep(0,4)

for (i in 1:4){
  mean_col[i] <- mean(matrix_Q4[1:5,i])
  print(paste("The mean of column",i,"is",mean_col[i]))
  sd_col[i] <- sd(matrix_Q4[1:5,i])
  print(paste("The  of standard deviation of column",i,"is",sd_col[i]))
  i = i + 1
}

# Question Five
#part one
matrix_Q5 <- matrix(c(1,5,-2,1,2,-1,3,6,-3),nrow = 3,ncol = 3)

# define a matrix power's function
"%^%" <- function(mat, pow) {
  if (!is.matrix(mat)) mat <- as.matrix(mat)
  stopifnot(!diff(dim(mat)))
  if (pow < 0) {
    pow <- -pow
    mat <- solve(mat)
  }
  pow <- round(pow)
  switch(pow + 1, return(diag(1, nrow(mat))), return(mat))
  get.exponents <- function(pow)
    if (pow == 0) NULL else c(k <- 2^floor(log2(pow)), get.exponents(pow - k))
  ans <- diag(nrow(mat))
  dlog2exp <- rev(-diff(c(log2(get.exponents(pow)), 0)))
  for (j in 1:length(dlog2exp)) {
    if (dlog2exp[j]) for (i in 1:dlog2exp[j]) mat <- mat %*% mat
    ans <- ans %*% mat
  }
  ans
}
matrix_Q5 %^% 3
# the result is :
#       [,1] [,2] [,3]
# [1,]    0    0    0
# [2,]    0    0    0
# [3,]    0    0    0

# part two
matrix_Q5[1:3,3] <- matrix_Q5[1:3,2] + matrix_Q5[1:3,3]
matrix_Q5
# the result is:
#       [,1] [,2] [,3]
# [1,]    1    1    4
# [2,]    5    2    8
# [3,]   -2   -1   -4

# Question Six
A <- matrix(c(1,2,3,4,5,2,1,2,3,4,3,2,1,2,3,4,3,2,1,2,5,4,3,2,1),nrow=5, ncol=5)
y <- c(7,-1,-3,5,17)
solve(A,y)
#the solution is x = -2  3  5  2 -4

# Question Seven
#part One
aMat <- matrix( sample(1:10, size=60, replace=T), nr=6)

i <- NULL
for ( i in 1:6){
  print(aMat[i,which(aMat[i,1:10] > 4)])
  i = i + 1
}

#part two
number_we_want <- readline()
frequence <- readline()
for ( i in 1:6){ # i represents the which line
  for ( j in 1:length(as.data.frame(table(aMat[i,1:10]))$Var1)){ # j represents which line in the data.frame
    if(as.data.frame(table(aMat[i,1:10]))$Var1[j] == number_we_want ){
      if(as.data.frame(table(aMat[i,1:10]))$Freq[j] == frequence ){
        print(i)
      }
    }
  }
}

# According to the question we can let:
# number_we_want <- 7
# frequence <- 2

#The idea is that to change `table` function into a data.frame which can make it
#clear that whether the numbers we need to find exists or not.
#Then, we  estimate the frequence of the number we want.  

# Question Eight 
# part one
x <- c(918,805,892,962,968,907,770,743,1045,810,927,813,858,860,760,747,743,803,683,844,755,700,748,775)
y <- c(42.33,53.10,42.08,50.06,42.45,42.46,47.82,49.92,36.23,49.66,41.49,46.17,48.18,43.21,51.81,53.28,53.29,47.18,56.91,47.80,48.65,53.69,60.62,56.73)

# part two
Sx = sum(x)
Sy = sum(y)
Sxx = sum((x - mean(x))^2)
Syy = sum((y - mean(y))^2)
Sxy = sum((x - mean(x)) * (y - mean(y)))
beta_1 = Sxy/Sxx
alpha_1 = mean(y) - beta*mean(x)

# part three
residuals = y - (beta + alpha * x)

#part four
mean(x)-qt(0.975,49)*sd(x)/sqrt(50) # lower bound
mean(x)+qt(0.975,49)*sd(x)/sqrt(50) # upper bound

