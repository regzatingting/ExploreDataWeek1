#reading and cleaning data
rawdata <- read.table('household_power_consumption.txt', header=TRUE, sep=';')
rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")
mydata <- subset(rawdata, Date=='2007-02-01' | Date=='2007-02-02')

#plotting
mydata$timestamp <- paste(mydata$Date, mydata$Time) #Concat 2 strings
mydata$timestamp2 <- as.POSIXct(mydata$timestamp)
mydata$Sub_metering_1 <- as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2 <- as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3 <- as.numeric(as.character(mydata$Sub_metering_3)) 

plot3 <- function() {
	plot(mydata$timestamp2, mydata$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
	lines(mydata$timestamp2, mydata$Sub_metering_2, col='red')
	lines(mydata$timestamp2, mydata$Sub_metering_3, col='blue')
	legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=1, col=c('black','red','blue'), cex=.75)
	dev.copy(png, file='plot3.png')
	dev.off()
}
plot3()