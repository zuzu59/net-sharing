#!/usr/bin/env sh
# Petit script tout simple pour partager sa connexion Internet
# zf170704.0854
# source: https://wiki.archlinux.org/index.php/Internet_sharing

PUB=eth0
PRIV=eth1

sudo ip link set up dev $PRIV
sudo ip addr add 192.168.2.1/24 dev $PRIV
sudo sysctl net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o $PUB -j MASQUERADE
sudo iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i $PRIV -o $PUB -j ACCEPT

#sudo apt-get update
sudo apt-get -y install isc-dhcp-server
sudo cp dhcpd.conf /etc/dhcp/
sudo dhcpd $PRIV
ps ax |grep dhc


