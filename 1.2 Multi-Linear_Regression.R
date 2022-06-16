# Multiple Linear Regression

# Loading the data
library(readxl)
mydata <- read_excel("C:/Users/santh/Desktop/MC-Stat'sday/Mult_Reg_Yield.xlsx")
View(mydata)

#cleaning up the data set by removing Slno. field
mydata=mydata[,-1]
mydata

# Preliminary analysis- Correlation
round(cor(mydata),3)
# Scatter plot
# Import the package caret
library(caret)
x=mydata[,1:2]
y=mydata$Yield
#Preliminary analysis- Scatter plot
featurePlot(x,y,plot='Scatter',pch=16, main="scatter plot")

# attach the dataset
attach(mydata)

#Develop regression model
mymodel=lm(Yield~Time+Temperature)
mymodel
summary(mymodel)

# Since, temparature feature is not significant we can drop and modify the model    
# Modify regression model
mymodel1=lm(Yield~Time)
summary(mymodel1)

# Prediction yield for time =120
-81.6205+0.9065*130

# Computing the predicted values
pred= predict(mymodel1)

# Combine the predicted values with the data
mynewdata= cbind(mydata, pred)
View(mynewdata)

# Compute the Residuals
res=residuals(mymodel1)
mynewdata=cbind(mydata, pred, res)
View(mynewdata)

#Model Adequecy
# Normal Probability plot of residuals
qqnorm(res, pch=16, col='green')
qqline(res, col='red')

# Normality Test
# H0: Deviation from bell shapesd is 0 ; H1: Deviation from bell shape is not 0
shapiro.test(res)

# Mean sqr error
mse=mean(res^2)
round(mse,4)

# Cross Validation
# Import package boot
library(boot)
attach(mydata)

#LOOCv
mymodel1=glm(Yield~Time)
summary(mymodel1)
mycv=cv.glm(mydata, mymodel1)
loocv_mse=mycv$delta[1]
round(loocv_mse,4)

# K fold crossvalidationk=4
set.seed(1)
mycv=cv.glm(mydata, mymodel1, K=4)
k_fold_cv_mse=mycv$delta[1]
round(k_fold_cv_mse,4)