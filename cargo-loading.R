# Define the weights and values of the items and the capacity of the cargo
# weights <- c(2, 3, 1)
# values <- c(31, 47, 14)
# capacity <- 4

weights <- as.numeric(strsplit(readline(prompt="Enter the weights of the items (comma-separated): "), ",")[[1]])
values <- as.numeric(strsplit(readline(prompt="Enter the values of the items (comma-separated): "), ",")[[1]])
capacity <- as.integer(readline(prompt="Enter the maximum weight capacity of the cargo: "))

# Initialize the dynamic programming table
dp <- matrix(0, length(weights)+1, capacity+1)

# Fill the dynamic programming table
for (i in 1:length(weights)) {
  for (j in 0:capacity) {
    if (weights[i] > j) {
      dp[i+1, j+1] <- dp[i, j+1]
    } else {
      dp[i+1, j+1] <- max(dp[i, j+1], dp[i, j+1-weights[i]] + values[i])
    }
  }
}

# Print the dynamic programming table
print(dp)

# Trace back the solution
solution <- integer(0)
j <- capacity
for (i in length(weights):1) {
  if (dp[i+1, j+1] != dp[i, j+1]) {
    solution <- c(solution, i)
    j <- j - weights[i]
  }
}

# Print the solution
cat("Selected cargos:", solution, "\n")
cat("Maximum value of loaded cargos:", dp[length(weights)+1, capacity+1], "\n")
cat("Total weight of selected cargos:", sum(weights[solution]), "\n")
