# In this file, we plot the three submetering as a function of time
# during February 1st and 2nd 2007.

# Read the file household_power_consumption.txt
ElectricityData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, dec=".", na.string="?")

# Keep data for February 1 and 2 2007
ElectricityData2007Feb1_2 <- ElectricityData[ElectricityData$Date=="1/2/2007" | ElectricityData$Date=="2/2/2007",]

# Add a column to the data frame ElectricityData2007Feb1_2 in which
# the date and time have been merged
ElectricityData2007Feb1_2$DateTime <- paste(ElectricityData2007Feb1_2$Date, ElectricityData2007Feb1_2$Time, sep=" ")

# Convert to POSIXIt the date and time
ElectricityData2007Feb1_2$TimePOSIXIt <- strptime(ElectricityData2007Feb1_2$DateTime,format="%d/%m/%Y %H:%M:%S")

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
legend("topright", lty=c(1,1,1), col=c("black","red","blue"),  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=.5)

# Now save the plot in the png file plot3.png with width 480 pixels
# and height 480 pixels and a white background 
png(file="plot3.png", width=480, height=480, units = "px", pointsize = 12, bg = "white")
plot(ElectricityData2007Feb1_2$TimePOSIXIt, plotsubmeter1, xlab = "", ylab="Energy sub metering", type="l")
lines(ElectricityData2007Feb1_2$TimePOSIXIt, plotsubmeter2, col="red")
lines(ElectricityData2007Feb1_2$TimePOSIXIt, plotsubmeter3, col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"),  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()