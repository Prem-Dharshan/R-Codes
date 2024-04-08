# Define coordinates of the vertices of the polygon
x <- c(1, 2, 4, 3)
y <- c(1, 3, 4, 2)

# Plot the polygon
plot(x, y, type = "n", xlim = c(0, 5), ylim = c(0, 5), xlab = "x", ylab = "y") # Create empty plot
polygon(x, y, col = "skyblue") # Draw the polygon with filled color
