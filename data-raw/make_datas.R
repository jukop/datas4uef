## code to prepare `mydataset` dataset goes here

esim_jakauma_dat <- data.frame(id=1:7,
                               sukupuoli=c("mies","nainen","nainen","nainen","mies","nainen","mies"))

usethis::use_data(esim_jakauma_dat, overwrite = TRUE)
#sinew::makeOxygen(esim_jakauma_dat,fileCon)

## -----

set.seed(42)
nsim <- 35
pmies <- 0.4
sukup <- rbinom(nsim,1,pmies) # 1 = mies
ikä <- rpois(nsim,lambda=23.4+sukup*0.8)
#table(ikä)
pituus <- round(rnorm(nsim,mean=165+sukup*17,sd=12),0)
#pituus
paino <- rnorm(nsim,mean=53+sukup*17+(pituus-mean(pituus))*0.2,sd=3.5)
pääaine <- as.vector(1:5 %*% rmultinom(nsim+5,size=1,prob=c(0.1,0.1,0.1,0.1,0.1)))
#table(pääaine)
# 	TK1K TILTK TTRA2 YM3 TTBiomed2
#?rmultinom
#plot(pituus,paino,col=sukup+1)
hlotsim_dat <- data.frame(sukupuoli=c(1,1,0,1,0,sukup), #c("mies","mies","nainen","mies","nainen"),
                          ikä      =c(27,26,23,17,25,ikä),
                          pituus   =c(194,170,165,170,168,pituus),
                          paino    =round(c(80,67,47,61,50,paino),1),
                          pääaine  =pääaine)
hlotsim_dat$sukupuoli <- factor(hlotsim_dat$sukupuoli,levels=0:1,labels=c("nainen","mies"))
hlotsim_dat$pääaine <- factor(hlotsim_dat$pääaine,levels=1:5,labels=c("TK1K","TILTK","TTRA2","YM3","TTBiomed2"))

usethis::use_data(hlotsim_dat, overwrite = TRUE)
# muutos
#sinew::makeOxygen(hlotsim_dat)

## -----

aineistoA_dat <- read.csv("data-raw/elearn-datat/AineistoA.csv", sep = ";")

names(aineistoA_dat) <- c("lomakenro","sukupuoli","ikä","tiedekunta",
                          "opiskeluvuosi","matem_pisteet","tarpeellisuus",
                          "välikoe1","välikoe2")
aineistoA_dat
aineistoA_dat$sukupuoli <- factor(aineistoA_dat$sukupuoli,levels=1:2,labels=c("mies","nainen"))
aineistoA_dat$tiedekunta <- factor(aineistoA_dat$tiedekunta,levels=1:3,
                                   labels=c("yhteiskuntatieteiden","kasvatustieteiden","humanististen tieteiden"))
aineistoA_dat$tarpeellisuus <- factor(aineistoA_dat$tarpeellisuus,levels=1:3,labels=c("täysin tarpeeton", "yhdentekevä", "hyvin tarpeellinen"))
summary(aineistoA_dat)

usethis::use_data(aineistoA_dat, overwrite = TRUE)
# sinew::makeOxygen(aineistoA_dat)

# kysely.csv on harkka6ssa

kysely_dat <- read.csv("data-raw/elearn-datat/kysely.csv")
kysely_dat$k1 <- factor(kysely_dat$k1, levels=1:2, labels=c("nainen","mies"))
library(labelled)
var_label(kysely_dat$k11) <- "Luentosarjaan kuuluu 4 viikkotuntia luentoja. Kuinka monta
tuntia viikossa arvioit käyttäväsi tämän lisäksi kurssin itsenäiseen opiskeluun keskimäärin?"
names(kysely_dat) <- c("sukupuoli","itseopiskelu")

usethis::use_data(kysely_dat, overwrite = TRUE)
# sinew::makeOxygen(kysely_dat)

## -----
v2018 <- c(11.2, 10.4, 10.8, 11.6, 12.5, 10.1, 11.0, 11.2, 12.4, 10.6)
v2020 <- c(11.5, 12.0, 11.6, 11.8, 10.4, 10.8, 12.2, 11.9, 12.4, 12.6)
pcb.data <- data.frame(aika = rep(c("2018", "2020"), each = length(v2018)),
                       pcb = c(v2018,v2020))
pcb.data$aika <- factor(pcb.data$aika)
usethis::use_data(pcb.data, overwrite = TRUE)

# # Harj 6 tehtävä 3 ja 4 (3op)
# library(car) # funktiota "leveneTest" varten
# levels(kysely$sukupuoli)
# leveneTest(itseopiskelu ~ sukupuoli, data=kysely)
# t.test(itseopiskelu ~ sukupuoli,data=kysely, paired=F, var.equal=T)
# aggregate(itseopiskelu ~ sukupuoli,data=kysely,FUN=mean)
#
# # vanha tyyli ratkaista
# leveneTest(a$k11, factor(a$k1))
# t.test(a$k11[a$k1==1], a$k11[a$k1==2], paired=F, var.equal=T)

# Monisteen luku 3 esimerkki 3.4 ja 3.5
# Tallennetaan muuttujaan country tutkimuksessa olleet maat
country <- c("Australia","Belgia","Tanska","Ranska","Irlanti","Alankomaat","Norja","Ruotsi","Englanti","Länsi-Saksa","Itävalta","Kanada","Suomi","Islanti","Uusi-Seelanti","Espanja","Sveitsi","Yhdysvallat")

# Tallennetaan muuttujaan alko ja death vuotuinen viininkulutus ja sydäntautikuolleisuus
alko <- c(2.5,2.9,2.9,9.1,0.7,1.8,0.8,1.6,1.3, 2.7,3.9,2.4,0.8, 0.8,1.9, 6.5, 5.8, 1.2)
death <- c(211,131,220,71,300,167,227,207,285,172,167,191,297,211,266,86,115,199)
viini_dat <- data.frame(country,alko,death)
usethis::use_data(viini_dat, overwrite = TRUE)

# Monisteen luku 3 esimerkki 3.6
alko_tupakka <- data.frame(alue = c("North", "Yorkshire", "Northeast", "East Midlands", "West Midlands", "East Anglia", "Southeast", "Southwest", "Wales", "Scotland", "Northern Ireland"), alkoholi = c( 6.47, 6.13, 6.19, 4.89, 5.63, 4.52, 5.89, 4.79, 5.27, 6.08, 4.02), tupakkatuotteet = c(4.03, 3.76, 3.77, 3.34, 3.47, 2.92, 3.20, 2.71, 3.53, 4.51, 4.46))
usethis::use_data(alko_tupakka, overwrite = TRUE)


## -----
# Harjoitus 8 koneet A ja B aineisto pitkässä muodossa
KoneA <- c(24, 25, 26, 24, 26, 27, 26, 26)
KoneB <- c(34, 30, 28, 25, 30, 28, 25, 28)
koneet_dat <- data.frame(mitalinpaino=c(KoneA, KoneB),kone=factor(rep(c("Kone A","Kone B"),times=c(length(KoneA), length(KoneB)))))
rm(kone,group,KoneA,KoneB)
usethis::use_data(koneet_dat, overwrite = TRUE)
#sinew::makeOxygen(koneet_dat,fileCon)
