#!/bin/bash

if [ ! -f /var/lib/dhcp/dhcpd.leases ]; then
	touch /var/lib/dhcp/dhcpd.leases
fi
sed -i -e 's/INTERFACES=""/INTERFACES="eth1"/g' /etc/default/isc-dhcp-server

#####################################################################
# ---------------------------------------------------------->		#
#####################################################################
# Prod
/usr/sbin/named -g >> /var/log/named.log 2>&1 &
sleep 1
/usr/sbin/dhcpd -d -f >> /var/log/dhcp.log 2>&1 
