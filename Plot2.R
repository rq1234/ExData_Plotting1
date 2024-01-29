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
png(filename='plot2new.png', width=480, height=480, units="px" )
with(consumeSub, plot(DateTime, Global_active_power, type="l", xlab="", 
                      ylab="Global Active Power (kilowatts)"))
getwd()
setwd("C:/Users/rongq/OneDrive/3 COURSE/01 Data Science Specialization (John Hopkins)/04 Exploratory Data Analysis/Week 1/consume")
