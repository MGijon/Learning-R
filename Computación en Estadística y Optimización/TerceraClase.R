### =========================================================================================
### En esta clase continuamos con el Test 0 llevado a cabo en la primera clase.
### Exploraremos diferentes formas de abordar algunos de los ejercicios y estudiaremos las 
### funciones que los resuelven.
### =========================================================================================

## Ejercicio 2
## ===========

# Exploramos el data set

state.x77
class(state.x77)      # es una matriz
is.matrix(state.x77)
is.data.frame(state.x77)
?state.x77            # despliega información sobre el dataset
state.region
class(state.region)   # es un factor ('vectores' que además de sus elementos tienen la información 'niveles', los elementos distintos presentes en el 'vector')
head(state.region)    # para obtener los niveles

length(state.x77)     # longitud de la matriz
dim(state.x77)        # dimensiones de la matriz: filas, columnas
ncol(state.x77)       # número de columnas
nrow(state.x77)       # número de filas

str(state.x77)        # imprimimos más información sobre las columnas
attributes(state.x77) # más información sobre las columnas

# 2a
# --

is.data.frame(state.x77)
is.matrix(state.x77)

class(state.x77)      # la mejor opción

# 2b
# --

ncol(state.x77)
dim(state.x77)
str(state.x77)
attributes(state.x77)

# 2c
# --

state77 <- data.frame(state.x77)  # convertimos la matriz en un data.frame
head(state77)                     # todavía no tenemos la variable Region añadida
state77$Region <- state.region    # creamos una nueva columna en el data.set y la llenamos con un...
head(state77)                     # Region ya está incluída en nuestro data.frame
class(state.region)               # ... factor

# podemos hacerlo en un paso
states77 <- data.frame(state.x77, Regio = state.region)  # observemos así que el segunda parámetro de data.frame,
                                                         # un factor, se suma a la matriz para crear un data.frame
                                                         # único


  # --------------------------------

  nombres = c("Jose", "Juan", "Jimena", "Jose", "Juan")
  nombres <- factor(nombres)
  nombres
  matriz <- matrix(1:5, 1, 5)
  matriz
  datos <- data.frame(nombres, matriz)
  datos
  datos <- data.frame(matriz, nombres)
  datos
  # --------------------------------
  
ncol(states77)
length(states77)

dim(states77)                   # filas, columnas
prod(dim(states77))             # número de datos del data.frame = filas x columnas, suponiendo no NA

# 2d
# --

head(states77)
# Para borrar las variables HS.Grad y Frost las seleccionamos y les asignamos el valor NULL
states77$HS.Grad <- NULL
states77$Frost <- NULL
head(states77)

# También podíamos habernos quedado con un subconjunto del data.drame original
state77 <- data.frame(state.x77)  # data.set restaurado
head(state77)
states77 <- subset(states77, select = -c(HS.Grad, Frost))
head(state77)

# 2e
# --

# inducaciones del ejercicio:
names(states77) <- substr(tolower(names(states77)), 1, 4)
names(states77)

  # estas funciones vienen indicadas, analizemos que hace cada una de ellas:
  names(datos)               # devuelve los nombres de las columnas en el data.set...
  class(names(datos))        # ... lo hace en forma de character
  
  tolower("HOLA")            # tolower : devuelve la cadena que le pasemos en minúsculas
  substr("Hola Mundo", 1, 3) # substr : devuelve una subcadena de la que le pasemos
                             # Parámetros :
                             #          chain : cadena 
                             #          first : posición del primer carácter a retornar
                             #          last : posición del último carácter a retornar

# --
states77["Alabama", "life"] <- NA
states77["Wyoming", "life"] <- NA

# 2f
# --

# 3 ejecuciones de código
cor(states77$inco, states77$illi)
cor(states77$inco, states77$life, use = "complete.obs")
cor(states77$life, states77$illi, use = "c")

# Much better: aún no sé por qué
cor(states77[, c("inco", "illi", "life")], use = "complete.obs")
# Otra opción cuya conveniencia sobre la inicial no acabo de explicarme...
round(cor(states77[, c("inco", "illi", "life")], use = "pairwise.complete.obs"), 3)


# 2g
# --
