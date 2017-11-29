## create plot 4 for week 1 of exploratory data analysis

## read the data in from your current working directory
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

## put the dates into the correct format and filter for just the days that we want (dplyr)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_small <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

## put the data into numeric format
data_small$Sub_metering_1 <- as.numeric(as.character(data_small$Sub_metering_1))
data_small$Sub_metering_2 <- as.numeric(as.character(data_small$Sub_metering_2))
data_small$Sub_metering_3 <- as.numeric(as.character(data_small$Sub_metering_3))
data_small$Global_active_power <- as.numeric(as.character(data_small$Global_active_power))
data_small$Global_reactive_power <- as.numeric(as.character(data_small$Global_reactive_power))
data_small$Voltage <- as.numeric(as.character(data_small$Voltage))

## combine the dates and times
data_small$date_time <- as.POSIXct(paste(data_small$Date, data_small$Time), "%d/%m/%Y %H:%M:%S")

## plot the data
par(mfrow = c(2, 2))

## top left
plot(data_small$date_time, data_small$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## top right
plot(data_small$date_time, data_small$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## bottom left
plot(data_small$date_time, data_small$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data_small$date_time, data_small$Sub_metering_2, col = "red")
lines(data_small$date_time, data_small$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

## bottom right
plot(data_small$date_time, data_small$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

## save to a file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()