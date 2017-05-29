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



