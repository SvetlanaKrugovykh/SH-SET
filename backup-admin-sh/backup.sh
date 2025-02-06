
#!/bin/sh
name=$1
BACKUP_WEBFILES=/usr/home/admin
BACKUPSH_WEBFILES=/usr/local/etc/rc.d/backups

rm /usr/home/admin/*.tar
cp $BACKUP_WEBFILES/backup.sh $BACKUPSH_WEBFILES/backup.sh

DIRS="usr/local/etc/rc.d"

####DIRS="usr/local/etc/rc.d usr/local/mrtg-2/bin usr/local/www/data-dist/support"
cd /
for dir in $DIRS
do
        file=$name.`date '+%d-%m-%Y'`.tar
                tar -cf $BACKUP_WEBFILES/$file $dir
done

tar -rf  $BACKUP_WEBFILES/$file /boot/defaults/loader.conf
tar -rf  $BACKUP_WEBFILES/$file /etc/crontab
tar -rf  $BACKUP_WEBFILES/$file /etc/passwd
tar -rf  $BACKUP_WEBFILES/$file /etc/group
tar -rf  $BACKUP_WEBFILES/$file /etc/master.passwd
tar -rf  $BACKUP_WEBFILES/$file /etc/hosts
tar -rf  $BACKUP_WEBFILES/$file /etc/motd
tar -rf  $BACKUP_WEBFILES/$file /etc/resolv.conf
tar -rf  $BACKUP_WEBFILES/$file /etc/rc.conf
tar -rf  $BACKUP_WEBFILES/$file /etc/ipnat.rules
tar -rf  $BACKUP_WEBFILES/$file /etc/pf.rules
tar -rf  $BACKUP_WEBFILES/$file /etc/sysctl.conf
tar -rf  $BACKUP_WEBFILES/$file /etc/namedb/named.conf
tar -rf  $BACKUP_WEBFILES/$file /etc/namedb/named.root
tar -rf  $BACKUP_WEBFILES/$file /etc/namedb/master/*
tar -rf  $BACKUP_WEBFILES/$file /usr/local/share/snmp/snmpd.conf
tar -rf  $BACKUP_WEBFILES/$file /sys/i386/conf/si*
tar -rf  $BACKUP_WEBFILES/$file /sys/amd64/conf/si*
tar -rf  $BACKUP_WEBFILES/$file /usr/local/etc/quagga/*
tar -rf  $BACKUP_WEBFILES/$file /usr/local/etc/nagios/*
tar -rf  $BACKUP_WEBFILES/$file /usr/local/etc/asterisk/*
tar -rf  $BACKUP_WEBFILES/$file /usr/local/etc/apache22/*
tar -rf  $BACKUP_WEBFILES/$file /usr/local/etc/mrtg/*
tar -rf  $BACKUP_WEBFILES/$file /usr/local/www/apache22/data/*
find /intelligence -type f -not -path "*/node_modules/*" -exec tar -rf "$BACKUP_WEBFILES/$file" {} +
tar -rf  $BACKUP_WEBFILES/$file /usr/local/www/*
tar -rf  $BACKUP_WEBFILES/$file /usr/local/etc/nginx/*
tar -rf  $BACKUP_WEBFILES/$file /usr/home/admin/backup.sh

cd /usr/home/admin/

#db_backup
cd ~/.db_backup
export PGPASSWORD=pa?s?s?wd
pg_dump -U postgres -d payments -h localhost -p 5432 > paym_$(date +\%Y-\%m-\%d).sql

#added db_backup to tar
tar -rf  $BACKUP_WEBFILES/$file paym_$(date +\%Y-\%m-\%d).sql


exit 0
