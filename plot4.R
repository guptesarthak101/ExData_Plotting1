# R Code for Plot 4

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

png("plot4.png", width = 480, height = 480)

# Convert numeric
gap <- as.numeric(subset_data$Global_active_power)
grp <- as.numeric(subset_data$Global_reactive_power)
volt <- as.numeric(subset_data$Voltage)
sm1 <- as.numeric(subset_data$Sub_metering_1)
sm2 <- as.numeric(subset_data$Sub_metering_2)
sm3 <- as.numeric(subset_data$Sub_metering_3)

# Layout
par(mfrow = c(2, 2))

# Plot 1
plot(subset_data$DateTime, gap, type = "l",
     xlab = "", ylab = "Global Active Power")

# Plot 2
plot(subset_data$DateTime, volt, type = "l",
     xlab = "datetime", ylab = "Voltage")

# Plot 3
plot(subset_data$DateTime, sm1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(subset_data$DateTime, sm2, col = "red")
lines(subset_data$DateTime, sm3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       cex = 0.8)

# Plot 4
plot(subset_data$DateTime, grp, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()