## Loads data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = c("?",""))

## Subsets the data
data <- data[data$Date ==  "1/2/2007" | data[,"Date"] ==  "2/2/2007",]

## Converts date & time data
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$timetemp <- paste(data$Date, data$Time)
data$Time <- strptime(data$timetemp, format = "%Y-%m-%d %H:%M:%S")

## Renders plot with PNG device
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(3,4,1,1))

    ## Graph 1
    plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    ## Graph 2
    plot(data$Time, data$Voltage, type = "l", xlab = "", ylab = "Voltage")
    ## Graph 3
    plot(data$Time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(data$Time, data$Sub_metering_2, type = "l", col = "red")
    lines(data$Time, data$Sub_metering_3, type = "l", col = "blue")
    legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= c(1,1,1)   , col = c("black","red", "blue"),bty = "n")
    ## Graph 4
    plot(data$Time, data$Global_reactive_power, type = "l", xlab = "", ylab = "Global_reactive_power")

dev.off()

