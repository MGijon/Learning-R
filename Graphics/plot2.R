# lerning to use plot funcion 2:

# https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/legend.html

# ===================================================
# Add Legends to Plots, Arguments:
# --------------------------------
# x, y : the x and y co-ordinates to be used to position the legend. They can be specified by keyword or in any way which is accepted by xy.coords.
# legend : a character or expression vector of length ≥ 1 to appear in the legend. Other objects will be coerced by as.graphicsAnnot.
# fill : if specified, this argument will cause boxes filled with the specified colors (or shaded in the specified colors) to appear beside the legend text.
# col : the color of points or lines appearing in the legend.
# border : the border color for the boxes (used only if fill is specified).
# (*) lty, lwd:  the line types and widths for lines appearing in the legend. One of these two MUST be specified for line drawing.
# (*) pch : the plotting symbols appearing in the legend, as numeric vector or a vector of 1-character strings (see points).
#       Unlike points, this can all be specified as a single multi-character string. MUST be specified for symbol drawing.
# angle : angle of shading lines.
# density : the density of shading lines, if numeric and positive. If NULL or negative or NA color filling is assumed.
# bty : type of box to be drawn around the legend. The allowed values are "o" (the default) and "n".
# bg : the background color for the legend box. (Note that this is only used if bty != "n".)
# box.lty, box.lwd, box.col : the line type, width and color for the legend box (if bty = "o").
# pt.bg : the background color for the points, corresponding to its argument bg.
# cex : character expansion factor relative to current par("cex"). Used for text, and provides the default for pt.cex.
# pt.cex : expansion factor(s) for the points.
# pt.lwd : line width for the points, defaults to the one for lines, or if that is not set, to par("lwd").
# xjust : how the legend is to be justified relative to the legend x location. A value of 0 means left justified, 
#         0.5 means centered and 1 means right justified.
# yjust : the same as xjust for the legend y location.
# x.intersp : character interspacing factor for horizontal (x) spacing.
# y.intersp : the same for vertical (y) line distances.
# adj : numeric of length 1 or 2; the string adjustment for legend text. Useful for y-adjustment when labels are plotmath expressions.
# text.width : the width of the legend text in x ("user") coordinates. (Should be a single positive number even for a reversed x axis.).
#              Defaults to the proper value computed by strwidth(legend).
# text.col : the color used for the legend text.
# text.font : the font used for the legend text, see text.
# merge : logical; if TRUE, merge points and lines but not filled boxes. Defaults to TRUE if there are points and lines.
# trace : logical; if TRUE, shows how legend does all its magical computations.
# plot : logical. If FALSE, nothing is plotted but the sizes are returned.
# ncol : the number of columns in which to set the legend items (default is 1, a vertical legend).
# horiz : logical; if TRUE, set the legend horizontally rather than vertically (specifying horiz overrides the ncol specification).
# title : a character string or length-one expression giving a title to be placed at the top of the legend. Other objects will be coerced by as.graphicsAnnot.
# inset : inset distance(s) from the margins as a fraction of the plot region when legend is placed by keyword.
# xpd : if supplied, a value of the graphical parameter xpd to be used while the legend is being drawn.
# title.col : color for title.
# title.adj : horizontal adjustment for title: see the help for par("adj").
# seg.len : the length of lines drawn to illustrate lty and/or lwd (in units of character widths).
# ===================================================

# A simple graphic to work on
Y <- c(10.99, 9, 6.1, 9.50, 6.30, 12, 18)
plot(Y, type = "o", col = "blue")

# -------------------------------------------
# legends with titles at different locations
# -------------------------------------------

plot(Y, type = "o", col = "blue")
legend("bottom", "(x, y)", pch = 1, title = "bottom")

plot(Y, type = "o", col = "blue")
legend("bottomright", "(x, y)", pch = 1, title = "bottomright")

plot(Y, type = "o", col = "blue")
legend("bottomleft", "(x, y)", pch = 1, title = "bottomleft")

plot(Y, type = "o", col = "blue")
legend("top", "(x, y)", pch = 1, title = "top")

plot(Y, type = "o", col = "blue")
legend("topright", "(x, y)", pch = 1, title = "topright")

plot(Y, type = "o", col = "blue")
legend("topleft", "(x, y)", pch = 1, title = "topleft")

plot(Y, type = "o", col = "blue")
legend("right", "(x, y)", pch = 1, title = "right")

plot(Y, type = "o", col = "blue")
legend("left", "(x, y)", pch = 1, title = "left")

plot(Y, type = "o", col = "blue")
legend("center", "(x, y)", pch = 1, title = "center")

# -------------------------------------------
# modify inset
# -------------------------------------------

plot(Y, type = "o", col = "blue", main = "inset distance(s) from the margins as a fraction of the plot region when legend is placed by keyword.", cex.main = .6)
legend("topright", "(x, y)", pch = 1, title = "topright, inset = .5", inset = .5)

plot(Y, type = "o", col = "blue", main = "inset distance(s) from the margins as a fraction of the plot region when legend is placed by keyword.", cex.main = .6)
legend("topright", "(x, y)", pch = 1, title = "topright, inset = .3", inset = .3)



