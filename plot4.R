## Read in data
data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880, na.strings = "?")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Process date and time into a single entry
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data <- cbind(datetime,data)

## Create image
png("plot4.png")
par(mfrow=c(2,2))

## top left plot
plot(data$datetime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

## top right plot
plot(data$datetime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

## bottom left plot
plot(data$datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(data$datetime, data$Sub_metering_2, type = "l", col = "red")
points(data$datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,  bty='n', col = c("black","red","blue"))

## bottom right plot
plot(data$datetime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
