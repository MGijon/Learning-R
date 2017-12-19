# library
library(ggplot2)

# The mtcars dataset is proposed in R
head(mpg)

# geom_boxplot proposes several arguments to custom appearance
ggplot(mpg, aes(x = class, y = hwy)) + geom_boxplot(
    
    # custom boxes
    color = "blue",
    fill = "blue",
    alpha = 0.2,
    
    # Notch?
    notch = TRUE,
    notchwidth = 0.8,
    
    # custom outliers
    outlier.colour = "red",
    outlier.fill = "red",
    outlier.size = 3
    
  )


# source : https://www.r-graph-gallery.com/263-ggplot2-boxplot-parameters/