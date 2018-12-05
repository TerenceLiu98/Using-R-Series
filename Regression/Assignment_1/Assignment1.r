x <- c(52.0,66.0,44.5,37.7,73.5,37.5,56.7,35.6)
y <- c(2.35,4.95,3.10,2.50,5.11,3.10,2.90,1.75)
sum_xs <- sum(x^2)
sum_1 <- (sum(x))^2
SS_xx <- sum_xs - (b / length(x))
sum_xy <- sum(x * y)
sum_2 <- sum(x) * sum(y) SS_xy <- sum_xy - (sum_2 / 8)
b_1 <- SS_xy / SS_xx
b_0 <- mean(y) - b_1 * mean(x)
sum_ys <- sum(y^2)
sum_3 <- (sum(y))^2
SS_yy <- sum_ys - (sum_3 / 8)
