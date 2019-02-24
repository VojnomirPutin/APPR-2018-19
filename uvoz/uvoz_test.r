#2. faza: Uvoz podatkov
#sl <- locale("sl", decimal_mark=",", grouping_mark=".")

#
library(dplyr)
library(tidyr)
library(readr)



# 1. tabela: delovno aktivno prebivalstvo

delovno.aktivno.prebivalstvo <- read.csv2(file = 'podatki/delovno_akti_preb.csv', header = TRUE, skip = 4,
                                          sep = ';', dec = '.', fill = TRUE, strip.white = TRUE,
                                          fileEncoding = 'Windows-1250', nrows = 694, check.names = TRUE, 
                                          blank.lines.skip = TRUE, skipNul = FALSE, na = c('-', '', ' '),
                                          col.names = c('Regija', 'Leto', 'Spol', 'Delovno aktivno prebivalstvo po prebivaliscu',
                                                        'Registrirane brezposelne osebe', 'Stopnja registrirane brezposelnosti'))


#test1 <- myspread(delovno.aktivno.prebivalstvo, Spol, c(Delovno.aktivno.prebivalstvo.po.prebivaliscu, Registrirane.brezposelne.osebe, Stopnja.registrirane.brezposelnosti) )


delovno.aktivno.prebivalstvo <- delovno.aktivno.prebivalstvo %>% fill(1:2) %>% filter(Spol != ' ')#%>%filter(Spol != 'Spol - SKUPAJ')
delovno.aktivno.prebivalstvo <- delovno.aktivno.prebivalstvo %>% filter(Spol != 'Moški')
delovno.aktivno.prebivalstvo <- delovno.aktivno.prebivalstvo %>% filter(Spol != 'Ženske')
delovno.aktivno.prebivalstvo <- delovno.aktivno.prebivalstvo[,-3]
brezposelni.Slovenija <- filter(delovno.aktivno.prebivalstvo, Regija == 'SLOVENIJA')
delovno.aktivno.prebivalstvo <- delovno.aktivno.prebivalstvo%>%filter(Regija != 'SLOVENIJA')
delovno.aktivno.prebivalstvo$Regija <- gsub('^Posavska.*', 'Spodnjeposavska', delovno.aktivno.prebivalstvo$Regija)
delovno.aktivno.prebivalstvo$Regija <- gsub('^Primorsko-notranjska.*', 'Notranjsko-kraška', delovno.aktivno.prebivalstvo$Regija)
brezposelni.Slovenija<- brezposelni.Slovenija[c(-5,-3, -1)]


#spread(delovno.aktivno.prebivalstvo, Spol, Delovno.aktivno.prebivalstvo.po.prebivaliscu, Registrirane.brezposelne.osebe, Stopnja.registrirane.brezposelnosti)



# 2. tabela: povprecne mesecne place po deajvnostih
povprecne.mesecne.place.dejavnosti <- read.csv2(file = 'podatki/mesec_place_dejavnosti.csv', skip = 4, 
                                                header = TRUE, sep = ';', dec = '.', fill = TRUE, strip.white = TRUE, 
                                                encoding = 'Windows-1250', nrows = 3134, check.names = TRUE,
                                                skipNul = FALSE, na = c('-', ' ', 'z'), col.names = c('Regija', 'Dejavnost', 'Leto', 'Plača za obodbje v EUR',
                                                                                                 'Plača za delano uro v obdobju v EUR', 'Indeks spremembe plače glede na prejšnje obdobje'))


povprecne.mesecne.place.dejavnosti <- povprecne.mesecne.place.dejavnosti %>% fill(1:3) %>% filter(Plača.za.obodbje.v.EUR != '')


# 3. tabela: Statistika prostih delovnih mest po regijah
prosta.delovna.mesta <- read.csv2(file = 'podatki/statistika_prostih_dmest.csv', header= TRUE, skip = 15, sep = ';', dec = '.', fill = TRUE,
                                  strip.white = TRUE, fileEncoding = 'Windows-1250', nrows = 171, blank.lines.skip = TRUE, skipNul = FALSE, na = c('-', '', ' '),
                                  col.names = c('Regija', 'Leto', 'Stevilo prostih delovnih mest', 'Stevilo zasedenih delovnih mest', 'Stopnja prostih delovnih mest', 'Stopnja prostih delovnihi mest 10+'))


prosta.delovna.mesta <- prosta.delovna.mesta %>% fill(1:2)%>% filter(Stevilo.prostih.delovnih.mest != '')
prosta.delovna.mesta <- prosta.delovna.mesta[,-6]

#3,5. tabela : Statistika prostih delovnih e+mest samo Slovenija
prosta.delovna.mesta.slovenija <- read.csv2(file = 'podatki/statistika_prostih_dmest.csv', header= TRUE, skip = 2, sep = ';', dec = '.', fill = TRUE,
                                  strip.white = TRUE, fileEncoding = 'Windows-1250', nrows = 12, blank.lines.skip = TRUE, skipNul = FALSE, na = c('-', '', ' '),
                                  col.names = c('Regija', 'Leto', 'Stevilo prostih delovnih mest', 'Stevilo zasedenih delovnih mest', 'Stopnja prostih delovnih mest', 'Stopnja prostih delovnihi mest 10+'))

prosta.delovna.mesta.slovenija <- prosta.delovna.mesta.slovenija %>% fill(1:2)%>% filter(Stevilo.prostih.delovnih.mest != '')
prosta.delovna.mesta.slovenija <- prosta.delovna.mesta.slovenija[,-6]


# 4. tabela: stevilo zaposlenih glede na plačilni razred, neto placa

placilni.razredi <- read.csv2(file = 'podatki/placilni_razredi.csv', header = TRUE, sep = ';', dec = '.', fill = TRUE, strip.white =  TRUE, fileEncoding = 'Windows-1250',
                              blank.lines.skip = TRUE, skipNul = FALSE, na = c('-', '', ' '), skip = 3, nrows = 2747,
                              col.names = c('Regija', 'Placilni razred', 'Leto', 'Skupaj.spol', 'Moski', 'Zenske'))
placilni.razredi <- placilni.razredi %>% fill(1:2) %>% filter(Skupaj.spol != ' ')
placilni.razredi <- placilni.razredi[,-4]
placilni.razredi <- placilni.razredi %>% gather(Spol, Neto.placa, 4:5)
placilni.razredi <- placilni.razredi%>%filter(Placilni.razred != 'Razred neto - SKUPAJ')
placilni.razredi$Leto <- gsub('^2017.*', '2017', placilni.razredi$Leto)

#5. tabela: prebivalstvo po regijah za statistično primerjavo

prebivalstvo_po_regijah <- read.csv2(file = 'podatki/prebivalstvo_po_regijah.csv', header = FALSE, skip = 1, fill = TRUE, sep = ';', dec = '.', strip.white = TRUE, 
                                     fileEncoding =  'Windows-1250', blank.lines.skip = TRUE, skipNul = FALSE, na = c('-', '', ' '), nrows = 1547, col.names = c('Regija','Spol', 'Leto', 'Ime', 'Prebivalstvo'))
prebivalstvo_po_regijah <- prebivalstvo_po_regijah[,-4]
prebivalstvo_po_regijah <- prebivalstvo_po_regijah%>%fill(1:3)%>%filter(Prebivalstvo != '')
prebivalstvo.slovenija <- filter(prebivalstvo_po_regijah, Regija == 'SLOVENIJA')
prebivalstvo_po_regijah <- prebivalstvo_po_regijah %>%filter(Regija != 'SLOVENIJA')
grp<-group_by(prebivalstvo_po_regijah, Regija, Leto)
prebivalstvo_po_regijah <- summarise(grp, Prebivalstvo=sum(Prebivalstvo, na.rm=TRUE))
grp1 <- group_by(prebivalstvo.slovenija,Regija, Leto)
prebivalstvo.slovenija <- summarise(grp1, Prebivalstvo=sum(Prebivalstvo, na.rm=TRUE))
prebivalstvo.slovenija <- prebivalstvo.slovenija[,-1]

#6. tabela: indeks izbirčnosti
indeks_izbircnosti <- left_join(filter(delovno.aktivno.prebivalstvo, Regija != 'SLOVENIJA'), prosta.delovna.mesta, by=c('Regija', 'Leto'))
indeks_izbircnosti <- indeks_izbircnosti[,-8]
indeks_izbircnosti <- indeks_izbircnosti[,-7]
indeks_izbircnosti <- indeks_izbircnosti[,-5]
indeks_izbircnosti <- indeks_izbircnosti[,-3]
indeks_izbircnosti <- indeks_izbircnosti%>%filter(Stevilo.prostih.delovnih.mest != '')
indeks_izbircnosti <- transform(indeks_izbircnosti, Indeks=(Stevilo.prostih.delovnih.mest/Registrirane.brezposelne.osebe))
indeksi <- indeks_izbircnosti[c(-3,-4)]




write.csv2(delovno.aktivno.prebivalstvo,'podatki/tidy_delovno_aktivno_prebivalstvo.csv', fileEncoding = 'UTF-8')
write.csv2(povprecne.mesecne.place.dejavnosti, 'podatki/tidy_povprecne_mesecne_place.csv', fileEncoding = 'UTF-8')
write.csv2(prosta.delovna.mesta,'podatki/tidy_prosta_delovna_mesta.csv', fileEncoding = 'UTF-8')
write.csv2(placilni.razredi,'podatki/tidy_placilni_razredi.csv', fileEncoding = 'UTF-8')
write.csv2(prebivalstvo_po_regijah,'podatki/tidy_prebivalstvo_po_regijah', fileEncoding = 'UTF-8')

