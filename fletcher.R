library(numDeriv)

f <- function(x) {
  x1 <- x[1]
  x2 <- x[2]
  return(x1 - x2 + 2*x1^2 + 2*x1*x2 + x2^2)
}

# Function to compute the gradient using numerical differentiation
compute_gradient <- function(f, x) {
  gradient <- grad(func = f, x = x)
  return(gradient)
}

# Gradient of the function using numerical differentiation
grad_f <- function(x) {
  gradient <- compute_gradient(f, x)
  return(gradient)
}

fletcher_reeves <- function(f, grad_f, x0) {
  x <- x0
  cap_s <- -grad_f(x) # S1
  iter <- 0
  
  for(i in 1:50 ) {
    # Compute the gradient at the current point
    grad <- grad_f(x)
    grad <- trunc(grad)
    
    # Check convergence
    if (all(grad == 0)) {
      break
    }
    
    if(i != 1) {
      a <- sum(grad^2) / sum(cap_s^2)
      b = -grad + a * cap_s
      cap_s <- b # S2
    }
    
    # Line search using optimize()
    line_search <- function(lambda) f(x + lambda * cap_s)
    opt <- optimize(f = line_search, interval = c(0, 10), maximum = FALSE)
    lambda <- opt$minimum
    
    x <- x + lambda * cap_s
    iter <- iter + 1
  }
  
  return(list(x = x, value = f(x), iterations = iter))
}

x0 <- c(0, 0)

# Run Fletcher-Reeves method
result <- fletcher_reeves(f, grad_f, x0)

cat("\nMinimum point:", result$x, "\n")
cat("Minimum value:", result$value, "\n")
cat("Number of iterations:", result$iterations, "\n")
