### ===============================================================
### ComputaciÛn en EstadÌstica y en OptimizaciÛn, 26.10.2017
### Group A, R Lecture 10: Functions vars1, vars2, vars3, and vars4
### ===============================================================
# Functions vars1 to vars4 compute the empirical variance and
# the ML estimador of the variance.
# Note: All functions do only work, if function varML exists.

## Function vars1
## --------------
vars1 <- function(x)
{
  stopifnot(is.numeric(x))
  
  val1 <- var(x)
  val2 <- varML(x)
  val1
  val2   # solo devuelve el último de los valores
}

## Function vars2
## --------------
vars2 <- function(x)
{
  stopifnot(is.numeric(x))
  
  val1 <- var(x)
  val2 <- varML(x)
  print(val1)
  cat("ML estimator:", val2, fill = TRUE)  # imprimimos la variable y texto además
}

## Function vars3
## --------------
vars3 <- function(x)
{
  stopifnot(is.numeric(x))
  
  val1 <- var(x)
  val2 <- varML(x)
  return(list("Empirical variance" = val1,
              "ML estimator of the variance" = val2))
}

## Function vars4
## --------------
vars4 <- function(x)
{
  stopifnot(is.numeric(x))
  
  val1 <- var(x)
  val2 <- varML(x)
  vars <- c(val1, val2)             # devolveremso un vector
  names(vars) <- c("Var", "VarML")  # le ponemos nombres a sus elementos
  return(vars)
}
