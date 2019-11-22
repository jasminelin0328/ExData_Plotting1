#load the data.table package
library(data.table)

#read the table
powerdata <- read.table("/Users/jasminelin/Coursera-datascience-R*material/household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
head(powerdata)

#convert the date column to date type
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")

#subtract the data from 2007-02-01 to 2007-02-02
powerdata <- powerdata[powerdata$Date >= "2007-02-01" & powerdata$Date <= "2007-02-02", ]

#create a PNG file with a width of 480 pixels and a height of 480 pixels
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(powerdata,{
        plot(dateTime, powerdata$Global_active_power,type = "l", ylab="Global Active Power (kilowatts)", xlab = "")
        plot(dateTime, powerdata$Voltage,type = "l", ylab="Voltage", xlab = "datetime")
})
with(powerdata,{
        plot(dateTime, Sub_metering_1,type = "l", col = "black", ylab = "Energy sub metering")
        lines(dateTime, Sub_metering_2,type = "l", col = "red")
        lines(dateTime, Sub_metering_3,type = "l", col = "blue")
})
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=1, lwd=1)
with(powerdata, plot(dateTime, powerdata$Global_reactive_power,type = "l", ylab="Global_reactive_power", xlab = "datetime"))
dev.off()