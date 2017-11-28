# Library
library(leaflet)

# Background 1: NASA
m = leaflet() %>% addTiles() %>% setView( lng = 2.34, lat = 48.85, zoom = 5 ) %>% addProviderTiles("NASAGIBS.ViirsEarthAtNight2012")
m

# Background 2: World Imagery
m = leaflet() %>% addTiles() %>% setView( lng = 2.34, lat = 48.85, zoom = 3 ) %>% addProviderTiles("Esri.WorldImagery")
m


# source : https://www.r-graph-gallery.com/180-change-background-in-leaflet-map/