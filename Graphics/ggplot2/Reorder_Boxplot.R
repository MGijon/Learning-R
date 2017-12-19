# library
library(ggplot2)

# The mtcars dataset is proposed in R
head(mpg)

# geom_boxplot proposes several arguments to custom appearance
ggplot(mpg, aes(x = reorder(class, hwy), y = hwy, fill = class)) + 
  geom_boxplot() +
  xlab("class") +
  theme(legend.position = "none")


# source : https://www.r-graph-gallery.com/267-reorder-ggplot2-boxplot/