# Library
#install.packages('leaflet')
library(leaflet)

# We always initiate a leaflet map with the leaflet() function
m = leaflet()
# Then we Add default OpenStreetMap map tiles
m = addTiles(m)
m

# Same stuff but using the %>% operator
m = leaflet() %>% addTiles()
m


# source : https://www.r-graph-gallery.com/179-show-a-map-with-leaflet-r/