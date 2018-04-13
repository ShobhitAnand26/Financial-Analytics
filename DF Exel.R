

?paste0
rollno= paste0('S-',1:30)
rollno
name=paste0('Student',1:30,'-xyz')     #check difference in paste and paste0
name
gender=sample(x=c('M','F'),size=30,replace=T,prob=c(0.5,0.5))
gender
age=trunc(runif(30,20,40))
age
course=sample(c('BTech','MTech','Phd'),size=30,replace = T,prob = c(.5,.3,.2))
course      
marks=trunc(rnorm(30,50,20))
marks
married=sample(c(TRUE,FALSE),size=30,replace = T,prob = c(.2,.8))
married
df=data.frame(rollno,name,gender,age,course,marks,married)
df


#subset the data
sample(nrow(df),3)
df1=df[sample(nrow(df),3),]
df1

(df2=subset(df,age>=20 & age<27,select=c(name,marks)))
(df2b=subset(df,marks>=55 & marks<70,select=c(name,marks)))


#dplyr
library(dplyr)
(df3=sample_n(df,10))
(df4=sample_frac(df,.5))
dim(df4)

df5=df[which(gender=='F'| age>25),]
df5

#save this data for export
write.csv(df,'./data/students3.cvs')
library(xlsx)   #rjava also to be installed at this stage

Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre1.8.0_144")
library(xlsx)   #needs rJava
library(rJava)   #install JAVA
write.xlsx(df,'./data/students4.xlsx',sheetName="IITG1",rownames=F,append=T)
write.xlsx(df2,'./data/students4.xlsx',sheetName="IITG2",rownames=F,append=T)



