# Non-Linear regression

# Importing the data
library(readxl)
mydata <- read_excel("C:/Users/santh/Desktop/MC-Stat'sday/Nonlinear_Thrust.xlsx")
View(mydata)

# Preliminary analysis- Correlation
round(cor(mydata),3)

# Scatter plot
# Import the package caret
library(caret)
x=mydata[,1:3]
y=mydata$y
#Preliminary analysis- Scatter plot
featurePlot(x,y,plot='Scatter',pch=16, main="scatter plot")

# attach the dataset
attach(mydata)


#Develop regression model
mymodel=lm(y~x1+x2+x3)
mymodel
summary(mymodel)

#Import car package: Tool for checking x's are appropriate
library(car)

#Component + residual plot
crPlots(mymodel,pch=16, col='black')

# Polynomial Regression
# Develop the model: Improving X1
mymodel=lm(y~poly(x1, 2,raw=TRUE)+x2+x3)
summary(mymodel)

#Component + residual plot
crPlots(mymodel,pch=16, col='black')

#---- Poly(3)----
mymodel=lm(y~poly(x1, 3,raw=TRUE)+x2+x3)
summary(mymodel)

#Component + residual plot
crPlots(mymodel,pch=16, col='black')

# Develop the model: Improving X2
mymodel=lm(y~poly(x1, 3,raw=TRUE)+poly(x2,2,raw=T)+x3)
summary(mymodel)

#Component + residual plot
crPlots(mymodel,pch=16, col='black')

# Develop the model: Improving X3
mymodel=lm(y~poly(x1, 3,raw=TRUE)+poly(x2,2,raw=T)+sqrt(x3))
summary(mymodel)

#Component + residual plot
crPlots(mymodel,pch=16, col='black')
# The model is significant and accurent

# Model Adequecy

# Residuals
res=residuals(mymodel)

# Normal Q_Q plot
qqnorm(res,pch=16, col='blue')
qqline(res, col='red')

# Normality Test
# H0: Deviation from bell shapesd is 0 ; H1: Deviation from bell shape is not 0
shapiro.test(res)

# Cross Validation
# Import package boot
library(boot)
attach(mydata)

#LOOCv
# With simple linear model
mymodel=glm(y~x1+x2+x3)
summary(mymodel)
mycv=cv.glm(mydata, mymodel)
loocv_mse=mycv$delta[1]
round(loocv_mse,4)

#with polynomial model
mymodel=glm(y~poly(x1, 3,raw=TRUE)+poly(x2,2,raw=T)+sqrt(x3))
summary(mymodel)
mycv=cv.glm(mydata, mymodel)
loocv_mse=mycv$delta[1]
round(loocv_mse,4)

# The model with  polynomial is not only significant and accurate but it also adiquate and genralize than linear regression model