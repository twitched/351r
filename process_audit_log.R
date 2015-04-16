setwd("~/351r/")
ips <- scan("ips.txt", what = character())
ip_freq <- as.data.frame(table(ips))

source("freegeoip.R")
geo <- freegeoip(as.character(ip_freq$Var1))

#combine the freqency table with the geographic info
geo_ip <- cbind(ip_freq$Freq, geo)
names(geo_ip)[1] <- "frequency"
#save the geographical data so we don't have to get it again
write.csv(geo_ip, file="geo_ip_ssh.csv")