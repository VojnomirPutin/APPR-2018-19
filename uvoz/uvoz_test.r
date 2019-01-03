#2. faza: Uvoz podatkov
#sl <- locale("sl", decimal_mark=",", grouping_mark=".")

#
library(dplyr)
library(tidyr)


# myspread <- function(df, key, value) {
#   # quote key
#   keyq <- rlang::enquo(key)
#   # break value vector into quotes
#   valueq <- rlang::enquo(value)
#   s <- rlang::quos(!!valueq)
#   df %>% gather(variable, value, !!!s) %>%
#     unite(temp, !!keyq, variable) %>%
#     spread(temp, value)
# }

# 1. tabela: delovno aktivno prebivalstvo

delovno.aktivno.prebivalstvo <- read.csv2(file = 'podatki/delovno_akti_preb.csv', header = TRUE, skip = 4,
                                          sep = ';', dec = '.', fill = TRUE, strip.white = TRUE,
                                          fileEncoding = 'Windows-1250', nrows = 694, check.names = TRUE, 
                                          blank.lines.skip = TRUE, skipNul = FALSE, na = c('-', '', ' '),
                                          col.names = c('Regija', 'Leto', 'Spol', 'Delovno aktivno prebivalstvo po prebivaliscu',
                                                        'Registrirane brezposelne osebe', 'Stopnja registrirane brezposelnosti'))


#test1 <- myspread(delovno.aktivno.prebivalstvo, Spol, c(Delovno.aktivno.prebivalstvo.po.prebivaliscu, Registrirane.brezposelne.osebe, Stopnja.registrirane.brezposelnosti) )


delovno.aktivno.prebivalstvo <- delovno.aktivno.prebivalstvo %>% fill(1:2) %>% filter(Spol != ' ')
#spread(delovno.aktivno.prebivalstvo, Spol, Delovno.aktivno.prebivalstvo.po.prebivaliscu, Registrirane.brezposelne.osebe, Stopnja.registrirane.brezposelnosti)

# 2. tabela: povprecne mesecne place po deajvnostih
povprecne.mesecne.place.dejavnosti <- read.csv2(file = 'podatki/mesec_place_dejavnosti.csv', skip = 4, 
                                                header = TRUE, sep = ';', dec = '.', fill = TRUE, strip.white = TRUE, 
                                                encoding = 'Windows-1250', nrows = 3134, check.names = TRUE,
                                                skipNul = FALSE, na = c('-', ' '), col.names = c('Regija', 'Dejavnost', 'Leto', 'Plača za obodbje v EUR',
                                                                                                 'Plača za delano uro v obdobju v EUR', 'Indeks spremembe plače glede na prejšnje obdobje'))


povprecne.mesecne.place.dejavnosti <- povprecne.mesecne.place.dejavnosti %>% fill(1:3) %>% filter(Plača.za.obodbje.v.EUR != '')


# 3. tabela: Statistika prostih delovnih mest
prosta.delovna.mesta <- read.csv2(file = 'podatki/statistika_prostih_dmest.csv', header= TRUE, skip = 2, sep = ';', dec = '.', fill = TRUE,
                                  strip.white = TRUE, fileEncoding = 'Windows-1250', nrows = 171, blank.lines.skip = TRUE, skipNul = FALSE, na = c('-', '', ' '),
                                  col.names = c('Regija', 'Leto', 'Stevilo prostih delovnih mest', 'Stevilo zasedenih delovnih mest', 'Stopnja prostih delovnih mest', 'Stopnja prostih delovnihi mest 10+'))


prosta.delovna.mesta <- prosta.delovna.mesta %>% fill(1:2)%>% filter(Stevilo.prostih.delovnih.mest != '')


# 4. tabela: stevilo zaposlenih glede na plačilni razred, neto placa

placilni.razredi <- read.csv2(file = 'podatki/placilni_razredi.csv', header = TRUE, sep = ';', dec = '.', fill = TRUE, strip.white =  TRUE, fileEncoding = 'Windows-1250',
                              blank.lines.skip = TRUE, skipNul = FALSE, na = c('-', '', ' '), skip = 3, nrows = 2747,
                              col.names = c('Regija', 'Placilni razred', 'Leto', 'Skupaj.spol', 'Moski', 'Zenske'))
placilni.razredi <- placilni.razredi %>% fill(1:2) %>% filter(Skupaj.spol != ' ')
placilni.razredi <- placilni.razredi[,-4]
placilni.razredi <- placilni.razredi %>% gather(Spol, Neto.placa, 4:5)


write.csv2(delovno.aktivno.prebivalstvo,'podatki/tidy_delovno_aktivno_prebivalstvo.csv', fileEncoding = 'UTF-8')
write.csv2(povprecne.mesecne.place.dejavnosti, 'podatki/tidy_povprecne_mesecne_place.csv', fileEncoding = 'UTF-8')
write.csv2(prosta.delovna.mesta,'podatki/tidy_prosta_delovna_mesta.csv', fileEncoding = 'UTF-8')
write.csv2(placilni.razredi,'podatki/tidy_placilni_razredi.csv', fileEncoding = 'UTF-8')

