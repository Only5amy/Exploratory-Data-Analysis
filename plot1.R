## Exploratory graphs Project - Plot 1

## step 1: read the data into R from the txt file
powerdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
powerdata$Date = as.Date(powerdata$Date,"%d/%m/%Y") #change Date data type
powerdata$Time = strptime(powerdata$Time, "%H:%M:%S") #change Time data type

## step 2: subset the data to only 2007-02-01 and 2007-02-02
powerdatasubset <- powerdata[powerdata$Date=="2007-02-01" | powerdata$Date=="2007-02-02",]

## step 3: construct plot 1
png("plot1.png", width=480, height=480)
hist(powerdatasubset$Global_active_power, col="red", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()



