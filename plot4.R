EPC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
EPC <- EPC[EPC$Date %in% c("1/2/2007","2/2/2007") ,]
EPC$DateTime <- strptime(paste(EPC$Date, EPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
EPC$Global_active_power <- as.numeric(EPC$Global_active_power)
EPC$Sub_metering_1 <- as.numeric(EPC$Sub_metering_1)
EPC$Sub_metering_2 <- as.numeric(EPC$Sub_metering_2)
EPC$Sub_metering_3 <- as.numeric(EPC$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(EPC$DateTime, EPC$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(EPC$DateTime, EPC$Voltage , type="l", xlab="datetime", ylab="Voltage")

plot(EPC$DateTime, EPC$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(EPC$DateTime,EPC$Sub_metering_2, type="l", col="red")
lines(EPC$DateTime,EPC$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(EPC$DateTime, EPC$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()