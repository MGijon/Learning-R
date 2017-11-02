## Ejemplo 1:
## ---------

load("Datos_immuno.RData")
ls()
str(immulong)
head(immulong, 5)

immulong$datvisit[1:10]
class(immulong$datvisit)

wds <- table(weekdays(immulong$datvisit))
wds
class(wds)

## Ejemplo 2:
## ---------

with(immulong, table(sex, group))
t <- with(immulong, table(sex, group))
t
which(t == 57) # así es como se numeran estos objetos, NO SON MATRICES!!
which(t == 54)
which(t == 18)
which(t == 42)

t[which.max(t)]

mosaicplot(t)

## Ejemplo 3:
## ---------

tt <- table(rpois(100, 5))
tt

mosaicplot(tt)

## Ejemplo 4:
## ---------

dias <- c("Lunes", "Martes", "Miércoles", "Jueves", "Viernes")
horas_trabajo <- c(5, 7.5, 7.45, 5.9, 5)
t <- table(dias, horas_trabajo)
t
t[1,1]
t["dias"]
t["Lunes"]
t["Lunes", "5"]

mosaicplot(t)
barplot(t)

## Ejemplo 5:
## ---------

# source : http://www.cyclismo.org/tutorial/R/tables.html