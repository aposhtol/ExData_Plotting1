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
png(filename = "plot1.png")
hist(hpc1$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col="red")
dev.off()