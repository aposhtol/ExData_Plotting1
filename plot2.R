# Reading & preparing data
url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile = "pwr.zip")
unzip("pwr.zip")
hpc<-read.csv("household_power_consumption.txt", sep=";",na.strings = "?")
library(lubridate)
hpc$Date<-dmy(hpc$Date)
hpc$Time<-hms(hpc$Time)
hpc1<-subset(hpc,Date >="2007-02-01" & Date <= "2007-02-02")
#Plotting to PNG
png(filename = "plot2.png")
plot(hpc1$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(1, c(0,1440,2880), c("Thu","Fri","Sat"))
dev.off()