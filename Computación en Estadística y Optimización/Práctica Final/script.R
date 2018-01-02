## ============ ##
## EJERCICIO 1: ##
## ============ ##


# (a): Utilizad las funciones del paquete RODBC para importar los datos de las tres tablas de la base de datos StudyENTE.mdb
# ---  y fusionadlos en un solo data frame.




# (b): Añ̃adid una variable (group) que indique el grupo de estudio (É́xtasis, Cannabis y Control).
# ---  Esta variable ha de ser un factor con el grupo  ́extasis como categor ́ıa de referencia.



# (c): Ordenad el data frame según el grupo de estudio y el identificador de voluntario.
# ---



# (d): ¿Cuántos casos (filas) tiene el data frame entero y cuáantos casos si se descartan aquellos con algún dato perdido
# ---  (missing)?




# (e): Convertid la variable género en un factor con valores ‘Male’ (sex == 1) y ‘Female’ (sex == 2), respectivamente.
# ---



# (f): Usad la función cut para crear una nueva variable categórica que contenga la edad de los voluntarios: 21,
# ---  22 , 24 y , 25 (años).





# (g): Cread una variable compuesta (composite variable) usando las variables corcub, sdmttoco, lnsscore y waisvocd de la siguiente manera:
# ---  se han de estandarizar las 4 variables (para que tengan media 0 y desviación estándar 1) y después sumar los 4 valores (estandarizados).





# (h): ¿Cuáles son la media, la mediana, la desviación estándar y el rango de la variable compuesta en cada grupo?
# ---




# (i): Añadid el data frame creado como nueva tabla a la base de datos StudyENTE.mdb.
# ---




# (j): Utilizad la función sqlQuery (del paquete RODBC) para extraer (solamente) las variables grupo de estudio y edad
# ---  (categorizada) de la nueva tabla de StudyENTE.mdb.







# (k): Representad la distribución condicionada de la variable edad por grupo de estudio mediante un gráfico de mosaicos.
# ---





# (l): Representad la distribución condicionada de la variable edad por grupo de estudio mediante una tabla de
# ---  contingencia usando la función CrossTable del paquete descr.







# (m): Cerrad la conexión a la base de datos StudyENTE.mdb.
# ---





# (n): Exportad vuestro data frame a un fichero EXCEL de tal manera que el fichero EXCEL contenga una hoja por cada 
# ---  grupo de estudio con nombre igual al grupo de estudio. Las tres hojas del fichero ya no deben contener la 
#      variable group. Podéis usar la función write.xlsx del paquete xlsx o la función write.xlsx del paquete openxlsx.




## ============ ##
## EJERCICIO 2: ##
## ============ ##

# Dibujad dos gráficos con los datos del Ejercicio 1 que permitan comparar el rendimiento neurocognitivo de los tres grupos de estudio.
# Usad para ello dos de las funciones que se presentan en la R Graph Gallery (https://www. r-graph-gallery.com/)

# Las dos funciones escogidas han de ser de paquetes distintos y los gráficos han de ser diferentes a los gráficos vistos en clase.
# Presentad la sintaxis e interpretad ambos gráficos.

# Gráfico 1:
# ---------






# Gráfico 2:
# ---------







## ============ ##
## EJERCICIO 3: ##
## ============ ##

# En la páagina web http://www.livefutbol.com se pueden encontrar las clasificaciones de las ligas de fútbol de muchos países en todo el mundo.

# Programad una función que devuelva los campeones de fútbol masculino de cuatro países distintos para distintas temporadas y presentad algunos ejemplos de aplicación
# de vuestra función. La salida de la función podría ser la siguiente:
  
# Se espera que la función devuelva un mensaje de error o de advertencia si se pide el campeón de un país distinto a los cuatro escogidos o de un año anterior a las
# temporadas consideradas por la función.