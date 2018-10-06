#!/bin/bash
source ./network.cfg
sudo netdiscover -i $IFACE -P -r $NETWORK | awk '{print($2)}' | grep -E "^([0-9A-Fa-f]{2}[:]){5}([0-9A-Fa-f]{2})$" > macs.data
