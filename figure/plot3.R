# reading in data
dat = read.table("C:/RWork/datascience/Exploratory data analysis/household_power_consumption.txt", na.strings = "?",
                 sep = ";", stringsAsFactor = F, header = T)

# converting to numeric
dat[,3:ncol(dat)] = apply(dat[,3:ncol(dat)], 2, as.numeric)
dat$Date = as.Date(dat$Date, format = "%d/%m/%Y")

# getting the data for 1 and 2 February 2007
dat = dat[dat$Date == as.Date("2007-02-01") | dat$Date == as.Date("2007-02-02"),]

# format day of week for x axis labels
dat$dayofweek = strftime(dat$Date, format = "%a")
dat$dayofweek[c(F,dat$dayofweek[2:nrow(dat)] ==dat$dayofweek[1:(nrow(dat)-1)])] = ""
dat$dayofweek[nrow(dat)] = "Sat"

width = 480
height = 480

setwd("C:/Users/magnuss/datasciencecoursera/exploratory/ExData_Plotting1/figure")
png("plot3.png",width = width, height = height)
plot(dat$Sub_metering_1, type = "l",ylab = "Energy sub metering", 
     xlab = "",main = "", xaxt = "n")
axis(side = 1, at = which(dat$dayofweek != ""), labels =  dat$dayofweek[which(dat$dayofweek != "")])

lines(dat$Sub_metering_2, col = "red")
lines(dat$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"))

dev.off()
