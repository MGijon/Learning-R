# library
library(ggplot2)

# The mtcars dataset is proposed in R
head(mpg)

# plot
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_boxplot(fill = "skyblue", aes(group = cut_width(carat, 0.5)))



# source : https://www.r-graph-gallery.com/268-ggplot2-boxplot-from-continuous-variable/