# Do not execute alone!
if ! hash dialog 2>/dev/null; then
   sudo apt install dialog
fi

if ! hash netdiscover 2>/dev/null; then
   sudo apt install netdiscover
fi

if ! hash ebtables 2>/dev/null; then
   sudo apt install ebtables
fi

