# Exploratory Data Analysis - Project 1 - Plot 2

setwd("~/Coursera/exploratory/project1")

data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                 stringsAsFactors = FALSE)

datetime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
data <- cbind(data, datetime)

datasub <- data[data$datetime >= as.POSIXct("2007-02-01 00:00:00") 
              & data$datetime <= as.POSIXct("2007-02-02 23:59:59"), ]

par(mar = c(5, 5, 4, 2))
with(datasub, plot(datetime, Global_active_power, main="", type = "l", xlab="",
                   ylab="Global Active Power (kilowatts)"))

dev.copy(png, file = "plot2.png", height=480, width=480)  # Copy my plot to a PNG file
dev.off()    # close the PNG device

