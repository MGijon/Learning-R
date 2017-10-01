# learning how to use 'par' function 1:

# http://www.statmethods.net/advgraphs/layout.html
# https://www.rdocumentation.org/packages/graphics/versions/3.4.0/topics/par

# It's use to change parameters of the graphics in a permanent way
# We can use it to to represent diferent graphics in the same window

x <- rnorm(20)  # two random vectors normally distributed
y <- rnorm(20)

par(mfcol = c(1, 3))    # mfcol=c(nrows, ncols)
plot(x, y, main ="1")
plot(x, y, main ="2")
plot(x, y, main ="3")

par(mfrow = c(3, 1))    # mfrow=c(nrows, ncols)
plot(x, y, main ="1")
plot(x, y, main ="2")
plot(x, y, main ="3")

# we can change the differents parameters for each graphic individualy

par(mfrow = c(2, 2))
plot(x, y, col = "red")
title(main = "just points")
plot(x, type = "h", col = "red", main = "one dimensional histogram-like plot") 
plot(x, y, type = "l", col = "green")
title("lines", sub = "beautiful lines", col.main = "red", font.main = 4, cex.main = 5
      , col.sub = "brown", font.sub = 4, cex.sub = 4)   
plot(y, x, type = "b", main = "points and lines")

# -----------------------------
# we can also modify the way their are represented...
# to be continued...


