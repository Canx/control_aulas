#!/bin/bash
source ./default.sh

OPTIONS=(1 "Quitar Internet a todos"
         2 "Dar Internet a todos"
         3 "Permitir hosts"
         4 "Denegar hosts"
         5 "Permitir URLs"
         6 "Denegar IPs de alumnos"
         7 "Apagar ordenadores")


CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear

case $CHOICE in
        1) exec ./mac.sh DENYALL ;;
        2) exec ./mac.sh ALLOWALL ;;
        3) exec ./mac.sh ALLOW;;
        4) exec ./mac.sh DENY;;
        5) exec ./permitir_urls.sh ;;
        6) exec ./denegar_ips.sh ;;
        7) exec ./apagar.sh ;;
esac

if test $? -eq 0
then
    exec ./control_aulas.sh
fi
