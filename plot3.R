## create plot 3 for week 1 of exploratory data analysis

## read the data in from your current working directory
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

## put the dates into the correct format and filter for just the days that we want (dplyr)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_small <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

## put the data into numeric format
data_small$Sub_metering_1 <- as.numeric(as.character(data_small$Sub_metering_1))
data_small$Sub_metering_2 <- as.numeric(as.character(data_small$Sub_metering_2))
data_small$Sub_metering_3 <- as.numeric(as.character(data_small$Sub_metering_3))

## combine the dates and times
data_small$date_time <- as.POSIXct(paste(data_small$Date, data_small$Time), "%d/%m/%Y %H:%M:%S")

## plot the data
plot(data_small$date_time, data_small$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data_small$date_time, data_small$Sub_metering_2, col = "red")
lines(data_small$date_time, data_small$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

## save the file as a png
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()