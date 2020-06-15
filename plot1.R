##Reading the dataset electricity which I have saved in my current working directory
##Let,the dataset is named after "elc"
elc<- read.delim("household_power_consumption.txt",sep=";")
  
##Now I am going to subset the whole dataset by 1/2/2007 to 2/2/2007
##And this filtered dataset is named after "elcn"
x1<- which(elc$Date=="1/2/2007")
y1<- which(elc$Date=="2/2/2007")
x<- elc[x1,]
y<- elc[y1,]
elcn<- rbind(x,y)

##Now I'm going to convert the character to numeric where needed
##And going to convert Date column into Date class
##And create a new column of Datetime consisting both Time and  Date
elcn$Global_active_power<- as.numeric(elcn$Global_active_power)
elcn$Global_reactive_power<- as.numeric(elcn$Global_reactive_power)
elcn$Voltage<- as.numeric(elcn$Voltage)
elcn$Sub_metering_1<- as.numeric(elcn$Sub_metering_1)
elcn$Sub_metering_2<- as.numeric(elcn$Sub_metering_2)
elcn$Sub_metering_3<- as.numeric(elcn$Sub_metering_3)

library(lubridate)

elcn$Date<- dmy(elcn$Date)
elcn<- data.frame(elcn,Datetime=paste(elcn$Date,elcn$Time,sep=" "))
elcn$Datetime<- ymd_hms(elcn$Datetime)

## Now I am going to draw a histogram like plot 1 
hist(elcn$Global_active_power,xlab = "Global Active Power(kilowatts)",ylab = "Frequency",main="Global Active Power",col="red")

