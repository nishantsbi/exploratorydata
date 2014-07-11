# Exploratory Data Analysis - Project 1 - Plot 3

setwd("~/Coursera/exploratory/project1")

data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                 stringsAsFactors = FALSE)

datetime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
data <- cbind(data, datetime)

datasub <- data[data$datetime >= as.POSIXct("2007-02-01 00:00:00") 
              & data$datetime <= as.POSIXct("2007-02-02 23:59:59"), ]

# produce plot for screen
par(mar = c(5, 4, 4, 1))
with(datasub, plot(datetime, Sub_metering_1, main="", type = "l", xlab="",
                   ylab="Energy sub metering"))
with(datasub, points(datetime, Sub_metering_2, col="red", type="l"))
with(datasub, points(datetime, Sub_metering_3, col="blue", type="l"))
legend("topright", col = c("black", "red", "blue"), lwd = 1, cex = 0.7,  
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# reproduce plot for PNG device
png("plot3.png", height=480, width=480)  # Copy my plot to a PNG file
par(mar = c(5, 4, 4, 1))
with(datasub, plot(datetime, Sub_metering_1, main="", type = "l", xlab="",
                   ylab="Energy sub metering"))
with(datasub, points(datetime, Sub_metering_2, col="red", type="l"))
with(datasub, points(datetime, Sub_metering_3, col="blue", type="l"))
legend("topright", col = c("black", "red", "blue"), lwd = 1, cex = 0.7,  
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()    # close the PNG device

