#The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
#
# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). 
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). 
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). 


# Prepare data
if(!file.exists("./data")) {dir.create("./data")}

if(!file.exists("./data/household_power_consumption.txt")) {
        URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"        
        download.file(URL,destfile="./data/powerConsumptionData.zip",method="curl")
}

data <- read.table("./data/household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors=FALSE)

data<- data[data$Date %in% c("1/2/2007","2/2/2007"),]

data$Global_active_power <- as.numeric(data$Global_active_power)





# Plot graph
png("plot3.png")

x <- strptime(paste(data$Date,data$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
y1 <- data$Sub_metering_1
y2 <- data$Sub_metering_2
y3  <- data$Sub_metering_3




plot(x,y1,'l',xlab="",ylab="Energy sub metering")
lines(x,y2,'l',col="red")
lines(x,y3,'l',col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)


dev.off()

