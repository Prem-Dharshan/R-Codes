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

plot(optimal_solution, type = "p", pch = 19, col = "red", main = "Linear Programming Problem", xlab = "x", ylab = "y")
abline(0, 1, col = "blue", lty = 2) # Constraint 1: 6x + 4y <= 24
abline(0.5, 1, col = "green", lty = 2) # Constraint 2: x + 2y <= 6
abline(1, -1, col = "purple", lty = 2) # Constraint 3: -x + y <= 1
abline(0, 1, col = "orange", lty = 2) # Constraint 4: y <= 2
legend("topright", legend = "Optimal Solution", pch = 19, col = "red")