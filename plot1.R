# Make sure time locale is English
Sys.setlocale("LC_TIME", "English")

# Read and subset data. NA is represented by "?".
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
sub_data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# Make sure it is 1 Graph layout and default font size.
par(mfrow=c(1,1))
par(cex=1)

# Generate Graph
hist(sub_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Save to a File
dev.copy(png, file = "plot1.png", bg = "white", width=480, height=480)
dev.off()
