# Library
library(leaflet)

# We always initiate a leaflet map with the leaflet() function
m = leaflet()
# Then we Add default OpenStreetMap map tiles
m = addTiles(m)
# We can choose a zone:
m = setView(m, lng = 166.45, lat = -21, zoom = 7)
m

# Same stuff but using the %>% operator
m = leaflet() %>% addTiles() %>% setView( lng = 166.45, lat = -22.25, zoom = 8 )
m


# source : https://www.r-graph-gallery.com/179-2-select-a-zone-in-leaflet-map/