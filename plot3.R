# Make sure time locale is English
Sys.setlocale("LC_TIME", "English")

# Read and subset data. NA is represented by "?".
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
sub_data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# Join Date and Time columns into a Date-Time List
datetime <- paste(sub_data$Date, sub_data$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

# Make sure it is 1 Graph layout and default font size.
par(mfrow=c(1,1))
par(cex=1)

# Generate Graph
plot(datetime, sub_data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
lines(datetime, sub_data$Sub_metering_1, type="l", col="darkgrey")
lines(datetime, sub_data$Sub_metering_2, type="l", col="red")
lines(datetime, sub_data$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5, 2.5, 2.5), col=c("darkgrey", "red", "blue"))

# Save to a File
dev.copy(png, file = "plot3.png", bg = "white", width=480, height=480)
dev.off()