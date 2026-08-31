#' @title Luentoesimerkki frekvenssijakaumasta
#' @description Luentoesimerkki frekvenssijakaumasta
#' @format Aineisto, jossa 7 riviä ja 2 muuttujaa:
#' \describe{
#'   \item{\code{id}}{integer juokseva numero, joka yksilöi henkilöt}
#'   \item{\code{sukupuoli}}{character sukupuoli, mies vai nainen} 
#'}
#' @examples
#' # frekvenssijakauma
#' table(esim_jakauma_dat$sukupuoli)
#' 
#' # tallennetaan objektiin taul
#' taul <- table(esim_jakauma_dat$sukupuoli)
#' 
#' # suhteelliset osuudet
#' prop.table(taul)
#'  
#' # prosentit
#' prop.table(taul)*100
#' 
"esim_jakauma_dat"

#' @title hlotsim_dat
#' @description Keinotekoinen aineisto luentoesimerkkiä varten
#' @format A data frame with 40 rows and 5 variables:
#' \describe{
#'   \item{\code{sukupuoli}}{integer Sukupuoli}
#'   \item{\code{ikä}}{double Ikä vuosina}
#'   \item{\code{pituus}}{double Henkilön pituus cm}
#'   \item{\code{paino}}{double Henkilö paino kg}
#'   \item{\code{pääaine}}{integer Henkilön pääaine yliopistossa} 
#'}
#' @details DETAILS
"hlotsim_dat"

#' @title aineistoA_dat
#' @description Harjoitustehtävissä käytettävä aineistoA löytyy tästä.
#' @format A data frame with 50 rows and 9 variables:
#' \describe{
#'   \item{\code{lomakenro}}{integer Identifikaationa vastauslomakkeen numero}
#'   \item{\code{sukupuoli}}{integer Opiskelijan sukupuoli: 1=mies, 2=nainen}
#'   \item{\code{ikä}}{integer Opiskelijan ikä vuosina}
#'   \item{\code{tiedekunta}}{integer Opiskelijan tiedekunta: 1=yhteiskuntatieteiden, 2=kasvatustieteiden, 3=humanististen tieteiden}
#'   \item{\code{opiskeluvuosi}}{integer Opiskelijan tiedekunnassa meneillään oleva opiskeluvuosi}
#'   \item{\code{matem_pisteet}}{integer Ennen kurssia suoritetun matematiikan testin pistemäärä}
#'   \item{\code{tarpeellisuus}}{integer Vastaus kysymykseen "Kuinka tarpeellinen mielestäsi pakollinen tilastotieteen kurssi on omassa tutkinnossasi?": 1=täysin tarpeeton, 2=yhdentekevä, 3=hyvin tarpeellinen}
#'   \item{\code{välikoe1}}{integer Tilastotieteen ensimmäisen välikokeen pistemäärä}
#'   \item{\code{välikoe2}}{integer Tilastotieteen toisen välikokeen pistemäärä} 
#'}
#' @details DETAILS
"aineistoA_dat"

#' @title kysely.csv data
#' @description Aineisto kysely_dat vastaa kysely.csv -tiedoston aineistoa.
#' @format A data frame with 186 rows and 2 variables:
#' \describe{
#'   \item{\code{sukupuoli}}{integer Kyselyyn vastanneen sukupuoli}
#'   \item{\code{itseopiskelu}}{double Vastaus kysymykseen: “Luentosarjaan kuuluu 4 viikkotuntia luentoja. Kuinka monta tuntia viikossa arvioit käyttäväsi tämän lisäksi kurssin itsenäiseen opiskeluun keskimäärin?”} 
#'}
#' @details DETAILS
"kysely_dat"

#' @title PCB-pitoisuudet vuosina 2018 ja 2020
#'
#' @description Esimerkkiaineisto kahden ajankohdan PCB-pitoisuuksista.
#'
#' @format A data frame with 20 rows and 2 variables:
#' \describe{
#'   \item{\code{aika}}{factor Mittausvuosi: 2018 tai 2020}
#'   \item{\code{pcb}}{double PCB-pitoisuus}
#' }
#'
"pcb.data"

#' @title Viininkulutus ja sydäntautikuolleisuus
#'
#' @description Esimerkkiaineisto viininkulutuksen ja sydäntautikuolleisuuden yhteyden tarkasteluun.
#'
#' @format A data frame with 18 rows and 3 variables:
#' \describe{
#'   \item{\code{country}}{character Maa}
#'   \item{\code{alko}}{double Vuotuinen viininkulutus}
#'   \item{\code{death}}{double Sydäntautikuolleisuus}
#' }
#'
"viini_dat"


#' @title Alkoholin ja tupakkatuotteiden kulutus
#'
#' @description Esimerkkiaineisto alkoholin ja tupakkatuotteiden kulutuksesta Ison-Britannian alueilla.
#'
#' @format A data frame with 11 rows and 3 variables:
#' \describe{
#'   \item{\code{alue}}{character Alue}
#'   \item{\code{alkoholi}}{double Alkoholin kulutus}
#'   \item{\code{tupakkatuotteet}}{double Tupakkatuotteiden kulutus}
#' }
#'
"alko_tupakka"


#' @title Kahden koneen valmistamien mitallien painot
#'
#' @description Harjoitusaineisto kahden koneen valmistamien kappaleiden painojen vertailuun.
#'
#' @format A data frame with 16 rows and 2 variables:
#' \describe{
#'   \item{\code{mitalinpaino}}{double Valmistetun kappaleen paino}
#'   \item{\code{kone}}{factor Kone A tai Kone B}
#' }
#'
"koneet_dat"