# Library
library(leaflet)

# Create 20 markers (Random points)
data = data.frame(long = sample(seq(-150,150),20) , 
                  lat = sample(seq(-50,50),20) ,
                  val = round(rnorm(20),2) ,
                  name = paste("point", letters[1:20], sep = "_")  ) 

# Show a circle at each position
m = leaflet(data = data) %>% addTiles() %>% addCircleMarkers(~long, ~lat , popup = ~as.character(name))
m


# source : https://www.r-graph-gallery.com/182-add-circles-rectangles-on-leaflet-map/