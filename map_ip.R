setwd("~/351r/")

# get the ip data
ip_data <- read.csv("geo_ip.csv")

# code from chapter 4 of the book
# extract the polygon information for the world map, minus Antarctica
world <- map_data('world')
world <- subset(world, region != "Antarctica")

# Chapter 5 examples explain mapping in greater detail
gg <- ggplot()
gg <- gg + geom_polygon(data=world, aes(long, lat, group=group, xmin=-100,xmax=100), fill="white", color="grey")
gg <- gg + geom_point(data=ip_data, aes(x=longitude, y=latitude, size=frequency), color="blue") 
gg <- gg + coord_map(xlim = c(-180, 180),ylim = c(0, 70))
gg <- gg + labs(x="", y="")
gg
