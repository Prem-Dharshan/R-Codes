library(gMOIP)
library(lpSolve)
library(ggplot2)

constraint_coefficients <- matrix(c(1,-2,1,0,0,1), ncol = 2, byrow = TRUE)
lp_result <- lp("max", c(3,5), constraint_coefficients, c("<=","<=",">="), c(6,10,1))

status <- lp_result$status

feasible_region <- function(obj, mat, dir, rhs, ans) {
  x_vals <- seq(0, 10, by = 0.01)
  y_vals <- seq(0, 10, by = 0.01)
  df <- expand.grid(x = x_vals, y = y_vals)
  df$feasible <- 1
  
  for (i in seq_len(nrow(mat))) {
    l<- F
    if(dir[i] == "<=") {
      l <- mat[i, 1] * df$x + mat[i, 2] * df$y <= rhs[i]
    } else { 
      print("oo")
      l <- mat[i, 1] * df$x + mat[i, 2] * df$y >= rhs[i]
    }
    df$feasible <- df$feasible & l
  }
}

if (status == 0) {
  print("The optimization problem was solved to optimality, and an optimal solution was found.")
} else if (status == 1) {
  print("The optimization problem was solved, but the solution found is suboptimal.")
} else if (status == 2) {
  print("The optimization problem is infeasible, meaning that no feasible solution exists that satisfies all the constraints.")
} else if (status == 3) {
  print(feasible_region(c(3,5), constraint_coefficients, c("<=","<=",">="), c(6,10,1), lp_result$solution))
  print("The optimization problem is unbounded, meaning that the objective function can be improved indefinitely without violating any constraints.")
} else if (status == 4) {
  print("The optimization problem is degenerate, meaning that there are multiple optimal solutions with the same objective function value.")
} else if (status == 5) {
  print("The optimization failed due to numerical issues, such as overflow or underflow.")
} else if (status == 6) {
  print("The optimization problem was not solved for some reason.")
} else {
  print("Unknown status code returned.")
}
