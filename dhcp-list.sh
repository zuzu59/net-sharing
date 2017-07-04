#!/usr/bin/env sh
# Petit script tout simple pour afficher les machines qui sont connectée sur le dhcp serveur
# zf170704.0915
# source: 

egrep "lease|hostname|hardware|\}" /var/lib/dhcp/dhcpd.leases


