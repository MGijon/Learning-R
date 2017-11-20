gas = scan('http://verso.mat.uam.es/~joser.berrendero/datos/gas6677.dat')

# El argumento frequency se utiliza para indicar la periodicidad de la serie (en este caso mensual), 
# mientras que el argumento start indica la fecha de la primera observación (enero de 1966).

gas.ts = ts(gas, start = c(1966,1), frequency = 12)


print(gas.ts)




















# source : https://rpubs.com/joser/SeriesTemporalesBasicas