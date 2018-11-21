ds = "household_power_consumption.txt";
data <-read.table(ds, header = TRUE, sep = ";", dec = ".", colClasses = c("character","character","character","character","character","character","character","character","character"));
data$Date <- as.Date(data$Date,"%d/%m/%Y");
subdata <- subset(data, Date== "2007-02-01" | Date=="2007-02-02");


Sub_metering_1 <- as.numeric(subdata$Sub_metering_1);
Sub_metering_2 <- as.numeric(subdata$Sub_metering_2);
Sub_metering_3 <- as.numeric(subdata$Sub_metering_3);

dev.new(width=480, height=480);

plot(Sub_metering_1, type="n", main="", xlab="", ylab = "Energy sub metering",xaxt="n", yaxt="n",ylim=c(-1,40));
axis(2, at=c(0,10,20,30), labels = c(0,10,20,30));
axis(1, at=c(0,length(Global_active_power)/2,length(Global_active_power)), labels = c("Thu","Fri","Sat"));
lines(Sub_metering_1, col="black");
lines(Sub_metering_2, col ="red");
lines(Sub_metering_3, col ="blue");
legend("topright", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1:1, cex=0.8);

dev.copy(png, file = "plot3.png");
dev.off();