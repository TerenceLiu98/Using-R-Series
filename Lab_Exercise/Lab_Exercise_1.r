#Question One:
# part a
x <- sample(1:20, 100, replace = T)
y <- rep(1:0)# Let y be a another vector: rep(1:0) print(x + y*3) # let the odd-index elements add 3
# part b
sqrt(x) # compute the square root of each element contained by x

#Question Two:
x <- c(3,15,9,12,-1,-12,9,6,1)
# part a
x <- c(3,15,9,12,-1,-12,9,6,1)
x <- abs(x) # get the absolute value of every elements in x print(x) # print out all the elements in x
# part b
x <- c(3,15,9,12,-1,-12,9,6,1)
x[which( x %% 3 == 0)] <- 3
print(3)
# part c
x <- c(3,15,9,12,-1,-12,9,6,1)
x_1 <- (x * 5) %% 2
x_2 <- x[x_1 == 0]
print(x_2)
# part d
x <- c(3,15,9,12,-1,-12,9,6,1)
y <- x[x > 10]
print(y)
# part e
i <- which(x > 4) # find out the element that suitable for the criteria
print(i) # print them out

#Question Three
x <- 1
sum(1,rep(x,19)^(1:19) / gamma(2:20))
