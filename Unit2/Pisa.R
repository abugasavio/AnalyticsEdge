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

summary(pisaTrain)

# Remove missing data
pisaTrain = na.omit(pisaTrain)
nrow(pisaTrain)

pisaTest = na.omit(pisaTest)

nrow(pisaTest)

# Factor Variables
str(pisaTrain)

levels(pisaTrain$raceeth)

# relevel
# The levels of a factor are re-ordered so that the level specified by ref is 
# first and the others are moved down. This is useful for contr.treatment 
# contrasts which take the first level as the reference.

pisaTrain$raceeth = relevel(pisaTrain$raceeth, "White")

pisaTest$raceeth = relevel(pisaTest$raceeth, "White")

levels(pisaTrain$raceeth)

