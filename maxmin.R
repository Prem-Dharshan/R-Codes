# Define decision matrix with row and column names
decision_matrix <- matrix(c(-20, 60, 30, -5,
                            40, 50, 35, 0,
                            -50, 100, 45, -10,
                            12, 15, 15, 10), 
                          nrow = 4, 
                          byrow = TRUE,
                          dimnames = list(c("Corn", "Wheat", "Soya Beans", "Do Grazing"),
                                          c("Heavy Rainfall", "Moderate Rainfall", "Light Rainfall", "Drought")))

cat("\nDecision Matrix\n")
print(decision_matrix)

# Maxmin method
maxmin <- apply(decision_matrix, 1, min)

cat("\nMaxmin Method\n")
print(maxmin)

max_index <- which.max(maxmin)

op <- sprintf("\nThe option with the highest min value is %s with a min value of %.2f\n\n", names(max_index), maxmin[max_index])
cat(op)


