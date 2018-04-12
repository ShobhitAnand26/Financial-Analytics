


#Import data
dataset=read.csv(file="G:/R Work/Project/Shobhit/logr2.csv")
summary(dataset)
view(dataset)

#SPLIT the dataset into the training set and test set

library(caTools)
set.seed(2000)
split=sample.split(dataset$purchased,SplitRatio = 0.75)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

dim(dataset)
nrow(training_set)
dim(test_set)
length(dataset)
length(dataset$userid)

class(dataset$gender)
names(training_set)


#fitting logistic regression to the training set
logitmodel1=glm(purchased~gender+age+salary,family = binomial,data=training_set)
summary(logitmodel1)

#fitting logistic regression to the training set- being insignificant is dropped here
logitmodel2= glm(purchased~age+salary,family=binomial,data=training_set)
summary(logitmodel2)
summary(logitmodel2)$coefficient

test_set2=data.frame(age=c(40,60),salary=c(40000,50000))
prob_pred2=predict(logitmodel2,type='response',newdata = test_set2)
prob_pred2
cbind(test_set2,prob_pred2)


#predicting the test set results from testset
test_set
prob_pred=predict(logitmodel2,type='response',newdata=test_set)
df_prob_pred=as.data.frame(prob_pred)
summary(df_prob_pred)
head(df_prob_pred)

y_pred=ifelse(prob_pred>0.5,1,0)
y_pred
cbind(test_set$purchased, y_pred)

#making the confusion matrix
cm=table(test_set[,5],y_pred)
cm
caret::confusionmatrix(cm)  #install caret
