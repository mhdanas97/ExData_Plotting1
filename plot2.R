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
png('plot2.png')
plot(dates,as.numeric(DT$Global_active_power),
     ylab = 'Global Active Power (kilowats)',type='l')
dev.off()


