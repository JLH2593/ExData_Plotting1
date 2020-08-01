library(dplyr)
library(lubridate)
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings ="?")
data$Date_Time <-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data <-tibble(data) %>%
  filter(Date == "1/2/2007"| Date == "2/2/2007")
data$weekday <- wday(data$Date_Time,label = TRUE)
png(file = "plot4.png",width = 480, height = 480)
#Plot1
par(mfrow = c(2,2))
par(mar =c(4,4,4,2))
with(data,plot(Date_Time,Global_active_power,type ="n",ylab = "Global Active Power (kilowatts)",xlab = ""))
lines(data$Date_Time,data$Global_active_power)
#plot2
par(mar =c(4,4,4,2))
with(data,plot(Date_Time,Voltage,type ="n",xlab = "datetime"))
lines(data$Date_Time,data$Voltage)
#Plot3
par(mar =c(4,4,4,2))
plot(data$Date_Time,data$Sub_metering_1,type ="n",ylab ="Energy sub metering",xlab = "")
lines(data$Date_Time,data$Sub_metering_1)
lines(data$Date_Time,data$Sub_metering_2,col="red")
lines(data$Date_Time,data$Sub_metering_3,col="blue")
legend("topright",lwd=c(1,1,1),cex = 0.5,col = c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#plot4
par(mar =c(4,4,4,2))
with(data,plot(Date_Time,Global_reactive_power,type ="n",xlab = "datetime"))
lines(data$Date_Time,data$Global_reactive_power)
dev.off()

