## Step No 5: Fit Model

n<-1:70 #require to assign the number of year, while we can fit the line with the 1951 or so

model_year<-lm(Year$`P[mm/a]`~n)  #fit the linear model
summary(model_year)

slope_month<-model_year$coefficients[2]
p_value<-summary(model_year)$coefficients[1,4]  

## Here p_value is less than 0.05 so yearly trend is significant

## plot
#Base R
plot(Year$Year,Year$`P[mm/a]`,type = "l",col="blue")
lines(Year$Year,fitted(model_year),col="red")


#GGPLot
p3<-ggplot(data = Year)+geom_line(aes(Year,`P[mm/a]`),group=1,colour="blue")+geom_line(aes(Year,fitted(model_year)),group=1,colour="red")+
  theme(panel.grid.major = element_line(colour = "darkgrey", size = 0.1),panel.grid.minor = element_blank(),panel.background = element_blank())+
  theme(panel.border = element_rect(colour="black",fill = NA))+ylim(250,1000)+scale_x_discrete(breaks=seq(1950, 2020, 10))+xlab("Years (1950-2019)")+
  ggtitle("Annual Precipitation[blue] and Fitted[red] for Prague (Czech Republic)")

ggsave(p3,filename = paste("D:/trend_plot",".png",sep=""), width = 30, height = 10, units = "cm", dpi = 300)
