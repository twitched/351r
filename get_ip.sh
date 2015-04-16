cat auth_attemp.log | cut -d ' ' -f 13 | cut -d '=' -f 2 > ips.txt
