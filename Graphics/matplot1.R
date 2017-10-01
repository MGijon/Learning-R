# learning about matplot:

# https://www.rdocumentation.org/packages/graphics/versions/3.4.0/topics/matplot
# https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/matplot.html

# Plot the columns of one matrix against the columns of another.

# ===================================================
# Matplot parameters:
# ------------------
# x, y : vectors or matrices of data for plotting. The number of rows should match.
# type : character string (length 1 vector) or vector of 1-character strings indicating the type of plot for each column of y.
# lty,lwd,lend : vector of line types, widths, and end styles. The first element is for the first column, the second element for the second column, etc.
# pch : character string or vector of 1-characters or integers for plotting characters, the first character is the plotting-character for the first plot,
#       the second for the second, etc. 
# col : vector of colors. Colors are used cyclically.
# cex : vector of character expansion sizes, used cyclically.
# bg : vector of background (fill) colors for the open plot symbols given by pch = 21:25 as in points.
# xlab, ylab : titles for x and y axes, as in plot.
# xlim, ylim : ranges of x and y axes, as in plot.
# … : Graphical parameters (see par) and any further arguments of plot, typically plot.default, may also be supplied as arguments to this function. 
# add : logical. If TRUE, plots are added to current one, using points and lines.
# verbose : logical. If TRUE, write one line of what is done.
# ===================================================

x <- matrix(1:45, nrow = 5)
y <- 2*x

matplot(x, y) # just matplot, with no parameters

matplot(x, y, type = 'o', col = "black")

matplot(x, y, type = 'l', col = c("black", "red"))

data("iris")
matplot(iris)

matplot(iris$Sepal.Length, main = "Sepal Length", ylab = "", sub = "of all the set")

matplot(iris[1:50, ]$Sepal.Length, main = "Setosa Sepal Length", ylab = "", sub ="just for Setosa")

matplot(iris[1:50, ]$Sepal.Length, type = "o", main = "Setosa Sepal Length", ylab = "", sub ="o type")

matplot(iris[1:50, ]$Sepal.Length, type = "p", main = "Setosa Sepal Length", ylab = "", sub ="p type")

matplot(iris[1:50, ]$Sepal.Length, type = "b", main = "Setosa Sepal Length", ylab = "", sub ="b type")

matplot(iris[1:50, ]$Sepal.Length, type = "o", main = "Setosa Sepal Length", ylab = "", sub ="o type, lend round", lend = "round")

matplot(iris[1:50, ]$Sepal.Length, type = "o", main = "Setosa Sepal Length", ylab = "", sub ="o type, lend square", lend = "square")

matplot(iris[1:50, ]$Sepal.Length, type = "c", main = "Setosa Sepal Length", ylab = "", sub ="c type, lend square", lend = "square")

matplot(iris[1:50, ]$Sepal.Length, type = "c", main = "Setosa Sepal Length", ylab = "", sub ="c type, lend butt", lend = "butt")


