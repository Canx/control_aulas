#!/bin/bash
DIALOG=${DIALOG=dialog}
ilist=`ifconfig -s | awk '{print $1}' | tail -n +2`
ilist_len=`echo "${ilist[@]}" | wc -l`

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=5
BACKTITLE="Control de Internet, por Ruben Cancho. V1.1"
TITLE="Elige el interfaz"
MENU="Elige una opción:"

OPTIONS=()

for iface in $ilist
do

    OPTIONS+=($iface "")
done

iface=$($DIALOG --clear --backtitle "$BACKTITLE" --title "$TITLE" --menu "$MENU" $HEIGHT $WIDTH $CHOICE_HEIGHT "${OPTIONS[@]}" 3>&1 1>&2 2>&3 3>&-)

echo "IFACE=$iface" > iface.cfg
