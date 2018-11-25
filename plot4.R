# Coursera Data Science: Exploratory Data Analysis
# Course project 1: plot4

## load the data
File <- "./household_power_consumption.txt"
DataFile <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the data
SubSetDataFile <- DataFile[DataFile$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert the Date
DayWeek <-strptime(paste(SubSetDataFile$Date, SubSetDataFile$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Convert to numeric
GlobalActivePower <- as.numeric(SubSetDataFile$Global_active_power)
Voltage <- as.numeric(SubSetDataFile$Voltage)
GlobalReactivePower <- as.numeric(SubSetDataFile$Global_reactive_power)

# Plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(SubSetDataFile, {
plot(DayWeek, GlobalActivePower , type="l", xlab=NA, ylab="Global Active Power")
plot(DayWeek, Voltage , type="l", xlab="datetime", ylab="Voltage")
with(SubSetDataFile, plot(DayWeek,Sub_metering_1, col = "black", type="l", xlab=NA, ylab = "Energy sub metering"))
with(SubSetDataFile, points(DayWeek,Sub_metering_2, col = "red", type="l"))
with(SubSetDataFile, points(DayWeek,Sub_metering_3, col = "blue", type="l"))
legend("topright", lty = 1, bty = "n", col = c("black","red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(DayWeek, GlobalReactivePower , type="l", xlab="datetime", ylab="Global_reactive_power")
})
dev.off()