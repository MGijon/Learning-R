# library
library(ggplot2)

# create a data frame
variety = rep(LETTERS[1:7], each=40)
treatment = rep(c("high","low"),each = 20)
note = seq(1:280) + sample(1:150, 280, replace = T)
data = data.frame(variety, treatment ,  note)

# One box per treatment
ggplot(data, aes(x = variety, y = note, fill = treatment)) + 
  geom_boxplot() +
  facet_wrap(~treatment)
# one box per variety
ggplot(data, aes(x = variety, y = note, fill = treatment)) + 
  geom_boxplot() +
  facet_wrap(~variety, scale = "free")


# source : https://www.r-graph-gallery.com/265-grouped-boxplot-with-ggplot2/