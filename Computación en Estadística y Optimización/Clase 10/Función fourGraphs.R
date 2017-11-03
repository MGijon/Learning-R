### ========================================================
### ComputaciÛn en EstadÌstica y en OptimizaciÛn, 26.10.2017
### Group A, R Lecture 10: Function fourGraphs
### ========================================================

## Function fourGraphs draws four graphs of a numeric variable

# ... captura los argumentos de las funciones interiores
# 'clr' es el argumento del color, fijado por defecto
# 'lwi' es el argumento que hace referencia a la longitud de las líneas en ambos gráficos
fourGraphs <- function(x, clr = 2, lwi = 2, ...)
{
  # si capturamos de esta manera el error podemos decir cual será el mensaje
  if (!is.numeric(x)) 
    stop("The argument must be a numeric vector")
  
  quartz()
  par(mfrow = c(2, 2), ...)
  hist(x)
  boxplot(x, main = paste("Boxplot of the vector", deparse(substitute(x))), # deparse extrae de un objeto su nombre
          col = clr)
  iqd <- summary(x)[5] - summary(x)[2]
  plot(density(x, width = 2 * iqd), main = "Kernel estimate of the density",
       xlab = "x", ylab = "", type = "l", lwd = lwi)
  qqnorm(x)
  qqline(x, col = clr, lwd = lwi)
}

