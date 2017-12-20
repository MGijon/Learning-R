# Ggplot2 library
library(ggplot2)

# Data 
names = c(rep("A", 80) , rep("B", 50) , rep("C", 70))
value = c( sample(2:5, 80 , replace = T) , sample(4:10, 50 , replace = T), 
         sample(1:7, 70 , replace = T) )
data = data.frame(names,value)

#Graph
qplot( x = names , y = value , data = data , geom = c("boxplot","jitter") , fill = names)


# source : http://www.r-graph-gallery.com/89-box-and-scatter-plot-with-ggplot2/