#!/bin/bash
sudo iptables -F FORWARD
profesor="192.168.0.2"

urls="ieshenrimatisse.es schooleando.es"
for url in $urls; do
    iptables -I FORWARD -d $url -j ACCEPT;
    iptables -I FORWARD -s $url -j ACCEPT;
done
iptables -t filter -A FORWARD -i enp1s10 ! -s $profesor -j REJECT
