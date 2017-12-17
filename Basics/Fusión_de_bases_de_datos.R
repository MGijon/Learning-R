##################################
##   FUSIÓN DE BASES DE DATOS   ##
##################################


## ========== ##
## EJEMPLO 1: ##
## ========== ##


# Defino unos data.frames, todos ellos con la variable 'id' como variable identificadora
A <- data.frame(id = c("A", "B", "C", "D"), age = c(24, 25, 17, 19), height = c(1.8, 1.9, 1.75, 1.65))
B <- data.frame(gender = c("M", "M", "F", "F"), id = c("A", "B", "C", "D"))
C <- data.frame(id = c("A", "B", "C", "D"), math = c(6.5, 8.9, 7.4, 9.2), science = c(7.2, 8.4, 6.5, 8.7))
D <- data.frame(id = c("A", "B", "C", "D"), eyes = c("blue", "brown", "green", "black"))

# Uniendo los dataframes con merge
AB <- merge(A, B)  # une A con B
ABC <- merge(AB, C)  # a la unión de A y B le agrega C
ABCD <- merge(ABC, D)  # a la unión de A, B y C le agrega D
ABCD  # resultado final

# 'merge' funciona solamente con dos elementos, usando 'Reduce' podemos hacer la operación en un solo paso
Reduce(merge, list(A, B, C, D))



## ========== ##
## EJEMPLO 2: ##
## ========== ##


# Defino los data.frame
authors <- data.frame(surname = I(c("Tukey", "Venables", "Tierney", "Ripley", "McNeil")),
                      nationality = c("US", "Australia", "US", "UK", "Australia"), 
                      deceased = c("yes", rep("no", 4)))
books <- data.frame(name = I(c("Tukey", "Venables", "Tierney", "Ripley", "Ripley", "McNeil", "R Core")),
                    title = c("Exploratory Data Analysis", "Modern Applied Statistics ...", "LISP-STAT", "Spatial Statistics", "Stochastic Simulation", "Interactive Data Analysis", "An Introduction to R"),
                    other.author = c(NA, "Ripley", NA, NA, NA, NA, "Venables & Smith"))

# Cambiando el 'id' de authors para que sea el mismo para todos
colnames(authors)[1] <- "name"  

edition <- data.frame(name = authors[, 1], edition = c(4, 2, 3, 1, 2))  # invento
year <- data.frame(name = authors[, 1], year = 2000:2004)  # invento

## Uniendo los dataframes con merge
m1 <- merge(authors, books)
m2 <- merge(m1, edition)
m3 <- merge(m2, year)

# 'merge' funciona solamente con dos elementos, usando 'Reduce' podemos hacer la operación en un solo paso
Reduce(merge, list(authors, books, edition, year))
