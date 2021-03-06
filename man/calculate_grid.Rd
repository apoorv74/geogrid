% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate_grid.R
\name{calculate_grid}
\alias{calculate_grid}
\title{Calculate grid from spatial polygons.}
\usage{
calculate_grid(shape, learning_rate = 0.03, grid_type = c("hexagonal",
  "regular"), seed = NULL, verbose = FALSE)
}
\arguments{
\item{shape}{A "SpatialPolygonsDataFrame" object representing the original spatial polygons.}

\item{learning_rate}{The rate at which the gradient descent finds the optimum cellsize to ensure that your gridded points fit within the outer boundary of the input polygons.}

\item{grid_type}{Either "hexagonal" for a hexagonal grid (default) or "regular" for a regular grid.}

\item{seed}{An optional random seed integer to be used for the grid calculation algorithm.}

\item{verbose}{A logical indicating whether messages should be printed as the algorithm iterates.}
}
\description{
Given an input multipolgyon spatial data frame this function calculates a hexagonal or regular grid that strives to preserve the original geography.
}
\examples{
\dontrun{
input_file <- system.file("extdata", "london_LA.json", package = "geogrid")
original_shapes <- read_polygons(input_file)

# calculate grid
new_cells <- calculate_grid(shape = original_shapes,
  grid_type = "hexagonal", seed = 1)
plot(new_cells)

#
grid_shapes <- assign_polygons(original_shapes, new_cells)
par(mfrow=c(1, 2))
sp::plot(original_shapes)
sp::plot(grid_shapes)

# look at different grids using different seeds
par(mfrow=c(2, 3), mar = c(0, 0, 2, 0))
for (i in 1:6) {
  new_cells <- calculate_grid(shape = original_shapes, grid_type = "hexagonal", seed = i)
  plot(new_cells, main = paste("Seed", i, sep=" "))
}
}
}
