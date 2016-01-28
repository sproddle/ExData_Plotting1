power_set <- fread("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", header = TRUE,  stringsAsFactors =FALSE, na.strings="?")

power<- filter(power_set,  dmy(Date) == ymd("2007-02-01") |dmy(Date) == ymd("2007-02-02"))

a<-as.data.frame(as.POSIXlt(strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S", tz = "UTC")))
names(a) <- ("datetime") 
power<-cbind(power,a)
power$ddate <-  dmy(power$Date)



##PLOT 4
png(filename = "plot4.png",  width = 480, height = 480, units = "px")
par(mfrow=c(2,2))

plot(power$datetime, power$Global_active_power, type = "l", xlab="Day", ylab="Global Active Power (kilowatts)")
plot(power$datetime, power$Voltage, type = "l", xlab="datetime", ylab="Voltage")
plot(power$datetime,power$Sub_metering_1, col="black",type ="S", xlab="Day", ylab="Energy Sub Metering")
lines(power$datetime,power$Sub_metering_2, col="red",type ="S")
lines(power$datetime,power$Sub_metering_3, col="blue",type ="S")

legend("topright",legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),col=c("black", "red","blue"),lwd=2, cex=0.5,  lty=c(1,1,1))
plot(power$datetime, power$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")

dev.off()