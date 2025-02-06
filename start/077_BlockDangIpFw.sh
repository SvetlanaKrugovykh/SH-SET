#!/bin/sh

/sbin/ipfw delete 00311

ipfw table 3 flush

cat BAN/site_ban_ip | while read ip; do
        ipfw table 3 add $ip
done


ipfw add 00311 reject ip from any to "table(3)"

