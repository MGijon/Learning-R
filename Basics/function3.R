# function 3:

# --------------------
# Recursive Functions
# --------------------

# recursive function to find the factorial

recursive.factorial <- function(x){
  if (x == 0) return (1)
  else        return(x * recursive.factorial(x-1))
}


recursive.factorial(0)
recursive.factorial(4)
recursive.factorial(10)

# --------------------
# Infix Operators
# --------------------

a <- 5
b <- 10

a + b # it call a function in the blackground, the same that write
`+`(a, b)

a - b
`-`(a, b)

`-`( `*`(a, b), 1)

# We can define this operators too:

`%divisible%` <- function(x, y){
  if (x%%y == 0) return (TRUE)
  else           return (FALSE)
}

10 %divisible% 2
11 %divisible% 2

`%divisible%`(12, 5) 
