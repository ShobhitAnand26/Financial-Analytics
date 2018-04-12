# Missing values


v1=c(1,2,NA,NA,5)
is.na(v1)
sum(is.na(v1))
mean(v1)
mean(v1,na.rm=T)
vla= na.omit(v1)
vla
sum(vla)
?na.omit
anyNA(v1)
#all
v1[is.na(v1)]=mean(v1,na.rm=T)
v1

mean(v1,na.rm = T)
v1[c(3,4)]
v1[is.na(v1)]
v1




#denoted by NA
library(VIM)
data(sleep,package='VIM')

head(sleep)
dim(sleep)
complete.cases(sleep)   #all complete rows without any missing values
sum(!complete.cases(sleep))
sleep[complete.cases(sleep),]
sleep[!complete.cases(sleep),]

is.na(sleep$Dream)
sum(is.na(sleep$Dream))
mean(is.na(sleep$Dream))
12/62
 sum(complete.cases(sleep))
 mean(complete.cases(sleep))
 
 
sum(is.na(sleep))
names(sleep)
colSums(is.na(sleep))
rowSums(is.na(sleep))
is.ana(sleep[1:3,])
head(sleep)

#Tabulate


library(mice)
mice::md.pattern(sleep)
#42 rows without any missing values #2 rows with 1 NA NonD

#visualisation
VIM::aggr(sleep,prop=T)
VIM::matrixplot(sleep)
VIM::marginmatrix(sleep[c('Gest','Dream')],pch=c(20),col='blue')
