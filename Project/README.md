## Exploratory Data Analysis Project 1
This project is based on the ashumeow, guindilla, dmaurath, TarekDib03 publications.

This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the “Individual household electric power consumption Data Set” which I have made available on the course web site:

Dataset:
[Electric power consumption](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip) [20Mb]
</br>Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.


## Execution
```R

# Print the current working directory
print(getwd())
# Declare our working variables
file.name <- "./Data/household_power_consumption.txt"
url       <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zip.file  <- "./Data/data.zip"

# Check if the data is downloaded and download when applicable
if (!file.exists(file.name)) {
        download.file(url, destfile = zip.file)
        unzip(zip.file)
        file.remove(zip.file)
        print("Downloaded the source file for plotting..")
}

## Getting full dataset
powerDT <- read.csv(file.name, header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
powerDT$Date <- as.Date(powerDT$Date, format="%d/%m/%Y")

## Subsetting the data
subsetData <- subset(powerDT, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# Remove the orginal dataset to optimize the excection of the script 
rm(powerDT)

# Convert column that we will use to correct class
subsetData$Global_active_power <- as.numeric(subsetData$Global_active_power)

# Do the graph
png(file = "./Project/plot1.png", width = 480, height = 480, units = "px")
hist(subsetData$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()  # Close the png file device

```
![](https://github.com/jacintod/ExData_Plotting1/blob/master/Project/plot1.png)
```R

# Print the current working directory
print(getwd())
# Declare our working variables
file.name <- "./Data/household_power_consumption.txt"
url       <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zip.file  <- "./Data/data.zip"

# Check if the data is downloaded and download when applicable
if (!file.exists(file.name)) {
        download.file(url, destfile = zip.file)
        unzip(zip.file)
        file.remove(zip.file)
        print("Downloaded the source file for plotting..")
}

## Getting full dataset
powerDT <- read.csv(file.name, header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
powerDT$Date <- as.Date(powerDT$Date, format="%d/%m/%Y")

## Subsetting the data
subsetData <- subset(powerDT, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# Remove the orginal dataset to optimize the excection of the script 
rm(powerDT)

# Convert column that we will use to correct class
convertedDatesDT <- paste(as.Date(subsetData$Date), subsetData$Time)

subsetData$Datetime <- as.POSIXct(convertedDatesDT)

## Plot 2
plot(subsetData$Global_active_power~subsetData$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="./Project/plot2.png", height=480, width=480)
dev.off()

```
![](https://github.com/jacintod/ExData_Plotting1/blob/master/Project/plot2.png)
```R

# Print the current working directory
print(getwd())
# Declare our working variables
file.name <- "./Data/household_power_consumption.txt"
url       <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zip.file  <- "./Data/data.zip"

# Check if the data is downloaded and download when applicable
if (!file.exists(file.name)) {
        download.file(url, destfile = zip.file)
        unzip(zip.file)
        file.remove(zip.file)
        print("Downloaded the source file for plotting..")
}

## Getting full dataset
powerDT <- read.csv(file.name, header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
powerDT$Date <- as.Date(powerDT$Date, format="%d/%m/%Y")

## Subsetting the data
subsetData <- subset(powerDT, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# Remove the orginal dataset to optimize the excection of the script 
rm(powerDT)

# Convert column that we will use to correct class
convertedDatesDT <- paste(as.Date(subsetData$Date), subsetData$Time)

subsetData$Datetime <- as.POSIXct(convertedDatesDT)

## Plot 3
with(subsetData, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="./Project/plot3.png", height=480, width=480)
dev.off()


```
![](https://github.com/jacintod/ExData_Plotting1/blob/master/Project/plot3.png)
```R

# Print the current working directory
print(getwd())
# Declare our working variables
file.name <- "./Data/household_power_consumption.txt"
url       <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zip.file  <- "./Data/data.zip"

# Check if the data is downloaded and download when applicable
if (!file.exists(file.name)) {
        download.file(url, destfile = zip.file)
        unzip(zip.file)
        file.remove(zip.file)
        print("Downloaded the source file for plotting..")
}

## Getting full dataset
powerDT <- read.csv(file.name, header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
powerDT$Date <- as.Date(powerDT$Date, format="%d/%m/%Y")

## Subsetting the data
subsetData <- subset(powerDT, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# Remove the orginal dataset to optimize the excection of the script 
rm(powerDT)

# Convert column that we will use to correct class
convertedDatesDT <- paste(as.Date(subsetData$Date), subsetData$Time)

subsetData$Datetime <- as.POSIXct(convertedDatesDT)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subsetData, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving to file
dev.copy(png, file="./Project/plot4.png", height=480, width=480)
dev.off()


```
![](https://github.com/jacintod/ExData_Plotting1/blob/master/Project/plot4.png)