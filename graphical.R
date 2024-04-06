# Define constraints and feasible region
cons.1 <- function(x) 6 - x  
cons.2 <- function(x) 5 - 0.5*x
feasible_region <- data.frame(x = c(0, 4, 4, 2, 0), y = c(0, 0, 2, 4, 5))

# Define objective function
objective_function <- function(x) -0.8*x + 2

# Import ggplot2 package
library(ggplot2)

# Build plot
p <- ggplot() +
  
  # Add constraints lines
  stat_function(fun = cons.1, aes(color = "Constraint 1")) +
  stat_function(fun = cons.2, aes(color = "Constraint 2")) +
  
  # Add feasible region
  geom_polygon(data = feasible_region, aes(x = x, y = y), fill = "#dddddd", color = "black") +
  
  # Define labels
  labs(title = "Optimization Problem",
       subtitle = "Graphical Method",
       x = "x1",
       y = "x2") +
  
  # Set axes limits
  xlim(0, 10) +
  ylim(0, 10) +
  
  # Add black and white theme
  theme_bw()

# Add objective function to plot
p <- p + stat_function(fun = objective_function, aes(color = "Objective Function"), linetype = "dashed")

# Highlight optimum solution in plot
optimal_solution <- c(4, 2)
p <- p + geom_point(aes(x = optimal_solution[1], y = optimal_solution[2]), color = "red", size = 4)

# Print plot
print(p)
