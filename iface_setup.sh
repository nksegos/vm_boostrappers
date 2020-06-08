#!/bin/bash

IFACE=$(ip link show | awk -F: '$0 !~ "lo" {print $2;exit}' |  tr -d "[:blank:]")

cat << EOF > /etc/network/interfaces
# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
allow-hotplug $IFACE
iface $IFACE inet dhcp

EOF

ip link set $IFACE up
dhclient

exit 0

