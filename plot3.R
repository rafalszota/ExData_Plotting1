#Read Data

data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"), ]

#Format date time and numbers
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

#Device PNG
png('plot3.png', width = 480, height = 480, units = "px", pointsize = 12)

#Plot
plot(data$DateTime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", yaxt='n')
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c('black', 'red', 'blue'), lty=1)
axis(2, at=c(0, 10, 20, 30), las=1)

#Close
dev.off()