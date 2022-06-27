## use package data.table to read the data
library(data.table)
data <- fread("./Data/household_power_consumption.txt", na.strings="?")

## use package lubridate to create the date_time variable and use package dplyr to insert this new variable
library(lubridate)
library(dplyr)
data <- as_tibble(data)
data <- mutate(datetime=dmy_hms(paste(data$Date, data$Time)), data[, 3:9])

## select data from the dates 2007-02-01 and 2007-02-02
data <- filter(data, datetime>=dmy("01/02/2007") & datetime<dmy("03/02/2007"))

## create the line plot
plot(data$datetime, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_1, col="black")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("top", lty=c(1,1,1), col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.copy(png, "plot3.png")
dev.off()