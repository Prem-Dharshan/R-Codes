# Define decision matrix with row and column names
decision_matrix <- matrix(c(-20, 60, 30, -5,
                            40, 50, 35, 0,
                            -50, 100, 45, -10,
                            12, 15, 15, 10), 
                          nrow = 4, 
                          byrow = TRUE,
                          dimnames = list(c("Corn", "Wheat", "Soya Beans", "Do Grazing"),
                                          c("Heavy Rainfall", "Moderate Rainfall", "Light Rainfall", "Drought")))

print("Decision Matrix:")
print(decision_matrix)

# Laplace method
laplace <- rowMeans(decision_matrix)

print("Laplace Method:")
print(laplace)

res <- which.max(laplace)
op <- sprintf("\nThe optimal crop to plant is %s with a payoff of %.2f\n\n", names(res), laplace[res])
print(op)
