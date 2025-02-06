#!/bin/sh
exit

#table1 from ua-list.txt
/sbin/ipfw table 1 flush
   cat ua-list.txt | while read ip; do
            # echo ipfw table 1 add $ip 1
           ipfw table 1 add $ip 1
          done
