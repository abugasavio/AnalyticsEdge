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

# 
