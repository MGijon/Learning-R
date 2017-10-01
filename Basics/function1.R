# function 1:

# in this file, no return value functions

# function_name <- function (argument/s){
#               statements
#}

pow <- function(x, y){
  # function to print x raised to the power y
  result <- x^y
  print(paste(x, "raised to the power", y, "is", result))
}
pow(3, 4)

pow(x = 10, y = 3)

pow(y = 3, x = 10)

pow(x = 8, 2)

pow(2, x = 8)

# Default valued arguments

sum <- function(x, y = 2){
  # function to add 2, well, not always...
  result <- x + y
  print(paste(x, "plus 2 (often) is", result))
}

sum(10)
