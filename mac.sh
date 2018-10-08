#!/bin/bash
source ./default.sh
CHOICE_HEIGHT=10

declare -A MACS 
read_macs() {
    NAMES=()
    while read line; do
        mac="$(echo $line | cut -d' ' -f1)"
        name="$(echo $line | cut -d' ' -s -f2)" 
    
        if [ "$name" ]; then 
            NAMES+=(${name} "")
    	MACS+=([${name}]=${mac})
        fi
    done < ./macs.data
}

controlar() {
    read_macs

    if [ ${#NAMES[@]} -eq 0 ]; then
        # TODO: mostrar mensaje de error!
        $DIALOG --msgbox "No se ha encontrado el archivo de macs! Realiza la configuración!" 10 30
        exec ./configurar.sh
    fi
    
    name=$($DIALOG --clear --backtitle "$BACKTITLE" --title "$TITLE" --menu "$MENU" $HEIGHT $WIDTH $CHOICE_HEIGHT "${NAMES[@]}" 3>&1 1>&2 2>&3 3>&-)
    
    echo "sudo ebtables -A FORWARD -s ${MACS[$name]} -p IPV4 -j $TARGET"
    read -rsp $'Press enter to continue...\n'
    sudo ebtables -A FORWARD -s ${MACS[$name]} -p IPV4 -j $TARGET
}

mostrar() {
    rules=$(sudo ebtables -L FORWARD)
    $DIALOG --title "Reglas actuales" --msgbox "$rules" 20 70  
}

case $1 in
    "DENYALL")
             sudo ebtables -P FORWARD DROP
             ;;
    "ALLOWALL")
             sudo ebtables -P FORWARD ACCEPT
             ;;
    "ALLOW") 
             TARGET="ACCEPT"
             TITLE="Elige un ordenador a permitir"
             controlar
             ;;
    "DENY" ) 
             TARGET="DENY"
             TITLE="Elige un ordenador a denegar" 
             controlar
             ;;
esac

mostrar
exec ./internet.sh
