# lerning to use plot funcion 2:

lunch_spend <- c(10.99, 9, 6.1, 9.50, 6.30, 12, 18)
dinner_spend <- c(10, 10, 10, 15.5, 10, 13, 17)

g_range <- range(0, lunch_spend, dinner_spend)
 # ......
g_range <- range(0, Y) # definds the range for plotting the Y values between 0 and max(Y)

g_range == range(0, max(Y))   # returns TRUE TRUE
 # ......

plot(lunch_spend, type = "o", col = "blue", ylim = g_range, axes = FALSE, ann = FALSE)
# use the line function to include the other data in a graphicla object that just already exists
lines(dinner_spend, type = "o", pch = 22, lty = 2, col = "red")

title("Money spend in food", col.main = "red", font.main = 4)

# add labels to the x axis
days <- c("Mond", "Tues", "Wed", "Thu", "Fri", "Sat", "Sun")
axis(1, at = 1:length(days), lab = days)

# make the y axis with labels that displays ticks every 4 marks, observe the syntax 
axis(2, at = 4 * grange[2])

# to be continued...

