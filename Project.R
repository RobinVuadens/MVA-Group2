library(tidyverse)
library(vegan)

image.real <- function(mat) { 
  mat <- t(mat)[,nrow(mat):1]
  image(mat, axes = FALSE, col = hcl.colors(15, palette="viridis"))
  axis(1, at = seq(0, 1, length = nrow(mat)), labels = rownames(mat), las=2)
  axis(2, at = seq(0, 1, length = ncol(mat)), labels = colnames(mat))
  box() 
}

species = read_excel("/Users/robin/Desktop/EPFL/MA1/Multivariate statistics/Dataset/Species_data_final.xlsx")
env = read_excel("/Users/robin/Desktop/EPFL/MA1/Multivariate statistics/Dataset/Environmental_variables.xlsx")

dist <- vegdist(species[, 2:374])
image.real(as.matrix(dist))