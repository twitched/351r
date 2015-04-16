setwd("~/351r/")
ips <- read.table("ssh_attempts_only.txt")
colnames(ips) <- c("user", "ip")
ip_freq <- as.data.frame(table(ips$ip))
user_freq <- as.data.frame(table(ips$user))

source("freegeoip.R")
geo <- freegeoip(as.character(ip_freq$Var1))

#combine the freqency table with the geographic info
geo_ip <- cbind(ip_freq$Freq, geo)
names(geo_ip)[1] <- "frequency"
#save the geographical data so we don't have to get it again
write.csv(geo_ip, file="geo_ip_ssh.csv")
#save the user file so we don't have to get it again
names(user_freq)[1] <- "frequency"
write.csv(user_freq, file="user_freq_ssh.csv")