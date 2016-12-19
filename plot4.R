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
png("plot4.png", width=480, height=480)
par(mfcol = c(2,2))
with(data,plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power" ))
with(data,plot(data$datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data,lines(datetime, Sub_metering_2, type = "l", col="red"))
with(data,lines(datetime, Sub_metering_3, type = "l", col="blue"))
legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(data,plot(datetime, Voltage, type = "l", ylab = "Voltage"))
with(data,plot(datetime, Global_reactive_power, type = "l", ylab = "Global_reactive_power"))
dev.off()
