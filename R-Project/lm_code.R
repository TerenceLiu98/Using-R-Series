get.Beta.hat <- function(y,x){
  y <- as.matrix(y)
  x <- cbind(constant = 1, as.matrix(x))
  beta.hat <- solve(t(x)%*%x,t(x)%*%y) # (x'x)^-1 * (x'y)

  for(i in length(beta.hat)){
    names(beta.hat) <- c("intercept", [i])
  }

  # Compute standard errors
  s2 <- sum((y - x%*% beta.hat)^2)/(nrow(x) - ncol(x))
  VCV <- s2*solve(t(x)%*%x)
  SE <- sqrt(diag(VCV))

  # Compute t-values
  t <- beta.hat/SE

  # Compute p-values
  p <- 2*pt(abs(t),nrow(x) - ncol(x), lower.tail = FALSE)

  # Compute adjusted R-squared
  y_hat <- x%*%beta.hat
  SSr <- sum((y - y_hat)^2)
  SSt <- sum((y - mean(y))^2)
  R2 <- 1 - (SSr/SSt)
  adj.R2 <- 1 - ((1 - R2)*(nrow(x) - 1))/(nrow(x) - ncol(x[,-1]) - 1)

  beta.hat <- as.numeric(beta.hat)
  Table <- as.data.frame(round(cbind(beta.hat,SE,t,p, R2), digits = 4))
  names(Table)[1:5] <- c("Estimate","Standard Error","t-value","p-value", "R^2")
  paste("adj R square is ", adj.R2)
  return(list("Table" = Table, "coefficients" = beta.hat,"y_hat" = y_hat))
}
