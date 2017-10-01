# lerning how to use plot funcion 1:

Y <- c(10.99, 9, 6.1, 9.50, 6.30, 12, 18)
plot(Y)         # just points

# ===================================================
# Plot Annotation:
# ----------------
# main : The main title (on top) using font, size (character expansion) and color par(c("font.main", "cex.main", "col.main")).
# sub : Sub-title (at bottom) using font, size and color par(c("font.sub", "cex.sub", "col.sub")).
# xlab : X axis label using font, size and color par(c("font.lab", "cex.lab", "col.lab")).
# ylab : Y axis label, same font attributes as xlab.
# line : specifying a value for line overrides the default placement of labels, and places them this many lines outwards from the plot edge.
# outer:  a logical value. If TRUE, the titles are placed in the outer margins of the plot.
# ===================================================

plot(Y, main = "Y against X")
plot(Y, type = "o", sub = "Y against X")
plot(Y, type = "o", ylab = "Y value", col = "blue")
plot(Y, type = "o", ylab = "Y value", xlab = "X value", col = "blue")
plot(Y, type = "o", ylab = "Y value", xlab = "X value", col = "blue", outer = TRUE)

# another way to add a title, but now we can modify the attributes:
plot(Y)
title("Y values", col.main = "red", font.main = 4, cex.main = 0.75)
# col : color
# font : modify the characters
# cex: modify the size of the font

# another way to ad a sub-title (using title) and modify its arguments:

plot(Y)
title("Title", sub = "Subtitle", col.main = "green", font.main = 4, cex.main = 2,
      col.sub = "red", font.sub = 4, cex.sub = 0.75)
# ===================================================
# Type parameter values:
# ----------------------
# "p" : points
# "l" : lines
# "b" : both points and lines
# "c" : empty points joined by lines
# "o" : overplotted points and lines
# "s" and "S" : stair steps
# "h" : histogram-like vertical lines
# "n" : does not product any points and lines
# ===================================================

plot(Y,main = "Using 'p' as parameter for plot", type = "p", ylab = "Y value", xlab = "X value", col = "blue")

plot(Y,main = "Using 'l' as parameter for plot", type = "l", ylab = "Y value", xlab = "X value", col = "blue")

plot(Y,main = "Using 'b' as parameter for plot", type = "b", ylab = "Y value", xlab = "X value", col = "blue")

plot(Y,main = "Using 'c' as parameter for plot", type = "c", ylab = "Y value", xlab = "X value", col = "blue")

plot(Y,main = "Using 'o' as parameter for plot", type = "o", ylab = "Y value", xlab = "X value", col = "blue")

plot(Y,main = "Using 's' as parameter for plot", type = "s", ylab = "Y value", xlab = "X value", col = "blue")

plot(Y,main = "Using 'S' as parameter for plot", type = "S", ylab = "Y value", xlab = "X value", col = "blue")

plot(Y,main = "Using 'h' as parameter for plot", type = "h", ylab = "Y value", xlab = "X value", col = "blue")

plot(Y,main = "Using 'n' as parameter for plot", type = "n", ylab = "Y value", xlab = "X value", col = "blue")







