temp <- tempfile()
fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, temp, mode="wb")
unzip(temp)

data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE, na.strings = "?")
data <- subset(data,Date=="1/2/2007" | Date=="2/2/2007")

data[,1] <- as.Date(data[,1], "%d/%m/%Y")

png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
