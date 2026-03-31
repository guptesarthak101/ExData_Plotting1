# R Code for Plot 3

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

png("plot3.png", width = 480, height = 480)

# Plot first line
plot(subset_data$DateTime, as.numeric(subset_data$Sub_metering_1), type = "l", xlab = "",
     ylab = "Energy sub metering")

# Add lines
lines(subset_data$DateTime,
      as.numeric(subset_data$Sub_metering_2),
      col = "red")

lines(subset_data$DateTime,
      as.numeric(subset_data$Sub_metering_3),
      col = "blue")

# Legend
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()