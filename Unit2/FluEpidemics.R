# Author: Savio Abuga
setwd("/Users/savioabuga/Documents/Study/AnalyticsEdge/")

FluTrain = read.csv("Unit2/Data/FluTrain.csv")
str(FluTrain)
sort(tapply(FluTrain$ILI, FluTrain$Week, mean))

sort(tapply(FluTrain$Queries, FluTrain$Week, mean))
    
hist(FluTrain$ILI)

# When handling a skewed dependent variable, it is often useful to predict 
# the logarithm of the dependent variable instead of the dependent variable itself 
# -- this prevents the small number of unusually large or small observations 
# from having an undue influence on the sum of squared errors of predictive models.
# In this problem, we will predict the natural log of the ILI variable, 
# which can be computed in R using the log() function.


plot(log(FluTrain$ILI), FluTrain$Queries)


# The regression model
FluTrend1 = lm(log(FluTrain$ILI) ~ Queries, data = FluTrain)
summary(FluTrend1)

# Doing predictions
FluTest = read.csv("Unit2/Data/FluTest.csv")
str(FluTest)

PredTest1 = exp(predict(FluTrend1, newdata = FluTest))
PredTest1

FluTest$Predictions = PredTest1

FluTest[FluTest$Week == '2012-03-11 - 2012-03-17',]

# Calculating the errors
SSE = sum((FluTest$Predictions - FluTest$ILI)^2)

RMSE = sqrt(SSE/nrow(FluTest))
RMSE

# Using time lag
library("zoo")

ILILag2 = lag(zoo(FluTrain$ILI), -2, na.pad = TRUE)

FluTrain$ILILag2 = coredata(ILILag2)

FluTrain

summary(FluTrain$ILILag2)

plot(log(FluTrain$ILILag2), log(FluTrain$ILI))

# Training ILI on ILILag2
FluTrend2 = lm(log(FluTrain$ILI) ~ log(ILILag2) + Queries, data=FluTrain)
summary(FluTrend2)

# Adding ILLLag2 to the FlueTest
FluTest$ILILag2 = coredata(lag(zoo(FluTest$ILI), -2, na.pad = TRUE))
FluTest$ILILag2
names(FluTrain)
nrow(FluTest)

Second = FluTrain[nrow(FluTrain), c('ILI')]
First = FluTrain[nrow(FluTrain) - 1, c('ILI')]


FluTest[FluTest$Week == "2012-01-08 - 2012-01-14", "ILILag2"] = Second
FluTest[FluTest$Week == "2012-01-01 - 2012-01-07", "ILILag2"] = First


FluTest$Predictions2 = exp(predict(FluTrend2, newdata = FluTest))

FluTest
SSE = sum((FluTest$Predictions2 - FluTest$ILI)^2)
RMSE = sqrt(SSE/nrow(FluTest))
RMSE
