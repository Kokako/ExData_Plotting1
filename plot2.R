## Read in data
data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880, na.strings = "?")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Process date and time into a single entry
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data <- cbind(datetime,data)

## Create image
png("plot2.png")
plot(data$datetime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
