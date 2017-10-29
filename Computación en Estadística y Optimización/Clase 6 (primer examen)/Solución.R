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


# (g) Calcular los coeficientes de correlación de Spearman entre los pares ares de las variables num ́ericas
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