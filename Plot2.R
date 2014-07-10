# In this file, we plot the Global Active Power as a function of time
# during February 1st and 2nd 2007.

# Read the file household_power_consumption.txt
ElectricityData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, dec=".", na.string="?")

# Keep data for February 1 and 2 2007
ElectricityData2007Feb1_2 <- ElectricityData[ElectricityData$Date=="1/2/2007" | ElectricityData$Date=="2/2/2007",]

# Add a column to the data frame ElectricityData2007Feb1_2 in which
# the date and time have been merged
ElectricityData2007Feb1_2$DateTime <- paste(ElectricityData2007Feb1_2$Date, ElectricityData2007Feb1_2$Time, sep=" ")

# Need to convert the factor to its numerical value before 
# generating the plot
plotdata <- as.numeric(as.character(ElectricityData2007Feb1_2$Global_active_power))

# Convert to POSIXIt the date and time
ElectricityData2007Feb1_2$TimePOSIXIt <- strptime(ElectricityData2007Feb1_2$DateTime,format="%d/%m/%Y %H:%M:%S")

# Plot the Global Active Power as a function of time to a window device
plot(ElectricityData2007Feb1_2$TimePOSIXIt,plotdata, xlab="",ylab="Global Active Power (kilowatts)", type="l")

# Now save the plot in the png file plot2.png with width 480 pixels
# and height 480 pixels and a white background 
png(file="plot2.png", width=480, height=480, units = "px", pointsize = 12, bg = "white")
plot(ElectricityData2007Feb1_2$TimePOSIXIt,plotdata, xlab="",ylab="Global Active Power (kilowatts)", type="l")
dev.off()