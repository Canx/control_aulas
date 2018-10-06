#!/bin/bash
source ./default.sh

TITLE="Configuración"

OPTIONS=(1 "Configurar interface"
         2 "Escanear MACS"
         3 "Asignar puestos")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear

case $CHOICE in
        1) exec ./iface.sh ;;
        2) exec ./netdiscover.sh ;;
        3) exec ./asign_pos.sh ;;
esac

if test $? -eq 0
then
   exec ./control_aulas.sh
fi
