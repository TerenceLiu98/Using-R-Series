## Quiz One

## Write the chi-square test for this data
x <- c(57, 66, 54, 55, 66, 70, 48, 28, 37, 53,
       50, 71, 24, 51, 53, 53, 43, 29, 46, 46,
       27, 64, 47, 42, 52, 45, 62, 51, 84, 32,
       60, 61, 33, 50, 36, 73, 41, 64, 59, 40,
       59, 77, 56, 49, 66, 29, 74, 44, 20, 72,
       38, 73, 41, 27, 55, 24, 43, 47, 49, 52,
       75, 36, 76, 59, 43, 32, 44, 29, 39, 78,
       72, 38, 42, 51, 39, 53, 41, 29, 32, 62,
       72, 42, 32, 53, 35, 55, 42, 107, 60, 63,
       46, 68, 55, 51, 37, 50, 50, 65, 33, 53,
       38, 30, 28, 55, 40, 39, 38, 69, 57, 36,
       60, 17, 67, 62, 39, 32, 39, 47, 51, 88,
       33, 74, 47, 43, 33, 56, 47, 42, 33, 63,
       49, 59, 26, 40, 50, 48, 31, 65, 14, 57,
       82, 52, 87, 46, 58, 48, 35, 36, 57, 42)

x1 <- x[x < 30]
x2 <- x[ x >= 30 & x < 40]
x3 <- x[ x >= 40 & x < 50]
x4 <- x[ x >= 50 & x < 60]
x5 <- x[ x >= 60 & x < 70]
x5 <- x[ x >= 60 & x < 80]
x5 <- x[ x >= 60 & x < 70]
x6 <- x[ x >= 70 & x < 80]
x7 <- x[ x >= 80]

x1.length <- length(x1)
x2.length <- length(x2)
x3.length <- length(x3)
x4.length <- length(x4)
x5.length <- length(x5)
x6.length <- length(x6)
x7.length <- length(x7)

p1 <- pnorm(30, 50, 15)
p2 <- pnorm(40, 50, 15) - pnorm(30, 50, 15)
p3 <- pnorm(50, 50, 15) - pnorm(40, 50, 15)
p4 <- pnorm(60, 50, 15) - pnorm(50, 50, 15)
p5 <- pnorm(70, 50, 15) - pnorm(60, 50, 15)
p6 <- pnorm(80, 50, 15) - pnorm(70, 50, 15)
p7 <- 1 - pnorm(80, 50, 15)

FE1 <- p1 * 150
FE2 <- p2 * 150
FE3 <- p3 * 150
FE4 <- p4 * 150
FE5 <- p5 * 150
FE6 <- p6 * 150
FE7 <- p7 * 150

M <- data.frame(
  "Class" = c("less than 30", " 30 to 40", "40 to 50", " 50 to 60", "60 to 70", "70 to 80", "over 80"),
  "Frequency" = c(x1.length, x2.length, x3.length, x4.length, x5.length, x6.length, x7.length),
  "Expected.Frequency" = c(FE1, FE2, FE3, FE4, FE5, FE6, FE7))

Chi.square <- sum((M$Frequency - M$Expected.Frequency)^2 / M$Expected.Frequency)

pchisq(6,6)
