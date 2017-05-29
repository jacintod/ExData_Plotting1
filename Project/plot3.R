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
