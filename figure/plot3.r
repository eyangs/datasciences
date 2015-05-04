setwd("./coursera/exdata")
power.data<-read.table(file.path("household_power_consumption.txt"), skip=66638, nrows=(69517-66638),header=F,sep=";")
names(power.data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
power.data<-transform(power.data, DateTime=strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))
power.data<-power.data[,3:10]
head(power.data)


Sys.setlocale(,"C")
png(filename="plot3.png", width=480, height=480)

plot(power.data$DateTime, power.data$Sub_metering_1, ylab="Energy sub metering", type="l", xlab="")
lines(power.data$DateTime, power.data$Sub_metering_2, col="red")
lines(power.data$DateTime, power.data$Sub_metering_3, col="blue")
legend("topright",lty=1,col=c("grey","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()


