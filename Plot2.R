power_set <- fread("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", header = TRUE,  stringsAsFactors =FALSE, na.strings="?")

power<- filter(power_set,  dmy(Date) == ymd("2007-02-01") |dmy(Date) == ymd("2007-02-02"))

a<-as.data.frame(as.POSIXlt(strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S", tz = "UTC")))
names(a) <- ("datetime") 
power<-cbind(power,a)
power$ddate <-  dmy(power$Date)

##PLOT 2
png(filename = "plot2.png",  width = 480, height = 480, units = "px")

plot(power$datetime, power$Global_active_power, type = "l", xlab="Day", ylab="Global Active Power (kilowatts)")

dev.off()

