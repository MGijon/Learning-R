# library
library(ggplot2)

# The mtcars dataset is proposed in R
head(mtcars)

# A really basic boxplot.
ggplot(mtcars, aes(x = as.factor(cyl), y = mpg)) + 
  geom_boxplot(fill = "slateblue", alpha = 0.2) + 
  xlab("cyl")

# source : https://www.r-graph-gallery.com/262-basic-boxplot-with-ggplot2/