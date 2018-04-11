#Simple Linear Regression : IIT Gauhati
# Regression : Areas vs Sales

#Method1 : creating data from Vectors
#X -is area sqft Y-sales in 1000s units; Find relationship betn X & Y
X = c(1.7,1.6,2.8,5.6,1.3,2.2, 1.3,1.1,3.2,1.5,5.2,4.6,5.8,3 )
Y = c(3.7,3.9,6.7,9.5,3.4,5.6,3.7,2.7,5.5,2.9,10.7,7.6,11.8,4.1 )

#create a data frame from X & Y
df1 = data.frame(X,Y)
#first few values
df1
str(df1)
#2nd method of importing data
#import from ggsheet  #pickup the correct url
library(gsheet)
url= "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=2023826519"
df2 = as.data.frame(gsheet::gsheet2tbl(url))
str(df2)
#first few values

#Third method of importing data from CSV file
df3 = read.csv(file="G:/R Work/Project/Shobhit/slr1.csv")
str(df3)
#first few values

#Method4 for importing from CSV file with choose
df = read.csv(file.choose("./data/slr1"))
str(df)
#first few values

# Use Vector Data or method used to import data
#make one of the DF active
#df = 

#Find mean, sum of X & Y, Covariance, Correlation
mean(df$X):mean(df$Y)

options(digits=4)
sum(df$X)
sum(df$Y)
sd(df$X)
cov(df$X,df$Y)     #covariance
cov(df$Y,df$X)
cor(df$X,df$Y)    #corelation
#plot X & Y

plot(x=df$X,y=df$Y,xlab = 'Area in sq ft',ylab = 'sales amt',type = 'p',ylim = c(0,max(df$Y)),main='plot area vs sales',xlim=c(0,max(df$X)),col='red',pch=15)
abline(lm(df$Y~df$X),lty=2,lw=4,col='blue')    #lyt =line type   lw = line width
abline(v=c(3,5,6),h=c(4,6,8),col=c('red','green','blue'))
#draw abline/ prediction line


#Linear Model fit= lm(Y~X, data=)
fit1=lm(Y~X,data=df)
min(df$X)
range(df$X)
summary(fit1) #r2 represents variation of y is explained by x
names(fit1)
coefficients(fit1)


#Print the Model, Summary, Coeff, Residuals


#understand the model values - R2, AdjR2, FStats, Residuals, Coeff p values - IMP STEP

#output of variable Names

#Print Slope value


#combine the data with Ypredicted, errors

# Predictions
(Y = 0.9645 + 1.6699 * 4)  # Predict Y for X=4
(Y = coef(fit1)[1] + coef(fit1)[2] * 4)  # for X=4 using values from output of LM 

fitted(fit1)
coef(fit1)[2]
cbind(df, fitted(fit1))# combine data with predicted values
cbind(df,fitted(fit1),fitted(fit1)-df$Y,residuals(fit1))

range(df$X)  #min to max value of X: area

# Create a Data Frame with sample values of X
new1=data.frame(X=c(1,2,3,4,5))
new1

#sample data for X for prediction, should be between the range of X values
#prediction data should be in the form of Data Frame

#Predict

predict(fit1, newdata= new1) # Predict Function for 4 values of X
#fitted(fit1) is equal to predict function using original X values
 

df$X
predictX = predict(fit1, newdata= data.frame(X=df$X))
cbind(df, predictX, fitted(fit1))
plot(fit1,which = 1)
plot(fit1)



library(forecast)
accuracy(fit1)


summary(fit1)
summary(fit1)$sigma  #Residual Std Error SD along the LM Line


#Assumption : Graphical Analysis : IMP STEP
plot(df$X, df$Y) # plot of Y & X
plot(x=df$X, y=residuals(fit1)) # Linearity plot of residuals & X # No pattern for assumption that there is linearity betw X & Y
abline(h=0)
plot(residuals(fit1))

#Auto Collinearity : relation between successive values of Y
car::durbinWatsonTest(fit1)
#pvalue > 0 : Do not reject Ho that there is no correlation


#Normality of residuals
hist(residuals(fit1)) #distribution of Residuals

hist(residuals(fit1), freq=F)
lines(density(residuals(fit1)))

#histogram values to show how hist rectangle are created
(h=hist(residuals(fit1)))
names(h)
cbind(h$breaks, h$counts)

#Normality Plot to check assumptions of LM
qqnorm(residuals(fit1))
qqline(residuals(fit1))

#Equal Variance : 4th Assumption : homoscedasticity= equal variance
plot(y=residuals(fit1), x=df$X)
abline(h=0)  #Variance across all x values is almost constant


#Outlier Analysis

boxplot(residuals(fit1), names=c('Residuals'))
identify(rep(1, length(residuals(fit1))), residuals(fit1), labels = seq_along(residuals(fit1)))

car::outlierTest(fit1)

car::outlierTest(lm(Y ~ X, data=df[-c(14,12),]))

