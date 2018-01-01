## ============ ##
## EJERCICIO 3: ##
## ============ ##

#install.packages("XML")
library(XML)


url17ENG <- "http://www.livefutbol.com/calendario/eng-premier-league-2016-2017-spieltag/38/"
liga17ENG <- readHTMLTable(url17ENG, header = TRUE)[[4]]
head(liga17ENG)

url17ITL <- "http://www.livefutbol.com/calendario/ita-serie-a-2016-2017-spieltag/38/"
liga17ITL <- readHTMLTable(url17ITL, header = TRUE)[[4]]
head(liga17ITL)

url17GER <- "http://www.livefutbol.com/calendario/bundesliga-2016-2017-spieltag/34/"
liga17GER <- readHTMLTable(url17GER, header = TRUE)[[4]]
head(liga17GER)

liga17ESP


FUTBOL <- function(country, year = 2017){
  # -------------------------------------------------------
  # v1 : Rank
  # v2 : será eliminada, no contiene información
  # v3 : Team
  # v4 : Matches
  # V5 : Victories
  # v6 : Defeats
  # v7 : Ties 
  # v8 : Goals
  # v9 : ?, por el momento la dejaré intacta
  # v10 : Score
  # -------------------------------------------------------
  paises_posibles <- c("Spain", "England", "Italy", "Germany") # para el mensaje de error o advertencia
  if (country %in% paises_posibles == FALSE) { 
    print('error con el país')
    return(0)
  }
  else{
    if (year == 2017) { 
      # SPAIN
      # -----
      if (country == paises_posibles[1]) {
        url17ESP <- "http://www.livefutbol.com/calendario/esp-primera-division-2016-2017-spieltag_2/38/"
        liga17ESP <- readHTMLTable(url17ESP, header = TRUE)[[4]]
        print(paste0('Champion in Spain in 2017: ', liga17ESP$V3[1]))
      }
      # ENGLAND
      # -------
      if (country == paises_posibles[2]) {
       
      }
      # ITALY
      # -----
      if (country == paises_posibles[3]) {
        
      }
      # GERMANY
      # -------
      if (country == paises_posibles[4]) {
        

      }
    }
    else {
      print('casi capullo')
    }
  }
}

FUTBOL('Spain', 2017)
