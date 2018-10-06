# Do not execute directly, only to include in other bash scripts!
VERSION="1.1"

OUTPUT="/tmp/input.txt"
export TERM=xterm
DIALOG=${DIALOG=dialog}
cd "$(dirname "$0")"
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=6
BACKTITLE="Control de Internet, por Ruben Cancho. V$VERSION"
TITLE="Menu principal"
MENU="Elige una opción:"
