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
png(filename = "plot3.png")
plot(hpc1$Sub_metering_1,type="l",xaxt="n",xlab="",ylab = "Energy sub metering")
axis(1, c(0,1440,2880), c("Thu","Fri","Sat"))
lines(hpc1$Sub_metering_2,type = "l", col="red")
lines(hpc1$Sub_metering_3,type = "l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1)
dev.off()