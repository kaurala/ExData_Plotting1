#reset the work directory
setwd("E:/coursera/Exploeratory data analysis/assignment/exdata-data-household_power_consumption")
#change the local language
Sys.setlocale("LC_TIME", "English")
#read the data
install.packages("sqldf")
library(sqldf)
data <- read.csv.sql(file = "household_power_consumption.txt", 
                     sep = ";", colClasses = c("Date",
                                               "character", rep("numeric", 7)), 
                     sql = "select * from file where Date = '1/2/2007'
                             or Date = '2/2/2007'")
#save the graph to a PNG file
png("plot2.png")
##plot the line chart
y <- data$Global_active_power
x <- paste(data$Date, data$Time)
date <- strptime(x, "%d/%m/%Y %H:%M:%S")
plot(date, y, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
#closs graphic device
dev.off()
