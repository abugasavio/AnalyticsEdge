# Introduction to R in MITx: 15.071x The Analytics Edge Class
# Author: Savio Abuga
setwd("/Users/savioabuga/Documents/Study/AnalyticsEdge/")

# Working with Vectors

Country <- c("Brazil", "China", "India", "Switzerland", "USA")

LifeExpectancy <- c(74, 76, 65, 83, 79)

length(Country)

length(LifeExpectancy)

# Creating a Sequence
seq(0, 100, 2)

# Working with DataFrames
CountryData <- data.frame(Country, LifeExpectancy)

CountryData$Population <- c(199000, 1390000, 1240000, 7997, 318000)

# Using rbind

Country <- c("Austraria", "Greece")
LifeExpectancy <- c(82, 81)
Population <- c(23050, 11125)

NewCountryData <- data.frame(Country, LifeExpectancy, Population)

AllCountryData <- rbind(CountryData, NewCountryData)

# Reading DataFiles
WHO = read.csv("Data/WHO.csv")

str(WHO)

summary(WHO)

# Subsetting
WHO_Europe = subset(WHO, Region == "Europe")

# Saving to csv
write.csv(WHO_Europe, "Data/WHO_Europe.csv")

ls()

rm(WHO_Europe)
rm(WHO)

mean(WHO$Under15)

sd(WHO$Under15)

summary(WHO$Under15)
#    Output
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#    13.12   18.72   28.65   28.73   37.75   49.99 

which.min(WHO$Under15)
# row number

WHO$Country[86]

which.max(WHO$Under15)
# Output

WHO$Country[124]

plot(WHO$GNI, WHO$FertilityRate)

Outliers = subset(WHO, GNI > 10000 & FertilityRate > 2.5)

nrow(Outliers)

Outliers[c("Country", "GNI", "FertilityRate")]

# Quick Questions
# 1. What is the mean value of the "Over60" variable?
mean(WHO$Over60)

# 2. Which country has the smallest percentage of the population over 60?

WHO$Country[which.min(WHO$Over60)]

summary(WHO$LiteracyRate)

WHO$Country[which.max(WHO$LiteracyRate)]

hist(WHO$CellularSubscribers)

boxplot(WHO$LiteracyRate ~ WHO$Region, xlab="", ylab="Life Expectancy",
        name="Life Expectancy by Region")

table(WHO$Region)

tapply(WHO$Over60, WHO$Region, mean)

tapply(WHO$LiteracyRate, WHO$Region, min, na.rm=TRUE)

tapply(WHO$ChildMortality, WHO$Region, min, na.rm=TRUE)



