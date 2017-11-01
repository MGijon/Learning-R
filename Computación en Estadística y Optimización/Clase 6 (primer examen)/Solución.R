#######################
##    EJERCICIO 1    ##
#######################

# El  área de trabajo GrATestR1.RData contiene un data frame llamado states77 con los datos
# de los 50 estados de los Estados Unidos de los añ̃os 70. Las variables son las siguientes:
#
# stat  :   Estado
# pop   :   Poblaci ́on (en miles)
# inco  :   Salario medio (en dólares)
# illi  :   Tasa de analfabetismo (en % de la población) 
# lifex :   Esperanza de vida al nacer
# hsg   :   Personas con bachillerato (en % de la población) 
# reg   :   Región

# (a) Cargar el área de trabajo y dar su número de datos
# --- 

load("Datos.Rdata")
ls()
length(ls())            
# 1



# (b) Cambiar los identificadores de fila (rownames) a los nombres de los estados y borrar 'stat'
# ---

rownames(states77) <- states77$stat    # cambiamos los identificadores de fila
states77$stat <- NULL                  # borramos 'stat'
head(states77)                         # imprimimos la cabezera para asegurarnos

# Alternativa:
states77 <- transform(states77, row.names = stat, stat = NULL)



# (c) ¿Cuántos datos perdidos hay en la muestra?
# ---

sum(is.na(states77) | states77 == "--" | states77 == "*")  
# 10



# (d) Convertir las variables 'pop' e 'illi' e variables numéricas
# ---

states77$pop <- as.numeric(states77$pop)
states77$illi <- as.numeric(states77$illi)
str(states77)                           # Nos aseguramos de la conversión
summary(states77)



# (e) ¿Cuántos estados tienen un salario medio entre 4000 y 5000 dólares?
# ---

sum(states77$inco %in% 4000:5000)
# 28



# (f) ¿Qué regiones tienen la esperanza de vida más baja y más alta, respectivamente, cuáles son los valores?
# ---

avelif <- with(states77, tapply(lifex, reg, mean))
avelif[c(which.min(avelif), which.max(avelif))]
#    South North Central 
# 69.70625      71.76667


# (g) Calcular los coeficientes de correlación de Spearman entre los pares ares de las variables numéricas
# --- usando todos los datos disponibles

round(cor(states77[, c("pop", "inco", "illi", "lifex", "hsg")], method = "spearman",use = "pairwise.complete.obs"), 2)
#         pop  inco  illi lifex   hsg
# pop    1.00  0.21  0.39 -0.14 -0.35
# inco   0.21  1.00 -0.25  0.29  0.49
# illi   0.39 -0.25  1.00 -0.57 -0.64
# lifex -0.14  0.29 -0.57  1.00  0.52
# hsg   -0.35  0.49 -0.64  0.52  1.00



# (h) Ordenar las variables por orden alfabético
# ---

states77 <- states77[, sort(names(states77))]
head(states77)

# (i) ¿Cuántos valores de la variable 'lifex' se repiten, cuáles son y que estados tienen como esperanza de
# ---  vida estos valores?

d <- duplicated(states77$lifex)
sum(d)
# 3

states77$lifex[d]
# 70.66 70.55 72.48

rownames(subset(states77, lifex %in% lifex[d]))
# "Arizona"     "Arkansas"    "Connecticut"
# "Florida"     "New York"    "Wisconsin"


# (j) ¿Cuál es la letra por la que comienzan más nombres de estados?
# ---

letras <- table(substr(rownames(states77), 1, 1))
letras
# A C D F G H I K L M N O P R S T U V W 
# 4 3 1 1 1 1 4 2 1 8 8 3 1 1 2 2 1 2 4 

letras[letras == max(letras)]
# M N 
# 8 8 


# (k) Contando espacios en blanco, ¿cuál es la media en el número de letras de los nombres de los estados?
# ---

mean(nchar(rownames(states77)))
# 8.44


# (l) Cambiad la región de South Carolina y North Carolina de ‘South’ a ‘Carolina

levels(states77$reg)
#  "North Central" "Northeast"     "South"         "West"  
levels(states77)[5] <- "Carolina"
states77[c("South Carolina", "North Carolina"), "reg"] <- "Carolina"
states77[c("South Carolina", "North Carolina"), ]      # Comprobamos que el cambio se ha efectuado
#                 hsg illi inco lifex  pop   reg
# South Carolina 37.8  2.3 3635 67.96 2816 South
# North Carolina 38.5  1.8 3875 69.21 5441 South




#######################
##    EJERCICIO 2    ##
#######################


# Reproducir los gráficos adjuntados (Gráficos.png)

quartz()
# 1
reg.ord1 <- with(states77, reorder(reg, -lifex, median))
means1 <- with(states77, round(tapply(lifex, reg.ord1, mean), 1))

# 2
reg.ord2 <- with(states77, reorder(reg, -hsg, median))
means2 <- with(states77, round(tapply(hsg, reg.ord2, mean), 1))

# Preparamos la ventana para recibir los dos gráficos en la forma en la que lo queremos
par(mfrow = c(1, 2), las = 1, font = 2, font.lab = 2, font.axis = 3, cex.main = 1.5, cex.lab = 1.4, cex.axis = 1.3)

# 1
boxplot(lifex ~ reg.ord1, states77, xlab = "Region", col = 2:5, pars = list(boxwex = 0.65))
points(1:4, means1, pch = 15, cex = 1.5)
legend("bottom", "Mean", pch = 15, bty = "n", cex = 1.5)
title("Life expentancy")

# 2
boxplot(hsg ~ reg.ord2, states77, xlab = "Region", col = 2:5, pars = list(boxwex = 0.65))
points(1:4, means2, pch = 15, cex = 1.5)
legend("bottom", "Mean", pch = 15, bty = "n", cex = 1.5)
title("Percent of high-school graduates")



