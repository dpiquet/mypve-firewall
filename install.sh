#!/bin/bash

##############################################################
#
#	INSTALL SCRIPT FOR PVE-FIREWALL
#
##############################################################
#
#
#
#

CONF_DIR='/etc/pve-firewall'

if [ ! -d $CONF_DIR ]; then
	mkdir $CONF_DIR
fi

# Copy default configuration files to CONF_DIR
cp ./common_bridged.rules $CONF_DIR/common_bridged.rules
cp ./bridged.rules $CONF_DIR/bridged.rules
cp ./global.conf $CONF_DIR/global.conf
cp ./hypervisor.rules $CONF_DIR/hypervisor.rules
cp ./routed.rules $CONF_DIR/routed.rules
cp ./macros $CONF_DIR/macros

# Copy script to /etc/init.d/
cp pve-firewall /etc/init.d/pve-firewall
chmod +x /etc/init.d/pve-firewall

# Add script to boot sequence
update-rc.d pve-firewall start 70 S . stop 70 0 1 6

