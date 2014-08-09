# R scipt for plot #2
#Script assumed working directory is set to have the downloaded file "house_power_consumption.txt" in it.
#Get data is appropiate form
hp <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character" , "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
hpdate <- as.Date(hp$Date, format = "%d/%m/%Y") #pull out dates as date
hp <- hp[ , 2:ncol(hp)] # remove character date column
hp <- cbind(hpdate, hp) # add proper class date data
colnames(hp)[1] <- "Date" #rename column
hp1 <- hp[hp$Date == "2007-02-01", ] # select first date
hp2 <- hp[hp$Date == "2007-02-02", ] # seleect 2nd date
hp3 <- rbind(hp1, hp2) #bind data back together
plot(hp3$Sub_metering_1, fg = "black", type = "n", xaxt = "n", ylab = "Energy sub metering", xlab = "") #basic plot without data and axis label
axis(1, at = c(0,1440, 2880), labels = c("Thur", "Fri", "Sat")) #add axis title
lines(hp3$Sub_metering_1, lty = 1, col = "black") #add first line, also one with biggest y axis
lines(hp3$Sub_metering_2, lty = 1, col = "red") #add second line
lines(hp3$Sub_metering_3, lty = 1, col = "blue") #add third line
legend("topright", legend = colnames(hp3)[7:9], text.col = "black", lty = 1, col = c("black", "red", "blue"), cex = 1, x.intersp = 0.5, y.intersp = 0.75) #add legend, boxed in.