#MLR using mt cars
mtcars    #mtcars data set
data()   #available dataset in R through libraries
?mtcars    

dim(mtcars)
names(mtcars)
head(mtcars)

mtcarsfit1= lm(mpg~cyl+disp+hp+drat+wt+qsec+vs+am+gear+carb,data = mtcars)
names(mtcars)
summary(mtcarsfit1)

mtcarsfit1=lm(mpg~. ,data=mtcars)




library(MASS)
(model1a = lm(mpg ~ ., data =mtcars))
(model1b = lm(mpg ~ 1, data =mtcars))
  
Summary(model1a)
summary(model1b)



stepboth = stepAIC(model1a, direction='both')
fit1=lm(mpg~wt+qsec+am, data=mtcars)
summary(fit1)

stepfwd = stepAIC(model1b, direction='forward', scope=list(upper=model1a,lower=model1b))

stepback = stepAIC(model1a, direction='backward')