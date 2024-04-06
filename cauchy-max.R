# Load the numDeriv package for the grad function
library(numDeriv)

# Ask the user for the function as a string
f_string <- readline(prompt="Enter the function as a string: ")

# Replace 'x1' and 'x2' with 'x[1]' and 'x[2]'
f_string <- gsub("x1", "x[1]", f_string)
f_string <- gsub("x2", "x[2]", f_string)

# Parse and evaluate the string to get the function
f <- eval(parse(text=paste("function(x) {", f_string, "}")))

# Set the initial point
x <- c(0, 0)

# Cauchy method for maximization
for (i in 1:50) {
  # Compute the gradient and step
  g <- grad(f, x)
  s <- g  # Change here for maximization
  
  # Line search
  line_search <- function(lambda) f(x + lambda * s)
  opt <- optimize(line_search, c(0, 10), maximum = TRUE)  # Change here for maximization
  lambda <- opt$maximum  # Change here for maximization
  
  # Update the current point
  x <- x + lambda * s
  
  # Check for convergence
  if (sqrt(sum(g^2)) < 1e-6) {
    break
  }
}

# Print the maximum point and value
cat("Maximum point: (", round(x[1], 2), ",", round(x[2], 2), ")\n")
cat("Maximum value: ", round(f(x), 2), "\n")
