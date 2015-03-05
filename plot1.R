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
png('plot1.png', width = 480, height = 480, units = "px", pointsize = 12)

#Plot
hist(data$Global_active_power, main="Global Active Power",  
     xlab="Global Active Power (killowatts)", 
     ylab="Frequency", col="red", yaxt='n')
axis(2, at = ylabel, las = 1)

#Close
dev.off()