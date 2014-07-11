# Exploratory Data Analysis - Project 1 - Plot 4

setwd("~/Coursera/exploratory/project1")

data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                 stringsAsFactors = FALSE)

datetime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
data <- cbind(data, datetime)

datasub <- data[data$datetime >= as.POSIXct("2007-02-01 00:00:00") 
              & data$datetime <= as.POSIXct("2007-02-02 23:59:59"), ]

# produce plot for PNG device
png("plot4.png", height=480, width=480)  # Copy my plot to a PNG file

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# 1st plot
with(datasub, plot(datetime, Global_active_power, main="", type = "l", xlab="",
                   ylab="Global Active Power"))

# 2nd plot
with(datasub, plot(datetime, Voltage, main="", type="l"))

# 3rd plot
with(datasub, plot(datetime, Sub_metering_1, main="", type = "l", xlab="",
                   ylab="Energy sub metering"))
with(datasub, points(datetime, Sub_metering_2, col="red", type="l"))
with(datasub, points(datetime, Sub_metering_3, col="blue", type="l"))
legend("topright", col = c("black", "red", "blue"), lwd = 1, cex = 0.7,  
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# 4th plot
with(datasub, plot(datetime, Global_reactive_power, main="", type="l"))

dev.off()

