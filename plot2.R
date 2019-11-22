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
png("plot2.png", width=480, height=480)
dateTime <- as.POSIXct(paste(powerdata$Date, powerdata$Time))
plot(dateTime, powerdata$Global_active_power,type = "l", ylab="Global Active Power (kilowatts)", xlab = "")
dev.off()