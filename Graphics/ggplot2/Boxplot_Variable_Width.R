# library
library(ggplot2)

# create data
names = c(rep("A", 20) , rep("B", 5) , rep("C", 30), rep("D", 100))
value = c( sample(2:5, 20 , replace = T) , sample(4:10, 5 , replace = T), sample(1:7, 30 , replace = T), 
           sample(3:8, 100 , replace = T) )
data = data.frame(names,value)

# prepare a special xlab with the number of obs for each group
my_xlab <- paste(levels(data$names),"\n(N=",table(data$names), ")",sep = "")

# plot
ggplot(data, aes(x = names, y = value, fill = names)) +
  geom_boxplot(varwidth = TRUE, alpha = 0.2) +
  theme(legend.position = "none") +
  scale_x_discrete(labels = my_xlab)


# source : https://www.r-graph-gallery.com/266-ggplot2-boxplot-with-variable-width/