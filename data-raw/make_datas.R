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
                          paino    =c(80,67,47,61,50,paino),
                          pääaine  =pääaine)
hlotsim_dat$sukupuoli <- factor(hlotsim_dat$sukupuoli,levels=0:1,labels=c("nainen","mies"))
hlotsim_dat$pääaine <- factor(hlotsim_dat$pääaine,levels=1:5,labels=c("TK1K","TILTK","TTRA2","YM3","TTBiomed2"))

usethis::use_data(hlotsim_dat, overwrite = TRUE)
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
