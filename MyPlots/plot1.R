
#download unzip data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./data.zip")
unzip("data.zip")

#read data into R
data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactor = FALSE, na.strings = "?")

#subset data 
dataFeb <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#convert into POSIXlt
dataFeb$Time <- paste(dataFeb$Date, dataFeb$Time)
dataFeb$Time <- strptime(dataFeb$Time, format = "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

#plot on a screen
par(mfcol = c(1,1))
hist(dataFeb$Global_active_power, col = "red", xaxp = c(0,6,3), main = "Global Active Power", xlab = "Global active power (kilowatts)")

#copy the plot into png file
dev.copy(png, file = "plot1.png", height = 480, width = 480, units = "px")
dev.off()
