#reading and cleaning data
rawdata <- read.table('household_power_consumption.txt', header=TRUE, sep=';')
rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")
mydata <- subset(rawdata, Date=='2007-02-01' | Date=='2007-02-02')

#ploting
mydata$timestamp <- paste(mydata$Date, mydata$Time) #Concat 2 strings
plot2 <- function() {
	plot(as.POSIXct(mydata$timestamp), mydata$Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab='')
	dev.copy(png, file='plot2.png')
	dev.off()
}
plot2()