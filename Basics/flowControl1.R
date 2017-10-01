# stydy the flow control 1:

# ------------------
# IF-ELSE
# ------------------


x = 10

if (x > 0){
  print("x positive")
} else{
  print("x negative")
}

# it also can be written in a single line as follows:

if (x > 0) print("x positive") else print("x negetive")

# we could use it to construct variables

y <- if (x < 0) 1 else 0

Y <- if (x < 0) TRUE else FALSE

# ------------------
# Nested IF-ELSE
# ------------------


if (x > 0){
  print("x positive")
} else if (x > -5){
  print("at least is gratter than -5")
} else if (x > -10){
  print(" gratter than -10")
} else{
  print("lower or equal to -10")
}

# ------------------
# IFELSE
# ------------------

# ifelse(test_expresion, x, y)
# test_expresion must be a logical vector.
# The returned value is a expresion of the same length as test_expresion.
# This returned vector has alement form x if the corresponding value of test_expresion
# is TRUE or from y if it's FALSE.

a = c(3, 3, 4, 5, 12)
ifelse(a %% 2 == 0, "even", "odd")


