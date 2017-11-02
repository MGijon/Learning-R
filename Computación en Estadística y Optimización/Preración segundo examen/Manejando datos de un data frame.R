# (0) Comenzamos limpiando completamente el área de trabajo
# ---

rm(list = ls())
ls()                                      # Nos aseguramos de que está vacía


# (1) Cargamos los datos
# ---

load("Datos.RData")                       # En este caso los cargamos de un fichero situado en el directorio de trabajo
ls()                                      # Comprobamos que se han cargado correctamente
length(ls())

# (2) Comenzamos inspecccionando los datos antes de manipularlos
# ---

head(states77, 5)                         # Imprimimos la cabecera continente de las 5 primeras filas
class(states77)
str(states77)
summary(states77 )
names(states77)                           # Imprimimos los nombres de las variables
colnames(states77)                        # Mismo resultado que en el caso anterior
names(states77) == colnames(states77)
rownames(states77)                        # Nombras de las filas, en este caso y por ahora solamennte números
dim(states77)                             # 50 filas y 7 columnas
dim(states77)[1] == nrow(states77)        # Otra forma de obtener el número de filas
dim(states77)[2] == ncol(states77)        # Doss nuevas formas de obtener el número de columnas
ncol(states77) == length(states77)

# (3) Limpieza de los datos: eliminando missings y valores extraños
# ---

 # (3.1)  Nos aseguramos de que las variables que deben contener datos numéricos sean del tipo correcto
str(states77)                             # Las variables 'pop' e 'illi' son del tipo 'chr' cuano nos convendía que fueran numéricas, las convertiremos
summary(states77)                         # Observemos que el número de NA's es 2 en total, solamente se encuentran en la variable 'inco'

states77$pop <- as.numeric(states77$pop)
states77$illi <- as.numeric(states77$illi)

str(states77)                             # El cambio se ha efectuado correctamente
summary(states77)                         # Vemos nuevos NA's donde antes no los había

# OBS: Al hacer la conversión, los valores que antes eran caracteres pero no representaban números se han añadido 'por coerción' como NA's.

total <- 0                                # Contamos el número total de NA's en el data frame usando un bucle que lo recorre entero, ineficiente si es grande
for (n in 2:(ncol(states77)-1)){
  for (i in 1:dim(states77)[1]){
    if (is.na(states77[i,n])) total <- total +1
  }
}
print(total)
