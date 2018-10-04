#!/bin/bash

exec 3>&1;
urls=$(dialog --title "URL accesibles" --inputbox "Indica las URL's que podrán ser accesibles (separadas por espacio)" 0 60 2>&1 1>&3);
exitcode=$?;
exec 3>&1;
for url in $urls; do
    iptables -I FORWARD -d $url -j ACCEPT;
    iptables -I FORWARD -s $url -j ACCEPT;
done
