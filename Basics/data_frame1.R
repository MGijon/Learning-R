# Definiremos varios vectores y listas y veremos que su conversión
# a data.frame dan lugar a estucturas muy distintas

## Primero con listas:

P1 = list("person" = "Pepe", "Ages" = 12, "heights" = 1.70)
P2 = list("person" = "Juan", "Ages" = 34, "heights" = 1.80)

useless = data.frame(P1, P2)
summary(useless)
head(useless)
useless

# intentaremos sacar datos de la manera ordinara para ver por 
# qué hacerlo así es una mala idea
useless$person # solo nos devuelce a Pepe... ¿y Juan?

# Juan no aparece porque automáticamente, veamos la tabla, ha cambiado el 
# nombre para que las variables no se repitan añadiendo un '.1'
useless$person.1 # ahí está Juan!!

# esto es un coñazo para almacenar datos de manera eficiente... por eso 
# HACERLO ASÍ ES UNA MALA IDEA

## Ahora con listas: (ESTA, POR RAZONES OBVIAS, SERÁ NUESTRA PREDILECCIÓN)

persons = c("Pepe", "Jose", "Juan", "Ramiro", "Elvira", "María")
ages = c(12, 23, 34, 53, 25, 22)
heights = c(1.70, 1.50, 1.80, 1.75, 1.78, 1.76)
weight = c(79, 68, 80, 90, 70, 71)

table = data.frame(Names = persons, Ages = ages, Heights = heights, Weight = weight)
summary(table)
head(table)

save(table, file = "datos_data_frame1.RData")    # guardamos los datos en un archivo de datos de R

names(table)

###########################################################################

# Ahora 'jugaremos' un poco con el data.frame

# cambiamos todos los nombre a minúsculas
names(table) <-  tolower(names(table))
names(table)

# los limitamos ahora a un máximo de 2 letras
names(table) <- substr(names(table), 1, 2)
names(table)

head(table)

# crearemos un nuevo conjunto de datos y lo añadiremos a nuestro data.frame
n.brothers <- c(0, 1, 2, 3, 4, 5)
table$n.brothers <- n.brothers

head(table)

# número medio de hermanos
mean(table$n.brothers)      # 2.5

# altura media
mean(table$he)              # 1.715

# peso medio
mean(table$we)              # 76.33333

# correlación entre la altura y el peso
cor(table$he, table$we)     # 0.4112864


# ahora nos moveremos por el data.frame sacando diferentes datos de varias maneras

table

  ## datos de Elvira
table[which(table$na == "Elvira"), "ag"]
table[which(table$na == "Elvira"), "he"]
table[which(table$we == "Elvira"), "we"]
table[which(table$na == "Elvira"), "n.brothers"]

# también

table["Elvira", "we"]

# eliminaremos la columna con los números a la izquierda:
rownames(table)
rownames(table) <- table$na
# ahora elimino la variable repetida
table$na <- NULL
table

# Podemos extraer todos los datos de una persona tratando la variable
# nombre como el indicador de fila (igual que antes, pero sin molestos números...)
table["Pepe", ]
table["Elvira", ]

# o un dato concreto:
table["Elvira", "we"]

head(table)

# análogamente al rowname, podemos obtener los nombres de las columnas, 
# esto es, de las variables almacenadas, de la siguiente manera:
colnames(table)
class(colnames(table))
