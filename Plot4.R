setwd("./exdata_data_household_power_consumption")
houseHold<- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
houseHold$DateTime <- strptime(paste(houseHold$Date,houseHold$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
New_houseHold <- subset(houseHold,grepl("^(2007-02-01)",houseHold$DateTime)|grepl("^(2007-02-02)",houseHold$DateTime))

### Plot 4

png(file="Plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
plot(New_houseHold$DateTime,New_houseHold$Global_active_power,type = "l",ylab = "Global Active power",xlab = " ")
plot(New_houseHold$DateTime,New_houseHold$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
plot(New_houseHold$DateTime,New_houseHold$Sub_metering_1,type = "l",xlab = " ",ylab = "Energy sub metering")
lines(New_houseHold$DateTime,New_houseHold$Sub_metering_2,type ="l",col="red")
lines(New_houseHold$DateTime,New_houseHold$Sub_metering_3,type ="l",col="blue")
legend("topright",legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3") ,pch = 7,cex = 1,col = c("black","red","blue"))
plot(New_houseHold$DateTime,New_houseHold$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")
dev.off()
