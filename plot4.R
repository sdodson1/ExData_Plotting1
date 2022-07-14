dataAll <- read.table("household_power_consumption.txt", 
                      header = TRUE, sep = ";")
dataAll$Date <- as.Date(strptime(dataAll$Date, "%d/%m/%Y"))

#subset for dates between 2007-02-01 and 2007-02-02
data <- dataAll[dataAll$Date >= "2007-02-01" & dataAll$Date <= "2007-02-02", ]

#combine date&time
data$date<- as.POSIXct(paste(data$Date, data$Time))

#Plot global active power plot2 and save to png
data$Global_active_power <- as.numeric(data$Global_active_power)
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(data, {
       plot(date, Global_active_power, type = "l",
            ylab = "Global Active Power",
            xlab = "")
       plot(date, Voltage, type = "l",
            ylab = "Voltage", xlab = "datetime")
       plot(date, Sub_metering_1, type = "s",
            ylab = "Energy sub metering",
            xlab = "")
       lines(date, Sub_metering_2, type = "s", col = "red")
       lines(date, Sub_metering_3, type = "s", col = "blue")
       legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                                     "Sub_metering_3"), 
              col = c("black", "blue", "red"), lwd = 2,
              xjust = 1, yjust = 1)
       plot(date, Global_reactive_power, type = "l",
            ylab = "Global Reactive Power",
            xlab = "datetime")
})
dev.off()
