library(ggplot2)
library(ggvis)
library(dplyr)
library(rgdal)
library(mosaic)
library(maptools)
library(ggmap)
library(mapproj)

graf_bdppc <- ggplot(data = bdppc, mapping = aes(x=Leto, y=Kolicina_eur, fill=Drzava))
graf_bdppc <- graf_bdppc + geom_bar(stat = 'identity', position = 'dodge')
#to se malo polepsaj

#plot(graf_bdppc)



