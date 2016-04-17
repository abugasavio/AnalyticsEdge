# Savio Abuga
# Stock Dynamics
# Unit 1 Homework Assignment 
setwd("/Users/savioabuga/Documents/Study/AnalyticsEdge/")
# Reading the data
IBM = read.csv("Unit1/Data/HomeWork01/IBMStock.csv")
GE = read.csv("Unit1/Data/HomeWork01/GEStock.csv")
ProcterGamble = read.csv("Unit1/Data/HomeWork01/ProcterGambleStock.csv")
CocaCola = read.csv("Unit1/Data/HomeWork01/CocaColaStock.csv")
Boeing = read.csv("Unit1/Data/HomeWork01/BoeingStock.csv")

# Update the date columns with date format
IBM$Date = as.Date(IBM$Date, "%m/%d/%y")
GE$Date = as.Date(GE$Date, "%m/%d/%y")
ProcterGamble$Date = as.Date(ProcterGamble$Date, "%m/%d/%y")
CocaCola$Date = as.Date(CocaCola$Date, "%m/%d/%y")
Boeing$Date = as.Date(Boeing$Date, "%m/%d/%y")

# Number of observations 
nrow(IBM)
nrow(GE)

# Latest Year
IBM$Date[which.max(IBM$Date)]

# Earliest Year
IBM$Date[which.min(IBM$Date)]

# Mean stock for IBM over the years 1970 to 2009
mean(IBM$StockPrice)

# The minimum stock price of General Electric (GE) over this time period
GE$StockPrice[which.min(GE$StockPrice)]

# The maximum stock prive of Coca-Cola oveth this period
CocaCola$StockPrice[which.max(CocaCola$StockPrice)]

# The median stock price of Boeing over this period
median(Boeing$StockPrice)

# The sd of the stock price of P&G  over this period
sd(ProcterGamble$StockPrice)


## Plotting
## Visualizing Stock Dynamics

plot(CocaCola$Date, CocaCola$StockPrice, xlab = 'Date', ylab = 'Stock Price', 
     main = 'CocaCola Stockprice from 1970 to 2009')














