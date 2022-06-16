# Regression Spline Model

# Loading the dataset
library(readxl)
mydata <- read_excel("C:/Users/santh/Desktop/MC-Stat'sday/Reg_Spline_DFR.xlsx")
View(mydata)

# Attach the data
attach(mydata)

# Prilimanary analysis
plot(Design, Coding, pch=16,col='blue',main='Scatter plot', xlab='Design')

# Develop the linear regression model
mymodel=lm(Coding~Design)
summary(mymodel)

# Comput predicted values
pred=predict(mymodel)

# Priliminary analysis - Scatter plot with Regression line
plot(Design,Coding,pch=16,col='blue',main='Scatter plot with predicted line')
lines(Design, pred, col='red')

# Introducing knot at 0.44
design44= Design-0.44
design44
design44[design44<0]=0
design44

# Develop the regression spline model
mymodel=lm(Coding~Design+design44)
summary(mymodel)

# Comput predicted values
pred=predict(mymodel)

# Priliminary analysis - Scatter plot with Regression line
plot(Design,Coding,pch=16,col='blue',main='Scatter plot with predicted line')
lines(Design, pred, col='red')

# Here the model is not continuous and to make it continuous we need to take polynomial to 3(cubic splines)
design44_cube=design44^3

# Develop the regression spline model
mymodel=lm(Coding~poly(Design,3,raw=T)+design44_cube)
summary(mymodel)

# Comput predicted values
pred=predict(mymodel)

# Priliminary analysis - Scatter plot with Regression line
plot(Design,Coding,pch=16,col='blue',main='Scatter plot with predicted curve',
     xlab='Coding', ylab='Design')
lines(Design, pred, col='red')

# Cross Validation
# Import package boot
library(boot)
attach(mydata)

#LOOCv
mymodel1=glm(Coding~Design)
summary(mymodel1)
mycv=cv.glm(mydata, mymodel1)
loocv_mse=mycv$delta[1]
round(loocv_mse,4)

mynewdata=cbind(mydata, design44_cube)
mynewdata=as.data.frame(mynewdata)
View(mynewdata)

attach(mynewdata)

#LOOCv
mymodel1=glm(Coding~poly(Design,3, raw=T)+design44_cube)
summary(mymodel1)
mycv=cv.glm(mynewdata, mymodel1)
loocv_mse=mycv$delta[1]
round(loocv_mse,4)