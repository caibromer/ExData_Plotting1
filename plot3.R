## Make Plot3 (Exploratory Data Analysis - Data Science Specialization)

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

#Set up for Plot 3
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

#Make Plot 3
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
legend("topright",lwd=1,cex=.5, col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
