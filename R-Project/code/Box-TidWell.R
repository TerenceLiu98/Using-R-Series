boxtidwell <- function(y,x,tol = .001, max.iter = 25){
  iter <- 1 # the initial iteration
  y <- as.matrix(y)
  x <- as.matrix(x)
  w <-x
  alpha <- rep(1, ncol(x)) # initial alpha

  repeat{
    y <- as.matrix(y)
    x <- as.matrix(x)


    w.log.w <- w*log(w) # alpha
    mod.1 <- get.Beta.hat(y ,  w)
    mod.2 <- get.Beta.hat(y , cbind(w,w.log.w)) # new model
    alpha <- (mod.2$coefficients[-c(1,2)] / mod.1$coefficients[-1] + 1) * alpha
    print(iter)
    print(alpha)
    if(alpha <= tol || iter >= 4){
      break
    }
    iter <- iter + 1
    for (i in 1:ncol(x)){
    for (j in 1:nrow(x)){
    	if(alpha[i] != 0){
        w[j] <- x[j]^alpha
      }
      	if(alpha[i] == 0){
        w[i] <- log(x)
      }
	}
	}
  }
  return(list("iter" = iter, "alpha" = alpha))
}

