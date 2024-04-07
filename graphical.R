library(gMOIP)

A <- matrix(c(6,4,1,2,-1,1,0,1), ncol = 2, byrow = TRUE)
b <- c(24,6,1,2)
obj <- c(5,4)  # coefficients c

plotPolytope(
  A,
  b,
  obj,
  type = rep("c", ncol(A)),
  crit = "max",
  faces = rep("c", ncol(A)),
  plotFaces = TRUE,
  plotFeasible = TRUE,
  plotOptimum = TRUE,
  labels = "coord",
  argsFaces = list(argsGeom_polygon = list(fill = 'blue'))
)

