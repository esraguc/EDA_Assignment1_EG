household_data <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
#extract the data between 1/2/2007 to 2/2/2007
house_data <-rbind(household_data[household_data$Date=="1/2/2007",],household_data[household_data$Date=="2/2/2007",])
house_data$Date <- as.Date(house_data$Date,"%d/%m/%Y")
#join a Data and Time in a new variable
house_data<-cbind(house_data, "DateTime" = as.POSIXct(paste(house_data$Date, house_data$Time)))
#plot the graph
with(house_data, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")})
lines(house_data$Sub_metering_2 ~ house_data$DateTime, col = 'Red')
lines(house_data$Sub_metering_3 ~ house_data$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
png("plot3.png", width=480, height=480)
dev.off()