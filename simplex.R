# Load the lpSolve package
library(lpSolve)

# Define the coefficients of the objective function
objective_coefficients <- c(5, 4)

# Define the coefficients of the constraints and the right-hand side values
constraint_coefficients <- matrix(c(6, 4, 1, 2, -1, 1, 0, 1), nrow = 4, byrow = TRUE)
rhs_values <- c(24, 6, 1, 2)
constraint_direction <- c("<=", "<=", "<=", "<=")

# Solve the Linear Programming Problem (LPP)
lp_result <- lp("max", objective_coefficients, constraint_coefficients, constraint_direction, rhs_values)

# Extract the optimal solution and the optimal objective function value
optimal_solution <- lp_result$solution
optimal_objective_value <- lp_result$objval

# Print the optimal solution and the optimal objective function value
cat("\n\nOptimal Solution: (", optimal_solution[1], ", ", optimal_solution[2], ")\n")
cat("Optimal Objective Function Value: ", optimal_objective_value, "\n")