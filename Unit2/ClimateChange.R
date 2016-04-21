# set the directory 
setwd("/Users/savioabuga/Documents/Study/AnalyticsEdge/")

CLIMATE = read.csv("Unit2/Data/climate_change.csv")

str(CLIMATE)

CLIMATE_TRAINING = subset(CLIMATE, Year <= 2006)
str(CLIMATE_TRAINING)

ClimateReg = lm(Temp ~ MEI + CO2 + CH4 + N2O + CFC.11 + CFC.12 + TSI + Aerosols, data = CLIMATE_TRAINING)

summary(ClimateReg)

cor(CLIMATE_TRAINING)

ClimateReg2 = lm(Temp ~ MEI + N2O + TSI + Aerosols, data = CLIMATE_TRAINING)

summary(ClimateReg2)

ClimateReg3 =step(ClimateReg)

summary(ClimateReg3)

CLIMATE_TEST = subset(CLIMATE, Year > 2006)
nrow(CLIMATE_TEST)

TempPredictions = predict(ClimateReg3, newdata = CLIMATE_TEST)
TempPredictions

SSE = sum((TempPredictions - CLIMATE_TEST$Temp)^2)
SST = sum((mean(CLIMATE_TRAINING$Temp) - CLIMATE_TEST$Temp)^2)

R2 = 1 - (SSE/SST)
R2
