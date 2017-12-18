fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./data.zip")
unzip("data.zip")

data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactor = FALSE, na.strings = "?")
dataFeb <- household[household$Date == "1/2/2007" | household$Date == "2/2/2007",]
dataFeb$Date <- as.Date(dataFeb$Date, format = "%d/%m/%Y")
dataFeb$Time <- paste(dataFeb$Date, dataFeb$Time)
dataFeb$Time <- strptime(houseFeb$Time, format = "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

par(mfcol = c(1,1))
with(houseFeb, plot(Time, Sub_metering_1, type = "l", col = "black", xlab = " ", ylab = "Energy sub metering"))
points(houseFeb$Time, houseFeb$Sub_metering_2, type = "l", col = "red")
points(houseFeb$Time, houseFeb$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))