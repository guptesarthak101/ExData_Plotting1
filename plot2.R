# R Code for Plot 2

data <- household_power_consumption

# Convert Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset required dates
subset_data <- subset(data, Date == as.Date("2007-02-01") |
                        Date == as.Date("2007-02-02"))

# Create datetime
subset_data$DateTime <- strptime(
  paste(subset_data$Date, subset_data$Time),
  format = "%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(subset_data$DateTime, as.numeric(subset_data$Global_active_power), type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()