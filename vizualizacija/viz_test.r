library(ggplot2)
library(ggvis)
library(dplyr)
library(rgdal)
library(mosaic)
library(maptools)
library(anchors)

source(file = 'lib/uvozi.zemljevid.r', encoding = 'UTF-8')

graf.prostih.delovnih.mest.regije <- ggplot((data=prosta.delovna.mesta), aes(x=Leto, y=Stevilo.prostih.delovnih.mest, col=Regija)) + 
  geom_point() + geom_line() + theme_classic()

#plot(graf.prostih.delovnih.mest.regije)

graf.prostih.delovnih.mest.slovenije <- ggplot((data = prosta.delovna.mesta.slovenija), aes(x=Leto, y=Stevilo.prostih.delovnih.mest)) + geom_point() + geom_line()
#plot(graf.prostih.delovnih.mest.slovenije)

Slovenija <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/SVN_adm_shp.zip",
                             "SVN_adm1") %>% fortify()
colnames(Slovenija)[12]<-'Regije'
Slovenija$Regije <- gsub('GoriĹˇka', 'Goriška', Slovenija$Regije)
Slovenija$Regije <- gsub('KoroĹˇka', 'Koroška', Slovenija$Regije)
Slovenija$Regije <- gsub('Notranjsko-kraĹˇka', 'Notranjsko-kraška', Slovenija$Regije)
Slovenija$Regije <- gsub('Obalno-kraĹˇka', 'Obalno-kraška', Slovenija$Regije)


graf.slovenija.zemljevid <- ggplot(Slovenija, aes(x=long, y=lat, fill=Regije)) +
  geom_polygon(show.legend = TRUE, inherit.aes = TRUE) +
  labs(title="Slovenija po regijah")+
  theme_classic()

plot(graf.slovenija.zemljevid)

# graf <- ggplot() + geom_map(data = Slovenija, map = Slovenija, aes(x=long, y=lat, map_id=id, fill = Regije))+
#   theme_map() +geom_map(data=prebivalstvo_po_regijah,map_id=id, map = Slovenija, stat='identity', inherit.aes = TRUE)
# plot(graf)

graf.indeksi <- ggplot((dat=indeksi), aes(x=Leto, y=Indeks, col=Regija)) + geom_point() + geom_line()
plot(graf.indeksi)




















