#!/bin/bash
source ./default.sh

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

OPTIONS=(1 "Quitar Internet a todos"
         2 "Dar Internet a todos"
         3 "Permitir IPs de alumnos"
         4 "Permitir URLs"
         5 "Denegar IPs de alumnos"
         6 "Apagar ordenadores")


CHOICE=$($DIALOG --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear

case $CHOICE in
        1) exec ./sin_internet.sh ;;
        2) exec ./con_internet.sh ;;
        3) exec ./permitir_ips.sh ;;
        4) exec ./permitir_urls.sh ;;
        5) exec ./denegar_ips.sh ;;
        6) exec ./apagar.sh ;;
esac
