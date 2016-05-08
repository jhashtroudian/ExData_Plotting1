# a plot of global active power against days

# start with a clean sheet to make sure this works
rm(list = ls())


# laod libraries for tidying - not all will be used in all this weeks assignment
require(dplyr)
require(tidyr)
library(lubridate)

# reading the table
hpc <- read.table("c:/exdata_plotting1/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)

# subset just the two days for the asignment
hpc_subset <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007" )

# make a good date time with 
datetime <- strptime(paste(hpc_subset$Date, hpc_subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# allow for four plots in a 2 by 2 matrix
par(mfrow = c(2,2))

# first plot
plot(datetime, hpc_subset$Global_active_power, type ='l', xlab = " ", ylab = "Global Active Power (kilowatts)")

#second one
 plot(datetime, hpc_subset$Voltage, type = 'l', ylab = "Voltage")

# coppied from plot3.r 
# now plot first line
plot(datetime, hpc_subset$Sub_metering_1, type ='l', xlab = " ", ylab = "Energy Sub metering")
# add two more line plots
lines(datetime, hpc_subset$Sub_metering_2, col = "red")
lines(datetime, hpc_subset$Sub_metering_3, col = "blue")

# add the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1, lwd = 1)

# Last plot
 plot(datetime, hpc_subset$Global_reactive_power, type = 'l', xlab = "datetime", ylab = "Global_reactive_power")



# write as png file
# first cd working directory to where plots must go
setwd("C:/exdata_plotting1/ExData_Plotting1/figure")
# now write line plot as png
dev.copy(png, "plot4.png")
# close device to close file
dev.off()

