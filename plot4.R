## Exploratory graphs Project - Plot 4

## step 1: read the data into R from the txt file
powerdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## step 2: create a new column merging Date and time into one
DateTime <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
powerdata <- cbind(powerdata, DateTime)

## step 3: subset the data to only 2007-02-01 and 2007-02-02
powerdata$Date = as.Date(powerdata$Date,"%d/%m/%Y") #change Date data type
powerdata$Time = strptime(powerdata$Time, "%H:%M:%S") #change Time data type
powerdatasubset <- powerdata[powerdata$Date=="2007-02-01" | powerdata$Date=="2007-02-02",]

## step 4: plot the 4 graphs
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2)) 

# graph 1
with(powerdatasubset, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
# graph 2
with(powerdatasubset, plot(DateTime, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
# graph 3
with(powerdatasubset,{
        plot(DateTime, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering")
        lines(DateTime, Sub_metering_2,type="l", col= "red")
        lines(DateTime, Sub_metering_3,type="l", col= "blue")
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(1,1,1), col = c("black", "red", "blue"))
# graph 4
with(powerdatasubset, plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()