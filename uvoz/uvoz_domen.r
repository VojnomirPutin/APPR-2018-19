library(readr)
library(dplyr)
library(tidyr)

#Tabela 1 

delez_ljudi <- read.csv('podatki/ljudje_delezi.csv', encoding = 'windows-1250',
                    col.names = c('Leto', 'Drzava', 'Prevozno_sredstvo', 'krnekaj',
                                  'Delez', 'krnekaj'), na = c(':', ''))
delez_ljudi <- delez_ljudi[,-6]
delez_ljudi <- delez_ljudi[,-4]


#Tabela 2

delez_tovora <- read.csv('podatki/tovor_delezi.csv', encoding = 'windows-1250',
                        col.names = c('Leto', 'Drzava', 'Nacin_prevoza', 'krnekaj',
                                      'Delez', 'krnekaj'), na = c(':', ''))
delez_tovora <- delez_tovora[,-6]
delez_tovora <- delez_tovora[,-4]


#Tabela 3

smrti_avti_bus <- read.csv('podatki/smrti_avti_busi.csv', encoding = 'windows-1250',
                           col.names = c('Leto', 'Drzava', 'krnekaj', 'Prevozno_sredstvo',
                                         'Stevilo', 'krnekaj'), na = c(':', ''))
smrti_avti_bus <- smrti_avti_bus[,-6]
smrti_avti_bus <- smrti_avti_bus[,-3]


#Tabela 4

smrti_vlak <- read.csv('podatki/smrti_vlak.csv', encoding = 'windows-1250',
                           col.names = c('Leto', 'Drzava', 'unit', 'accident', 'victim',
                                         'pers_inv', 'Stevilo', 'krnekaj'), na = c(':', ''))
smrti_vlak <- smrti_vlak[,-8]
smrti_vlak <- smrti_vlak[,-6]
smrti_vlak <- smrti_vlak[,-5]
smrti_vlak <- smrti_vlak[,-4]
smrti_vlak <- smrti_vlak[,-3]


#Tabela 5

greenhouse_gas <- read.csv('podatki/greenhouse_gas.csv', encoding = 'windows-1250',
                       col.names = c('Leto', 'Drzava', 'airpol', 'nace', 'unit',
                                     'Kolicina(kg)', 'krnekaj'), na = c(':', ''))
greenhouse_gas <- greenhouse_gas[,-7]
greenhouse_gas <- greenhouse_gas[,-5]
greenhouse_gas <- greenhouse_gas[,-4]
greenhouse_gas <- greenhouse_gas[,-3]


#Tabela 6

bdppc <- read.csv('podatki/bdppc.csv', encoding = 'windows-1250',
                           col.names = c('Leto', 'Drzava', 'unit', 'na', 'Kolicina(€)',
                                         'krnekaj'), na = c(':', ''))
bdppc <- bdppc[,-6]
bdppc <- bdppc[,-4]
bdppc <- bdppc[,-3]


#Tabela 7

#smrti <- left_join(smrti_avti_bus, smrti_vlak, by="Stevilo")
#test <- spread(smrti_avti_bus, convert = TRUE)







