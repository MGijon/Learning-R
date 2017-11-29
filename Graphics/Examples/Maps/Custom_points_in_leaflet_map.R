##
## Measure in pixels
## =================

# Library
library(leaflet)

# Create 20 markers (Random points)
data = data.frame(long = sample(seq(-150,150),20) ,
                  lat = sample(seq(-50,50),20) ,
                  val = round(rnorm(20),2) ,
                  name = paste("point" , letters[1:20], sep = "_")  ) 

# Show a CUSTOM circle at each position. Size defined in Pixel. Size does not change when you zoom
m = leaflet(data = data) %>% addTiles() %>%  addProviderTiles("Esri.WorldImagery") %>%
  addCircleMarkers(~long, ~lat, 
                   radius = ~val * 14 , 
                   color = ~ifelse(data$val>0 , "red", "orange"),
                   stroke = TRUE, 
                   fillOpacity = 0.2,
                   popup = ~as.character(name)
  ) 
m


##
## Measure in meters
## =================


# Create 20 markers (Random points)
data = data.frame(long = sample(seq(-150,150),20) , 
                  lat = sample(seq(-50,50),20) ,
                  val = round(rnorm(20),2) , 
                  name = paste("point", letters[1:20], sep = "_")  ) 

# Show a CUSTOM circle at each position. Size in meters --> change when you zoom.
m=leaflet(data = data) %>% addTiles()  %>%  addProviderTiles("Esri.WorldImagery") %>%
  addCircles(~long, ~lat, 
             radius = ~val * 1000000 , 
             color = ~ifelse(data$val>0 , "red", "orange"),
             stroke = TRUE, 
             fillOpacity = 0.2,
             popup = ~as.character(name)
  ) %>% 
  setView( lng = 166.45, lat = 21, zoom = 2)
m



# source : https://www.r-graph-gallery.com/182-add-circles-rectangles-on-leaflet-map/
