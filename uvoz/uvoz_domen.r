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
                                         'Delez', 'krnekaj'), na = c(':', ''))
smrti_avti_bus <- smrti_avti_bus[,-6]
smrti_avti_bus <- smrti_avti_bus[,-3]


#Tabela 4

smrti_vlak <- read.csv('podatki/smrti_vlak.csv', encoding = 'windows-1250',
                           col.names = c('Leto', 'Drzava', 'unit', 'accident', 'victim',
                                         'pers_inv', 'stevilo', 'krnekaj'), na = c(':', ''))
smrti_vlak <- smrti_vlak[,-8]
smrti_vlak <- smrti_vlak[,-6]
smrti_vlak <- smrti_vlak[,-5]
smrti_vlak <- smrti_vlak[,-4]
smrti_vlak <- smrti_vlak[,-3]




