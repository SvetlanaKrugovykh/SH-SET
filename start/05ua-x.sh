#!/bin/sh 


UA_SRC=ua-list.txt 
UA_DST=dst.lst 

rm $UA_SRC 
rm $UA_DST 
fetch http://noc.ua-ix.net.ua/ua-list.txt 


for ip in 'cat $UA_SRC | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v / '; do 
echo $ip/24 >> $UA_DST 
done 

for ip in 'cat $UA_SRC | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep / '; do 
echo $ip >> $UA_DST 
done 


/sbin/ipfw table 1 flush
   cat ua-list.txt | while read ip; do
            # echo ipfw table 1 add $ip 1
           ipfw table 1 add $ip 1
          done


/sbin/ipfw table 1 delete 176.124.138.0/23