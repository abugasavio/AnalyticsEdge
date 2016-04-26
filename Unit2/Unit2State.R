# Author: Savio Abuga
setwd("/Users/savioabuga/Documents/Study/AnalyticsEdge/")

data(state)

statedata = cbind(data.frame(state.x77), state.abb, state.area, state.center,  state.division, state.name, state.region)

plot(statedata$x, statedata$y)

str(statedata)

tapply(statedata$HS.Grad, statedata$state.region, sum)

boxplot(statedata$Murder ~ statedata$state.region,  col=(c("gold","darkgreen")))

NorthEast = subset(statedata, state.region == "Northeast")
nrow(statedata)

NorthEast

NorthEast$state.name[which.max(NorthEast$Murder)]

# Creating Regression Model

Model1 = lm(Life.Exp ~ Population + Income + Illiteracy + Murder + HS.Grad + Frost, data = statedata)

summary(Model1)

# Correlation of Income and Life Expectancy

plot(statedata$Income, statedata$Life.Exp)

cor(statedata$Income, statedata$Life.Exp)

# Model without Area
# Area has the highest P Value

Model2 = lm(Life.Exp ~ Population + Income + Illiteracy + Murder + HS.Grad + Frost, data = statedata)

summary(Model1)

# Model without Illiteracy
# Illiteracy has the 2nd highest P Value

Model3 = lm(Life.Exp ~ Population + Income + Murder + HS.Grad + Frost, data = statedata)

summary(Model1)


# Model without Income
# Income has the 3rd highest P Value

Model4 = lm(Life.Exp ~ Population + Frost + Murder + HS.Grad, data = statedata)

summary(Model1)

# Using the model
statedata$predictions = predict(Model4)
statedata$state.name[which.min(statedata$predictions)]
statedata$state.name[which.min(statedata$Life.Exp)]


statedata$state.name[which.max(statedata$predictions)]
statedata$state.name[which.max(statedata$Life.Exp)]

statedata$residuals = abs(statedata$predictions - statedata$Life.Exp)
statedata$state.name[which.min(statedata$residuals)]
statedata$state.name[which.max(statedata$residuals)]
