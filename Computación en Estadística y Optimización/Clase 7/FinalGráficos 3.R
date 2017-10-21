### ========================================================
### Práctica final con gráficos 3 (17-10-2017)
### Otros paquetes de interés
### ========================================================

load("Immunology.RData")

## Figures with package plotrix
## ============================
install.packages("plotrix")
library(plotrix)
example(twoord.plot)

example(radial.plot)
example(pyramid.plot)
example(addtable2plot)


## Package ggplot2
## ===============
# install.packages("ggplot2")
library(ggplot2)
quartz(width = 10)

# A simple boxplot
# i) Using function qplot
qplot(x = group, y = lympho1, data = immuno, geom = "boxplot")
# ii) Using function ggplot and several layers
p <- ggplot(immuno, aes(group, lympho1))
p + geom_boxplot()

# Somewhat nicer
p + geom_boxplot(fill = 2:4) +
  labs(title = attr(immuno$lympho1, "label"),
       y = attr(immuno$lympho1, "units"), x = "Study groups")

# Including variable Gender
p + geom_boxplot(aes(fill = sex)) +
  labs(title = "Lymphocytes per group and gender",
       y = attr(immuno$lympho1, "units"), x = "Study groups")

# Separate panels for female and male study participants
p + geom_boxplot(fill = rep(c("tomato", "olivedrab", "steelblue"), 2)) +
  labs(title = "Lymphocytes per group and gender",
       y = attr(immuno$lympho1, "units"), x = "Study groups") +
  facet_grid(~ sex)

p + geom_boxplot(fill = rep(c("tomato", "olivedrab", "steelblue"), 2)) +
  labs(title = "Lymphocytes per group and gender",
       y = attr(immuno$lympho1, "units"), x = "Study groups") +
  facet_grid(sex ~ .)


# The scatterplot CD$ cells vs. Natural killer cells
# --------------------------------------------------
p <- ggplot(immuno, aes(nkiller1, cd4v1))
p + geom_point(aes(color = group), size=3) +
  labs(title = "CD4 cells vs. Natural killer cells",
       y = attr(immuno$cd4v1, "units"),
       x = attr(immuno$nkiller1, "units")) +
  theme(legend.position = "bottom") +
  ylim(400, max(immuno$cd4v1)) +
  scale_colour_discrete(name = "Study group")


# The density plot with shaded area from quantile 75 to 95
# --------------------------------------------------------
set.seed(123)
draws <- rnorm(1000)^2
dens <- density(draws)
dens
str(dens)
plot(dens)

(q75 <- quantile(draws, .75))
(q95 <- quantile(draws, .95))

x1 <- min(which(dens$x >= q75))
x2 <- max(which(dens$x <  q95))

dd <- data.frame(x = dens$x, y = dens$y)
qplot(x, y, data = dd, geom = "line") +
  geom_ribbon(data = subset(dd, x > q75 & x < q95), aes(ymax = y), ymin = 0,
              fill = "red", colour = NA, alpha = 0.5)

## For MUCH more information, see http://ggplot2.org/
## Also VERY helpful: https://www.rstudio.com/resources/cheatsheets/


## Interactive Web Graphics with plotly
## ====================================
install.packages("plotly")
library(plotly)
plot_ly(immuno, x = ~ cd4v1, color = ~ group, type = "box")
plot_ly(immuno, x = ~ nkiller1, y = ~ cd4v1, mode = "markers", color = ~ age)

## For much more, see:
## https://plot.ly/r/


## Interactive plots with package playwith
## =======================================
install.packages("cairoDevice", "gWidgetsRGtk2", "RGtk2", "gWidgets", "playwith")
library(lattice)
library(playwith)
playwith(xyplot(lympho~totime|group, data = immulong, layout = c(3, 1),
                groups = vol, subscripts = group,
                par.strip.text = list(cex = 1.1, font = 2),
                main = attr(immulong$lympho, "label"),
                xlab = list("Months from first visit", font = 4),
                ylab = list(attr(immulong$lympho, "units"), font = 4),
                scales = list(font = 2, cex = 1.05, tck = c(0.7, 0),
                              x = list(alternating = FALSE),
                              y = list(alternating = FALSE)),
                panel = function(x = x, y = y, subscripts = subscripts,
                                 groups = immulong$vol) {
                  panel.grid(h = -1, v = -1)
                  panel.superpose(x, y, subscripts = subscripts, groups = groups,
                                  type = c("p", "b"), col = 1, lwd = 2,
                                  pch = 18, cex = 1.1)
                }))

## Gr?ficos animados:
## (a) Ver p?gina de Yihui Xie: http://vis.supstat.com/
## R package: animation
## (b) R package anim.plots: http://hughjonesd.github.io/

