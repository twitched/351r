cat secure.log | grep "password for" | cut -d ' ' -f 9,11 > ssh_attempts.txt
cat ssh_attempts.txt | grep -E -o ".*([0-9]{1,3}[\.]){3}[0-9]{1,3}"
