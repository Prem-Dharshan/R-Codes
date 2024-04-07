# Install and load the numDeriv package
# install.packages("numDeriv")
library(numDeriv)

# Define the function
# f <- function(x) {x[1] - x[2] + 2*x[1]^2 + 2*x[1]*x[2] + x[2]^2}

f_string <- readline(prompt="Enter the function as a string: ")
f_string <- gsub("x1", "x[1]", f_string)
f_string <- gsub("x2", "x[2]", f_string)

# Parse and evaluate the string to get the function
f <- eval(parse(text=paste("function(x) {", f_string, "}")))

# Multiply the function by -1 to find the maximum
# f <- function(x) {-f(x)}

# Set the initial point
x <- c(0, 0)
x <- as.numeric(unlist(strsplit(readline(prompt = "Enter the intial point for line search (comma-separated): "), ',')))
interval <- as.numeric(unlist(strsplit(readline(prompt = "Enter the interval for line search (comma-separated): "), ',')))

# Cauchy method
for (i in 1:50) {
  # Compute the gradient and step
  g <- grad(f, x)
  s <- -g
  
  # Line search
  line_search <- function(lambda) f(x + lambda * s)
  opt <- optimize(line_search, interval)
  lambda <- opt$minimum
  
  # Update the current point
  x <- x + lambda * s
  
  # Check for convergence
  if (sqrt(sum(g^2)) < 1e-6) {
    break
  }
}

# Print the minimum point and value
cat("Minimum point: (", round(x[1], 2), ",", round(x[2], 2), ")\n")
cat("Minimum value: ", round(f(x), 2), "\n")

# Print the maximum point and value
cat("Maximum point: (", round(x[1], 2), ",", round(x[2], 2), ")\n")
cat("Maximum value: ", round(-f(x), 2), "\n") 
