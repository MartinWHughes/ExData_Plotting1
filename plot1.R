library(lubridate)
# Read the data file
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors = FALSE)
# Change the text dates to dates
data$Date <- dmy(data$Date)
# Just select the dates of interest
data <- subset(data, data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"))

# Create the graph
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
