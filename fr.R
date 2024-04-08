f <- function (x)
{
  x1 <- x[1]
  x2 <- x[2]
  return(x1 - x2 + 2 * x1 ^ 2 + 2 * x1 * x2 + x2 ^ 2)
}

cauchy <- function(f,x0)
{
  x <- x0
  itr <- 0
 
  for (i in 1:50)
  {
  grad <- grad(func = f, x = x)
 
  if (all(round(grad,2) == 0))
  {
    break
  }
  if (i == 1)
  {
    s <- -grad
  }
 
  else
  {
    s <- -grad + sum(grad ^2)/sum(s ^ 2) * s
  }
  opt <- optimize(f = function(lambda)f(x + lambda * s),interval = c(0,10),maximum = FALSE)
  lambda = opt$minimum
  x <- x + lambda * s
  itr <- itr + 1
  }
 
  return(list(x = x, min_val = f(x), iter = itr))
}

x0 <- c(0,0)
result <- cauchy(f , x0)

cat("\nMinimum Point :",round(result$x,2),"\n")
cat("\nMinimum Value :",round(result$min_val,2),"\n")
cat("\nNumber of iterations :",result$iter,"\n")
