EPC <- read.table("household_power_consumption.txt", sep = ';',  dec = '.', stringsAsFactors = FALSE, header = T)
EPC <- EPC[EPC$Date %in% c("1/2/2007","2/2/2007") ,]
EPC$Global_active_power <- as.numeric(EPC$Global_active_power)
png("plot1.png", width=480, height=480)
hist(EPC$Global_active_power, breaks = 6, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()