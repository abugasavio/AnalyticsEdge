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
SongsTrain = subset(songs, year <= 2009)
SongsTest = subset(songs, year == 2010)

