setwd("D:/Apprentissage/John Hopkins Data Science/Projects/exploratory_analysis/ExData_Plotting1")


df = read.csv(file = "household_power_consumption.txt", sep = ";", stringsAsFactors = F)
df$Date = as.Date(df$Date, "%d/%m/%Y")
s = (df$Date >= "2007-02-01") & (df$Date <= "2007-02-02")
tdf = df[s,]
tdf$Global_active_power = as.numeric(tdf$Global_active_power)
tdf$Time = strptime(tdf$Time, "%H:%M:%S")
png(filename = "plot1.PNG")
hist(tdf$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()
