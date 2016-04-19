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
is.na(CPS$MetroAreaCode)

tapply(is.na(CPS$MetroAreaCode), CPS$State, mean)

# Integrating Metropolitan Area Data

MetroAreaMap = read.csv("Unit1/Data/Demographics/MetroAreaCodes.csv")
str(MetroAreaMap)

CountryMap = read.csv("Unit1/Data/Demographics/CountryCodes.csv")
str(CountryMap)

CPS = merge(CPS, MetroAreaMap, by.x="MetroAreaCode", by.y="Code", all.x=TRUE)

str(CPS)

MissingMetroAreas = CPS[is.na(CPS$MetroArea)==TRUE, ]

nrow(MissingMetroAreas)

NonMissingMetroAreas = CPS[is.na(CPS$MetroArea)==FALSE, ]

fre = as.data.frame(table(NonMissingMetroAreas$MetroArea))
fre[order(Freq),]
