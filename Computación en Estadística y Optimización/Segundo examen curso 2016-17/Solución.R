#######################
##    EJERCICIO 1    ##
#######################

# Las variables contenidas en el data frame immulog se corresponden con un en estudio longitudinal sobre
# el consumo regular del éxtasis y la medición de los siguientes factores en tres momentos repartidos en 
# el tiempo, son las siguientes:
#
# vol       :   Volunteer ID
# group     :   Study group (Extasis, Cannabis, or Control)
# sex       :   Gender
# age       :   Age 
# visit     :   Visit (First, second or third)
# datvisit  :   Date of visit 
# lympho    :   Lymphocyte count (in cells per microliter) 
# cd4       :   CD4 cell count (in cells per micholiter)
# cd8       :   CD8 cell count (in cells per microliter)
# nkiller   :   Natural Killer cell count (in cells per microliter)


# (a) En la primera visita, ¿cuántos voluntarios tuvieron un número e linfocitos superiores a 2000 por microlitro?
# --- 

load("Datos.RData")     
dim(immulong)
# [1] 270  10

sum(subset(immulong, visit == 1)$lympho > 2000, na.rm = TRUE)
# [1] 23

# Alternativa más eficiente:
immuv1 <- subset(immulong, visit == 1, select = -visit)



# (b) ¿Cuáles son los rangos (máximo y mínimo) de las variables numéricas de immuv1?
# ---

sapply(immuv1[sapply(immuv1, is.numeric)], range, na.rm = TRUE)
#      age lympho      cd4     cd8 nkiller
# [1,]  18   1432  552.750 310.078  11.046
# [2,]  31   2306 1163.694 929.526 509.525



# (c) Presentad una tabla con las frecuencias absolutas de los distintos tipos de variables (numeric, factor, character, etc) de immuv1
# ---

table(sapply(immuv1, class))
# character      Date    factor   numeric 
#         1         1         2         5 



# (d) Creamos una nueva variable NAsLympho del data frame immulong que indique para cada voluntario cuantos missings tiene la variable lympho
# ---

library(plyr)
immulong <- ddply(immulong, ~vol, transform, NAsLympho = sum(is.na(lympho)))
head(immulong, 3)
#   vol   group  sex age visit   datvisit lympho     cd4     cd8 nkiller NAsLympho
# 1   1 Extasis Male  26     1 2000-10-26     NA 745.010 583.530  60.555         2
# 2   1 Extasis Male  26     2 2001-05-10     NA 690.475 548.422  43.728         2
# 3   1 Extasis Male  26     3 2001-11-02   1775 672.725      NA  40.825         2

# Alternativa que no requiere el uso de un paquete contribuído
immulong$NAsLympho <- with(immulong, ave(lympho, vol, FUN = function(x) sum(is.na(x))))
head(immulong, 3)
#   vol   group  sex age visit   datvisit lympho     cd4     cd8 nkiller NAsLympho
# 1   1 Extasis Male  26     1 2000-10-26     NA 745.010 583.530  60.555         2
# 2   1 Extasis Male  26     2 2001-05-10     NA 690.475 548.422  43.728         2
# 3   1 Extasis Male  26     3 2001-11-02   1775 672.725      NA  40.825         2

table(subset(immulong, visit == 1)$NAsLympho)
#  0  1  2 
# 78  9  3 



#######################
##    EJERCICIO 2    ##
#######################

# Reproducir el gráfico "Figura1.png", que muestra la relación entre los números de células CD4 y de células 
# NK al inicio del estudio y que además identifica alguno de los voluntarios

maxims <- subset(immuv1, cd4 >= sort(cd4, decreasing = TRUE)[2] | nkiller >= sort(nkiller, decreasing = TRUE)[2]) 
par(las = 1, font.lab = 4, font.axis = 2, cex.axis = 1, cex.lab = 1.1, font = 2)
plot(nkiller ~cd4, immuv1, pch = 16, xlab = "CD4 cell count", ylab = "Natural killer cell count", cex = 1.2)
title("Natural Killer Cells vs. CD4 Cells")
with(maxims, text(cd4, nkiller, paste("Vol", vol), pos = 1))

rm(maxims)



#######################
##    EJERCICIO 3    ##
#######################

# Al importar datos desde SPSS es posible que las variables categóricas presenten valores con espacio en blanco al final
# Esto ocurre cuando la variable original en el fichero de SPSS es una variable tipo cadena como en caso de la variable State
# del fichero StatesWithoutWest.sav, que contiene un subconjunto de datos de la matriz state.x77 de R. Además, como se puede
# ver a continuación, la variable Region, que es un factor, guarda la categoría West del fichero original a pesar de que entre
# los estados de StatesWithoutWest.sav no hay ninguno de esta región:

library(Hmisc)
states <- spss.get("StatesWithoutWest.sav")
summary(states)

levels(states$State)[1:4]



# Programad una función que importe un fichero de SPSS de tal manera que los factores del data frame resultante no tengan
# niveles (levels) sin observaciones y que los niveles no tengan espacios en blanco al inicio o al final. Aplicad la función
# al fichero StatesWithoutWest.sav


mySpssGet <- function(file, ...) {
  require(Hmisc)
  require(stringr)
  
  dfram <- suppressWarnings(spss.get(file, ...))
  fax <- which(sapply(dfram, is.factor))
  for (i in fax){
    dfram[, i] <- factor(str_trim(dfram[, i]))
  }
  return(dfram)
  }

states <- mySpssGet("StatesWithoutWest.sav")
summary(states)

levels(states$State)[1:4]
