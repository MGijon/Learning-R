## ============ ##
## EJERCICIO 3: ##
## ============ ##

#install.packages("XML")
library(XML)

FUTBOL <- function(country, year = 2017){
  # -------------------------------------------------------
  # v1 : Rank
  # v2 : no contiene información
  # v3 : Team
  # v4 : Matches
  # V5 : Victories
  # v6 : Defeats
  # v7 : Ties 
  # v8 : Goals
  # v9 : ?
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
        url17ENG <- "http://www.livefutbol.com/calendario/eng-premier-league-2016-2017-spieltag/38/"
        liga17ENG <- readHTMLTable(url17ENG, header = TRUE)[[4]]
        print(paste0('Champion in England in 2017: ', liga17ENG$V3[1]))
      }
      # ITALY
      # -----
      if (country == paises_posibles[3]) {
        url17ITL <- "http://www.livefutbol.com/calendario/ita-serie-a-2016-2017-spieltag/38/"
        liga17ITL <- readHTMLTable(url17ITL, header = TRUE)[[4]]
        print(paste0('Champion in Italy in 2017: ', liga17ITL$V3[1]))
      }
      # GERMANY
      # -------
      if (country == paises_posibles[4]) {
        url17GER <- "http://www.livefutbol.com/calendario/bundesliga-2016-2017-spieltag/34/"
        liga17GER <- readHTMLTable(url17GER, header = TRUE)[[4]]
        head(liga17GER)
        print(paste0('Champion in Germany in 2017: ', liga17GER$V3[1]))
      }
    }
    else {
      ############
      
      # SPAIN
      # -----
      if (country == paises_posibles[1]) {
        url <- paste0("http://www.livefutbol.com/calendario/esp-primera-division-", toString(year), "-", toString(year + 1), "-spieltag/38/")
        liga <- readHTMLTable(url, header = TRUE)[[4]]
        print(paste0('Champion in Spain in ', toString(year), ': ', liga$V3[1]))
      }
      # ENGLAND
      # -------
      if (country == paises_posibles[2]) {
        url <- paste0("http://www.livefutbol.com/calendario/eng-premier-league-", toString(year), "-", toString(year + 1), "-spieltag/38/")
        liga <- readHTMLTable(url, header = TRUE)[[4]]
        print(paste0('Champion in England in ', toString(year), ': ',liga$V3[1]))
      }
      # ITALY
      # -----
      if (country == paises_posibles[3]) {
        url <- paste0("http://www.livefutbol.com/calendario/ita-serie-a-", toString(year), "-", toString(year + 1), "-spieltag/38/")
        liga <- readHTMLTable(url, header = TRUE)[[4]]
        # hasta el 2004hay datos de la liga italiana, antes solo del vencendor de la Champions League
        if (year >= 2004){
          print(paste0('Champion in Italy in ', toString(year), ': ',liga$V3[1]))
        }
        else {
          print(paste0('Champion in Italy in ', toString(year), ': ',liga[1, -1]))
        }
      }
      # GERMANY
      # -------
      if (country == paises_posibles[4]) {
        url17GER <- "http://www.livefutbol.com/calendario/bundesliga-2016-2017-spieltag/34/"
        liga17GER <- readHTMLTable(url17GER, header = TRUE)[[4]]
        head(liga17GER)
        print(paste0('Champion in Germany in ', toString(year), ': ',liga17GER$V3[1]))
      }
      
      ############
    }
  }
}

FUTBOL('Spain', 2017)
FUTBOL('England')
FUTBOL('Italy')
FUTBOL('Germany')
FUTBOL('otro')

FUTBOL('Spain', 2001)
FUTBOL('Spain', 2006)
FUTBOL('Spain', 2015)

FUTBOL('England', 2016)
FUTBOL('England', 2004)
FUTBOL('England', 1990)

FUTBOL('Italy', 2012)
FUTBOL('Italy', 1999)
FUTBOL('Italy', 2000)
FUTBOL('Italy', 2001)
FUTBOL('Italy', 2002)
FUTBOL('Italy', 2003)
FUTBOL('Italy', 2004)
