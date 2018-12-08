boxtidwell <- function(y,x,tol = .001, max.iter = 25){
  iter <- 1
  alpha <- rep(1, length(var.names))
  y <- as.matrix(y)
  x <- as.matrix(x)
  
  repeat{
    y <- as.matrix(y)
    x <- as.matrix(x)
    if (any(x <= 0)) stop("the variables to be transformed must have only positive values")
    var.names <- if(is.null(colnames(x))) seq(length.out=ncol(x)) else colnames(x)
    # Retrieve or set the row or column names of a matrix-like object. use clonams to get the length of x
    #‘is.null’ returns ‘TRUE’ if its argument's value is ‘NULL’ and
    # ‘FALSE’ otherwise.
    k.x <- length(var.names) # the number of the independent varible
    x.log.x <- x*log(x) # alpha
    
    mod.1 <- get.Beta.hat(y ,  x)
    mod.2 <- get.Beta.hat(y , cbind(x,x.log.x)) # new model
    alpha <- (mod.2$coefficients[-c(1,2)] / mod.1$coefficients) * alpha
    iter <- iter + 1
    if(alpha <= tol || iter >= max.iter){
    x <- x^alpha
      break
    }
  }
   return(list("iter" = iter, "alpha" = alpha))
}
