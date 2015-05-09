#reset the work directory
setwd("E:/coursera/Exploeratory data analysis/assignment/exdata-data-household_power_consumption")
#change the local language
Sys.setlocale("LC_TIME", "English")
#read the data
install.packages("sqldf")
library(sqldf)
data <- read.csv.sql(file = "household_power_consumption.txt", 
                     sep = ";", colClasses = c("Date","character", rep("numeric", 7)), 
                     sql = "select * from file where Date = '1/2/2007'
                             or Date = '2/2/2007'")
#save the plot to a PNG file
png("plot1.png")
##plot the histogram
hist(data$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)"
     , main = "Global Active Power")
#closs graphic device
dev.off()















