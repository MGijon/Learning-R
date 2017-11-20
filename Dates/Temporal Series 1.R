#  Datos mensuales del consumo de gasolina en España entre enero de 1966 y agosto de 1977.
gas = scan('http://verso.mat.uam.es/~joser.berrendero/datos/gas6677.dat')

# Si queremos que R trate a un objeto como serie temporal, tenemos que determinar apropiadamente 
# sus características con el comando ts. Para definir la serie correctamente escribimos:
gas.ts = ts(gas, start = c(1966,1), frequency = 12)

# El argumento frequency se utiliza para indicar la periodicidad de la serie (en este caso mensual), 
# mientras que el argumento start indica la fecha de la primera observación (enero de 1966).
print(gas.ts)


plot(gas.ts)

# Si queremos comparar la distribución del consumo de gasolina para cada mes, un gráfico útil es:
boxplot(gas.ts ~ cycle(gas.ts))

# El comando cycle determina la unidad de tiempo a la que pertenece cada observación de la serie:
cycle(gas.ts)



gas.ts.desc = decompose(gas.ts)
plot(gas.ts.desc, xlab='Año')











# source : https://rpubs.com/joser/SeriesTemporalesBasicas