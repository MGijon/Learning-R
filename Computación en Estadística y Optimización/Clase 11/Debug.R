### ========================================================
### Práctica con el debuging de funciones (31-10-2017)
### ========================================================

ejemplo1 <- function(x)
{
  print("hola")
}

debug(ejemplo1) # iniciamos el proceso de debuging
ejemplo1() # la ejecutamos

# Q para salir del debugging a lo bruto

# undebug(funcion)  # para salir de 'manera controlada'

# función temporal timpo lamba:
# function(x) is.factor(x) | is.character(x)