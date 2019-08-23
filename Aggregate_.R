## Step No 2: Aggregates the time series to monthly/annual scale (sums)

# Split the date
setDT(data)[,paste0(c("Year","Month","Day")) :=tstrsplit(date,"-")]

#Aggregate
Year <- aggregate(data$`rainfall [mm/day]`,by=list(data$Year),FUN = sum)
colnames(Year)<-c("Year","P[mm/a]")
month <- aggregate(data$`rainfall [mm/day]`,by=list(data$Year,data$Month),FUN=sum)
colnames(month)<-c("Year","Month","P[mm/a]")
month$Month<-as.factor(month$Month)
