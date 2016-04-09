# Make sure time locale is English
Sys.setlocale("LC_TIME", "English")

# Read and subset data. NA is represented by "?".
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
sub_data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# Join Date and Time columns into a Date-Time List
datetime <- paste(sub_data$Date, sub_data$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

# Make it 2x2 Graph layout and 0.7x scaled font size.
par(mfrow=c(2,2))
par(cex=0.7)

# Generate Graph 1
plot(datetime, sub_data$Global_active_power, xlab="", ylab="Global Active Power", type="n")
lines(datetime, sub_data$Global_active_power, type="l")

# Generate Graph 2
plot(datetime, sub_data$Voltage, xlab="datetime", ylab="Voltage", type="n")
lines(datetime, sub_data$Voltage, type="l")

# Generate Graph 3
plot(datetime, sub_data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
lines(datetime, sub_data$Sub_metering_1, type="l", col="darkgrey")
lines(datetime, sub_data$Sub_metering_2, type="l", col="red")
lines(datetime, sub_data$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5, 2.5, 2.5), col=c("darkgrey", "red", "blue"), bty="n")

# Generate Graph 4
plot(datetime, sub_data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="n")
lines(datetime, sub_data$Global_reactive_power, type="l")

# Save to a File
dev.copy(png, file = "plot4.png", bg = "white", width=480, height=480)
dev.off()



