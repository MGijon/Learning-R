# function 2:

# ---------------------------
# Enviromment and Scope in R
# ---------------------------

# Enviromment: can be thought as a collection of objects (functions, variables, etc).
#              Is created when we first fire up the R interpreter.
#              The top level environment is the global environment R_GlobalEnv


# we can use ls function to soww what variables and functions and in the environment

ls()

# environment() to get the current environment

environment()

# the arguments of the functions are not in the gloval environment

#-----

f <- function(f_x){
  g <- function(g_x){
    print("Inside g")
    print(environment())
    print(ls())
  }
  g(5)
  print("Inside f")
  print(environment())
  print(ls())
}
f(6)

# ---------------------------
# Assignments to gloval variables
# ---------------------------

a <- 15
outher_function <- function(){
  inner_function <- function(){
    a <<- 30                    # superassignment operator
    print(a)
  }
  inner_function()
  print(a)
}
outher_function()
print(a)
