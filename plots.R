## Step No 3: For annual sum draw line plot and quantile plot.

# Line plot
p<- ggplot(data = Year)+geom_line(aes(Year,`P[mm/a]`),group=1,colour="blue")+
  theme(panel.grid.major = element_line(colour = "darkgrey", size = 0.1),panel.grid.minor = element_blank(),panel.background = element_blank())+
  theme(panel.border = element_rect(colour="black",fill = NA))+ylim(250,1000)+scale_x_discrete(breaks=seq(1950, 2020, 10))+xlab("Years (1950-2019)")+
  ggtitle("Annual Precipitation for Prague (Czech Republic)")

# chage the colour of title, move it into centre (hjust=0.5)
p<-p + theme(plot.title = element_text(color="black", size=14, face="bold",hjust = 0.5))

ggsave(p,filename = paste("D:/line_plot",".png",sep=""), width = 30, height = 10, units = "cm", dpi = 300)


# Quantile plot
png(filename = paste(("Quantile_plot"),".png",sep=""), width = 28, height = 10, units = "cm", res = 300)

qqnorm(Year$`P[mm/a]`, col="blue",main="QQ plot of Precipitation for Prague (Czech Republic)")
qqline(Year$`P[mm/a]`, lty=2, lwd=1, col="blue")

dev.off()

## Step No 4: For the monthly sums, draw boxplots and barplots.

# Boxplot
p1<-ggplot(data = month,aes(x=Month,y=`P[mm/a]`))+geom_boxplot(fill="skyblue")+
  theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())+
  theme(panel.border = element_rect(colour="black",fill = NA))+
  ggtitle("Boxplot of Monthly Precipitation for Prague (Czech Republic)")
p1<-p1 + theme(plot.title = element_text(color="black", size=14, face="bold",hjust = 0.5))


ggsave(p1,filename = paste("D:/box_plot",".png",sep=""), width = 30, height = 10, units = "cm", dpi = 300)

# Barplot  
p2<-ggplot(data = month)+geom_bar(aes(x=Month,y=`P[mm/a]`),fill="skyblue",colour="black",stat = "summary", fun.y = "mean")+
  theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())+
  theme(panel.border = element_rect(colour="black",fill = NA))+
  ggtitle("Barplot of Mean Monthly Precipitation for Prague (Czech Republic)")
p2<-p2 + theme(plot.title = element_text(color="black", size=14, face="bold",hjust = 0.5))


ggsave(p2,filename = paste("D:/bar_plot",".png",sep=""), width = 30, height = 10, units = "cm", dpi = 300)



