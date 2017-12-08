a <- 2
a^2
a^2 == 2  #  FALSE
round(a^2, 15) == 2  #  FALSE
all.equal(a^2, 2)   # "Mean relative difference: 0.5"
identical(a^2, 2) # FALSE


flush.console() # actualización continua de la pantalla

repeat{ 
  print(rpois(3, 50))
  flush.console()
}


# try alrededor del bucle con car()
# sapply(immundop[sndad], mean, ns.rm = TRUE)
# sapply(immuno, is.nummeric)  # variables numéricas
# which(sapply(immuno, is.nummeric))     # posiciones dónde se cumple la ppremisa
                                        #  las variables son nméricas
# sapply(immuno[which(sapply(immuno, is.nummeric))], mean, ns.rm = TRUE)  # media de las varubles numéricas

ls() # muestra las variables en el área de trabajo
