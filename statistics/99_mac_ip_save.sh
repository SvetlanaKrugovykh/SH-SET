#arp -a | awk '\!/incomplete/{ print $2 "\t" $4 "\t" $6 "\t" $7 }' | sed 's/[()]//g' | sort > /usr/home/ftp1c/macs.log

/usr/sbin/arp -a | /usr/bin/awk '/incomplete/{next} { print $2 "\t" $4 "\t" $6 "\t" $7 }' | /usr/bin/sed 's/[()]//g' | /usr/bin/sort > /home/ftp1c/macs.log


