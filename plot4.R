#Four plots (2,2) on a single graph
#Script assumed working directory is set to have the downloaded file "house_power_consumption.txt" in it.
# R scipt for plot 4
#Get data is appropiate form
hp <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character" , "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
hpdate <- as.Date(hp$Date, format = "%d/%m/%Y") #pull out dates as date
hp <- hp[ , 2:ncol(hp)] # remove character date column
hp <- cbind(hpdate, hp) # add proper class date data
colnames(hp)[1] <- "Date" #rename column
hp1 <- hp[hp$Date == "2007-02-01", ] # select first date
hp2 <- hp[hp$Date == "2007-02-02", ] # seleect 2nd date
hp3 <- rbind(hp1, hp2) #bind data back together
#set parameters
par(mfrow = c(2,2)) #going left to right
#Make Plot 1
plot(hp3$Global_active_power, fg = "black", type = "n", xaxt = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(hp3$Global_active_power, lty = 1, col = "black")
axis(1, at = c(0,1440, 2880), labels = c("Thur", "Fri", "Sat"))

#Make Plot 2
plot(hp3$Voltage, fg = "black", type = "n", xaxt = "n", ylab = "Voltage", xlab = "datetime")
lines(hp3$Voltage, lty = 1, col = "black")
axis(1, at = c(0,1440, 2880), labels = c("Thur", "Fri", "Sat"))

#Make Plot 3
plot(hp3$Sub_metering_1, fg = "black", type = "n", xaxt = "n", ylab = "Energy sub metering", xlab = "")
axis(1, at = c(0,1440, 2880), labels = c("Thur", "Fri", "Sat"))
lines(hp3$Sub_metering_1, lty = 1, col = "black")
lines(hp3$Sub_metering_2, lty = 1, col = "red")
lines(hp3$Sub_metering_3, lty = 1, col = "blue")
legend("topright", legend = colnames(hp3)[7:9], text.col = "black", lty = 1, col = c("black", "red", "blue"), cex = 0.5, bty = "n")

#make plot 4 (lower right)
plot(hp3$Global_reactive_power, fg = "black", type = "n", xaxt = "n", ylab = "Global_reactive_power", xlab = "datetime")
lines(hp3$Global_reactive_power, lty = 1, col = "black")
axis(1, at = c(0,1440, 2880), labels = c("Thur", "Fri", "Sat"))
