boxtidwell <- function(y,x,tol = .001, max.iter = 25){
  iter <- 1 # the initial iteration
  y <- as.matrix(y)
  x <- as.matrix(x)
  alpha <- rep(1, ncol(x)) # initial alpha

  repeat{
    y <- as.matrix(y)
    x <- as.matrix(x)


    x.log.x <- x*log(x) # alpha
    mod.1 <- get.Beta.hat(y ,  x)
    mod.2 <- get.Beta.hat(y , cbind(x,x.log.x)) # new model
    alpha <- (mod.2$coefficients[-c(1,2)] / mod.1$coefficients[-1] + 1) * alpha
    print(iter)
    print(alpha)
    if(alpha <= tol || iter >= 4){
      break
    }
    iter <- iter + 1
    for (i in 1:ncol(x)){
      if(alpha[i] == 0){
        x[i] <- log(x)
      }
      if(alpha[i] != 0){
        x[i] <- x[i]^alpha
      }
    }
  }
  return(list("iter" = iter, "alpha" = alpha))
}
