#Reading and subsetting the data
data<-read.table("household_power_consumption.txt", dec=".", sep=";", stringsAsFactors=FALSE, header=TRUE)
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
data<-subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

#Converting data types: character to num and times
dateTime<-paste(data$Date, data$Time)
data<-cbind(data, dateTime=strptime(dateTime, format="%Y-%m-%d %H:%M:%OS"))
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Voltage<-as.numeric(data$Voltage)
data$Global_intensity<-as.numeric(data$Global_intensity)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)

#Creating the graph
png("plot2.png", width=480, height=480)
with(data, {
    #par(ylab="Global Active Power (kilowatts)")
    plot(data$dateTime,data$Global_active_power, type="n",ylab="Global Active Power (kilowatts)", xlab="", lwd=2 )
    lines(data$dateTime,data$Global_active_power)
})
dev.off()