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
png("plot4.png")
#set global graphics devices
par(mfrow = c(2, 2), mar = c(4, 4, 2, 2))
#change the class of date
x <- paste(data$Date, data$Time)
date <- strptime(x, "%d/%m/%Y %H:%M:%S")
##draw the topleft graph
plot(date, data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power")
##draw the topright graph
plot(date, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
##draw the bottomleft graph
plot(date, data$Sub_metering_1, type = "l", col = "black", xlab = "",
     ylab = "Energy sub metering")
lines(date, data$Sub_metering_2, type = "l", col = "red")
lines(date, data$Sub_metering_3, type = "l", col = "blue")
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
col = c("black", "red", "blue")
legend("topright", legend = legend, lty = 1, col = col, bty = "n")
##draw the bottomright graph
plot(date, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "
     Global_reactive_power")
#closs graphic device
dev.off()