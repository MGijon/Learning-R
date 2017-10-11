### =========================================================================================
### Importar datos de un archivo SPSS
### =========================================================================================

# OBS: cmd + click sobre una función abre datos sobre ella !!!!!!!!

#install.packages("Hmisc")
library(Hmisc) 

getwd() # solo funciona si la carpera donde están los datos se encuentra en el actual directorio de trabajo
"Immunology.sav" %in% dir("Datasets_4")   # retorna TRUE, luego la carpeta está en el directorio y podemos continuar

# Obtenemos los datos:
immuno <- spss.get("Datasets_4/Immunology.sav", datevars = c("datbirth", "datvisit1", "datvisit2", "datvisit3"))

# datevars : vector of variable names containing dates to be converted to R internal format

str(immuno)
head(immuno)
summary(immuno)
Label(immuno)
class(immuno)             # "data.frame"

# Manipulando el data.frame

class(immuno$vol)
immuno$vol <- as.factor(immuno$vol)
class(immuno$vol)

class(immuno$group)
immuno$group <- factor(immuno$group)
class(immuno$group)

# Observemos de nuevo el data.frame con summary, veros máximos desorbitados con valores de 9999, estos
# se corresponden con datos perdidos, los convertiremos en NA y volveremso a explorar con summary.

summary(immuno)
immuno[immuno == 9999] <- NA

# otra alternativa:
is.na(immuno) <- immuno == 9999

# ahora utilizaremos la función units del paquete Hmisc para almacenar ciertos valores numéricos

for (i in 8:19){
  units(immuno[, i]) = "Cells per microliter"
}

rm(i) # sirve para remover objetos del entorno de trabajo
# https://stat.ethz.ch/R-manual/R-devel/library/base/html/rm.html
describe(immuno) # imprime una descripción del data set

# -------------
variables = c("x1", "x2")
nombres = c("A", "B")
dat <- data.frame(nombres, variables)
dat
head(dat)
summary(dat)
describe(dat)
Label(dat)
# -------------

### =========================================================================================
### Importar datos de un archivo EXCEL
### =========================================================================================

