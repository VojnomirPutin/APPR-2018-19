library(ggplot2)
library(ggvis)
library(dplyr)
library(rgdal)
library(mosaic)
library(maptools)

source(file = 'lib/uvozi.zemljevid.r', encoding = 'UTF-8')

graf.prostih.delovnih.mest.regije <- ggplot((data=prosta.delovna.mesta), aes(x=Leto, y=Stevilo.prostih.delovnih.mest, col=Regija)) + geom_point() + geom_line()


graf.prostih.delovnih.mest.slovenije <- ggplot((data = prosta.delovna.mesta.slovenija), aes(x=Leto, y=Stevilo.prostih.delovnih.mest)) + geom_point() + geom_line()
plot(graf.prostih.delovnih.mest.slovenije)

