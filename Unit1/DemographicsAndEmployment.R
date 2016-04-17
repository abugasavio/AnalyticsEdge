# Savio Abuga
# The Analytical Edge 

# Loading and Summarizing the Dataset

setwd("/Users/savioabuga/Documents/Study/AnalyticsEdge/")

CPS = read.csv("Unit1/Data/Demographics/CPSData.csv")

names(CPS)
str(CPS)
summary(CPS)

sort(table(CPS$Industry))

sort(table(CPS$State)) 

prop.table(table(CPS$Citizenship))["Citizen, Native"] + prop.table(table(CPS$Citizenship))["Citizen, Naturalized"]
