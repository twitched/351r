# read from capture csv
setwd("~/351r/")
raw <- read.csv("capture2.csv")

# get destination IP and make it a character type
dest_ip <- as.character(raw$Destination)
proto <- raw$Protocol

#create a data frame to hold the destination IP and protocol
dest_prot <- data.frame(dest_ip, proto)
dest_prot$dest_ip <- as.character(dest_prot$dest_ip)
#how many rows?
sprintf("%d total IPs", nrow(dest_prot))

#remove all of the destination IPs to local addresses
dest_prot <- dest_prot[grep('^(?!10).*$', dest_prot$dest_ip, perl = TRUE),]
dest_prot <- dest_prot[grep('^(?!192.168.).*$', dest_prot$dest_ip, perl = TRUE),]
dest_prot <- dest_prot[grep('^(?!172.16.).*$', dest_prot$dest_ip, perl = TRUE),]
dest_prot <- dest_prot[grep('^(?!224).*$', dest_prot$dest_ip, perl = TRUE),]
dest_prot <- dest_prot[grep('^(?!ff).*$', dest_prot$dest_ip, perl = TRUE),]

sprintf("%d outside IPs", nrow(dest_prot))

# put it in a frequency table with unique ips and frequencies
ip_freq <- as.data.frame(table(dest_prot$dest_ip))

#get the geo data for each IP

#load the freegeoip function
source("freegeoip.R")
geo <- freegeoip(as.character(ip_freq$Var1))

#combine the freqency table with the geographic info
geo_ip <- cbind(ip_freq$Freq, geo)

#save the geographical data so we don't have to get it again
write.csv(geo_ip, file="geo_ip.csv")
