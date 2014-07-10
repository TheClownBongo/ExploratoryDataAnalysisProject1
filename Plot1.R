# In this file, we plot the histogram of the Global Active Power
# during February 1st and 2nd 2007.

# Read the file household_power_consumption.txt
ElectricityData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, dec=".", na.string="?")

# Keep data for February 1 and 2 2007
ElectricityData2007Feb1_2 <- ElectricityData[ElectricityData$Date=="1/2/2007" | ElectricityData$Date=="2/2/2007",]

# Get the histogram of the Global Active Power. The Global Active Power
# is treated as a factor not a numerical value. Need to convert the
# factor to its numerical value before generating the histogram
plotdata <- as.numeric(as.character(ElectricityData2007Feb1_2$Global_active_power))

# First plot the histogram to a window device
hist(plotdata, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red", xlim=c(0,6), ylim=c(0,1200))

# Now save the histogram in the png file plot1.png with width 480 pixels
# and height 480 pixels and a white background 
png(file="plot1.png", width=480, height=480, units = "px", pointsize = 12, bg = "white")
hist(plotdata, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red", xlim=c(0,6), ylim=c(0,1200))
dev.off()