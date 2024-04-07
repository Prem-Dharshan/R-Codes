library(gMOIP)

constraint_coefficients <- matrix(c(6,4,1,2,-1,1,0,1), ncol = 2, byrow = TRUE)
rhs <- c(24,6,1,2)
obj <- c(5,4) 

plotPolytope(
  constraint_coefficients,
  rhs,
  obj,
  type = rep("c", ncol(constraint_coefficients)),
  crit = "max",
  faces = rep("c", ncol(constraint_coefficients)),
  plotFaces = TRUE,
  plotFeasible = TRUE,
  plotOptimum = TRUE,
  labels = "coord",
  argsFaces = list(argsGeom_polygon = list(fill = 'blue'))
)

