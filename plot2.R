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
plot(hp3$Global_active_power, fg = "black", type = "n", xaxt = "n", ylab = "Global Active Power (kilowatts)", xlab = "") #basic plot without data
lines(hp3$Global_active_power, lty = 1, col = "black") #add line data
axis(1, at = c(0,1440, 2880), labels = c("Thur", "Fri", "Sat")) #add axis labels and swtich to days.