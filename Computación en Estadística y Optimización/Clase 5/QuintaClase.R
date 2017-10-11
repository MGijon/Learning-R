### =========================================================================================
### En esta clase continuamos con el Test 0 llevado a cabo en la primera clase.
### Exploraremos diferentes formas de abordar algunos de los ejercicios y estudiaremos las 
### funciones que los resuelven.
### =========================================================================================

## Cargamos la librería apropiada y los datos:

library(Hmisc)

load("Immunology.RData")
"Immunology.RData" %in% dir("Datasets_5") # TRUE

load("Datasets_5/Immunology.RData")

str(immuno)
dim(immuno)
attributes(immuno)
summary(immuno)

# busco los datos perdidos
which(is.na(immuno), arr.ind = TRUE)

## ======================================
## Algunos gráficos estándard: BOXPLOTS
## ======================================

quartz() # Abre una nueva ventana en Mac

par(mfrow = c(2, 2), las = 1, font.main = 4, font.lab = 4, font.axis = 2, oma = c(0, 0, 1, 0), mar = c(3, 4, 4, 2))
boxplot(lympho1~group, immuno, col = 2:4, lwd = 2, ylab = "Células por microlítro", main = "Limfocitos", pars = list(boxwex = 0.7), pch = 16)
boxplot(cd4v1~group, immuno, col = 2:4, lwd = 2, ylab = units(immuno$lympho1), main = "CD4 Cells", pars = list(boxwex = 0.7), pch = 16)
boxplot(cd8v1~group, immuno, col = 2:4, lwd = 2, ylab = units(immuno$lympho1), main = "CD8 Cells", pars = list(boxwex = 0.7), pch = 16)
boxplot(nkiller1~group, immuno, col = 2:4, lwd = 2, ylab = units(immuno$lympho1), main = "Células Natural Killer", pars = list(boxwex = 0.7), pch = 16)
title("Marcadores immunológicos tras la primera visita", outer = TRUE, cex.main = 1.5)


## =====================================================
## Algunos gráficos estándard: BOXPLOTS with a Beeswarm
## =====================================================

#install.packages("beeswarm")
library(beeswarm)
tit <- label(immuno$lympho1)

tit <- label(immuno$lympho1)
quartz(width = 12, height = 12)

par(mfrow = c(2, 2), font = 2, font.lab = 4, font.axis = 2, las = 1, pch = 16)
with(immuno, boxplot(lympho1~group, main = tit, ylab = units(lympho1), col = 2:4))
with(immuno, beeswarm(lympho1~group, main = tit, xlab = "", ylab = units(lympho1), col = 2:4))
with(immuno, boxplot(lympho1~group, main = tit, ylab = units(lympho1)))
with(immuno, beeswarm(lympho1~group, main = tit, ylab = units(lympho1), add = TRUE, col = 2:4))
with(immuno, boxplot(lympho1~group, main = tit, ylab = units(lympho1)))
with(immuno, beeswarm(lympho1~group, add = TRUE, pwcol = as.numeric(sex)))
legend("bottomright", levels(immuno$sex), col = 1:2, pch = 16, bty = "n", title = "Gender")

dev.off()
rm(tit)

## =======================================
## Algunos gráficos estándard: HISTOGRAMS
## =======================================

par(mfrow = c(1, 3), las = 1, font = 2, font.lab = 4, font.axis = 2, cex = 1)
hist(immuno$lympho1, xlab = units(immuno$lympho1), col = 3, main = label(immuno$lympho1))
with(immuno, hist(lympho1, breaks = 20, xlab = units(lympho1), col = "steelblue", main = label(lympho1)))

# Incluímos la función de densidad estimada
par(mar = c(5, 5, 4, 2))
with(immuno, hist(lympho1, breaks = 20, xlab = units(lympho1), col = "maroon", ylab = "", freq = FALSE, main = label(lympho1)))
lines(density(immuno$lympho1), lwd = 3)
mtext("Densidad", 2, line = 4, las = 0)
dev.off()

# Arcoiris y colores tierra
quartz(width = 8, height = 12)
par(mfrow = 2:1, las = 1, font = 2, font.lab = 4, font.axis = 2, oma = c(0, 0, 1, 0))
with(immuno, hist(lympho1, breaks = 20, xlab = units(lympho1), col = rainbow(20), main = label(lympho1)))
with(immuno, hist(lympho1, breaks = 20, xlab = units(lympho1), col = terrain.colors(20), main = label(lympho1)))
dev.off()

# panoplia de gráficos varios
quartz(width = 8, height = 12)
par(las = 1, font = 2, font.lab = 4, font.axis = 2, oma = c(0, 0, 1, 0))
hist(immuno, nclass = 15)


## ===========================
## GRÁFICOS COMO OBJETOS EN R
## ===========================

histograma <- hist(immuno$lympho1, breaks = 20, plot = FALSE)
histograma
class(histograma)
str(histograma)
(hmax <- max(histograma$counts))    # máximo de los valores y
(wmax <- which(histograma$counts == max(histograma$counts)))   # fijamos su posición en x??

quartz(width = 8, height = 12)
par(las = 1, font.lab = 4, font.axis = 2)
plot(histograma, col = "royalblue", xlab = units(immuno$lympho1), main = "Nivel linfocitario")
text(histograma$mids[wmax], hmax, paste0("N=", hmax), adj = c(0.5, -0.1), font = 2) 

dev.off()
rm(histograma, wmax, hmax)
