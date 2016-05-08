# plot1 A histogram of 2880 observations of Global Active Power

# start with a clean sheet to make sure this works
rm(list = ls())

# reading the table this time with  stringsAsFactors = FALSE
hpc <- read.table("c:/exdata_plotting1/household_power_consumption.txt", header = TRUE, sep=";")

# subset just the two days for the asignment
hpcs <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007" )

# rm unneeded table
rm(hpc)

# draw first graph
# since this is just a histogram we dont need to separate the date
 hist(as.numeric(as.character(hpcs$Global_active_power)), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
# write as png file
# first cd working directory to where plots must go
setwd("C:/exdata_plotting1/ExData_Plotting1/figure")
# now write hist plot
dev.copy(png, "plot1.png")
# close device to close file
dev.off()

