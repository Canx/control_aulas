#!/bin/bash

ips=`netdiscover -i enp1s10 -r 192.168.0.0/24 -P | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | sed -n '1!p'`

for ip in $ips;
do
   ssh root@$ip /sbin/shutdown &
done

#netdiscover: /usr/sbin/netdiscover /usr/share/man/man8/netdiscover.8.gz
#grep: /bin/grep /usr/share/man/man1/grep.1.gz /usr/share/info/grep.info.gz
#sed: /bin/sed /usr/share/man/man1/sed.1.gz /usr/share/info/sed.info.gz
#ssh: /usr/bin/ssh /etc/ssh /usr/share/man/man1/ssh.1.gz
