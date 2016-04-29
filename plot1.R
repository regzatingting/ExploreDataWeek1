#reading and cleaning data
rawdata <- read.table('household_power_consumption.txt', header=TRUE, sep=';')
rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")
mydata <- subset(rawdata, Date=='2007-02-01' | Date=='2007-02-02')

#ploting
mydata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))
plot1 <- function() {
	hist(mydata$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
	dev.copy(png, file='plot1.png')
	dev.off()
} 
plot1()