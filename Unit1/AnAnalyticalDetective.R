# Homework Assignment 1
setwd("/Users/savioabuga/Documents/Study/AnalyticsEdge/")

mvt = read.csv("Unit1/Data/AnAnalyticalDetective/mvtWeek1.csv")

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
# ALLEY
# 249/(249+2059) = 0.1078856153
# DRIVEWAY - RESIDENTIAL
# 132/(132+1543) = 0.07880597015
# GAS STATION
# 439/(439+1672) = 0.2079583136
# PARKING LOT/GARAGE(NON.RESID.)
# 1603/(1603+13249) = 0.1079315917
# STREET
# 11595/(11595 + 144969) = 0.07405917069

# On which day of the week do the fewest motor vehicle thefts in residential driveways happen

GasStationMonday = subset(GasStation, Weekday == "Monday")
GasStationTuesday = subset(GasStation, Weekday == "Tuesday")
GasStationWednesdays = subset(GasStation, Weekday == "Wednesday")
GasStationThursday = subset(GasStation, Weekday == "Thursday")
GasStationFriday = subset(GasStation, Weekday == "Friday")
GasStationSaturday = subset(GasStation, Weekday == "Saturday")
GasStationSunday = subset(GasStation, Weekday == "Sunday")

# On which day of the week do the most motor vehicle thefts at gas stations happen?

DrivewayMonday = subset(Driveway, Weekday == "Monday")
DrivewayTuesday = subset(Driveway, Weekday == "Tuesday")
DrivewayWednesdays = subset(Driveway, Weekday == "Wednesday")
DrivewayThursday = subset(Driveway, Weekday == "Thursday")
DrivewayFriday = subset(Driveway, Weekday == "Friday")
DrivewaySaturday = subset(Driveway, Weekday == "Saturday")
DrivewaySunday = subset(Driveway, Weekday == "Sunday")


