# library
library(ggplot2)

# The mtcars dataset is proposed in R
head(mpg)

# Set a unique color with fill, colour, and alpha
ggplot(mpg, aes(x = class, y = hwy)) + 
  geom_boxplot(color = "red", fill = "orange", alpha = 0.2)

# Set a different color for each group
ggplot(mpg, aes(x = class, y = hwy, fill = class)) + 
  geom_boxplot(alpha = 0.3) +
  theme(legend.position = "none")


# source : https://www.r-graph-gallery.com/264-control-ggplot2-boxplot-colors/