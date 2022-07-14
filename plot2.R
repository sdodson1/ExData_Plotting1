dataAll <- read.table("household_power_consumption.txt", 
                      header = TRUE, sep = ";")
dataAll$Date <- as.Date(strptime(dataAll$Date, "%d/%m/%Y"))

#subset for dates between 2007-02-01 and 2007-02-02
data <- dataAll[dataAll$Date >= "2007-02-01" & dataAll$Date <= "2007-02-02", ]

#add weekday column, and combine date&time
data$Weekday <- weekdays(data$Date)
data$date<- as.POSIXct(paste(data$Date, data$Time))

#Plot global active power plot2 and save to png
data$Global_active_power <- as.numeric(data$Global_active_power)
png(file = "plot2.png", width = 480, height = 480)
with(data, {
       plot(date, Global_active_power, type = "l",
            ylab = "Global Active Power (kilowatts)",
            xlab = "")
})
dev.off()
