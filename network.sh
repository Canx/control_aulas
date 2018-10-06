#!/bin/bash
source ./default.sh
DIALOG=${DIALOG=dialog}
ilist=`ifconfig -s | awk '{print $1}' | tail -n +2`
ilist_len=`echo "${ilist[@]}" | wc -l`

TITLE="Dirección de red"
MESSAGE="Escribe la dirección de red a explorar (p.e. 192.168.0.0/24)"

network=$($DIALOG --clear --backtitle "$BACKTITLE" --title "$TITLE" --inputbox "$MESSAGE" $HEIGHT $WIDTH 3>&1 1>&2 2>&3 3>&-)

echo "NETWORK=$network" > network.cfg
