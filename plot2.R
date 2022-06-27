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
plot(data$datetime, data$Global_active_power, type="n", xlab="", ylab="Global Active Power (Kilowatts)")
lines(data$datetime, data$Global_active_power)
dev.copy(png, "plot2.png")
dev.off()