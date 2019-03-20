# Trg dela v Sloveniji

## Analiza podatkov s programom R, 2018/19

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2018/19

* [![Shiny](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/VojnomirPutin/APPR-2018-19/master?urlpath=shiny/APPR-2018-19/Trg_dela_v_Slovenija.Rmd) Shiny
* [![RStudio](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/VojnomirPutin/APPR-2018-19/master?urlpath=rstudio) RStudio

## Tematika
V svoji projektni nalogi bom analiziral trg dela v Sloveniji, v različnih obdobjih po statističnih regijah. 

## Podatki
Po tabelah bom najprej analiziral delovno aktivno prebivalsto, brezposelne in prosta delovna mesta po statisticnih regijah ter spolu. Nato bom analiziral povprečne mesečne plače po dejavnostih ter zaposlene osebe po višini neto plače. Vse analize bodo narejene za leto in v tabelah, kjer so podatki predstavljeni po mesecih vzel prvi mesec v letu kot merilo za to leto.

## Tabele

1. tabela: leto, statistična regija, spol, aktivno prebivalstvo, zaposleni, brezposelni
2. tabela: leto, statistična regija, prosta delovna mesta
3. tabela: leto, statistična regija, spol, povprečna plača, dejavnost
4. tabela: leto, statistična regija, spol, število ljudi v plačilnem razredu

## Povezave do tabel

https://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=0700950S&ti=&path=../Database/Dem_soc/07_trg_dela/90_arhivski_podatki/02_akt_preb_mes_arhiv/&lang=2

https://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=0711535S&ti=&path=../Database/Dem_soc/07_trg_dela/10_place/10_07115_zap_osebe_placa/&lang=2

https://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=0701081S&ti=&path=../Database/Dem_soc/07_trg_dela/90_arhivski_podatki/80_place_arhiv/&lang=2

https://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=0714694S&ti=&path=../Database/Dem_soc/07_trg_dela/30_07146_prosta_mesta/&lang=2
## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`.
Ko ga prevedemo, se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`.
Podatkovni viri so v mapi `podatki/`.
Zemljevidi v obliki SHP, ki jih program pobere,
se shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `rgdal` - za uvoz zemljevidov
* `rgeos` - za podporo zemljevidom
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `mosaic` - za pretvorbo zemljevidov v obliko za risanje z `ggplot2`
* `maptools` - za delo z zemljevidi
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)

## Binder

Zgornje [povezave](#analiza-podatkov-s-programom-r-201819)
omogočajo poganjanje projekta na spletu z orodjem [Binder](https://mybinder.org/).
V ta namen je bila pripravljena slika za [Docker](https://www.docker.com/),
ki vsebuje večino paketov, ki jih boste potrebovali za svoj projekt.

Če se izkaže, da katerega od paketov, ki ji potrebujete, ni v sliki,
lahko za sprotno namestitev poskrbite tako,
da jih v datoteki [`install.R`](install.R) namestite z ukazom `install.packages`.
Te datoteke (ali ukaza `install.packages`) **ne vključujte** v svoj program -
gre samo za navodilo za Binder, katere pakete naj namesti pred poganjanjem vašega projekta.

Tako nameščanje paketov se bo izvedlo pred vsakim poganjanjem v Binderju.
Če se izkaže, da je to preveč zamudno,
lahko pripravite [lastno sliko](https://github.com/jaanos/APPR-docker) z želenimi paketi.

Če želite v Binderju delati z git,
v datoteki `gitconfig` nastavite svoje ime in priimek ter e-poštni naslov
(odkomentirajte vzorec in zamenjajte s svojimi podatki) -
ob naslednjem.zagonu bo mogoče delati commite.
Te podatke lahko nastavite tudi z `git config --global` v konzoli
(vendar bodo veljale le v trenutni seji).
