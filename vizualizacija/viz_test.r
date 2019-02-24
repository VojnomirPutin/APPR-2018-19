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
colnames(Slovenija)[12]<-'Regija'
Slovenija$Regija <- gsub('GoriĹˇka', 'Goriška', Slovenija$Regija)
Slovenija$Regija <- gsub('KoroĹˇka', 'Koroška', Slovenija$Regija)
Slovenija$Regija <- gsub('Notranjsko-kraĹˇka', 'Notranjsko-kraška', Slovenija$Regija)
Slovenija$Regija <- gsub('Obalno-kraĹˇka', 'Obalno-kraška', Slovenija$Regija)


graf.slovenija.zemljevid <- ggplot(Slovenija, aes(x=long, y=lat, fill=Regija)) +
  geom_polygon(show.legend = TRUE, inherit.aes = TRUE) +
  labs(title="Slovenija po regijah")+
  theme_classic()

plot(graf.slovenija.zemljevid)

# graf <- ggplot() + geom_map(data = Slovenija, map = Slovenija, aes(x=long, y=lat, map_id=id, fill = Regije))+
#   theme_map() +geom_map(data=prebivalstvo_po_regijah,map_id=id, map = Slovenija, stat='identity', inherit.aes = TRUE)
# plot(graf)

graf.indeksi <- ggplot((data=indeksi), aes(x=Leto, y=Indeks, col=Regija)) + geom_point() + geom_line()
plot(graf.indeksi)

# tabele za zemljevide

brezposelnost.2007 <- filter(delovno.aktivno.prebivalstvo, Leto == '2007')
brezposelnost.2009 <- filter(delovno.aktivno.prebivalstvo, Leto == '2009')
brezposelnost.2011 <- filter(delovno.aktivno.prebivalstvo, Leto == '2011')
brezposelnost.2013 <- filter(delovno.aktivno.prebivalstvo, Leto == '2013')
brezposelnost.2015 <- filter(delovno.aktivno.prebivalstvo, Leto == '2015')



brezposelnost.2007 <- brezposelnost.2007[c(-2, -3, -4)]
brezposelnost.2009 <- brezposelnost.2009[c(-2, -3, -4)]
brezposelnost.2011 <- brezposelnost.2011[c(-2, -3, -4)]
brezposelnost.2013 <- brezposelnost.2013[c(-2, -3, -4)]
brezposelnost.2015 <- brezposelnost.2015[c(-2, -3, -4)]





zemljevid.2007.brezposelnost <- ggplot() +
  geom_polygon(data = right_join(brezposelnost.2007,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill = Stopnja.registrirane.brezposelnosti))+
               xlab("") + ylab("") + ggtitle('Brezposelnost v letu 2007') + theme(axis.title=element_blank(), axis.text=element_blank(),
                                                                                          axis.ticks=element_blank(), panel.background = element_blank()) + scale_fill_gradient(low = '#ffb3b3', high='#660000')

zemljevid.2009.brezposelnost <- ggplot() +
  geom_polygon(data = right_join(brezposelnost.2009,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill = Stopnja.registrirane.brezposelnosti))+
  xlab("") + ylab("") + ggtitle('Brezposelnost v letu 2009') + theme(axis.title=element_blank(), axis.text=element_blank(),
                                                                     axis.ticks=element_blank(), panel.background = element_blank()) + scale_fill_gradient(low = '#ffb3b3', high='#660000')


zemljevid.2011.brezposelnost <- ggplot() +
  geom_polygon(data = right_join(brezposelnost.2011,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill = Stopnja.registrirane.brezposelnosti))+
  xlab("") + ylab("") + ggtitle('Brezposelnost v letu 2011') + theme(axis.title=element_blank(), axis.text=element_blank(),
                                                                     axis.ticks=element_blank(), panel.background = element_blank()) + scale_fill_gradient(low = '#ffb3b3', high='#660000')
plot(zemljevid.2011.brezposelnost)

zemljevid.2013.brezposelnost <- ggplot() +
  geom_polygon(data = right_join(brezposelnost.2013,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill = Stopnja.registrirane.brezposelnosti))+
  xlab("") + ylab("") + ggtitle('Brezposelnost v letu 2013') + theme(axis.title=element_blank(), axis.text=element_blank(),
                                                                     axis.ticks=element_blank(), panel.background = element_blank()) + scale_fill_gradient(low = '#ffb3b3', high='#660000')

zemljevid.2015.brezposelnost <- ggplot() +
  geom_polygon(data = right_join(brezposelnost.2015,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill = Stopnja.registrirane.brezposelnosti))+
  xlab("") + ylab("") + ggtitle('Brezposelnost v letu 2015') + theme(axis.title=element_blank(), axis.text=element_blank(),
                                                                     axis.ticks=element_blank(), panel.background = element_blank()) + scale_fill_gradient(low = '#ffb3b3', high='#660000')


plot(zemljevid.2007.brezposelnost)
plot(zemljevid.2009.brezposelnost)
plot(zemljevid.2011.brezposelnost)
plot(zemljevid.2013.brezposelnost)
plot(zemljevid.2015.brezposelnost)


















