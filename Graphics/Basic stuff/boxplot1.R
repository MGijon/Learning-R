# learning about boxplot:

# http://www.statmethods.net/graphs/boxplot.html
# http://www.theanalysisfactor.com/r-tutorial-part-13/
# https://www.r-bloggers.com/box-plot-with-r-tutorial/

x <- c(2, 4, 2, 3, 4, 5, 7, 4)

boxplot(x)

boxplot(x, varwidth = TRUE) #  make box plot widths proportional to the square root of the sample sizes

boxplot(x, horizontal = TRUE) # make it horizontal

data(iris)

boxplot(iris)

boxplot(iris$Sepal.Length, main = "Sepal Length", sub = "all the flowers")

boxplot(iris[1:50, ]$Sepal.Length, main = "Sepal Length", sub = "only Setosa")

par(mfrow = c(1, 3))
boxplot(iris[1:50, ]$Sepal.Length, main = "Sepal Length", sub = "only Setosa")
boxplot(iris[51:100, ]$Sepal.Length, main = "Sepal Length", sub = "only Versicolor")
boxplot(iris[101:150, ]$Sepal.Length, main = "Sepal Length", sub = "only Virginica")
par(mfrow=c(1,1))     # ugly way to reset 'par'

boxplot(iris$Petal.Length, main = "Petal Length", sub = "all the flowers", col = "red")


# to be continued...