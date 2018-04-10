# Data Structures in R

#Vectors----
v1=c('A','B','C') #create a vector
v1                #print the vector
class(v1)         #print the class of vector
(v2=c(1,2,3)) 
class(v2)
(v3=c(TRUE,FALSE,TRUE))
class(v3)
v3a=c(T,F,T)    # "=" can also be written as "<-"
class(v3a)
v4=100:200     #prints numbers from 100 to 200
v4
length(v4)     #length of vector
v5=seq(1,10,2)
v5
v4;v5       #prints both variables
v4[-c(1,3,4)] #prints all value except 1st,3rd,4th
v4[v4 > 150]   #prints vales more than 150
v7=c('A','C')
v1
v1[v1 %in% v7]   #values in v7 present in v1
v1[!v1 %in% v7]   #values not in v7 present in v1
v1
v1['A']   # NA wrong/error
v1[1]    # 1st value

#Matrix----
(mymatrix=matrix(1:24,ncol=6,byrow=F)) #attention
?matrix
(mymatrix=matrix(2:25,4,6))    # first-row then-coloumn
mymatrix[,1]
mymatrix[2:3,2:4]
paste('R',1:6,sep='_')     #check
paste('C',1:4,sep='_')
rn = paste('R',1:6,sep='_')
cn = paste('C',1:4,sep='_')
dimnames(mymatrix)=list(c(rn),c(cn))
mymatrix

#Arrays----
(myarray= array(101:124,dim=c(4,3,2)))  #run and check
myarray
#(myarray=array(101:124, dimnames = list(c('s1','s2','s3','s4'), c('sub1','sub2','sub3'), c('dept1''dept2))))

apply(myarray,1,sum)
apply(myarray,1,mean)
apply(myarray,c(1,3),mean)





#List----
list1= list('dhiraj',v1,students)
list1

#Factors----
name=c('s1','s2','s3','s4','s5')
course= c('phd','mtech','btech','btech','phd')
gender=c('M','F','M','F','F')
marks=c(50,60,70,80,90)
df=data.frame(name,course,gender,marks)
df
str(df)
df[1:2,]
df$course         # use of $
df$name= as.character(df$name)      # how to change the character
str(df)
df$marks= factor(df$marks, ordered = T, levels=c('A','B','C','D','E','F'))
# usefulness of factor
df$marks


#BASE PAKAGE
letters[1:5]
(l1=letters[1:26])
sample(l1,2)
sample(l1,30,replace=T)
(grades=letters[1:5])
sgrades=sample(grades,20,replace=T,prob=c(0.4,0.2,0.2,0.1,0.1))
table(sgrades)

#DataFrames----
rollno = c(1,2,3)
name = c('Rohit','Latit','Ram')
course = c('MBA','BBA','MCA')
dept = c('Dept1','Dept2','Dept3')
marks = floor(rnorm(3,50,10))     #important 
rnorm(3,50,10)
students = data.frame(rollno, name, course, dept, marks)
students 
class(students)
str(students)
summary(students)
