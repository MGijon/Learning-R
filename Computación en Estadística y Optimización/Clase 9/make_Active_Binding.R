### ========================================================
### Computación en Estadística y en Optimización, 24.10.2017
### Group A, R Lecture 9: Function makeActiveBinding
### ========================================================

# Example 1
# ---------

x <- 7
y <- 22
makeActiveBinding("z", function() x + y, .GlobalEnv)
z
x <- 100    # Update of x ...
z           # implies update of z

# Example 2

# ---------
(notas <- data.frame(R1 = 7:9, R2 = 7, Pr = c(9, 9, 8.5)))
makeActiveBinding("notaCeoR", function() round(rowMeans(notas), 1), .GlobalEnv)
notaCeoR
notas[4:5, ] <- c(5, 10, 6.5, 8.5, 8, 9.5)
notas
notaCeoR
