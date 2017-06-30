#!/usr/bin/env sh
# Petit script pour installer le dhcp serveur utilisé pour le net-sharing
# zf170630.2125

echo ---------- install du serveur dhcp

sudo apt-get update
sudo apt-get install isc-dhcp-server
sudo cp dhcpd.conf /etc/dhcp/


#start dhcpcd server
#systemctl start dhcpcd.service

