# learning about the lines function 1:

x <- seq(-pi, pi, 0.1) # it crates a sequency of numbers from -pi to pi taken each 0.1
# wiht plot we create a graphical object, essential before use 'lines'
plot(x, sin(x), type = "l", main = "The Sine Function", col = "blue")

# now we have the 'lines'. It is not gonna create a new graphic object by itself!!
plot(x, sin(x), type = "l", main = "The Sine/Cosine Functions", col = "blue")
lines(x, cos(x), col = "red")

#now we are gonna add a legend at the left side
legend("topleft", c("sin(x)", "cos(x)"), fill = c("blue", "red")) 

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

x <- seq(-pi * 3, pi * 3, 0.1)
plot(x, sin(x), col = "blue", type= "l", main = "'p' as type parameter")
lines(x, cos(x), col = "red", type = "p")

plot(x, sin(x), col = "blue", type= "l", main = "'l' as type parameter")
lines(x, cos(x), col = "red", type = "l")

plot(x, sin(x), col = "blue", type= "l", main = "'b' as type parameter")
lines(x, cos(x), col = "red", type = "b")

plot(x, sin(x), col = "blue", type= "l", main = "'c' as type parameter")
lines(x, cos(x), col = "red", type = "c")

plot(x, sin(x), col = "blue", type= "l", main = "'o' as type parameter")
lines(x, cos(x), col = "red", type = "o")

plot(x, sin(x), col = "blue", type= "l", main = "'s' as type parameter")
lines(x, cos(x), col = "red", type = "s")

plot(x, sin(x), col = "blue", type= "l", main = "'S' as type parameter")
lines(x, cos(x), col = "red", type = "S")

plot(x, sin(x), col = "blue", type= "l", main = "'h' as type parameter")
lines(x, cos(x), col = "red", type = "h")

plot(x, sin(x), col = "blue", type= "l", main = "'n' as type parameter")
lines(x, cos(x), col = "red", type = "n")

