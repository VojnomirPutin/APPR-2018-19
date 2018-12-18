#2. faza: Uvoz podatkov
#sl <- locale("sl", decimal_mark=",", grouping_mark=".")

#

# 1. tabela: delovno aktivno prebivalstvo
#stolpci <- c('2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016')
delovno.aktivno.prebivalstvo <- read.csv2(file = 'podatki/delovno_aktivno_prebivalstvo_1.csv', skip = 3,
                                          header = TRUE, sep = ';', dec = '.', fill = TRUE, strip.white = TRUE,
                                          fileEncoding = 'Windows-1250', nrows = 53, check.names = TRUE, 
                                          blank.lines.skip = TRUE, skipNul = FALSE, na = c('-', ''))




# 2. tabela: povprecne mesecne place po deajvnostih
povprecne.mesecne.place.dejavnosti <- read.csv2(file = 'podatki/povprecne_mesecne_place_dejavnosti.csv', skip = 3, 
                                                header = TRUE, sep = ';', dec = '.', fill = TRUE, strip.white = TRUE, 
                                                encoding = 'Windows-1250', nrows = 3134, check.names = TRUE,
                                                skipNul = FALSE, na = c('-', ''))

                                          
                                          