x <- read.table("hpc.txt", sep = ";", header = TRUE)
x$Date <- as.character(x$Date)
y <- subset(x, (Date == "1/2/2007") | (Date == "2/2/2007"))
y$Global_active_power <- as.numeric(y$Global_active_power)
hist(y$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png")
dev.off()


