# Install and load the lpSolve package
# install.packages("lpSolve")
library(lpSolve)

# Define the weights and values of the items and the capacity of the cargo
weights <- c(2, 3, 1)
values <- c(31, 47, 14)
capacity <- 4

# Set up the linear programming problem
result <- lp("max", values, matrix(weights, nrow=1), "<=", capacity, all.bin = TRUE)

# Print the results
cat("Maximum value of loaded cargos:", sum(result$solution * values), "\n")
cat("Selected cargos:", which(result$solution == 1), "\n")
cat("Total weight of selected cargos:", sum(result$solution * weights), "\n")
