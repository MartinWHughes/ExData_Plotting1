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
png("plot2.png", width=480, height=480)
with(data, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
