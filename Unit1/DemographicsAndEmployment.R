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

str(CPS)
table(CPS[CPS$Hispanic==1, c("Race")])

summary(CPS)

# Working with Missing data
table(CPS$Age, is.na(CPS$Married))

table(CPS$State, is.na(CPS$MetroAreaCode))

prop.table(table(CPS$State, is.na(CPS$MetroAreaCode)), 1)

# mean
tapply(CPS$State, is.na(CPS$MetroAreaCode), mean, na.rm = TRUE)
    