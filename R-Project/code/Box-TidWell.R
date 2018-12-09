boxtidwell <- function(y,x,tol = .001, max.iter = 25){
  iter <- 1 # the initial iteration
  y <- as.matrix(y)
  x <- as.matrix(x)
  w <-x
  alpha <- rep(1, ncol(x)) # initial alpha

  repeat{
    y <- as.matrix(y)
    x <- as.matrix(x)


<<<<<<< HEAD:R-Project/code/Box-TidWell.R
    w.log.w <- w*log(w) # alpha
    mod.1 <- get.Beta.hat(y ,  w)
    mod.2 <- get.Beta.hat(y , cbind(w,w.log.w)) # new model
    alpha <- (mod.2$coefficients[-c(1,2)] / mod.1$coefficients[-1] + 1) * alpha
    print(iter)
    print(alpha)
=======
    x.log.x <- x*log(x) # alpha
    mod.1 <- get.Beta.hat(y ,  x)
    mod.2 <- get.Beta.hat(y , cbind(x,x.log.x)) # new model
    storage <- NULL
    storage[iter] <- alpha <- (mod.2$coefficients[-c(1,2)] / mod.1$coefficients[-1] + 1) * alpha

>>>>>>> fde1025dcc01101ee71a80a9c9f0278c4325228c:R-Project/Box-TidWell.R
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
<<<<<<< HEAD:R-Project/code/Box-TidWell.R
  return(list("iter" = iter, "alpha" = alpha,"R^2 after transformation" = mod.2$R2))
=======
  return(list("iter" = iter - 1, "alpha" = alpha,"alpha all" = storage))
>>>>>>> fde1025dcc01101ee71a80a9c9f0278c4325228c:R-Project/Box-TidWell.R
}
