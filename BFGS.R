# Define the function
# f <- function(x) {
#   return (x[1] - x[2] + 2 * x[1]^2 + 2 * x[1] * x[2] + x[2]^2)
# }

# Ask the user for the function as a string
f_string <- readline(prompt="Enter the function as a string: ")

# Replace 'x1' and 'x2' with 'x[1]' and 'x[2]'
f_string <- gsub("x1", "x[1]", f_string)
f_string <- gsub("x2", "x[2]", f_string)

f <- eval(parse(text=paste("function(x) {", f_string, "}")))

# Initial point
x0 <- c(0, 0)

# BFGS optimization
library(stats)
result <- optim(x0, f, method = "BFGS")
# result <- optim(x0, f, method = "BFGS", control = list(fnscale = 1)) # For max

# Extract results
minimum_point <- result$par
minimum_value <- result$value
# maximum_point <- result$par
# maximum_value <- -result$value

# Check if optimization has converged
converged <- result$convergence == 0

# Calculate the number of iterations (approximation)
num_iterations <- result$counts[["function"]]  # Corrected access to function evaluations

# Print the output
cat("Minimum point:\n")
cat("x =", minimum_point[1], ", y =", minimum_point[2], "\n")
cat("Minimum value:\n")
cat(minimum_value, "\n")
cat("Number of iterations:\n")
cat(num_iterations, "\n")

# cat("Maximum point:\n")
# cat("x =", maximum_point[1], ", y =", maximum_point[2], "\n")
# cat("Maximum value:\n")
# cat(maximum_value, "\n")
# cat("Number of iterations:\n")
# cat(num_iterations, "\n")

cat("Converged:\n")
cat(converged, "\n")