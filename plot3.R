#reset the work directory
setwd("E:/coursera/Exploeratory data analysis/assignment/exdata-data-household_power_consumption")
#change the language
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
png("plot3.png")
#set global graphics devices
par("mar" = c(4, 4, 2, 2))
##plot the graph where x = Sub_metering_1
plot(date, data$Sub_metering_1, type = "l", col = "black", xlab = "",
     ylab = "Energy sub metering")
##add two lines where x = Sub_metering_2 and x = Sub_metering_2
lines(date, data$Sub_metering_2, type = "l", col = "red")
lines(date, data$Sub_metering_3, type = "l", col = "blue")
##add the legend in the topright
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
col = c("black", "red", "blue")
legend("topright", legend = legend, lty = 1, col = col)
#closs graphic device
dev.off()
