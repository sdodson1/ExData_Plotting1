#read data
dataAll <- read.table("household_power_consumption.txt", 
                      header = TRUE, sep = ";")
dataAll$Date <- as.Date(strptime(dataAll$Date, "%d/%m/%Y"))

#subset for dates between 2007-02-01 and 2007-02-02
data <- dataAll[dataAll$Date >= "2007-02-01" & dataAll$Date <= "2007-02-02", ]

#Plot global active power and save to png
data$Global_active_power <- as.numeric(data$Global_active_power)
png(file = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
