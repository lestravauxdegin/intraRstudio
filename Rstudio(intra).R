# INFORMATIQUE POUR SCIENCES SOCIALES (INF105- 2022J)
# DEVOIR D'INTRA

# MEMBRES DU GROUPE:
 # NAISSA INGRID JACQUET (JA184143)
 # MAGDALINA JEAN (JE175643)

setwd("~/Rstudio_TD/INF_105")

 library(tidyverse)
 library(ggplot2) 
 library(openxlsx)
df <- read.xlsx("WB_HT_DATA.xlsx")


     # EXTRACTION DES DONNEES QUE NOUS AURONS A MANIPULER

# A-SERIE CHRONOLOGIQUE EN ANNEE

annee<-df[2,7:67]
annee<-as.numeric(annee)
annee


# B-CREDITS DOMESTIQUES EN POURCENTAGE DU PIB 

dom<-df[134,7:67]
dom<-as.numeric(dom)
dom


# C-CREATION D'UNE BASE DE DONNEES

df1<- data.frame(annee, dom)
df1


# D-GDP PER CAPITA (CURRENT $US)

GDP<-df[52,7:67]
GDP<-as.numeric(GDP)
GDP

# E-GROSS SAVINGS (% OF GDP)
sav<-df[50,7:67]
sav<-as.numeric(sav)
sav

# F-MODIFICATION DE LA BASE DE DONNEES

df2<-data.frame(annee, dom, GDP, sav)
df2


# G-INFLATION

inf<-df[494,7:67]
inf<-as.numeric(inf)
inf


# H-RURAL POPULATION GROWTH (annual%)

rur<-df[996,7:67]
rur<-as.numeric(rur)
rur

# I-CREATION D'UNE NOUVELLE BASE DE DONNEES

df3<-data.frame(annee, dom, GDP, sav, inf, rur)
df3
  
   # REPRODUCTION DES FIGURES 2.4 ET 3.1 FIGURANT DANS LE RAPPORT

# GRAPHIQUE DE LA FIGURE 2.4

lsav<- log(sav)
plot(annee, sav, xlab="Annees", ylab="Inf. en % PIB",type="l",cex=2, lwd=4, col=6,
     main="FIGURE 2.4-TAUX D'EPARGNE EN POURCENTAGE DU PIB",
     sub="N.B-Les donnees proviennent de la Banque Mondiale", 
     font.main=2,font.lab=4, font.sub=3, cex.main=1.3,
     col.main="purple",col.lab="red", col.sub="black", col.axis="black", fg="blue")
lines(annee, inf, col="blue", type="l")

abline(v=2008, col="red", lty= 2, lwd=2.5)
text(2007,600, "Crise des Subprimes", srt=90)
abline(v=2019, col="red", lty=2, lwd=2.5)
text(2018,600, "Covid-19",srt=90)
abline(v=2006, col="red", lty=2, lwd=2.5)
text(2005,600, "Crise financiere internationale", srt=90)
abline(v=2014, col="red", lty=2, lwd=2.5)
text(2013,600, "BIC Operationnel ",srt=90)
abline(v=2016, col="red", lty=2, lwd=2.5)
text(2015,600, "Cyclone Matthew", srt=90)



# GRAPHIQUE DE LA FIGURE 3.1


plot(annee,rur, xlab ="Annees", ylab="GDP PER CAPITA",type="l", cex=2, lwd=4,
     main="FIGURE 3.1- EVOLUTION OF GDP PER CAPITA FROM 1960 TO 2020",
     sub="SOURCE:Banque Mondiale",col.sub="black",
     col="red", col.main="black",col.lab="red", col.axis="black", fg="orange",
     font.main=2, font.lab=4, font.sub=1, cex.sub=1)

     
abline(v=2020, col=6, lty=2, lwd=2.5)
text(2019,1.7, "Covid-19",srt=90)
abline(v=2018, col=6, lty=2, lwd=2.5)
abline(v=2014, col=6, lty=2, lwd=2.5)
text(2013,1.7, "BIC Operationnel ",srt=90)
abline(v=2016, col=6, lty=2, lwd=2.5)
text(2015,1.7, "Cyclone Matthew", srt=90)