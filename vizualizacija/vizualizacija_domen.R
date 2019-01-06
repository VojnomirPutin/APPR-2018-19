library(ggplot2)
library(ggvis)
library(dplyr)
library(rgdal)
library(mosaic)
library(maptools)
library(ggmap)
library(mapproj)

graf_bdppc <- ggplot(data = bdppc, aes(x=Leto, y=Kolicina_eur, col=Drzava)) + geom_point() + geomline()
#graf_bdppc <- graf_bdppc + geom_bar(stat = 'identity', position = 'dodge')
#to se malo polepsaj

#plot(graf_bdppc)



