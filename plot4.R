#reading and cleaning data
rawdata <- read.table('household_power_consumption.txt', header=TRUE, sep=';')
rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")
mydata <- subset(rawdata, Date=='2007-02-01' | Date=='2007-02-02')

#plotting
mydata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))
mydata$timestamp <- paste(mydata$Date, mydata$Time) #Concat 2 strings
mydata$timestamp2 <- as.POSIXct(mydata$timestamp)
mydata$Sub_metering_1 <- as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2 <- as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3 <- as.numeric(as.character(mydata$Sub_metering_3)) 
mydata$Voltage <- as.numeric(as.character(mydata$Voltage)) 
mydata$Global_reactive_power <- as.numeric(as.character(mydata$Global_reactive_power))

plot4 <- function(){
	par(mfrow=c(2,2))
	#1
	plot(mydata$timestamp2, mydata$Global_active_power, type='l', ylab='Global Active Power', xlab='')
	#2
	plot(mydata$timestamp2, mydata$Voltage, type='l', ylab='Voltage', xlab='datetime')
	#3
	plot(mydata$timestamp2, mydata$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
	lines(mydata$timestamp2, mydata$Sub_metering_2, col='red')
	lines(mydata$timestamp2, mydata$Sub_metering_3, col='blue')
	legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=1, col=c('black','red','blue'), cex=.75)
	#4
	plot(mydata$timestamp2, mydata$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')

	dev.copy(png, file='plot4.png')
	dev.off()
}
plot4()