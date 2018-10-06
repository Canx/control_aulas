#!/bin/bash
source ./default.sh

TITLE="Elige un ordenador a permitir"
CHOICE_HEIGHT=10

declare -A MACS 
NAMES=()
while read line; do
    mac="$(echo $line | cut -d' ' -f1)"
    name="$(echo $line | cut -d' ' -s -f2)" 

    if [ "$name" ]; then 
        NAMES+=(${name} "")
	MACS+=([${name}]=${mac})
    fi
done < ./macs.data

if [ ${#NAMES[@]} -eq 0 ]; then
    # TODO: mostrar mensaje de error!
    exec ./internet.sh
fi

name=$($DIALOG --clear --backtitle "$BACKTITLE" --title "$TITLE" --menu "$MENU" $HEIGHT $WIDTH $CHOICE_HEIGHT "${NAMES[@]}" 3>&1 1>&2 2>&3 3>&-)

sudo ebtables -A FORWARD -s ${MACS[$name]} -p IPV4 -j ACCEPT

exec ./internet.sh
