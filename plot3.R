setwd("D:/Apprentissage/John Hopkins Data Science/Projects/exploratory_analysis/ExData_Plotting1")


df = read.csv(file = "household_power_consumption.txt", sep = ";", stringsAsFactors = F)
df$Date = as.Date(df$Date, "%d/%m/%Y")
s = (df$Date >= "2007-02-01") & (df$Date <= "2007-02-02")
tdf = df[s,]
tdf$Global_active_power = as.numeric(tdf$Global_active_power)
#tdf$Time = strptime(tdf$Time, "%H:%M:%S")
datetime <- paste(tdf$Date, tdf$Time)
tdf$Datetime <- as.POSIXct(datetime)
png(filename = "plot3.PNG")
with(tdf, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

