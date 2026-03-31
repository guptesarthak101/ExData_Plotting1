# R Code for Plot 1

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

# Convert to numeric
gap <- as.numeric(subset_data$Global_active_power)

# Plot
hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()