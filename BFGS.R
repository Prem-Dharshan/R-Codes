# Define the function
f <- function(x) {
  return (x[1] - x[2] + 2 * x[1]^2 + 2 * x[1] * x[2] + x[2]^2)
}

# Initial point
x0 <- c(0, 0)

# BFGS optimization
library(stats)
result <- optim(x0, f, method = "BFGS")

# Extract results
minimum_point <- result$par
minimum_value <- -result$value

# Calculate the number of iterations (approximation)
num_iterations <- result$counts[["function"]]  # Corrected access to function evaluations

# Print the output
cat("Minimum point:\n")
cat("x =", minimum_point[1], ", y =", minimum_point[2], "\n")
cat("Minimum value:\n")
cat(minimum_value, "\n")
cat("Number of iterations:\n")
cat(num_iterations, "\n")
