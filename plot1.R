# Exploratory Data Analysis - Project 1 - Plot 1

setwd("~/Coursera/exploratory/project1")
getwd()

data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                 stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

datasub <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]


par(mar = c(5, 5, 4, 2))
with(datasub, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)"
                   , col="red"))
dev.copy(png, file = "plot1.png", height=480, width=480)  # Copy my plot to a PNG file
dev.off()    # close the PNG device
