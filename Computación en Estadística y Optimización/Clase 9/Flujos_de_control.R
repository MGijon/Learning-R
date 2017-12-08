### ========================================================
### ComputaciÛn en EstadÌstica y en OptimizaciÛn, 24.10.2017
### Group A, R Lecture 9: Control flow (Part 2)
### ========================================================
load("Immunology.RData")

## Funciones while, repeat and break
## =================================

# Ejemplo 1
# ---------
set.seed(112)
repeat {
  x <- rpois(3, 50)
  print(x)
  if (any(duplicated(x)))
    break
}
rm(x)

set.seed(112)
x <- rpois(3, 50)
while (!any(duplicated(x))) {
  print(x)
  x <- rpois(3, 50)
}
rm(x)

# Ejemplo 2
# ---------
x <- 1:10
i <- 1
while (x[i]^2 < 40) {
  cat("The value of x[", i, "] is ", x[i], " and its square number is ",
      x[i]^2, ".\n", sep = "")
  i = i + 1
}
rm(i, x)


x <- 1:10
for (i in 1:length(x)) {
  if (x[i]^2 >= 40)
    break
  cat("The value of x[", i, "] is ", x[i], " and its square number is ",
      x[i]^2, ".\n", sep = "")
}
rm(i, x)

# Ejemplo 3
# ---------
now <- as.POSIXlt(Sys.time())
print(now)
while (Sys.time() < now + 8) {
  cat("\r", format(Sys.time(), "%H:%M:%S"))
  flush.console()
}
rm(now)

now <- as.POSIXlt(Sys.time())
print(now)
repeat {
  if (Sys.time() >= now + 8)
    break
  cat("\r", format(Sys.time(), "%H:%M:%S"))
  flush.console()
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

## Usando un bucle for:
lista <- vector("list", 10)
for (i in 1:10) {
  lista[[i]] <- (i * 4 - 3):(i * 4)
}
rm(i)
lista

# install.packages("foreach")
library(foreach)
lista2 <- foreach (i = 1:10) %do% (i * 4 - 3):(i * 4)
rm(i)

# son las dos listas iguales?
identical(lista, lista2)


## ======================
## Más de los bubles for
## ======================

## The computational cost of a for loop can be high
## ================================================
x <- rnorm(75000)
y <- rnorm(75000)

# Mal hábito
# ----------
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


# And the winner is (not really a surprise):
system.time(z <- x + y)


## A progress bar may be useful when executing a for-loop
## Fuente: http://ryouready.wordpress.com/2009/03/16/r-monitor-function-progress-with-a-progress-bar/
## ==================================================================================================
x <- rnorm(75000)
y <- rnorm(75000)
z <- NULL
total <- length(x)
pb <- winProgressBar(title = "Progress bar", min = 0, max = total, width = 300)

for (i in 1:total) {
  z <- c(z, x[i] + y[i])
  setWinProgressBar(pb, i, title = paste(round(i/total*100, 0), "% done"))
}
close(pb)
rm(i, total)


## Functions try and tryCatch
## ==========================
## Consider the following for-loop
myList <- list(24, 111, -23, NA, "NoNumber", 19, 91)
for (i in myList) {
  cat("The square root of", i, "is", round(sqrt(i), 3), "\n")
}

# Use of function try avoids the abort of the loop
for (i in myList) {
  suppressWarnings(try(cat("The square root of", i, "is", round(sqrt(i), 3), "\n"),
                       silent = TRUE))
}

rm(i, myList)

# See http://www.win-vector.com/blog/2012/10/error-handling-in-r/
# for examples for function tryCatch, which permits to define
# your own warning and error messages


## Performance comparison: package microbenchmark
## ==============================================
# install.packages("microbenchmark")
library(microbenchmark)

# Example 1
# ---------
x <- rnorm(1000)
y <- rnorm(1000)
z <- numeric(1000)

microbenchmark(x + y,
               for (i in 1:1000) {
                 z[i] <- x[i] + y[i]
               },
               unit = "ms")

# Example 2
# ---------
library(doBy)
library(plyr)
mx <- microbenchmark(with(immulong, immulong[order(-vol, visit), ]),
                     orderBy(~ -vol + visit, immulong),
                     arrange(immulong, desc(vol), visit))
mx

# Graphical representation
library(ggplot2)
boxplot(mx, log = FALSE, ylab = "Microseconds", col = 3:4)
autoplot(mx)


# Example 3
# ---------
set.seed(222)
city <- sample(c("BCN", "GIR", "LLE", "TAR"), 1000, replace = TRUE)
cityf <- factor(city)

mc <- microbenchmark(sum(city %in% c("GIR", "TAR")),
                     sum(city == "GIR" | city == "TAR"),
                     sum(cityf %in% c("GIR", "TAR")),
                     sum(cityf == "GIR" | city == "TAR"))
mc


# Example 4
# ---------
x <- 9
y <- 11
mc <- microbenchmark(x < 10 | y < 10,
                     x < 10 || y < 10,
                     x > 10 & y > 10,
                     x > 10 && y > 10)
mc

## See also: http://adv-r.had.co.nz/Performance.html


## Functions sapply and lapply
## ===========================
sapply(immuno, summary)
sapply(immuno[8:19], mean)
sapply(immuno[8:19], mean, na.rm = TRUE)
lapply(immuno[8:19], mean, na.rm = TRUE)
sapply(immuno[8:19],
       function(x) round(sd(x, na.rm = TRUE)/mean(x, na.rm = TRUE), 3))
sapply(immuno[sapply(immuno, is.numeric)], mean, na.rm = TRUE)


## Exercise 3:
## Create 10 vectores of length 15, x1 to x10, with random values of a normal
## distribution with mu = 10 and sigma = 2.
## --------------------------------------------------------------------------

set.seed(2410)

for (i in 1:10) {
  assign(paste0("x", i), rnorm(15, 10, 2))
}

ls(pattern = "x") # imprimimos las variables que contienen la 'x' en su nombre



## Ejercicio 4:
## Dados 10 vectores numéricos x1, x2, ..., x10, imprimir un 
## sumario de cada una por la consola de R.
## ----------------------------------------------------------

# Utilizar un bucle como el anterior no nos da la información que buscaba
for (i in 1:10) {
  print(summary(paste0("x", i)))
}

# Necesitaremos hacer uso de una nueva función, get
for (i in 1:10) {
  print(summary(get(paste0("x", i))))
}

# cómo borraríamos los elementos que contengan una 'x'?
ls()
rm(list = ls(pattern = 'x'))   # el problema es que esto eliminría también elementos llamados 'extra', por ejemplo
ls()

   # genero de nuevo los vectores:

for (i in 1:10) {
  assign(paste0("x", i), rnorm(15, 10, 2))
}
ls(pattern = "x") # comprobamos que se han generado...
# ahora eliminamos solo los vectores deseados:
for (i in 1:10){
  rm(list = paste0('x', i))
}
ls(pattern = "x") # comprobamos que se han borrado...


## Ejercicio 5:
## (a) Read the data of datos1.txt, datos2.txt, and datos3.txt
## and store them in a list. 
## -----------------------------------------------------------

# importamos los datos y en formato de una lista, como nos pedía el ejercio
datalist <- lapply(paste0("datos", 1:3, ".txt"),read.table, header = TRUE)

## (b) Following, create a single data
## frame with the data of the three files.
## ---------------------------------------

do.call(rbind(datalist))

