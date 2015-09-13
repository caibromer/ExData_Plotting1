## Make Plot2 (Exploratory Data Analysis - Data Science Specialization)
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

#Make plot2
library(datasets)
days=c("Thu","Fri","Sat")
plot(active3, ylab="Global Active Power (kilowatts)",pch=".",xaxt="n",xlab=" ")
axis(1,at=c(1,1500,2900),labels=days)
lines(active3)