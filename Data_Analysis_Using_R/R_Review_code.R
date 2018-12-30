6 + 9
# [1] 15

x <- 15
x - 1 

#[1] 14

x = 5
5 * x -> x
x
#[1] 25

x <- c(1, -1, 3.5, 2)
x
# [1]  1.0 -1.0  3.5  2.0

x + 2
# [1] 3.0 1.0 5.5 4.0

x^2

# [1] 1.00 1.00 12.25 4.00

sum((x - mean(x))^2)

#[1] 10.69

Before <- c(78,72,78,79,105)
After <- c(67,65,79,70,93)
Before <- as.vector(Before)
After <- as.vector(After)
lost <- Before - After
average_lost <- mean(lost)
print(average_lost)

1:10

# [1]  1  2  3  4  5  6  7  8  9 10

-3:4

# [1] -3 -2 -1  0  1  2  3  4

9:5

# [1] 9 8 7 6 5

seq(from = 2, to = 6, by = 0.4)
# [1] 2.0 2.4 2.8 3.2 3.6 4.0 4.4 4.8 5.2 5.6 6.0
seq(from = -1, to = 1, length = 6)
# [1] -1.0 -0.6 -0.2  0.2  0.6  1.0

rep(5,3)
# [1] 5 5 5
rep(2:5, each = 3)
# [1] 2 2 2 3 3 3 4 4 4 5 5 5
rep(-1:3, length.out=10)
# [1] -1  0  1  2  3 -1  0  1  2  3

2^(0:10)
# [1] 1 2 4 8 16 32 64 128 256 5121024
1:3 + rep(seq(from = 0, by = 10, to = 30), each = 3)
# [1] 1 2 3 11 12 13 21 22 23 31 32 33

1:10 * c(-1,1)
# [1]-1 2-3 4-5 6-7 8-910
1:7 * 1:2
# [1] 1 4 3 8 5 12 7

x <- c(5,9,2,14,-4)
x[3]

# note indexing starts from 1
x[c(2,3,5)]

x[1:3]

x[3:length(x)]

x > 4

x[x>4]

# Question One
LETTERS[1:12]

# Question Two 
letter_odd <- LETTERS[seq(1,length(LETTERS),2)]

a <- which(LETTERS == "A")
e <- which(LETTERS =="E")
i <- which(LETTERS =="I")
o <- which(LETTERS =="O")
u <- which(LETTERS =="U")

vowel <- as.vector(rbind(a,e,i,o,u))

LETTERS_consonant <- LETTERS[-vowel]
print(LETTERS_consonant)

x <= 2 # less than or equal to 

x == 2 # equal to

x != 2 # not equal to 

x <- rnorm(10) # initial x

# question one
x.less_1 <- x[x < 1]
print(x.less_1)
# question two 
x.between_0.5_1 <- x[ x > 0.5 & x < 1]
print(x.between_0.5_1)
# question three 
x.larger_1.5 <- x[x > 1.5]
print(x.larger_1.5)

x <- c("Hello", "how do you do", "lovely to meet you", 42)
print(x)

x[2:3]
x[-4]
c(x[1:2],"goodbye")


i <- 1
roll_results <- rep(NA)
dice_sides <- 1:6
j <- 0 
while(length(roll_results) < 6){
    a <- sample(dice_sides, size = 1)
    if(a %in% roll_results == FALSE){
      roll_results[i] <- a
      i <- i + 1
    }
  j <- j + 1
}
paste(j, "times rolling")
