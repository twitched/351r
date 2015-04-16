setwd("~/351r/")
library(ggplot2)

# get the ip data
ip_data <- read.csv("geo_ip_ssh.csv")

# code from chapter 4 of the book
# extract the polygon information for the world map, minus Antarctica
world <- map_data('world')
world <- subset(world, region != "Antarctica")

gg <- ggplot()
gg <- gg + geom_polygon(data=world, aes(long, lat, group=group, xmin=-100,xmax=100), fill="white", color="grey")
gg <- gg + geom_point(data=ip_data, aes(x=longitude, y=latitude, size=frequency), color="blue") 
gg <- gg + labs(x="", y="")
gg

user_data <- read.csv("user_freq_ssh.csv")
user_data <- user_data[order(-user_data$Freq),]
user_data$user <- factor(user_data$user, levels = user_data$user[order(-user_data$Freq)])
c <- ggplot(head(user_data, 10), aes(x=user, y=Freq)) + scale_y_log10(breaks=c(100,1000,10000,100000), labels=c("100","1000","10000","100000")) + geom_point(size=10)
c <- c + labs(x="User name", y="Frequency (log scale)")
c
