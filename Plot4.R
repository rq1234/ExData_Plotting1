setwd("C:\\Users\\rongq\\OneDrive\\3 COURSE\\01 Data Science Specialization (John Hopkins)\\04 Exploratory Data Analysis\\Week 1")
fileUrl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, dest="consume.zip", full.names=TRUE)
if (!file.exists("household_power_consumption.txt")) { 
  unzip("consume.zip") 
}
consume <- read.table("household_power_consumption.txt",header=TRUE, sep=';', 
                      na.strings="?", stringsAsFactors=FALSE)
consume$Date <- as.Date(consume$Date, format="%d/%m/%Y")
consumeSub <- subset(consume, Date %in% as.Date(c("2007-02-01", "2007-02-02")))
consumeSub$DateTime <- as.POSIXct(paste(consumeSub$Date, consumeSub$Time))

png(filename='plot4new.png', width=960, height=480, units="px" )

par(mfrow=c(2,2))
plot(consumeSub$DateTime, consumeSub$Global_active_power, xlab="", 
     ylab="Global Active Power (kilowatts)", type="l")

plot(consumeSub$DateTime, consumeSub$Voltage, xlab = 'datetime', 
     ylab = 'Voltage', type = 'l')

matplot(consumeSub$DateTime, consumeSub[, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")], 
        type = 'l', col = c('black', 'red', 'blue'), xlab = '', ylab = 'Energy sub metering')

legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)

plot(consumeSub$DateTime, consumeSub$Global_reactive_power, xlab = 'datetime', 
     ylab = 'Global_reactive_power', type = 'l')

dev.off()