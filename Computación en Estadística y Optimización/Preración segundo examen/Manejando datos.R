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
dim(states77)[2] == ncol(states77)        # doDoss nuevas formas de obtener el número de columnas
ncol(states77) == length(states77)

# acceso a los elementos de un data frame

states77$pop[1:50]

# ahora limpiaremos los datos eliminando missings y valores extraños
states77
  # ¿cómo puedo imprimir solo los caracteres que representan valores no numéricos, es decir, los que estoy buscando=
head(states77)

for (n in 1:ncol(states77)){
  if (!is.numeric(states77[,n])) print(states77[,n])
}
str(states77)
# el problema de esto es que las variables 'pop' e 'illi' son chr y que estoy incluyendo las chr también, 
# primero convertiré las dos primeras y luego buscaré en las numéricas

states77$pop <- as.numeric(states77$pop)
states77$illi <- as.numeric(states77$illi)

str(states77)
for (n in 3:(ncol(states77)-1)){
  if (!is.numeric(states77[,n])) print(states77[,n])
}
# el problema es que ahora todos son numéricos... mierda!!

# empiezo de nuevo
load("Datos.RData")
str(states77)
for (n in 3:(ncol(states77)-1)){
  for (i in 1:dim(states77)[1]){
    if (is.na(states77[i,n])) print(states77[i,n])
  }
}
# no ayuda en absoluto

is.numeric(3)
is.numeric("3")
is.numeric(as.numeric("3"))
is.numeric(as.numeric("*")) # pero a partir de aquí no sé como utilizar esta información
print(is.numeric(as.numeric("*")))

summary(states77)

states77$pop <- as.numeric(states77$pop)
states77$illi <- as.numeric(states77$illi)

summary(states77)
# Ahora si que podemos buescar los NA (asteriscos y demás introducudos por coerción)
total <- 0
for (n in 2:(ncol(states77)-1)){
  for (i in 1:dim(states77)[1]){
    if (is.na(states77[i,n])) total <- total +1
  }
}
print(total)
