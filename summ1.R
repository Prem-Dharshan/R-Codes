library(lpSolve)
library(ggplot2)

constraint_coefficients <- matrix(c(1,-2,1,0,0,1), ncol = 2, byrow = TRUE)
lp_result <- lp("max", c(3,5), constraint_coefficients, c("<=","<=",">="), c(6,10,1))

status <- lp_result$status

# Function to plot the feasible region
plot_feasible_region <- function(obj, mat, dir, rhs, ans) {
  x_vals <- seq(0, 10, by = 0.01)
  y_vals <- seq(0, 10, by = 0.01)
  df <- expand.grid(x = x_vals, y = y_vals)
  df$feasible <- TRUE
  
  for (i in seq_len(nrow(mat))) {
    if (dir[i] == "<=") {
      df$feasible <- df$feasible & (mat[i, 1] * df$x + mat[i, 2] * df$y <= rhs[i])
    } else { 
      df$feasible <- df$feasible & (mat[i, 1] * df$x + mat[i, 2] * df$y >= rhs[i])
    }
  }
  
  t <- ggplot(df, aes(x, y)) +
    geom_tile(aes(fill = df$feasible), color = "#ffffff") +
    geom_point(aes(x = ans[1], y = ans[2]), color = "#FF0000", size = 3) +
    labs(
      title = "Feasible Region for LP Problem",
      x = "x", y = "y"
    ) +
    theme_minimal()
  
  for (i in seq_len(nrow(mat))) {
    t <- t +
      stat_function(
        fun = function(x, m, b) {
          m * x + b
        },
        args = list(
          m = -mat[i, 1] / mat[i, 2],
          b = rhs[i] / mat[i, 2]
        ),
      )
  }
  t <- t + coord_cartesian(ylim = c(0, 10), xlim = c(0,10))
  
  return(t)
}

# Plot unbounded region if LP problem is unbounded
if (status == 3) {
  cat("The optimization problem is unbounded, meaning that the objective function can be improved indefinitely without violating any constraints.\n")
  t <- plot_feasible_region(c(3, 5), constraint_coefficients, c("<=", "<=", ">="), c(6, 10, 1), lp_result$solution)
  print(t)
} else {
  cat("The optimization problem is not unbounded.\n")
}
