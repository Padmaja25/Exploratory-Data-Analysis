setwd("./exdata_data_household_power_consumption")
houseHold<- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
houseHold$DateTime <- strptime(paste(houseHold$Date,houseHold$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
New_houseHold <- subset(houseHold,grepl("^(2007-02-01)",houseHold$DateTime)|grepl("^(2007-02-02)",houseHold$DateTime))

### Plot 1

png(file="Plot1.png",width = 480,height = 480)
hist(New_houseHold$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power(kilowatts)")
dev.off()
