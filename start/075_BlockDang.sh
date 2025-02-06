#!/bin/sh

#Input file with hosts to ban
BAN_Host="BAN/site_ban_host"
#Output file with ip to ban
BAN_IP="BAN/site_ban_ip"

if [ -e ${BAN_Host} ]; then
        if [ -e ${BAN_IP} ]; then
                rm ${BAN_IP}
                touch ${BAN_IP}
                cat ${BAN_Host} | while read line; do
                        dig $line +short >> ${BAN_IP}
                done
        else
                touch ${BAN_IP}
                cat ${BAN_Host} | while read line; do
                        dig $line +short >> ${BAN_IP}
                done
        fi
else
        echo File ${BAN_Host} is not exist! Please create it.
fi
