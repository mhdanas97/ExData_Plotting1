## This script will create plot1.png
## Make sure to unzip data file in a directory with the name `data`
## Make sure to install `data.table` and `lubridate`

library(data.table)
library(lubridate)

# Read data and get only the subset needed
DT <- fread('data/household_power_consumption.txt',sep = ';')
DT <- DT[Date %in% c('1/2/2007','2/2/2007'),]

## Get dates to plot on the xaxis
dates <- dmy_hms(paste(DT$Date,DT$Time))

#Open png device and plot dates on x axis and global active power on y
png('plot4.png')
par(mfrow= c(2,2))
plot(dates,as.numeric(DT$Global_active_power),type='l',
     ylab='Global Active Power',xlab='')
plot(dates,as.numeric(DT$Voltage),type='l',ylab='Voltage',xlab='datetime')

plot(dates,as.numeric(DT$Sub_metering_1),type='l',
     ylab = 'Energy Sub metering',col='black',xlab='')
lines(dates, as.numeric(DT$Sub_metering_2),type = 'l',col='red')
lines(dates, as.numeric(DT$Sub_metering_3),type = 'l',col='blue')
# lty=1 must be specified
legend('topright',
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c('black','red','blue'),
       lty=1,
       bty='n')

plot(dates, as.numeric(DT$Global_reactive_power),
     type='l',
     xlab='datetime',
     ylab = 'Global_reactive_power')

dev.off()
