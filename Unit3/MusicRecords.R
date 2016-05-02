setwd("/Users/savioabuga/Documents/Study/AnalyticsEdge/")

songs = read.csv("Unit3/Data/songs.csv")
str(songs)
songs_2010 = subset(songs, year == "2010")
str(songs_2010)

michael_jackson = subset(songs, artistname == "Michael Jackson")
michael_jackson[c["songtitle",]]
