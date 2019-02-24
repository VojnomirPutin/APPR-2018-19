source('lib/libraries.r', encoding = 'UTF-8')

prileganje <- lm(data = brezposelni.Slovenija, Registrirane.brezposelne.osebe ~ Leto)
leta <- data.frame(Leto=seq(2017,2020,1))
napoved <- mutate(leta, Registrirane.brezposelne.osebe=predict(prileganje,leta))

#graf brezposelnih posameznikov

graf.napovedi <- ggplot(brezposelni.Slovenija, aes(x=Leto, y=Registrirane.brezposelne.osebe))+ 
  geom_point() + geom_smooth(method=lm, fullrange=TRUE, color='red') + geom_point(data=napoved, inherit.aes = TRUE)+
  labs(title='Registrirane brezposelne osebe v Sloveniji')
plot(graf.napovedi)

#graf procentne brezposelnosti

brezposelnost <- left_join(prebivalstvo.slovenija, brezposelni.Slovenija, by=c('Leto'))
brezposelnost <- brezposelnost%>%filter(Registrirane.brezposelne.osebe != '')
brezposelnost <- transform(brezposelnost, Odstotek=(Registrirane.brezposelne.osebe/Prebivalstvo))
brezposelnost <- brezposelnost[c(-2,-3)]

prileganje1 <- lm(data=brezposelnost, Odstotek ~Leto)
leta1 <- data.frame(Leto=seq(2017,2020,1))
napoved.odstotka<-mutate(leta1, Odstotek=predict(prileganje1,leta1))

graf.napovedi.odstotkov <- ggplot(brezposelnost, aes(x=Leto, y=Odstotek)) + geom_point(data=napoved.odstotka, inherit.aes = TRUE) + 
  geom_smooth(method=lm, fullrange=TRUE, color='green') + geom_point() + labs(title='Odstotek registrirane brezposelnosti v Sloveniji')
plot(graf.napovedi.odstotkov)
