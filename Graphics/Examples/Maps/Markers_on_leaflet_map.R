# Library
library(leaflet)

# Create 10 markers (Random points)
data = data.frame(long = sample(seq(-150,150),10) ,  lat = sample(seq(-50,50),10) , val = round(rnorm(10),2) , name = paste("point",letters[1:10],sep="_")  ) 

# Show a marker at each position
m = leaflet(data = data) %>% addTiles() %>% addMarkers(~long, ~lat, popup = ~as.character(name))
m


# source : https://www.r-graph-gallery.com/181-add-markers-on-leaflet-map/