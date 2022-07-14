dataAll <- read.table("household_power_consumption.txt", 
                      header = TRUE, sep = ";")
dataAll$Date <- as.Date(strptime(dataAll$Date, "%d/%m/%Y"))

#subset for dates between 2007-02-01 and 2007-02-02
data <- dataAll[dataAll$Date >= "2007-02-01" & dataAll$Date <= "2007-02-02", ]

#combine date&time
data$date<- as.POSIXct(paste(data$Date, data$Time))

#Plot global active power plot2 and save to png
data[,7:9] <- sapply(data[,7:9], as.numeric)
png(file = "plot3.png", width = 480, height = 480)
with(data, {
       plot(date, Sub_metering_1, type = "s",
            ylab = "Energy sub metering",
            xlab = "")
       lines(date, Sub_metering_2, type = "s", col = "red")
       lines(date, Sub_metering_3, type = "s", col = "blue")
       legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                                     "Sub_metering_3"), 
              col = c("black", "blue", "red"), lwd = 2,
              xjust = 1, yjust = 1)
})
dev.off()
