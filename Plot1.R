library(dplyr)
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)
housepow <-tibble(data) %>%
           filter(Date == "1/2/2007"| Date == "2/2/2007") %>%
           transform(Global_active_power = as.numeric(Global_active_power))
png(file ="plot1.png",width=480,height = 480)
hist(housepow$Global_active_power,main = "Global active power",col = "red",
     xlab = "Global Active Power (kilowatts)")

dev.off()         
dev.cur()
