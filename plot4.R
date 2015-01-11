temp <- tempfile()
fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, temp, mode="wb")
unzip(temp)

data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE, na.strings = "?")
data <- subset(data,Date=="1/2/2007" | Date=="2/2/2007")

data$DateTime <- strptime(paste(data[,1], data[,2], " "), format="%d/%m/%Y %H:%M:%S ")

Sys.setlocale("LC_TIME", "English")

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
with(data, {
  plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab = "")
  plot(DateTime, Voltage, type="l", ylab="Voltage", xlab = "datetime")
  with(data, {
    plot(DateTime, Sub_metering_1, ylab="Energy sub metering", xlab = "",
         type = "n")
    lines(DateTime, Sub_metering_1, col = "black")
    lines(DateTime, Sub_metering_2, col = "red")
    lines(DateTime, Sub_metering_3, col = "blue")
    legend("topright", pch = NA, lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  })
  plot(DateTime, Global_reactive_power, type="l", xlab = "datetime")
})
dev.off()
