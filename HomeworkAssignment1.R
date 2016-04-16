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
