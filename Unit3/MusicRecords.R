setwd("/Users/savioabuga/Documents/Study/AnalyticsEdge/")

songs = read.csv("Unit3/Data/songs.csv")
str(songs)
songs_2010 = subset(songs, year == "2010")
str(songs_2010)

michael_jackson = subset(songs, artistname == "Michael Jackson")
michael_jackson[c("songtitle")]

# Michael Jackson's songs that made it to the 10 billboard chart
top_10_michael_jackson = subset(michael_jackson, Top10 == 1)
str(top_10_michael_jackson)
top_10_michael_jackson[c("songtitle")]

factor(songs$timesignature)

table(songs$timesignature)

# song with the highest tempo
songs$songtitle[which.max(songs$tempo)]

# creating a logistic regression model
nonvars = c("year", "songtitle", "artistname", "songID", "artistID")

SongsTrain = subset(songs, year <= 2009)
# remove non vars columns
SongsTrain = SongsTrain[, !names(SongsTrain) %in% nonvars]
SongsTest = subset(songs, year == 2010)
# remove non vars columns
SongsTest = SongsTest[, !names(SongsTest) %in% nonvars]
# the model
SongsLog1 = glm(Top10 ~ ., data = SongsTrain, family = binomial)
summary(SongsLog1)
# Beware of multicoliearity
cor(SongsTrain$loudness, SongsTrain$energy)

SongsLog2 = glm(Top10 ~ . - loudness, data = SongsTrain, family = binomial)
summary(SongsLog2)


SongsLog3 = glm(Top10 ~ . - energy, data = SongsTrain, family = binomial)
summary(SongsLog3)

predictions = predict(SongsLog3, newdata = SongsTest, type="response")
predictions
table(SongsTest$Top10)
table(SongsTest$Top10, predictions > 0.45)
