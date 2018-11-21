ds = "household_power_consumption.txt";
data <-read.table(ds, header = TRUE, sep = ";", dec = ".", colClasses = c("character","character","character","character","character","character","character","character","character"));
data$Date <- as.Date(data$Date,"%d/%m/%Y")
subdata <- subset(data, Date== "2007-02-01" | Date=="2007-02-02")
Global_active_power <- as.numeric(subdata$Global_active_power);

dev.new(width=480, height=480)
hist(Global_active_power, main="Global Active Power",ylim=c(0,1200), xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", col="red")
#axis(1, at=c(0,1000,2000,3000), labels = c(0,2,4,6))
dev.copy(png, file = "plot1.png")
dev.off()

