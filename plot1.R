## create plot 1 for week 1 of exploratory data analysis

## read the data in from your current working directory
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

## put the dates into the correct format and filter for just the days that we want (dplyr)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_small <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

## put the data into numeric format
data_small$Global_active_power <- as.numeric(as.character(data_small$Global_active_power))

## plot the data
hist(data_small$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

## save the file as a png
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
