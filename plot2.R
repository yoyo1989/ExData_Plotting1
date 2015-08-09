plot2 <- function() {

        filename <- file("../household_power_consumption.txt")
        data <- read.table(text = grep("^[1,2]/2/2007", readLines(filename), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?",sep = ";", header = TRUE)

        #deal with time        
        datetime <- paste(as.Date(data$Date,"%d/%m/%Y"), data$Time)
        data$Datetime <- as.POSIXct(datetime)
        
        png(filename="plot2.png", width=480, height=480, units="px")
        plot(data$Global_active_power ~ data$Datetime, type = "l",
             ylab = "Global Active Power (kilowatts)", xlab = "")
        dev.off()
        
}