# Load the lpSolve package
library(lpSolve)

# objective_coefficients <- c(5, 4)
# 
# # Define the coefficients of the constraints and the right-hand side values
# constraint_coefficients <- matrix(c(6, 4, 1, 2, -1, 1, 0, 1), nrow = 4, byrow = TRUE)
# rhs_values <- c(24, 6, 1, 2)
# constraint_direction <- c("<=", "<=", "<=", "<=")

# Function to take user inputs for coefficients or rhs values
get_user_input <- function(prompt_text) {
  # Prompt user for input
  cat(prompt_text)
  input <- readline(prompt = "")
  
  # Convert input to numeric vector
  numeric_input <- as.numeric(unlist(strsplit(input, ",")))
  
  return(numeric_input)
}

# Prompt user for objective function coefficients
objective_coefficients <- get_user_input("Enter the coefficients of the objective function (comma-separated): ")

# Prompt user for constraint coefficients
num_constraints <- as.integer(readline(prompt = "Enter the number of constraints: "))
constraint_coefficients <- matrix(nrow = num_constraints, ncol = length(objective_coefficients))
for (i in 1:num_constraints) {
  constraint_coefficients[i,] <- get_user_input(paste("Enter the coefficients of constraint ", i, " (comma-separated): "))
}

# Prompt user for right-hand side values of constraints
rhs_values <- get_user_input("Enter the right-hand side values of constraints (comma-separated): ")

# Prompt user for constraint directions
constraint_direction <- readline(prompt = "Enter the constraint directions (e.g., '<=', '>=', or '==', comma-separated): ")
constraint_direction <- strsplit(constraint_direction, ",")[[1]]

# Solve the Linear Programming Problem (LPP)
lp_result <- lp("max", objective_coefficients, constraint_coefficients, constraint_direction, rhs_values)

# Extract the optimal solution and the optimal objective function value
optimal_solution <- lp_result$solution
optimal_objective_value <- lp_result$objval

# Print the optimal solution and the optimal objective function value
cat("\n\nOptimal Solution: (", paste(optimal_solution, collapse = ", "), ")\n")
cat("Optimal Objective Function Value: ", optimal_objective_value, "\n")
