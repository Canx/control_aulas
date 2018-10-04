#!/bin/bash
export TERM=xterm
cd "$(dirname "$0")"
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=5
BACKTITLE="Control de Internet, por Ruben Cancho. V1.1"
TITLE="Configuración"
MENU="Elige una opción:"

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
        2) exec ./scan_macs.sh ;;
        3) exec ./asign_pos.sh ;;
esac
