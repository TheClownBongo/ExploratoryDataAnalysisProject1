# In this file, we plot the Global Active Power, the submeterings, the 
# voltage, and the global reactive power as a function of time
# during February 1st and 2nd 2007 in 4 different plots presented 
# as 2 rows of 2 columns. First plot each subplot individually in a 
# window device. Then plot the 4 plots together in a window device.

# Read the file household_power_consumption.txt
ElectricityData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, dec=".", na.string="?")

# Keep data for February 1 and 2 2007
ElectricityData2007Feb1_2 <- ElectricityData[ElectricityData$Date=="1/2/2007" | ElectricityData$Date=="2/2/2007",]

# Add a column to the data frame ElectricityData2007Feb1_2 in which
# the date and time have been merged
ElectricityData2007Feb1_2$DateTime <- paste(ElectricityData2007Feb1_2$Date, ElectricityData2007Feb1_2$Time, sep=" ")

# Need to convert the factor global active power to its numerical value before 
# generating the plot
plotglobalactivepower <- as.numeric(as.character(ElectricityData2007Feb1_2$Global_active_power))

# Convert to POSIXIt the date and time
ElectricityData2007Feb1_2$TimePOSIXIt <- strptime(ElectricityData2007Feb1_2$DateTime,format="%d/%m/%Y %H:%M:%S")

# Plot the Global Active Power as a function of time to a window device
plot(ElectricityData2007Feb1_2$TimePOSIXIt,plotglobalactivepower, xlab="",ylab="Global Active Power (kilowatts)", type="l")

# Convert the factor to a numerical value for Sub_metering_1,
# Sub_metering_2, and Sub_metering_3
plotsubmeter1 <- as.numeric(as.character(ElectricityData2007Feb1_2$Sub_metering_1))
plotsubmeter2 <- as.numeric(as.character(ElectricityData2007Feb1_2$Sub_metering_2))
plotsubmeter3 <- as.numeric(as.character(ElectricityData2007Feb1_2$Sub_metering_3))

# Plot the Sub_metering_1 data as a black line
plot(ElectricityData2007Feb1_2$TimePOSIXIt, plotsubmeter1, xlab = "", ylab="Energy sub metering", type="l")

# Add in red the Sub_metering_2 data
lines(ElectricityData2007Feb1_2$TimePOSIXIt, plotsubmeter2, col="red")

# Add in blue the Sub_metering_3 data
lines(ElectricityData2007Feb1_2$TimePOSIXIt, plotsubmeter3, col="blue")

# Add the legend
legend("topright", bty = "n", lty=c(1,1,1), col=c("black","red","blue"),  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Convert the factor to a numerical value for voltage
plotvoltage <- as.numeric(as.character(ElectricityData2007Feb1_2$Voltage)) 

# Plot the Voltage data as a black line
plot(ElectricityData2007Feb1_2$TimePOSIXIt, plotvoltage, xlab = "datetime", ylab="Voltage", type="l")

# Convert the factor to a numerical value for voltage
plotglobalreactivepower <- as.numeric(as.character(ElectricityData2007Feb1_2$Global_reactive_power)) 

# Plot the Voltage data as a black line
plot(ElectricityData2007Feb1_2$TimePOSIXIt, plotglobalreactivepower, xlab = "datetime", ylab="Global Reactive Power", type="l")

par(mfrow=c(2,2))
# Plot the global active Power
plot(ElectricityData2007Feb1_2$TimePOSIXIt,plotglobalactivepower, xlab="",ylab="Global Active Power", type="l")

# Plot the Voltage information
plot(ElectricityData2007Feb1_2$TimePOSIXIt, plotvoltage, xlab = "datetime", ylab="Voltage", type="l")

# Plot the submetering information
plot(ElectricityData2007Feb1_2$TimePOSIXIt, plotsubmeter1, xlab = "", ylab="Energy sub metering", type="l")
lines(ElectricityData2007Feb1_2$TimePOSIXIt, plotsubmeter2, col="red")
lines(ElectricityData2007Feb1_2$TimePOSIXIt, plotsubmeter3, col="blue")
legend("topright", bty="n", lty=c(1,1,1), col=c("black","red","blue"),  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=.5)

# Plot the Global Reactive Power
plot(ElectricityData2007Feb1_2$TimePOSIXIt, plotglobalreactivepower, xlab = "datetime", ylab="Global Reactive Power", type="l")

# Save as a png file the plot with the 4 panels as plot4.png
png(file="plot4.png", width=480, height=480, units = "px", pointsize = 12, bg = "white")
par(mfrow=c(2,2))
# Plot the global active Power
plot(ElectricityData2007Feb1_2$TimePOSIXIt,plotglobalactivepower, xlab="",ylab="Global Active Power", type="l")

# Plot the Voltage information
plot(ElectricityData2007Feb1_2$TimePOSIXIt, plotvoltage, xlab = "datetime", ylab="Voltage", type="l")

# Plot the submetering information
plot(ElectricityData2007Feb1_2$TimePOSIXIt, plotsubmeter1, xlab = "", ylab="Energy sub metering", type="l")
lines(ElectricityData2007Feb1_2$TimePOSIXIt, plotsubmeter2, col="red")
lines(ElectricityData2007Feb1_2$TimePOSIXIt, plotsubmeter3, col="blue")
legend("topright", bty="n", lty=c(1,1,1), col=c("black","red","blue"),  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=.6)

# Plot the Global Reactive Power
plot(ElectricityData2007Feb1_2$TimePOSIXIt, plotglobalreactivepower, xlab = "datetime", ylab="Global Reactive Power", type="l")
dev.off()