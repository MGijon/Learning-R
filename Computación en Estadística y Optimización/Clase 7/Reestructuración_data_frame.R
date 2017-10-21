### ====================================================================
### Reestructurando un data.frame   (17-10-2017)
### ====================================================================

load("Immunology.RData")
library(Hmisc)

## Cambiaremos la forma de los datos del formato ancho al largo:
## =============================================================

class(immuno) # data.frame
head(immuno)
View(immuno)  # visualizamos su estado antes de la reordenación 


head(reshape(immuno, direction = "long", idvar = "vol", varying = list(5:7, 8:10, 11:13, 14:16, 17:19)), 10)
tail(reshape(immuno, direction = "long", idvar = "vol", varying = list(5:7, 8:10, 11:13, 14:16, 17:19)), 10)
dim(reshape(immuno, direction = "long", idvar = "vol", varying = list(5:7, 8:10, 11:13, 14:16, 17:19)))

immulong <- reshape(immuno, direction = "long", idvar = "vol", varying = list(5:7, 8:10, 11:13, 14:16, 17:19),
                    v.names = c("datvisit", "lympho", "cd4", "cd8", "nkiller"), timevar = "visit", drop = "datbirth")
# idvar : variable identificadora
head(immuno)
View(immulong)

## Ya hemos hecho el cambio, lo siguinete es una nueva (opcional) ordenación de los datos
## Podemos ordenar los datos de acuerdo al identificador del voluntario y a la visita
#  i) Usando la función order
immulong <- with(immulong, immulong[order(vol, visit), ])

#  ii) Usando la función orderBy(doBy)
library(doBy)
immulong <- orderBy(~vol + visit, immulong)

head(immulong, 10)
str(immulong)
summary(immulong)


##  Opcional: Etiquetas, unidades, ... -> Necesitamos el paquete Hmisc
## ==================================================================≠

#   COMENTARIO:
#   -----------
#   Hmisc::Label(immulong)
#   Esta sentencia nos permite hacer unos de una función sin cargar el paquete completo.
#   Puede ser útil si queremos utilizar una función cuyo nombre ya está en un paquete precargado
#   ---------------------------------------------------------------------------------------------


Label(immulong)
label(immulong$group)    <- "Study group"
label(immulong$sex)      <- "Sex"
label(immulong$visit)    <- "Number of visit"
label(immulong$datvisit) <- "Date of visit"
label(immulong$lympho)   <- "Lymphocytes"
label(immulong$cd4)      <- "CD4 cells"
label(immulong$cd8)      <- "CD8 cells"
label(immulong$nkiller)  <- "Natural killer cells"
describe(immulong)

head(immulong)

## Para un vector de fechas calculamos el tiempo en día entre valores consecutivos
diff(immulong$datvisit)

## Ejemplo:
## Creamos dos variables:
##   a) vis2vis: Para cada voluntario, tiempo en días entre las visitas
##   b) totime: Para cada voluntario, días desde la primera visita
## ===================================================================

diff(immulong$datvisit) # Para un vector de fechas calculamos el tiempo en día entre valores consecutivos
c(0, diff(immulong$datvisit))  # Podríamos usar esto, bucles y demás...
# Pero hay una solución mejor 
library(plyr)
immulong <- ddply(immulong, ~vol, transform, vis2vis = c(0, diff(datvisit)))
immulong <- ddply(immulong, ~vol, transform, totime = cumsum(vis2vis))
head(immulong, 12)

## Añadimos un comentario al data.frame ordenado en formato largo y salvamos el espacio de trabajo
## ===============================================================================================
comment(immulong) <- "Same data as data frame immuno in long format"
save(immuno, immulong, file = "Immunology.RData")


