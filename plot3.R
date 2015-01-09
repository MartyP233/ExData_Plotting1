#Electric power consumption

#Read in dataset from UCI website

url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(url, 'powerconsumption.zip')
unzip('powerconsumption.zip')
dataset <- read.csv('household_power_consumption.txt', sep = ';', na.strings = '?')

# Set working directory to Github folder

setwd('~/GitHub/ExData_Plotting1')

# Preprocess data - convert variables to their correct class, subset the data to
# the include only the correct dates, set correct classes for variables

dataset$Time <- paste(dataset$Date, dataset$Time)
dataset$Time <- strptime(dataset$Time, "%d/%m/%Y %H:%M:%S")
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")

dataset <- dataset[dataset$Date == '2007-02-01' | dataset$Date == '2007-02-02', ]

# Create plot in png file
png(file = 'plot3.png')
plot(dataset$Time, dataset$Sub_metering_1, type = "n", pch = '.', 
     ylab = 'Energy sub metering', xlab = '')
points(dataset$Time, dataset$Sub_metering_1, type = "o", pch = '.')
points(dataset$Time, dataset$Sub_metering_2, type = "o", pch = '.', col = 'red')
points(dataset$Time, dataset$Sub_metering_3, type = "o", pch = '.', col = 'blue')
legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
lty=c(1,1,1),col=c("black","red","blue"))
dev.off()