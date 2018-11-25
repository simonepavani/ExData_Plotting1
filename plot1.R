# Coursera Data Science: Exploratory Data Analysis
# Course project 1: plot1

## load the data
File <- "./household_power_consumption.txt"
DataFile <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the data
SubSetDataFile <- DataFile[DataFile$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert Global_active_power to numeric
GlobalActivePower <- as.numeric(SubSetDataFile$Global_active_power)

# Plot 1
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()