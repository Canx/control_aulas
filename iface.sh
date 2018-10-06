#!/bin/bash
source ./default.sh
DIALOG=${DIALOG=dialog}
ilist=`ifconfig -s | awk '{print $1}' | tail -n +2`
ilist_len=`echo "${ilist[@]}" | wc -l`

TITLE="Elige el interfaz"
CHOICE_HEIGHT=$ilist_len

OPTIONS=()

for iface in $ilist
do
    OPTIONS+=($iface "")
done

iface=$($DIALOG --clear --backtitle "$BACKTITLE" --title "$TITLE" --menu "$MENU" $HEIGHT $WIDTH $CHOICE_HEIGHT "${OPTIONS[@]}" 3>&1 1>&2 2>&3 3>&-)

echo "IFACE=$iface" > iface.cfg
