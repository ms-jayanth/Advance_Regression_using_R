# Advance Regression using R

## Multiple Linear Regression

To model output variable y in terms of two or more variables.<br>
General Form:

y = a + b1x1 + b2x2 + - - - + bkxk + ε

Two variable case:

y = a + b1x1 + b2x2 + ε

Where
a: intercept (the predicted value of y when all x’s are zero)
bj: slope (the amount change in y for unit change in xj keeping all other x’s constant, j =1,2,---,k)

### Problem Statement:
The effect of temperature and reaction time affects the % yield. The data collected in given in the Mult-Reg_Yield file. Develop a model for % yield in terms of temperature and time?

## Modelling Non-linear Relations

The linear regression is fast and powerful tool to model complex phenomena.<br>
But makes several assumptions about the data including the assumption of linear relationship exists between predictors and response variable.<br>
When these assumptions are violated, the model breaks down quickly

The linear model y = xβ + ε is general model
Can be used to fit any relationship that is linear in the unknown parameter β

Examples:
y = β0 + β1x1 + ... + βkxk + ε

y = β0 + β1x1 + β11x1^2 + ε

In general

y = β0 + β1f(x) + ε

where f(x) can be 1/x, sqrt(x), log(x), e^x, etc 

Detection of non linear relation between predictor x and response variable y

- Scatter Plot:<br>
  The plotted points are not lying lie in a straight line is an indication of non linear relationship between predictor and dependant variable.

- Component Residual Plots:<br>
  An extension of partial residual plots<br>
  Partial residual plots are the plots of residuals of one predictor against dependant variable<br>
  Component residual plots(crplots) adds a line indicating where the best fit line
lies.<br>
  A significant difference between the residual line and the component line indicate
that the predictor does not have a linear relationship wit the dependent variable

### Problem Statement:
The data given in Nonlinear_Thrust.csv represent the trust of a jet –
turbine engine (y) and 3 predictor variables: x1 = fuel flow rate, x2 =
pressure, and x3 = exhaust temperature. Develop a suitable model
for thrust in terms of the predictor variables.

## Regression Splines

- Spline
  A continuous function formed by connecting linear segments<br>
  A function constructed piecewise from polynomial functions

- Knots
  The points where the segments are connected

- Spline of degree D
  A function formed by connecting polynomial segments of degree D so that
  • Function is continuous
  • Function has D – 1 continuous derivatives

- Usage
  Develop models when relationship between y and x’s is piecewise polynomial

### Problem Statement:
The data on defect finding rate (design phase) and the
corresponding defect finding rate (coding phase) of 20 similar projects is given in
Reg_Spline_DFR.csv. Fit a suitable model to predict defect finding rate in coding
phase in terms of defect finding rate in design phase?
