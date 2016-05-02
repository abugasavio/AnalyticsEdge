setwd("/Users/savioabuga/Documents/Study/AnalyticsEdge/")

quality = read.csv("Unit3/Data/quality.csv")
str(quality)
library(caTools)

set.seed(88)

split = sample.split(quality$PoorCare, SplitRatio = 0.75) 

split

qualityTrain = subset(quality, split = TRUE)

qualityTest = subset(quality, split = FALSE)

QualityLog = glm(PoorCare ~ StartedOnCombination + ProviderCount, data = qualityTrain, family = binomial)
summary(QualityLog)
