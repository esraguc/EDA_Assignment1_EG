household_data <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
#extract the data between 1/2/2007 to 2/2/2007
house_data <-rbind(household_data[household_data$Date=="1/2/2007",],household_data[household_data$Date=="2/2/2007",])
house_data$Date <- as.Date(house_data$Date,"%d/%m/%Y")
#join a Data and Time in a new variable
house_data<-cbind(house_data, "DateTime" = as.POSIXct(paste(house_data$Date, house_data$Time)))
#plot the graph
plot(house_data$Global_active_power ~ house_data$DateTime, type="l", xlab= "", ylab="Global Active power (kilowatts)")
png("plot2.png", width=480, height=480)
dev.off()