EPC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
EPC <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
EPC$DateTime <- strptime(paste(EPC$Date, EPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
EPC$Global_active_power <- as.numeric(EPC$Global_active_power)
png("plot2.png", width=480, height=480)
plot(EPC$DateTime, EPC$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()