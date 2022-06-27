## use package data.table to read the data
library(data.table)
data <- fread("./Data/household_power_consumption.txt")

## select data from the dates 2007-02-01 and 2007-02-02
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

## Create the histogram of global active power 
hist(as.numeric(data$Global_active_power), xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", main="Global Active Power", col="red")

dev.copy(png, "plot1.png")

dev.off()
