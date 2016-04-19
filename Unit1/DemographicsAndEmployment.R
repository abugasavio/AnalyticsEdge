# Savio Abuga
# The Analytical Edge 

# Loading and Summarizing the Dataset

setwd("/Users/savioabuga/Documents/Study/AnalyticsEdge/")

CPS = read.csv("Unit1/Data/Demographics/CPSData.csv")
str(CPS)
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
sort(tapply(CPS$Hispanic, CPS$MetroArea, mean, na.rm=TRUE))

str(CPS)

tapply(CPS$MetroArea, CPS$State, mean)

t = tapply(CPS$Race=="Asian", CPS$MetroArea, mean)

sort(t)

MissingMetroAreas = CPS[is.na(CPS$MetroArea)==TRUE, ]

nrow(MissingMetroAreas)

NonMissingMetroAreas = CPS[is.na(CPS$MetroArea)==FALSE, ]

fre = as.data.frame(table(NonMissingMetroAreas$MetroArea))

sort(tapply(CPS$Education == "No high school diploma", CPS$MetroArea, mean, na.rm=TRUE))

CPS = merge(CPS, CountryMap, by.x="CountryOfBirthCode", by.y="Code", all.x=TRUE)
str(CPS)

sort(tapply(is.na(CPS$Country), CPS$Country, sum))

nrow(CPS[is.na(CPS$Country), ])

CPS[CPS$Region != "North America", ]

tapply(CPS$Country=="Canada", CPS$Country, mean)
sort(table(CPS$Country))

prop.table(table(CPS$MetroArea=="New York-Northern New Jersey-Long Island, NY-NJ-PA", CPS$Country=="United States"))

sort(tapply(CPS$Country == "India", CPS$MetroArea, sum, na.rm=TRUE))
sort(tapply(CPS$Country == "Brazil", CPS$MetroArea, sum, na.rm=TRUE))
sort(tapply(CPS$Country == "Somalia", CPS$MetroArea, sum, na.rm=TRUE))
sort(tapply(CPS$Country == "Kenya", CPS$MetroArea, sum, na.rm=TRUE))
