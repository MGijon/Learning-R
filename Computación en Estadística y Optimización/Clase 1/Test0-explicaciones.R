### =================================================================================
### Explicaciones sobre algunas de las funciones implicadas en la solución del test 
### realizado durante la primera clase:
### =================================================================================

## Ejercicio 1
## ===========

set.seed(1609)     # Initialize internal state of the random number generator
  # https://docs.python.org/2/library/random.html
edades <- rpois(20, 40)  # rpois(n, lambda), random generation for the POISSON distribution
                         # with parameter lambda
  # https://stat.ethz.ch/R-manual/R-devel/library/stats/html/Poisson.html
alturas <- round(rnorm(20, 175, 10), 2) # rnorm(n, mean = 0, sd = 1),  random generation for 
                                        # the NORMAL distribution with mean equal to mean and 
                                        # standard deviation equal to sd.
  # https://stat.ethz.ch/R-manual/R-devel/library/stats/html/Normal.html

  # round(x, digits = 0) : rounds the values in its first argument to the specified number of
  # decimal places (default 0).

# ---------------------

x <- c(1:100)
y <- rpois(100,10)
plot(x, y)

x <- c(1:100)
y <- rnorm(100,0, 1)
plot(y, type = "h")

plot(sort(y), type = "h")
# ---------------------

# (a)
  
max(alturas)  # max(vector)

# (b)

minimo_alutas <- which(alturas == min(alturas))
edades[minimo_alutas]
  # which() function gives the TRUE indices of a logical object, allowing for array indices.  
  # which(x, arr.ind = FALSE, useNames = TRUE)

    # alternativa a aplicar solamente si no hay repeticiones:
    min_alturas <- which.min(alturas)
    edades[min_alturas]

# ---------------------
cosas <- c("Perro", "gato", "dog", "cat", "Informático")    
which("Informático" == cosas)    

cosas[0] 
cosas[1]
cosas[which(cosas == "Informático")]
cosas[which("Informático" == cosas)]
# ---------------------
numeros <- c(1:50)
muestra <- sample(numeros)    # randomize a vector

which.min(muestra)
which.max(muestra)

muestra[which.max(muestra)] == max(muestra)
muestra[which.min(muestra)] == min(muestra)
# ---------------------

# (c)

sum(edades %in% 30:40)

# (d)

carrera <- factor(sample( c("Estadística", "Física", "Biología", "Medicina"), 20, replace = T))
carrera

# ---------------------

  # sample : takes a sample of the specified size from the elements of x using either with or without replacement

letras <- c("A", "B")
letras
sopa <- sample(letras)
sopa
sopa <- sample(letras, 4) # ERROR si no permitimos la repetición!! 
sopa
sopa <- sample(letras, 4, replace = TRUE)
sopa
  # sample(x, size, replace = FALSE, prob = NULL)
  # https://stat.ethz.ch/R-manual/R-devel/library/base/html/sample.html

# ---------------------

  # factors are variables in R which take on a limited number of different values
  # https://www.stat.berkeley.edu/classes/s133/factors.html
  
  # factor : is used to encode a vector as a factor (the terms ‘category’ and ‘enumerated type’ are also used for factors)
  #          If argument ordered is TRUE, the factor levels are assumed to be ordered
  # https://stat.ethz.ch/R-manual/R-devel/library/base/html/factor.html

sopa <- factor(sopa)
sopa
levels(sopa)
# ---------------------

# (e)

median(edades[carrera %in% c("Física", "Medicina")])

  # alternativa:
  median(edades[as.numeric(carrera) > 2])

# ---------------------
  
  # median : Compute the sample median
  # https://stat.ethz.ch/R-manual/R-devel/library/stats/html/median.html
  
num <- round(rnorm(20, 0, 1), 2)
median(num)

num <- round(rnorm(200, 0, 1), 2)
median(num)

# ---------------------

# (f)
  
levels(carrera)
levels(carrera)[2:3] <- c("Stats", "Phys")

  # levels(factor) : devuelve el vector de levels de un objeto del tipo factor
  
# (g)

datframe <- data.frame(Edad = edades, Altura = alturas, Carrera = carrera)
save(datframe, file = "Test0.RData")

# ---------------------
  
  # data.frame() : creates data frames, tightly coupled collections of variables which  
  # share many of the properties of matrices and of lists, used as the fundamental data structure
  # https://stat.ethz.ch/R-manual/R-devel/library/base/html/data.frame.html

marco <- data.frame(Letras <- c("A", "B", "C", "D"), Numeros <- c(1:4))                 # el uso del operador de asignación fastidia los data.frames
marco

marco <- data.frame(Letras = c("A", "B", "C", "D"), Numeros = c(1:4))
marco

# ---------------------


## Ejercicio 2
## ===========

state.x77
state.region

# (a)

class(state.x77)
  # https://stat.ethz.ch/R-manual/R-devel/library/base/html/class.html

# (b)

ncol(state.x77)
  # ncol : retorna el número de columnas de uns matriz

# (c)

states77 <- data.frame(state.x77) # convertimos la matriz en data.frame
states77
states77$Region <- state.region   # añadimos una nueva variable con el nombre Region
states77
head(states77)                    # imprimimos la cabecera del data.frame

  # alternatica, en un solo paso:
  states77 <- data.frame(state.x77, Region = state.region)

# (d)

states77$HS.Grad <- states77$Frost <- NULL  # asigno a HS.Grad el valor de Frost después de marcar este como nulo
  
  # alternativa:
  states77 <- subset(states77, select = -c(HS.Grad, Frost))  # nos quedamos con un subconjunto del data.frame
  head(states77, 4)
  
# ---------------------
C <- c(1:20)
C
  
c <- c(1:10)
C <- C - c
C    # WTF!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# ---------------------                                                                                   # TO BE CONTINUED...
  
  names(states77) <- substr(tolower(names(states77)), 1, 4)
  names(states77)
  
# (e)

states77[c("Alabama", "Wyoming"), "life"] <- NA
  
# (f)

  # Use the complete data set
round(cor(states77[c("inco", "illi", "life")], use = "c"), 3)

  # Using pairwise complete observations
round(cor(states77[c("inco", "illi", "life")], use = "p"), 3)

# (g)

tap <- with(states77, tapply(inco, regi, mean))
which.max(tap)
max(tap)

    # alternatica, en un solo paso:
    tap[which.max(tap)]
