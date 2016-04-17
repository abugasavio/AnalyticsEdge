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
     main = 'CocaCola Stockprice from 1970 to 2009', col='red', type="l")

lines(ProcterGamble$Date, ProcterGamble$StockPrice, col="blue", lty=2)

abline(v=as.Date(c("1983-03-01")), lwd=2)

plot(CocaCola$Date[301:432], CocaCola$StockPrice[301:432], type="l", col="red", ylim=c(0,210),
    main = "Stock Price 1995 - 2005")

lines(IBM$Date[301:432], IBM$StockPrice[301:432], col="blue")

lines(GE$Date[301:432], GE$StockPrice[301:432], col="green")

lines(ProcterGamble$Date[301:432], ProcterGamble$StockPrice[301:432], col="orange")

lines(Boeing$Date[301:432], Boeing$StockPrice[301:432], col="black")

abline(v=as.Date(c("1997-9-01")))

abline(v=as.Date(c("1997-11-01")))

abline(v=as.Date(c("2004-01-01")), lwd=2)

abline(v=as.Date(c("2005-12-31")), lwd=2)

# Monthly Trends




