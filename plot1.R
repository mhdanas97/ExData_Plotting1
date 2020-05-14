## This script will create plot1.png
## Make sure to unzip data file in a directory with the name `data`
## Make sure to install `data.table` and `lubridate`

library(data.table)
library(lubridate)

# Read data and get only the subset needed
DT <- fread('data/household_power_consumption.txt',sep = ';')
DT <- DT[Date %in% c('1/2/2007','2/2/2007'),]

# Open PNG device and plot a histogram with color red and an xlabel
# and main title
png('plot1.png')
hist(as.numeric(DT$Global_active_power),
     xlab = 'Global Active Power (kilowats)',
     main = 'Global Active Power',
     col = 'red')
dev.off()