### ========================================================
### ComputaciÛn en EstadÌstica y en OptimizaciÛn, 26.10.2017
### Group A, R Lecture 10: Writing your own functions
### ========================================================

load("Immunology.RData")
library(Hmisc)

## Escribimos nuevas funciones utilizando la función 'function'
## ============================================================

varML <- function(x)
{
  stopifnot(is.numeric(x))
  
  # calculamos la varianza sin considerer los missings
  val <- var(x, na.rm = TRUE) 
  # a partir de este calculamos el estimador de mácima verosimilitud de la varianza
  n <- sum(complete.cases(x)) # sumando los casos concretos no tendremos en cuenta los missisgs
  val <- val * (n - 1) / n
  # val <<- val * (n - 1) / n   # hará que se devuelvan también las nuevas variables al espacio de trabajo
  return(val)
}

var(immuno$age)           # 7.944138
varML(immuno$age)         # 7.85587
# veamos como detecta errores no numéricos:
varML(immuno$group)       # Error: is.numeric(x) is not TRUE 


## Some functions that (should) return more than one result
## ========================================================

file.show("Funciones vars.R")    # mostramos en una nueva ventana el contenido del archivo
source("Funciones vars.R")       # obtenemos funciones (y objetos?) contenidos en el archivo
vars1(immuno$age)
vars2(immuno$age)
vars3(immuno$age)
vars4(immuno$age)


## A function that draws several figures given a numeric vector
## ============================================================

file.show("Función fourGraphs.R")
source("Función fourGraphs.R")

x <- rnorm(1000)
y <- rchisq(1000, 5)
fourGraphs(x)
fourGraphs(x, "tomato", 3)
fourGraphs(y, lwi = 5)

fourGraphs(immuno$group)   # Error in fourGraphs(immuno$group) : The argument must be a numeric vector

fourGraphs(y, lwi = 5, font.lab = 4, font.axis = 2)
graphics.off()

