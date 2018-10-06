#!/bin/bash
source ./default.sh
DIALOG=${DIALOG=dialog}
ilist=`ifconfig -s | awk '{print $1}' | tail -n +2`
ilist=`ip -o addr show | grep "inet " | awk '{print($2":"$4)}'`
ilist_len=`echo "${ilist[@]}" | wc -l`

TITLE="Elige el interfaz"
CHOICE_HEIGHT=$ilist_len

OPTIONS=()

for iface in $ilist
do
    OPTIONS+=(${iface%:*} ${iface#*:})
done

iface=$($DIALOG --clear --backtitle "$BACKTITLE" --title "$TITLE" --menu "$MENU" $HEIGHT $WIDTH $CHOICE_HEIGHT "${OPTIONS[@]}" 3>&1 1>&2 2>&3 3>&-)

echo "IFACE=$iface" > network.cfg

for element in $ilist
do
    if [ "${element%:*}" == "$iface" ]
    then
        echo "NETWORK=${element#*:}" >> network.cfg
    fi
done
