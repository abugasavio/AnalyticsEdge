setwd("/Users/savioabuga/Documents/Study/AnalyticsEdge/")

quality = read.csv("Unit3/Data/quality.csv")

library(caTools)

set.seed(88)

split = sample.split(quality$PoorCare, SplitRatio = 0.75) 

qualityTrain = subset(quality, PoorCare = TRUE)