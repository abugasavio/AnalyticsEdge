# Homework Assignment 1
setwd("/Users/savioabuga/Documents/Study/AnalyticsEdge/")

mvt = read.csv("Data/mvtWeek1.csv")

str(mvt)

mvt$ID[which.max(mvt$ID)]

mvt$Beat[which.min(mvt$Beat)]

# Arrests were made

ArrestsMade = subset(mvt, Arrest == TRUE)
nrow(ArrestsMade)

names(mvt)


AlleyLocationDescription = subset(mvt, LocationDescription == "ALLEY")

nrow(AlleyLocationDescription)

# Working with Dates in R
mvt$Date[c(0, 10)]

DateConvert = as.Date(strptime(mvt$Date, "%m/%d/%y %H:%M"))

summary(DateConvert)

months(DateConvert)
weekdays(DateConvert)

mvt$Month = months(DateConvert)
mvt$Weekday = weekdays(DateConvert)

mvt$Date = DateConvert

table(mvt$Month)

table(mvt$Weekday)

mvt$Month[which.max(mvt$Arrest)]

DateConvert = as.Date(strptime(ArrestsMade$Date, "%m/%d/%y %H:%M"))
ArrestsMade$Month = months(DateConvert)

tapply(mvt$Arrest, mvt$Month, summary)

nrow(ArrestsMade)

hist(mvt$Date, breaks=1000)

boxplot(mvt$Date ~ mvt$Arrest, las = 2)

mvt_2001 = subset(mvt, Year == "2001")

nrow(mvt_2001)

table(mvt_2001$Arrest)

mvt_2007 = subset(mvt, Year == "2007")
table(mvt_2007$Arrest)
table(mvt_2007$Arrest)

mvt_2012 = subset(mvt, Year == "2012")
table(mvt_2012$Arrest)
table(mvt_2012$Arrest)['TRUE']/nrow(mvt_2012)


sort(table(mvt$LocationDescription), decreasing = TRUE)


Top5 = subset(mvt, LocationDescription == "STREET" | LocationDescription == "PARKING LOT/GARAGE(NON.RESID.)"
               | LocationDescription == "ALLEY" | LocationDescription == "GAS STATION" | LocationDescription == "DRIVEWAY - RESIDENTIAL")

nrow(Top5)

Street = subset(mvt, LocationDescription == "STREET")
Parking = subset(mvt, LocationDescription == "PARKING LOT/GARAGE(NON.RESID.)")
Alley = subset(mvt, LocationDescription == "ALLEY")
GasStation = subset(mvt, LocationDescription == "GAS STATION")
Driveway = subset(mvt, LocationDescription == "DRIVEWAY - RESIDENTIAL")

Top5_ = rbind(Street, Parking, Alley, GasStation, Driveway)

nrow(Top5_)

Top5$LocationDescription = factor(Top5$LocationDescription)

Top5$LocationDescription

tapply(Top5$Arrest, Top5$LocationDescription, summary)
# Rate of Arrest
# 




