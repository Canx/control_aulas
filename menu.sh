#!/bin/bash
export TERM=xterm
cd "$(dirname "$0")"
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=5
BACKTITLE="Control de Internet, por Ruben Cancho. V1.1"
TITLE="Menu principal"
MENU="Elige una opción:"

OPTIONS=(1 "Quitar Internet a todos"
         2 "Dar Internet a todos"
         3 "Permitir IPs de alumnos"
         4 "Permitir URLs"
         5 "Denegar IPs de alumnos"
         6 "Apagar ordenadores")


CHOICE=$(dialog --clear \
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
