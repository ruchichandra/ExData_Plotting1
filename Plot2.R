#Setting working directory
getwd()
setwd("C:/1.RC/Coursera/Data Science/Exploratory Data Analysis")

# Loading the data
if(!file.exists("exdata-data-household_power_consumption.zip")){
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
  file <- unzip(temp)
  unlink(temp)
}

data <- read.table(file, header = T, sep = ";", na.strings = "?")

#Convert the date variable to Date Class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#Plot 2
data$datetime <- as.POSIXct(data$datetime)
attach(data)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

#Save file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)





