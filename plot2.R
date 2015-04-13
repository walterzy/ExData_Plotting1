x <- read.table("hpc.txt", sep = ";", header = TRUE)
x$Date <- as.character(x$Date)
y <- subset(x, (Date == "1/2/2007") | (Date == "2/2/2007"))
y$Global_active_power <- as.numeric(y$Global_active_power)
hist(y$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

z <- y
z$Time <- as.character(z$Time)
z$DT <- strptime(paste(z$Date, z$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
with(z, plot(DT, Global_active_power/500.0, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.copy(png, file = "plot2.png")
dev.off()


