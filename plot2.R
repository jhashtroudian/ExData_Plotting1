# a plot of global active power against days

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
plot(datetime, hpc_subset$Global_active_power, type ='l', xlab = " ", ylab = "Global Active Power (kilowatts)")

# write as png file
# first cd working directory to where plots must go
setwd("C:/exdata_plotting1/ExData_Plotting1/figure")
# now write line plot as png
dev.copy(png, "plot2.png")
# close device to close file
dev.off()

