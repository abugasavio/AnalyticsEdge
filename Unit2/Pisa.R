# set the directory 
setwd("/Users/savioabuga/Documents/Study/AnalyticsEdge/")


pisaTrain = read.csv("Unit2/Data/pisa2009train.csv")

pisaTest = read.csv("Unit2/Data/pisa2009test.csv")

# number of students
nrow(pisaTrain)

# Mean reading speed
names(pisaTest)

tapply(pisaTest$readingScore, pisaTest$male, mean)

# Missing data