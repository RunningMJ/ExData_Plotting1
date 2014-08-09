#makes histogram with appropiate modifications
hp <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character" , "numeric", "numeric", "numeric", "numeric", "factor", "factor", "factor"))
hpdate <- as.Date(hp$Date, format = "%d/%m/%Y") #pull out dates as date
hp <- hp[ , 2:ncol(hp)] # remove character date column
hp <- cbind(hpdate, hp) # add proper class date data
colnames(hp)[1] <- "Date" #rename column
hp1 <- hp[hp$Date == "2007-02-01", ] # select first date
hp2 <- hp[hp$Date == "2007-02-02", ] # seleect 2nd date
hp3 <- rbind(hp1, hp2) #bind data back together
hist(hp3$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
