## code to prepare `mydataset` dataset goes here

esim_jakauma_dat <- data.frame(id=1:7,
                               sukupuoli=c("mies","nainen","nainen","nainen","mies","nainen","mies"))

usethis::use_data(esim_jakauma_dat, overwrite = TRUE)
writeLines(sinew::makeOxygen(esim_jakauma_dat),file("man/esim_jakauma_dat.Rd"))

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
writeLines(sinew::makeOxygen(aineistoA_dat),file("man/aineistoa_dat.Rd"))

# kysely.csv on harkka6ssa

kysely_dat <- read.csv("data-raw/elearn-datat/kysely.csv")
kysely_dat$k1 <- factor(kysely_dat$k1, levels=1:2, labels=c("nainen","mies"))
library(labelled)
var_label(kysely_dat$k11) <- "Luentosarjaan kuuluu 4 viikkotuntia luentoja. Kuinka monta
tuntia viikossa arvioit käyttäväsi tämän lisäksi kurssin itsenäiseen opiskeluun keskimäärin?"
names(kysely_dat) <- c("sukupuoli","itseopiskelu")

usethis::use_data(kysely_dat, overwrite = TRUE)
writeLines(sinew::makeOxygen(kysely_dat),file("man/kysely_dat.Rd"))

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
