plot4 <- function() {
        
        filename <- file("../household_power_consumption.txt")
        data <- read.table(text = grep("^[1,2]/2/2007", readLines(filename), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?",sep = ";", header = TRUE)

        #deal with time        
        datetime <- paste(as.Date(data$Date,"%d/%m/%Y"), data$Time)
        data$Datetime <- as.POSIXct(datetime)
        
        png(filename="plot4.png", width=480, height=480, units="px")
        par(mfrow = c(2,2))
        with(data, {
                plot(Global_active_power ~ Datetime, type = "l", 
                     ylab = "Global Active Power", xlab = "")
                plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
                plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
                     xlab = "")
                lines(Sub_metering_2 ~ Datetime, col = 'Red')
                lines(Sub_metering_3 ~ Datetime, col = 'Blue')
                legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
                       bty = "n",
                       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
                plot(Global_reactive_power ~ Datetime, type = "l", 
                     ylab = "Global_rective_power", xlab = "datetime")
        })
        dev.off()

}