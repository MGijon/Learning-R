### ============================================
### Soluciones aportadas al test del primer día:
### ============================================

## Ejercicio 1
## ===========

set.seed(1609)
edades <- rpois(20, 40)
alturas <- round(rnorm(20, 175, 10), 2)

# (a)

max(alturas)

# (b)

minimo_alutas <- which(alturas == min(alturas))
edades[minimo_alutas]

  # alternativa a aplicar solamente si no hay repeticiones:
  min_alturas <- which.min(alturas)
  edades[min_alturas]
  
# (c)
  
sum(edades %in% 30:40)
  
# (d)

carrera <- factor(sample( c("Estadística", "Física", "Biología", "Medicina"), 20, replace = T))
carrera

# (e)

median(edades[carrera %in% c("Física", "Medicina")])

    # alternativa:
    median(edades[as.numeric(carrera) > 2])

# (f)
    
levels(carrera)
levels(carrera)[2:3] <- c("Stats", "Phys")

# (g)

datframe <- data.frame(Edad = edades, Altura = alturas, Carrera = carrera)
save(datframe, file = "Test0.RData")


## Ejercicio 2
## ===========

state.x77
state.region

# (a)

class(state.x77)

# (b)

ncol(state.x77)

# (c)

states77 <- data.frame(state.x77)
states77$Region <- state.region
head(states77)
  
    # alternatica, en un solo paso:
    states77 <- data.frame(state.x77, Region = state.region)

# (d)
  
states77$HS.Grad <- states77$Frost <- NULL
  
    # alternativa:
    states77 <- subset(states77, select = -c(HS.Grad, Frost))
    head(states77, 4)
    
names(states77) <- substr(tolower(names(states77)), 1, 4)
names(states77)

# (e)

states77[c("Alabama", "Wyoming"), "life"] <- NA
 
# (f)

  # Use the complete data set
round(cor(states77[c("inco", "illi", "life")], use = "c"), 3)

  # Using pairwise complete observations
round(cor(states77[c("inco", "illi", "life")], use = "p"), 3)

# (g)

tap <- with(states77, tapply(inco, regi, mean))
which.max(tap)
max(tap)

    # alternatica, en un solo paso:
    tap[which.max(tap)]
    