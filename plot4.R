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

#Plot 4
png("plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))
#plot 4a
#par(mar=c(2,0,2,2))
plot(b$Date1,b$Global_active_power,type="l",ylab="Global Active Power",xlab="")

#plot 4b
#par(mar=c(2,0,2,2))
plot(b$Date1,b$Voltage,type="l",ylab="Voltage",xlab="datetime")

#plot 4c
plot(b$Date1,b[,7],type="n",ylab="Energy sub metering",xlab="")

lines(b$Date1,b[,7],type="l",col="black")
lines(b$Date1,b[,8],type="l",col="red")
lines(b$Date1,b[,9],type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(1,1,1)
       ,col=c("black","red","blue"),bty="n",cex=0.9)

#plot 4d
plot(b$Date1,b$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()
