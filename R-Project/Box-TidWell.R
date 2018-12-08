<<<<<<< HEAD
boxtidwell <- function(y,x,tol = .01, max.iter = 25){
  iter <- 1
  y <- as.matrix(y)
  x <- as.matrix(x)
  alpha <- rep(1, ncol(x))

=======
boxtidwell <- function(y,x,tol = .001, max.iter = 25){
  iter <- 1 # the initial iteration
  y <- as.matrix(y)
  x <- as.matrix(x)
  alpha <- rep(1, ncol(x)) # initial alpha
>>>>>>> a448c371c6c5b56843d46715a815d38f95ba4b51

  repeat{
    y <- as.matrix(y)
    x <- as.matrix(x)
<<<<<<< HEAD
    # if (any(x <= 0)) stop("the variables to be transformed must have only positive values")
    # var.names <- if(is.null(colnames(x))) seq(length.out=ncol(x)) else colnames(x)
    # Retrieve or set the row or column names of a matrix-like object. use clonams to get the length of x
    #‘is.null’ returns ‘TRUE’ if its argument's value is ‘NULL’ and
    # ‘FALSE’ otherwise.
    # k.x <- length(var.names) # the number of the independent varible
    x.log.x <- x*log(x) # alpha
    # which.coefs <- 2:(1 + k.x)
    mod.1 <- get.Beta.hat(y ,  x)
    mod.2 <- get.Beta.hat(y , cbind(x,x.log.x)) # new model
    alpha <- (coefficients(mod.2)[ncol(x):ncol(x.log.x)]/coefficients(mod.1)[1:ncol(x)] + 1) * alpha
    print(iter)
    print(alpha)
    iter <- iter + 1
    x <- x^alpha
    if(alpha <= tol || iter >= max.iter){
=======


    x.log.x <- x*log(x) # alpha
    mod.1 <- get.Beta.hat(y ,  x)
    mod.2 <- get.Beta.hat(y , cbind(x,x.log.x)) # new model
    alpha <- (mod.2$coefficients[-c(1,2)] / mod.1$coefficients[-1] + 1) * alpha
    print(iter)
    print(alpha)
    if(alpha <= tol || iter >= 4){
>>>>>>> a448c371c6c5b56843d46715a815d38f95ba4b51
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
