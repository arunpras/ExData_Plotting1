# Read input file
a<-read.table("household_power_consumption.txt",head=T,sep=";",colClasses="character")

#subset data
b<-subset(a,Date =="1/2/2007"|Date=="2/2/2007")

#format converstions
b$Date1<-as.POSIXct(paste(b$Date,b$Time),format="%d/%m/%Y %H:%M:%S")
b$Global_active_power<-as.numeric(b$Global_active_power)
b$Global_reactive_power<-as.numeric(b$Global_reactive_power)
b$Voltage<-as.numeric(b$Voltage)
b$Sub_metering_1<-as.numeric(b$Sub_metering_1)
b$Sub_metering_2<-as.numeric(b$Sub_metering_2)
b$Sub_metering_3<-as.numeric(b$Sub_metering_3)

#Plot 1
png("plot1.png",width=480,height=480,units="px")
hist(b$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red",main="Global Active Power")
dev.off()



