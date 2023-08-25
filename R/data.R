#' @title Luentoesimerkki frekvenssijakaumasta
#' @description Luentoesimerkki frekvenssijakaumasta
#' @format Aineisto, jossa 7 riviä ja 2 muuttujaa:
#' \describe{
#'   \item{\code{id}}{integer juokseva numero, joka yksilöi henkilöt}
#'   \item{\code{sukupuoli}}{character sukupuoli, mies vai nainen} 
#'}
#' @examples
#' # frekvenssijakauma
#' table(mydataset$sukupuoli)
#' 
#' # tallennetaan objektiin taul
#' taul <- table(mydataset$sukupuoli)
#' 
#' # suhteelliset osuudet
#' prop.table(taul)
#'  
#' # prosentit
#' prop.table(taul)*100
#' 
"mydataset"