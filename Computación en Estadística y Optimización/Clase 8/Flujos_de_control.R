### ========================================================
### FLujos de control 19.10.2017
### ========================================================

library(Hmisc)
load("Immunology.RData")

## Bucles for
## ===========

# Ejemplo 1
# ---------

for (i in c(1, 4, 9, 10)) {
  print("Hello!")
  cat("The square root of ", i, " is ", round(sqrt(i), 3), ".\n", sep = "")
}
rm(i)


# Ejemplo 2
# ---------

names(immuno)
# Queremos los boxpots sobre los datos en las posiciones 8, 11, 14 y 17
pdf("SomeBoxplots.pdf") # creamos una conexión con un fichero, al no existir se creará

par(las = 1, font.axis = 2, font.lab = 4)

for (i in c(8, 11, 14, 17)) {
  boxplot(immuno[, i] ~ group, immuno, ylab = units(immuno[, i]),
          main = label(immuno[, i]), col = 2:4, pch = 16)
}

dev.off() # cerramos la conexión con el fichero
rm(i) 


## Ejercicio 1:
## Crear un pdf por cada uno de los 4 anteriores.
## El nombre de cada uno de ellos debe ser VARIABLENAME.pdf
## --------------------------------------------------------------

for (i in c(8, 11, 14, 17)) {
  pdf(paste(names(immuno)[i], ".pdf", sep = "")) # conectamos (y creamos) el pdf que contendrá el gráfico al comienzo del mismo
  boxplot(immuno[, i] ~ group, immuno, ylab = units(immuno[, i]),
          main = label(names(immuno)[i]), col = 2:4, pch = 16)
  dev.off() # cerramos la conexión con el fichero recién creado
}

# Ejemplo 3:
# La correlación entre el número de células CD4 y NK en cada grupo de estudio.
# ----------------------------------------------------------------------------

for (l in levels(immuno$group)) {
  cat("\nStudy group:", l, fill = TRUE)
  corr <- with(subset(immuno, group == l), cor.test(cd4v1, nkiller1))
  cat("Correlation (Pearson): ", round(corr$est, 3), ".",
      sep = "", fill = TRUE)
}
rm(l)


## Bucle if-else 
## =============

set.seed(1010)

(x <- round(rnorm(10, 0, 2), 4))
for (i in 1:length(x)) {
  if (x[i] > 0) {
    cat("The square root of", round(x[i], 3), "is", round(sqrt(x[i]), 3), "\n")
  } else {
    cat("Warning:", x[i], "is a negative number.\n")
  }
}
rm(i, x)


## Function ifelse can help para evitar bucles if-else
## ===================================================

(x <- rbinom(10, 1, .5))
gend <- ifelse(x == 0, "Female", "Male")    # si x = 0 devuelve "Female", si no "Male"
gend

# En este caso no necesitaríamos nada de esto, con convertir los datos a factar vasta
gen2 <- factor(x, labels = c("Female", "Male")) 
gen2

# Un segundo ejemplo: if-else anidados !!

(x <- rpois(30, 35))
factor(ifelse(x < 30, "Joven", ifelse(x < 40, "No tan joven", "Un poco mayor")))

# Con el mismo propósito, ver también las funciones cut, cut2(Hmisc), recode (memisc), etc.


## Funciónes repeat y break
## ========================

repeat {
  x <- rpois(3, 35)
  print(x)
  if (any(duplicated(x)))  # si se repite alguno de los valores paramos
    break
}
rm(x)


## Bucle while
## ===========

# Ejemplo 1
# ---------

x <- 1:10
i <- 1
while (x[i]^2 < 40) {
  cat("The value of x[", i, "] is ", x[i], " and its square number is ",
      x[i]^2, ".\n", sep = "")
  i = i + 1
}
rm(i, x)

# Ejemplo 2: aparecerá la hora en pantalla durante 15 segundos
# ---------

now <- as.POSIXlt(Sys.time())
while (Sys.time() < now + 15) {
  cat("\r", format(Sys.time(), "%H:%M:%S"))  # nos escribe la hora en el fotmato correcto
  flush.console() # actualiza la pantalla continuamente
  Sys.sleep(1)
}
rm(now)


## Ejercicio 2:
## Crear la siguiente lista:
## [[1]]
## [1] 1 2 3 4
##
## [[2]]
## [1] 5 6 7 8
## :
## :
## [[10]]
## [1] 37 38 39 40
## --------------------------


# INCLUIR LO QUE FALTA

## =======================
## Más de bucles for-loops
## =======================

## El coste computacional de cada bucle for puede ser alto
## =======================================================

x <- rnorm(75000)
y <- rnorm(75000)

# Mál hábito:
# -----------

z <- NULL
for (i in 1:75000) {
  z <- c(z, x[i] + y[i])
}

# Un poco mejor:
# --------------

z <- numeric(75000)
for (i in 1:75000) {
  z[i] <- x[i] + y[i]
}

# Comparando tiempos:
# -------------------

system.time({
  z <- NULL
  for (i in 1:75000) {
    z <- c(z, x[i] + y[i])
  }
})


system.time({
  z <- numeric(75000)
  for (i in 1:75000) {
    z[i] <- x[i] + y[i]
  }
})


# El mejor es:

system.time(z <- x + y)

## Una barra de progreso puede ser útil cuando ejecutamos un bucle for
## Fuente: http://ryouready.wordpress.com/2009/03/16/r-monitor-function-progress-with-a-progress-bar/
## ==================================================================================================

x <- rnorm(75000)
y <- rnorm(75000)
z <- c()
total <- length(x)
pb <- winProgressBar(title = "Progress bar", min = 0, max = total, width = 300)

for (i in 1:total) {
  z <- c(z, x[i] + y[i])
  setWinProgressBar(pb, i, title = paste(round(i/total*100, 0), "% done"))
}
close(pb)
rm(i, total)


## Funciones try y tryCatch
## ==========================

## Consideremos el siguiente bucle for:

myList <- list(24, 111, -23, NA, "NoNumber", 19, 91)
for (i in myList) {
  cat("The square root of", i, "is", round(sqrt(i), 3), "\n")
}

rm(i, myList)

# http://www.win-vector.com/blog/2012/10/error-handling-in-r/
# for examples for function tryCatch, which permits to define
# your own warning and error messages


## Performance comparison: package microbenchmark
## =============================================

# install.packages("microbenchmark")
library(microbenchmark)

# Ejemplo 1
# ---------

x <- rnorm(10000)
microbenchmark(
  x^2,
  x*x
)

mx <- microbenchmark(
  x^2,
  x*x
)

# Representación gráfica
boxplot(mx, log = FALSE, ylab = "Microseconds", col = 3:4)
library(ggplot2)
autoplot(mx)

# Ejemplo 2
# ---------

x <- rnorm(1000)
y <- rnorm(1000)
z <- numeric(1000)

microbenchmark(
  x + y,
  for (i in 1:1000) {
    z[i] <- x[i] + y[i]
  },
  unit = "ms"
)

# Ejemplo 3
# ---------

library(doBy)
library(plyr)
mx <- microbenchmark(
  with(immulong, immulong[order(-vol, visit), ]),
  orderBy(~-vol + visit, immulong),
  arrange(immulong, desc(vol), visit)
)
mx
autoplot(mx)


# Ejemplo 4
# ---------

set.seed(222)
city <- sample(c("BCN", "GIR", "LLE", "TAR"), 100, replace = TRUE)

mc <- microbenchmark(
  sum(city %in% c("GIR", "TAR")),
  sum(city == "GIR" | city == "TAR")
)
mc

## Ver también: http://adv-r.had.co.nz/Performance.html


## Funciones sapply y lapply
## ===========================

sapply(immuno, summary)
sapply(immuno[8:19], mean)


## Ejercicio 3:
## Crear 10 vectores de longitud 15, x1 a x10, con valoros aleatorios producidos
## por una distibución normal con  mu = 10 y sigma = 2.
## -----------------------------------------------------------------------------

set.seed(2410)
for (i in 1:10){
  assign(paste0("x", i), rnorm(15, 10, 2))
}

x1
x2

x10 # hemos generado 10 vectores x1 a x10 con 15 valores que siguen una distribución normal 
    # con media mu = 10 y varianza sigma = 2

# ===========
# veamos un poco mejor cómo funciona paste0 :
saludo <- 'hola'
espacio <- ' '
receptor <- 'jefe'

Saludo <- paste0(saludo, espacio)
Saludo         # "hola "
Saludo <- paste0(Saludo, receptor)
Saludo         # "hola jefe"

saludo <- 'hola'
espacio <- ' '
receptor <- 'jefe'

Saludo <- paste0(saludo, espacio, receptor)
Saludo         # "hola jefe"
# Acabamos de ver que paste0 se puede utilizar con más de dos cadenas de texto al mismo tiempo
# ===========
# veamos ahora cómo funciona assign
#  TO BE CONTINUED...
# ===========

## Ejercicio 4:
##    of each in the R console.
## ----------------------------


## Ejercicio 5:
## Leer los datos contenidos en datos1.txt, datos2.txt y datos3.txt-
## y almacenarolos en una lista. Después, crear un único data.fame 
## que contenga los datos de los tres ficheros.
## -----------------------------------------------------------------


## ======================
## Enviando mails desde R
## ======================

# install.packages("mail")
library(mail)
sendmail("...@...", subject = "...", message = "This R lecture is ...")

