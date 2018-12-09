BoxTidwell <- function(y,x,tol = .001, max.iter = 25){
  # step one
  y <- as.matrix(y)
  x <- as.matrix(x)
  mod.1 <- get.Beta.hat(y,x)
  alpha <- as.vector(rep(1, ncol(x)))
  x.log.x <- x * log(x)
  mod.2 <- get.Beta.hat(y,cbind(x, x.log.x))
  print(mod.2$R2)
  w <- x
  iter <- 0

  repeat{
    w <- w ^ alpha
    w.log.w <- w * log(w)
    mod.1 <- get.Beta.hat(y,w)
    mod.2 <- get.Beta.hat(y,cbind(w, w.log.w))
    alpha <- (mod.2$coefficients[-seq(1,1 + ncol(x)),] / mod.1$coefficients[ncol(x) + 1, ] + 1) * alpha
    iter <- iter + 1
    print(iter)
    print(alpha)
    if(iter >= max.iter || alpha == 4){break}
  }
  return(list("iter" = iter, "alpha" = alpha))
}

  # step two
