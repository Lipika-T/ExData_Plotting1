data=read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE)
library(dplyr)
two_day_data=filter(data,Date=="1/2/2007"|Date=="2/2/2007")
dt=paste(two_day_data$Date,two_day_data$Time,sep=" ")
two_day_data$DateTime=strptime(dt,format="%d/%m/%Y %H:%M:%S")
daterange=c(min(two_day_data$DateTime),max(two_day_data$DateTime))
png(filename = "plot4.png")
par(mfrow=c(2,2))
plot(two_day_data$DateTime,as.numeric(two_day_data$Global_active_power),type="l",xaxt="n",xlab="",ylab="Global Active Power")
axis.POSIXct(1,seq(daterange[1],daterange[2],by="day"),format="%a")

plot(two_day_data$DateTime,as.numeric(two_day_data$Voltage),type="l",xaxt="n",xlab="",ylab="Voltage")
axis.POSIXct(1,seq(daterange[1],daterange[2],by="day"),format="%a")

plot(two_day_data$DateTime,as.numeric(two_day_data$Sub_metering_1),type="l",col="black",xaxt="n",xlab="",ylab="Energy sub metering")
lines(two_day_data$DateTime,as.numeric(two_day_data$Sub_metering_2),type="l",col="red")
lines(two_day_data$DateTime,as.numeric(two_day_data$Sub_metering_3),type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.7)
axis.POSIXct(1,seq(daterange[1],daterange[2],by="day"),format="%a")

plot(two_day_data$DateTime,as.numeric(two_day_data$Global_reactive_power),type="l",xaxt="n",xlab="",ylab="Global Reactive Power")
axis.POSIXct(1,seq(daterange[1],daterange[2],by="day"),format="%a")
dev.off()