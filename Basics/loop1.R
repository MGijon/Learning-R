# Loop 1:

# ------------------
# FOR
# ------------------

# for (val in sequence){
#     statment
#}

x <- c(1, 3, 4, 5, 12, 12, 43, 1, 34)
count <- 0
for (val in x){
  if (val %% 2 == 0) count = count + 1 
}
print(count)

# ------------------
# WHILE
# ------------------

# while (test_expresion){
#       statment
#}

i <- 1
while (i < 6){
  print(i)
  i = i + 1 
}

# ------------------
# BREAK
# ------------------

# It's used inside a loop (repeat, for, while) to stop the iterations and flow
# the control aoutside the loop.
# In a nested looping situation, it exist from the innermost loop that is being evaluated.


x <- 1:5
for (val in x){
  if (val == 3){
    break
  }
  print(val)
}

# ------------------
# NEXT
# ------------------

# Skip the current iteration od a loop without terminating it.

x <- 1:5
for (val in x){
  if (val == 3){
    next
  }
  print(val)
}

# ------------------
# REPEAT
# ------------------

# There is no condition check in repeat loop to exit the loop.

# repeat{
#     statment
#}

count <- 1

repeat{
  print("helo")
  count = count + 1
  if (count == 6){
    break
  }
}

