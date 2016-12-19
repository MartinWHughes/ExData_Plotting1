library(lubridate)
# Read the data file
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors = FALSE)
# Change the text dates to dates
data$Date <- dmy(data$Date)
# Just select the dates of interest
data <- subset(data, data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"))

# Get the time 
data$Time <- hms(data$Time)
data$datetime = data$Date + data$Time

# Create the graph
png("plot3.png", width=480, height=480)
with(data, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data, lines(data$datetime, data$Sub_metering_2, type = "l", col="red"))
with(data, lines(data$datetime, data$Sub_metering_3, type = "l", col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
