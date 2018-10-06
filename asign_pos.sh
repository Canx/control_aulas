#!/bin/bash
# fichero: puestos.data

# Mostramos primero los puestos asignados.
source ./default.sh

TITLE="Elige una MAC para asignar nombre:"
CHOICE_HEIGHT=10

OPTIONS=()

while read line; do
    mac="$(echo $line | cut -d' ' -f1)"
    name="$(echo $line | cut -d' ' -s -f2)" 
    OPTIONS+=(${mac} "${name}")
done < ./macs.data

selectedmac=$($DIALOG --clear --backtitle "$BACKTITLE" --title "$TITLE" --menu "$MENU" $HEIGHT $WIDTH $CHOICE_HEIGHT "${OPTIONS[@]}" 3>&1 1>&2 2>&3 3>&-)

if ! test $? -eq 0
then
    exec ./configurar.sh
else
    # Esto es muy sucio...
    while read line; do
        mac="$(echo $line | cut -d' ' -f1)"
        name="$(echo $line | cut -d' ' -s -f2)" 
        if [ "${mac}" == "${selectedmac}" ]; then
	    break
        fi	
    done < ./macs.data

    $DIALOG --title "Cambia el nombre a la MAC $mac" --inputbox "Nuevo nombre " 8 60 ${name} 2> $OUTPUT
    response=$?
    name=$(<$OUTPUT)

    case $response in 
       0)
	   sed -i "s/^${mac}.*/${mac} ${name}/" ./macs.data
	   sort -k2 -o ./macs.data ./macs.data
           ;;
    esac
    exec ./asign_pos.sh
fi
