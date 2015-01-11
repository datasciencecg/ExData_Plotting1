temp <- tempfile()
fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, temp, mode="wb")
unzip(temp)

data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE, na.strings = "?")
data <- subset(data,Date=="1/2/2007" | Date=="2/2/2007")

data$DateTime <- strptime(paste(data[,1], data[,2], " "), format="%d/%m/%Y %H:%M:%S ")

Sys.setlocale("LC_TIME", "English")

png(filename = "plot3.png", width = 480, height = 480)
with(data, plot(DateTime, Sub_metering_1, ylab="Energy sub metering", xlab = "",
                      type = "n"))
with(data, lines(DateTime, Sub_metering_1, col = "black"))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", pch = NA, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
