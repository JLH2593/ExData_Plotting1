library(dplyr)
library(lubridate)
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings ="?")
data$Date_Time <-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data <-tibble(data) %>%
       filter(Date == "1/2/2007"| Date == "2/2/2007")
data$weekday <- wday(data$Date_Time,label = TRUE)    
png(file ="plot2.png",width=480,height = 480)
par(mar =c(2,4,4,2))
with(data,plot(Date_Time,Global_active_power,type ="n",ylab = "Global Active Power (kilowatts)"))
lines(data$Date_Time,data$Global_active_power)

dev.off()         
