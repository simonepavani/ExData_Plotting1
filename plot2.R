# Coursera Data Science: Exploratory Data Analysis
# Course project 1: plot2

## load the data
File <- "./household_power_consumption.txt"
DataFile <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the data
SubSetDataFile <- DataFile[DataFile$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert to numeric
GlobalActivePower <- as.numeric(SubSetDataFile$Global_active_power)

# Convert the Date
DayWeek <-strptime(paste(SubSetDataFile$Date, SubSetDataFile$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Plot 2
png("plot2.png", width=480, height=480)
plot(DayWeek, GlobalActivePower , type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()