## APPLY
## -----
## When you want to apply a function to the rows or columns of a matrix (and higher-dimensional analogues);
## not generally advisable for data frames as it will coerce to a matrix first.
## ---- 

# Two dimensional matrix
M <- matrix(seq(1,16), 4, 4)

# apply min to...
apply(M, 1, min)    # ... columns
apply(M, 2, min)    # ... rows

# apply mean to...
apply(M, 1, mean)   # ... columns
apply(M, 2, mean)   # ... rows
 
# Three dimensional array
M <- array(seq(32), dim = c(4, 4, 2))
M

# Apply sum across each...  
apply(M, 1, sum)    # ... M[*, , ] - i.e Sum across 2nd and 3rd dimension -> Result is one-dimensional
apply(M, 2, sum)    # ... M[, *, ] - i.e Sum across 1nd and 3rd dimension -> Result is one-dimensional
apply(M, 3, sum)    # ... M[, , *] - i.e Sum across 1nd and 2rd dimension -> Result is one-dimensional

# Apply sum across each... 
apply(M, c(2,3), sum) #  M[, *, *] - i.e Sum across 1rd dimension -> Result is two-dimensional
apply(M, c(1,3), sum) #  M[*, , *] - i.e Sum across 2rd dimension -> Result is two-dimensional
apply(M, c(1,2), sum) #  M[*, *, ] - i.e Sum across 3rd dimension -> Result is two-dimensional


## LAPPLY
## ------
## When you want to apply a function to each element of a list in turn and get a list back.
## ------

x <- list(a = 1, b = 1:3, c = 10:100) 
x
lapply(x, FUN = length) 


## SAPPLY
## ------
## When you want to apply a function to each element of a list in turn, but you want a vector back, rather than a list.
## ------

x <- list(a = 1, b = 1:3, c = 10:100)
x
sapply(x, FUN = length)

# In more advanced uses of sapply it will attempt to coerce the result to a multi-dimensional array, if appropriate.
# For example, if our function returns vectors of the same length, sapply will use them as columns of a matrix:
sapply(1:5, function(x) rnorm(3,x))

# If our function returns a 2 dimensional matrix, sapply will do essentially the same thing, treating each returned 
# matrix as a single long vector:
sapply(1:5, function(x) matrix(x,2,2))

# Unless we specify simplify = "array", in which case it will use the individual matrices to build a multi-dimensional
# array:
sapply(1:5, function(x) matrix(x,2,2), simplify = "array")



## VAPPLY
## ------
## When you want to use sapply but perhaps need to squeeze some more speed out of your code.
## ------

# For vapply, you basically give R an example of what sort of thing your function will return, which can save some time 
# coercing returned values to fit in a single atomic vector.

x <- list(a = 1, b = 1:3, c = 10:100)
# Note that since the advantage here is mainly speed, this
# example is only for illustration. We're telling R that
# everything returned by length() should be an integer of 
# length 1. 
vapply(x, FUN = length, FUN.VALUE = 0L)




## MAPPLY
## ------
## For when you have several data structures (e.g. vectors, lists) and you want to apply a function to the 1st elements of each,
## and then the 2nd elements of each, etc., coercing the result to a vector/array as in sapply.
## ------

# This is multivariate in the sense that your function must accept multiple arguments.

# Sums the 1st elements, the 2nd elements, etc. 
mapply(sum, 1:5, 1:5, 1:5) 

# To do rep(1,4), rep(2,3), etc.
mapply(rep, 1:4, 4:1)  



## MAP 
## ---
## A wrapper to mapply with SIMPLIFY = FALSE, so it is guaranteed to return a list.
## ---

Map(sum, 1:5, 1:5, 1:5)



## RAPPLY
## ------
## For when you want to apply a function to each element of a nested list structure, recursively.
## ------

# To give you some idea of how uncommon rapply is, I forgot about it when first posting this answer!
# Obviously, I'm sure many people use it, but YMMV. rapply is best illustrated with a user-defined function to apply:

# Append ! to string, otherwise increment
myFun <- function(x){
  if(is.character(x)){
    return(paste(x,"!",sep=""))
  }
  else{
    return(x + 1)
  }
}

#A nested list structure
l <- list(a = list(a1 = "Boo", b1 = 2, c1 = "Eeek"), 
          b = 3, c = "Yikes", 
          d = list(a2 = 1, b2 = list(a3 = "Hey", b3 = 5)))


# Result is named vector, coerced to character          
rapply(l, myFun)

# Result is a nested list like l, with values altered
rapply(l, myFun, how = "replace")



## TAPPLY
## ------
## For when you want to apply a function to subsets of a vector and the subsets are defined by some other vector, usually a factor.
## ------


# The black sheep of the *apply family, of sorts. The help file's use of the phrase "ragged array" can be a bit confusing,
# but it is actually quite simple.

# A vector:
x <- 1:20
x

# A factor (of the same length!) defining groups:
y <- factor(rep(letters[1:5], each = 4))
y

# Add up the values in x within each subgroup defined by y:
tapply(x, y, sum)

### =========
### MNEMONICS
### =========

### lapply is a list apply which acts on a list or vector and returns a list.
### sapply is a simple lapply (function defaults to returning a vector or matrix when possible)
### vapply is a verified apply (allows the return object type to be prespecified)
### rapply is a recursive apply for nested lists, i.e. lists within lists
### tapply is a tagged apply where the tags identify the subsets
### apply is generic: applies a function to a matrix's rows or columns (or, more generally, to dimensions of an array)




# source : https://stackoverflow.com/questions/3505701/grouping-functions-tapply-by-aggregate-and-the-apply-family