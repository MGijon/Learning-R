# library
library(igraph)

# data
head(mtcars)

# Make a correlation matrix:
mat = cor(t(mtcars[,c(1,3:6)]))

# Keep only high correlations
mat[mat < 0.995] = 0

# Make an Igraph object from this matrix:
network = graph_from_adjacency_matrix( mat, weighted = T, mode = "undirected", diag = F)

plot(network)


##  Map a color on it and add a few customizations:
## ================================================

# color palette
library(RColorBrewer)
coul = brewer.pal(nlevels(as.factor(mtcars$cyl)), "Set2")
# Map the color to cylinders
my_color = coul[as.numeric(as.factor(mtcars$cyl))]

# plot
par(bg = "grey13", mar = c(0,0,0,0))
set.seed(4)
plot(network, 
     vertex.size = 12,
     vertex.color = my_color, 
     vertex.label.cex = 0.7,
     vertex.label.color = "white",
     vertex.frame.color = "transparent"
)

# title and legend
text(0,0,"The network chart of the mtcars dataset",col = "white")
text(0.2,-0.1," - by the R graph gallery",col = "white")
legend(x = -0.6, y = -0.12, 
       legend = paste( levels(as.factor(mtcars$cyl)), " cylinders", sep = ""),
       col = coul , bty = "n", pch = 20 , pt.cex = 2, cex = 1, text.col = "white" , horiz = T)


# source : https://www.r-graph-gallery.com/250-correlation-network-with-igraph/