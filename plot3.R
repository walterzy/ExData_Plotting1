x <- read.table("hpc.txt", sep = ";", header = TRUE)
x$Date <- as.character(x$Date)
y <- subset(x, (Date == "1/2/2007") | (Date == "2/2/2007"))
y$Global_active_power <- as.numeric(y$Global_active_power)
hist(y$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

z <- y
z$Time <- as.character(z$Time)
z$DT <- strptime(paste(z$Date, z$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

z$Sub_metering_1 <- as.numeric(z$Sub_metering_1)
z$Sub_metering_2 <- as.numeric(z$Sub_metering_2)
z$Sub_metering_3 <- as.numeric(z$Sub_metering_3)


with(z, plot(DT, Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering"))
with(subset(z, TRUE), lines(DT, Sub_metering_1, col = "blue")) 
with(subset(z, TRUE), lines(DT, Sub_metering_2, col = "red")) 
with(subset(z, TRUE), lines(DT, Sub_metering_3, col = "green")) 
legend("topright", pch = 1, col = c("blue", "red", "green"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

dev.copy(png, file = "plot3.png")
dev.off()


