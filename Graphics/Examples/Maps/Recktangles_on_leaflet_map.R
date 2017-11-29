# Library
library(leaflet)

# Create 20 markers (Random points)
data = data.frame(long = sample(seq(-150,150),20) ,
                  lat = sample(seq(-50,50),20) ,
                  val = round(rnorm(20),2) ,
                  name = paste("point",letters[1:20],sep = "_")  ) 

# Show a rectangle
m = leaflet() %>% addTiles() %>%  
  addRectangles(
    lng1 = -118.456554, lat1 = 34.078039,
    lng2 = -118.436383, lat2 = 34.062717,
    fillColor = "transparent"
  )
m


# source : https://www.r-graph-gallery.com/182-add-circles-rectangles-on-leaflet-map/