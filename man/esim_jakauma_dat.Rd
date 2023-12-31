% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{esim_jakauma_dat}
\alias{esim_jakauma_dat}
\title{Luentoesimerkki frekvenssijakaumasta}
\format{
Aineisto, jossa 7 riviä ja 2 muuttujaa:
\describe{
  \item{\code{id}}{integer juokseva numero, joka yksilöi henkilöt}
  \item{\code{sukupuoli}}{character sukupuoli, mies vai nainen} 
}
}
\usage{
esim_jakauma_dat
}
\description{
Luentoesimerkki frekvenssijakaumasta
}
\examples{
# frekvenssijakauma
table(esim_jakauma_dat$sukupuoli)

# tallennetaan objektiin taul
taul <- table(esim_jakauma_dat$sukupuoli)

# suhteelliset osuudet
prop.table(taul)
 
# prosentit
prop.table(taul)*100

}
\keyword{datasets}
