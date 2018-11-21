ds = "household_power_consumption.txt";
data <-read.table(ds, header = TRUE, sep = ";", dec = ".", colClasses = c("character","character","character","character","character","character","character","character","character"));
data$Date <- as.Date(data$Date,"%d/%m/%Y");
subdata <- subset(data, Date== "2007-02-01" | Date=="2007-02-02");

dev.new(width=480, height=480);

Global_active_power <- as.numeric(subdata$Global_active_power);
Sub_metering_1 <- as.numeric(subdata$Sub_metering_1);
Sub_metering_2 <- as.numeric(subdata$Sub_metering_2);
Sub_metering_3 <- as.numeric(subdata$Sub_metering_3);
Voltage <- as.numeric(subdata$Voltage);
Global_reactive_power <- as.numeric(subdata$Global_reactive_power);

par(mfrow = c(2, 2))
plot(Global_active_power, type="n", main="", xlab = "", ylab = "Global Active Power",xaxt="n");#,yaxt = "n",xaxt="n");
axis(1, at=c(0,length(Global_active_power)/2,length(Global_active_power)), labels = c("Thu","Fri","Sat"));
lines(Global_active_power);

plot(Voltage, type="n", main="", xlab = "Datetime", ylab = "Voltage",xaxt="n");#,yaxt = "n",xaxt="n");
axis(1, at=c(0,length(Voltage)/2,length(Voltage)), labels = c("Thu","Fri","Sat"));
lines(Voltage);

plot(Sub_metering_1, type="n", main="", xlab="", ylab = "Energy sub metering",xaxt="n", yaxt="n",ylim=c(-1,40));
axis(2, at=c(0,10,20,30), labels = c(0,10,20,30));
axis(1, at=c(0,length(Global_active_power)/2,length(Global_active_power)), labels = c("Thu","Fri","Sat"));
lines(Sub_metering_1, col="black");
lines(Sub_metering_2, col ="red");
lines(Sub_metering_3, col ="blue");
legend("topright", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1:1, cex=0.8);

plot(Global_reactive_power, type="n", main="", xlab = "Datetime", ylab = "Global reactive power",xaxt="n");#,yaxt = "n",xaxt="n");
axis(1, at=c(0,length(Global_reactive_power)/2,length(Global_reactive_power)), labels = c("Thu","Fri","Sat"));
lines(Global_reactive_power);

dev.copy(png, file = "plot4.png");
dev.off();