## Loads data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = c("?",""))

## Subsets the data
data <- data[data$Date ==  "1/2/2007" | data[,"Date"] ==  "2/2/2007",]

## Converts date & time data
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$timetemp <- paste(data$Date, data$Time)
data$Time <- strptime(data$timetemp, format = "%Y-%m-%d %H:%M:%S")

## Renders plot with PNG device
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
