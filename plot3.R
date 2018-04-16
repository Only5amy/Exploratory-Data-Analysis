## Exploratory graphs Project - Plot 3

## step 1: read the data into R from the txt file
powerdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## step 2: create a new column merging Date and time into one
DateTime <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
powerdata <- cbind(powerdata, DateTime)

## step 3: subset the data to only 2007-02-01 and 2007-02-02
powerdata$Date = as.Date(powerdata$Date,"%d/%m/%Y") #change Date data type
powerdata$Time = strptime(powerdata$Time, "%H:%M:%S") #change Time data type
powerdatasubset <- powerdata[powerdata$Date=="2007-02-01" | powerdata$Date=="2007-02-02",]

## step 4: construct plot 3
png("plot3.png", width=480, height=480)
with(powerdatasubset,{
        plot(DateTime, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering")
        lines(DateTime, Sub_metering_2,type="l", col= "red")
        lines(DateTime, Sub_metering_3,type="l", col= "blue")
    })

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(1,1,1), col = c("black", "red", "blue"))
dev.off()
