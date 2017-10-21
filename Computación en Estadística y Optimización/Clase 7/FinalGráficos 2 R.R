### ========================================================
### Práctica final con gráficos 2 (17-10-2017)
### Gráficos longitudinales
### ========================================================

load("Immunology.RData")
library(Hmisc)  # no nos será necesario
 
## R-package lattice
## =================
library(lattice)

      # OBS: la función par con esta paquete, y con ggplot2 también, se ignora por completo

# Histograms & densityplots
# -------------------------
windows(width = 12)
par(font = 2, font.axis = 4, font.lab = 2, las = 1)
histogram(~ cd4v1 | group, immuno, layout = c(3, 1), col = "steelblue",  # | group : para trabajar con subgrupos
          breaks = 15, xlab = attr(immuno$cd4v1, "units"))
densityplot(~ cd4v1 | group, immuno, layout = c(3, 1), col = "tomato",
            breaks = 15, xlab = attr(immuno$cd4v1, "units"),
            scales = list(alternating = FALSE))


# Scatterplots
# ------------
quartz(width = 8, height = 8)
xyplot(cd8v1 ~ cd4v1, data = immuno, pch = 19, col = 3, cex = 1.25,
       xlab = attr(immuno$cd4v1, "units"), ylab = attr(immuno$cd8v1, "units"))
title("CD8 cells vs. CD4 cells")            # La función es ignorada, usaremos el argumento 'main' para especificar el título.
xyplot(cd8v1 ~ cd4v1, data = immuno, pch = 19, col = 3, cex = 1.1,
       main = "CD8 cells vs. CD4 cells", xlab = attr(immuno$cd4v1, "units"),
       ylab = attr(immuno$cd8v1, "units"))
xyplot(nkiller1 ~ cd4v1 | group + sex, data = immuno, xlab = "CD4 cells",
       ylab = "Natural killers", pch = "*", col = 3, cex = 2.5,
       scales = list(font = 4))


# Need some help?
?xyplot                 # Really helpful?
# Maybe better:
example(xyplot)


# Two figures in one graph window
# -------------------------------
windows(width = 12)
plot1 <- dotplot(visit ~ lympho | group, data = immulong, col = "steelblue",
                 layout = c(3, 1), xlab = attr(immuno$lympho1, "label"))
plot2 <- densityplot(~ cd4v1 | group, immuno, layout = c(3, 1), col = "tomato",
                     breaks = 15, xlab = attr(immuno$cd4v1, "label"))
plot1
print(plot1, position = c(0, 0, .35, 0.6), more = TRUE)
print(plot2, position = c(0.35, 0, 1, 1))

## Close all graphic devices (if you want)
graphics.off()


## Longitudinal data plots
## =======================
windows(width = 12, height = 6)
xyplot(lympho ~ totime/30 | group, data = immulong, layout = c(3, 1),
       main = attr(immulong$lympho, "label"),
       xlab = list("Months from first visit", font = 4),
       ylab = list(attr(immulong$lympho, "units"), font = 4),
       par.strip.text = list(cex = 1.1, font = 2),
       scales = list(font = 2, cex = 1.05, tck = c(0.7, 0),
                     x = list(at = seq(0, 12, 3), alternating = FALSE)),
       panel = function(x, y) {
         panel.grid(h = -1, v = -1)
         panel.xyplot(x, y, type = c("p", "r"), lwd = 2, col = 1,
                      pch = 18, cex = 1.1)
       })


# Connecting the points of each volunteer
# ---------------------------------------
xyplot(lympho ~ totime/30 | group, data = immulong, layout = c(3, 1),
       groups = vol, subscripts = group,
       par.strip.text = list(cex = 1.1, font = 2),
       main = attr(immulong$lympho, "label"),
       xlab = list("Months from first visit", font = 4),
       ylab = list(attr(immulong$lympho, "units"), font = 4),
       scales = list(font = 2, cex = 1.05, tck = c(0.7, 0),
                     x = list(at = c(0, 6, 12), alternating = FALSE),
                     y = list(alternating = FALSE)),
       panel = function(x = x, y = y, subscripts = subscripts,
                        groups = immulong$vol) {
         panel.grid(h = -1, v = -1)
         panel.superpose(x, y, subscripts = subscripts, groups = groups,
                         type = c("p", "b"), col = 1, lwd = 2, pch = 18, cex = 1.1)
       })


# One panel per subject (AllVolunteers.jpg)
# -----------------------------------------
xyplot(lympho ~ totime/30 | as.factor(vol), data = immulong, layout = c(10, 9),
       strip = strip.custom(strip.names = TRUE, var.name = "Vol", sep = ". ",
                            strip.levels = TRUE, bg = "wheat"),
       par.strip.text = list(cex = 1.1, font = 2),
       main = "Evolution of lymphocyte levels over time",
       xlab = list("Months from first visit", font = 4),
       ylab = list(attr(immulong$lympho, "units"), font = 4),
       scales = list(font = 4, tck = c(0.7, 0.5),
                     x = list(at = c(0, 6, 12), alternating = TRUE),
                     y = list(alternating = TRUE)),
       panel = function(x, y) {
         panel.grid(h = -1, v = -1)
         panel.xyplot(x, y, type = c("p", "b"), col = 1, pch = 18, cex = 1.1)
       })


# A pdf file with 4 pages
# -----------------------
pdf("AllVolunteers.pdf", width = 10, height = 8)
xyplot(lympho ~ totime/30 | as.factor(vol), data = immulong, layout = c(5, 5),
       strip = strip.custom(strip.names = TRUE, var.name = "Vol", sep = ". ",
                            strip.levels = TRUE, bg = "wheat"),
       par.strip.text = list(cex = 1.1, font = 2),
       main = "Evolution of lymphocyte levels over time",
       xlab = list("Months from first visit", font = 4),
       ylab = list(attr(immulong$lympho, "units"), font = 4),
       scales = list(font = 4, tck = c(0.7, 0.5),
                     x = list(at = c(0, 6, 12), alternating = TRUE),
                     y = list(alternating = TRUE)),
       panel = function(x, y) {
         panel.grid(h = -1, v = -1)
         panel.xyplot(x, y, type = c("p", "b"), col = 1, pch = 18, cex = 1.1)
       })
dev.off()

## For more information, see, e.g.:
## http://lattice.r-forge.r-project.org/documentation.php

