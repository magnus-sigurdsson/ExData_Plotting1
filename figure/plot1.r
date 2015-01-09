# reading in data
dat = read.table("C:/RWork/datascience/Exploratory data analysis/household_power_consumption.txt", na.strings = "?",
                 sep = ";", stringsAsFactor = F, header = T)

# converting to numeric
dat[,3:ncol(dat)] = apply(dat[,3:ncol(dat)], 2, as.numeric)
dat$Date = as.Date(dat$Date, format = "%d/%m/%Y")

# getting the data for 1 and 2 February 2007
dat = dat[dat$Date == as.Date("2007-02-01") | dat$Date == as.Date("2007-02-02"),]

width = 480
height = 480

setwd("C:/Users/magnuss/datasciencecoursera/exploratory/ExData_Plotting1/figure")
png("plot1.png",width = width, height = height)
hist(dat$Global_active_power, col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
