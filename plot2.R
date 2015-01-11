temp <- tempfile()
fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, temp, mode="wb")
unzip(temp)

data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE, na.strings = "?")
data <- subset(data,Date=="1/2/2007" | Date=="2/2/2007")

data$DateTime <- strptime(paste(data[,1], data[,2], " "), format="%d/%m/%Y %H:%M:%S ")

Sys.setlocale("LC_TIME", "English")

png(filename = "plot2.png", width = 480, height = 480)
with(data, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab = ""))
dev.off()
