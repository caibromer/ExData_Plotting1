## Make Plot4 (Exploratory Data Analysis - Data Science Specialization)
#Setup
setInternet2(use=TRUE)
setwd("C:/Users/Cailey/Desktop/DataScienceCourse/04 ExploratoryDataAnalysis/Week 1/exdata-data-household_power_consumption")
install.packages("dplyr")

#Read and filter data
energy<-read.csv("household_power_consumption.txt", sep=";")
col1<-as.Date(energy$Date,"%d/%m/%Y")
col2<-strptime(energy$Time,"%H:%M:%S")
energy_two<-data.frame(col1,col2,energy$Global_active_power,energy$Global_reactive_power,energy$Voltage,energy$Global_intensity, energy$Sub_metering_1, energy$Sub_metering_2, energy$Sub_metering_3)
date_1<-energy_two[energy_two$col1=="2007-02-01",]
date_2<-energy_two[energy_two$col1=="2007-02-02",]
data<-rbind(date_1,date_2)

#Set up Plot4
active<-data$energy.Global_active_power
active2<-as.character(active)
active3<-as.numeric(active2)

reactive<-data$energy.Global_reactive_power
reactive2<-as.character(reactive)
reactive3<-as.numeric(reactive2)

volt<-data$energy.Voltage
volt2<-as.character(volt)
volt3<-as.numeric(volt)

days=c("Thu","Fri","Sat")
submeter1<-data$energy.Sub_metering_1
submeter1_a<-as.character(submeter1)
submeter1_b<-as.numeric(submeter1_a)

submeter2<-data$energy.Sub_metering_2
submeter2_a<-as.character(submeter2)
submeter2_b<-as.numeric(submeter2_a)

submeter3<-data$energy.Sub_metering_3
submeter3_a<-as.character(submeter3)
submeter3_b<-as.numeric(submeter3_a)

#Make Plot4
par(mfrow=c(2,2),mar = c(5,5,2,1), oma = c(.5,.5,2,.5))
library(datasets)
days=c("Thu","Fri","Sat")
plot(active3, ylab="Global Active Power",pch=".",xaxt="n",xlab=" ")
axis(1,at=c(1,1500,2900),labels=days)
lines(active3)

days=c("Thu","Fri","Sat")
plot(volt3, ylab="Voltage",xlab="datetime",pch=".",xaxt="n", yaxt="n")
axis(1,at=c(1,1500,2900),labels=days)
axis(2,at=c(234,238,242,246),labels=c(234,238,242,246))
lines(volt3)

plot(submeter1_b,ylab=" ",yaxt="n",pch=".",xaxt="n",xlab=" ",ylim=c(1,40))
axis(2,at=c(0,10,20,30))
lines(submeter1_b)
par(new=T)
plot(submeter2_b,ylab=" ",yaxt="n",col="red",pch=".",xaxt="n",xlab=" ",ylim=c(1,40))
axis(2,at=c(0,10,20,30))
lines(submeter2_b, col="red")
par(new=T)
plot(submeter3_b,ylab="Energy sub metering",col="blue",pch=".",yaxt="n",xaxt="n",xlab=" ",ylim=c(1,40))
axis(1,at=c(1,1500,2900),labels=days)
axis(2,at=c(0,10,20,30))
lines(submeter3_b, col="blue")
legend("topright",lwd=1,cex=.25, col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


days=c("Thu","Fri","Sat")
plot(reactive3, ylab="Global_reactive_power",xlab="datetime",pch=".",xaxt="n",)
axis(1,at=c(1,1500,2900),labels=days)
axis(2,at=c(0.1,0.2,0.3,0.4,0.5), labels =c(0.1,0.2,0.3,0.4,0.5))
lines(reactive3)
