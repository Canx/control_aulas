#!/bin/bash
exec 3>&1;
ips=$(dialog --title "IPs internas denegadas" --inputbox "Indica las IPs que NO podrán navegar (192.168.0.X)" 0 0 2>&1 1>&3);
exec 3>&1;
for ip in $ips; do
    iptables -I FORWARD -s 192.168.0.$ip -j REJECT;
done
