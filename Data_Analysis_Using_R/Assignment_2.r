# Questions One 

time <- seq(1:100)
number_time <- c(sample(1:6,100,replacement = T))
j <- 1
for (i in 1:100){
  if (data.frame(time,number_time)$number[i] == 5){
    j = j + 1
  }
}
print(paste("There are",j,"'5' in the trail."))


# Question two 

country <- read.table("country.txt") # before enter this command, please use getwd() to check the path

# part one
length(country)
print(paste("There are ",length(country),"veriables in this data set"))

length(country$V1)
print(paste("There are ",length(country$V1),"contries in this data set"))

# part two
developing_percentage <- length(country$V5[country$V5 == "developing"]) / length(country$V5[-1])
paste(sprintf("%.1f%%", developing_percentage ))
# part three
V2 <- as.matrix(country$V2)
mean(as.numeric(V2[-1]))
print(paste("The mean of the variable GDP is ",mean(as.numeric(V2[-1]))))

# part Four
V4 <- as.matrix(country$V4)
print(paste("The standard deviation is ",sd(as.numeric(V4[-1]))))

# part Five
V2 <- as.matrix(country$V2)
print(paste("The range of GDP is (",min(as.numeric(V2[-1])),",",max(as.numeric(V2[-1])),")"))

# part six
V2 <- as.matrix(country$V2)
V3 <- as.matrix(country$V3)

# Question three

i <- 0
sum <- 0

repeat{
  i = i + 1
  sum = sum + i
  
  if (sum >= 1000000 ){
    break
  }
}
print(paste("After",i,"times rolling, the first sum which is exceeded one million is:",sum))

# Question four 
for ( i in 0:299) {
  i = i + 1
  sum = sum + i
  if(i %% 20 == 0){ # every 20 terms we make a judgement
    # check if the number is the multiple of 20
    if(i %% 20 == 0) {  
      print(paste("The",i,"the current number  is",i,"which is the multiple of 20."))
    } else if (i %% 20 != 0) {
      print(paste("The",i,"the current number is",i,"which is not the multiple of 20."))
    }
  }
}

# Question five
collatz <- function(n, acc=c()) {
  if(n==1) return(c(acc, 1));
  collatz(ifelse(n%%2==0, n/2, 3*n +1), c(acc, n))}

# Quesiton six
collatz <- function(n, acc=c()) {
  if(n==1) return(c(acc, 1));
  collatz(ifelse(n%%2==0, n/2, 3*n +1), c(acc, n))}

# Question seven
install.packages("zoo")
library(zoo)
x <- 1:100
rollmedian(x,5)

# Question eight

Question_Eight <- function(x){
  i <- 1
  n <- length(x)
  answer <- x[1]
  for(i in 1:(n-1)){
    y <- 1 / answer
    if(i == n-1){
      answer <- (x[i + 1] + y)
    }
    else {
      answer <- 1/(x[i] + y)
    }
  }
  return(answer)
}

# Question nine 

sex <- readline()
height <- readline()
height <- as.numeric(height)

if (height < 2 ){
  height = height * 100
}
if ( sex == 'female'){
  sex <- 'f'
}
if ( sex == 'male'){
  sex <- 'm'
}
if ( sex == 'f'){
  weight = (height - 105) * 0.92
  print(paste("You are a female, your ideal weight is between (",weight * 0.8, weight * 1.2,")"))
}
if ( sex == 'm'){
  weight = (height - 100) * 0.90
  print(paste("You are a male, your ideal weight is between (",weight * 0.8, weight * 1.2,")"))
}

# Question ten

Id=c(1:10)
Age=c(14,12,15,10,23,21,41,56,78,12)
Sex=c('F','M','M','F','M','F','M','M','F','M')
Code=letters[1:10]
df=data.frame(Id,Age,Sex,Code)

interchange <- function(x,y){
  Id=c(1:10)
  Age=c(14,12,15,10,23,21,41,56,78,12)
  Sex=c('F','M','M','F','M','F','M','M','F','M')
  Code=letters[1:10]
  df=data.frame(Id,Age,Sex,Code)
  df[5] <- df[y]
  df[y] <- df[x]
  df[x] <- df[5]
  return(df[-5])
}

# Question eleven

elimination <- function (x, y)
{
  x <- as.vector(x)
  y <- as.vector(y)
  unique(if (length(x) || length(y))
    x[match(x, y, 0L) == 0L]
    else x)
}

# Chanllenge problem 

test_matrix <- matrix(c(-2,4,6,0,0,0,-1,1,1,2,0,2),ncol = 4,nrow = 3)
reduced_row_echelon_form <- function(A)
{
  stopifnot(is.numeric(A))
  if (!is.matrix(A))
    stop("Input parameter 'A' must be a matrix.")
  nr <- nrow(A)
  nc <- ncol(A)
  tol <- eps() * max(nr, nc) * max(abs(A))
  r <- 1
  for (i in 1:nc) {
    pivot <- which.max(abs(A[r:nr, i]))
    pivot <- r + pivot - 1
    m <- abs(A[pivot, i])
    if (m <= tol) {
      A[r:nr, i] <- 0
    }
    else {
      A[c(pivot, r), i:nc] <- A[c(r, pivot), i:nc]
      A[r, i:nc] <- A[r, i:nc]/A[r, i]
      if (r == 1) {
        ridx <- c((r + 1):nr)
      }
      else if (r == nr) {
        ridx <- c(1:(r - 1))
      }
      else {
        ridx <- c(1:(r - 1), (r + 1):nr)
      }
      A[ridx, i:nc] <- A[ridx, i:nc] - A[ridx, i, drop = FALSE] %*%
        A[r, i:nc, drop = FALSE]
      if (r == nr)
        break
      r <- r + 1
    }
  }
  A[abs(A) < tol] <- 0
  return(A)
}
print(test_matrix)

