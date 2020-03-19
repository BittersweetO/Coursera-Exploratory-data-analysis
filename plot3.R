EPC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
EPC <- EPC[EPC$Date %in% c("1/2/2007","2/2/2007") ,]
EPC$DateTime <- strptime(paste(EPC$Date, EPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
EPC$Global_active_power <- as.numeric(EPC$Global_active_power)
EPC$Sub_metering_1 <- as.numeric(EPC$Sub_metering_1)
EPC$Sub_metering_2 <- as.numeric(EPC$Sub_metering_2)
EPC$Sub_metering_3 <- as.numeric(EPC$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(EPC$DateTime,  EPC$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(EPC$DateTime, EPC$Sub_metering_2, type="l", col="red")
lines(EPC$DateTime, EPC$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()