
#download unzip data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./data.zip")
unzip("data.zip")

#read data into R
data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactor = FALSE, na.strings = "?")

#subset data 
dataFeb <- household[household$Date == "1/2/2007" | household$Date == "2/2/2007",]

#convert variables into Date/Time classes
dataFeb$Date <- as.Date(dataFeb$Date, format = "%d/%m/%Y")
dataFeb$Time <- paste(dataFeb$Date, dataFeb$Time)
dataFeb$Time <- strptime(houseFeb$Time, format = "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

#plot on a screen
par(mfcol = c(1,1))
plot(houseFeb$Time, houseFeb$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

#copy the plot into png file
dev.copy(png, file = "plot2.png")
dev.off()