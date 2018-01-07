## Ordenar un data set:
## ===================

# Cargamos los datos primero:
videogames <- read.csv('vgsales.csv')
summary(videogames)
str(videogames)
head(videogames)

# Order the data by, for example, by Platform
# by default, sorting is ascending
videogames <- videogames[order(videogames$Platform),]
head(videogames)

# we can sort descending this way
videogames <- videogames[order(-videogames$Global_Sales),]
head(videogames)

# we can sort by two or more variables, for example
videogames <- videogames[order(-videogames$EU_Sales, videogames$Global_Sales),]
head(videogames)
# =====================================================================