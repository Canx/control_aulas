#!/bin/bash
source ./default.sh

source ./apt.sh

# check if iface.cfg exists
if [ ! -f ./network.cfg ]; then
   $DIALOG --msgbox "No se ha configurado la red!" $HEIGHT $WIDTH
   ./iface.sh
   exec ./menu.sh
fi

# check if macs.data exists
if [ ! -f ./macs.data ]; then
   $DIALOG --msgbox "No se ha explorado la red!" $HEIGHT $WIDTH
   ./netdiscover.sh
   exec ./menu.sh
fi

CHOICE_HEIGHT=2

OPTIONS=(1 "Configurar"
         2 "Controlar Internet")


CHOICE=$($DIALOG --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

case $CHOICE in
        1) exec ./configurar.sh ;;
        2) exec ./internet.sh ;;
esac
