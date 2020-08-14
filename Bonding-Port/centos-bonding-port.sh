!/bin/bash

#Create and modify by Brian Dao - D3spere@ux
#This tool with automatic proccess bonding 2 port on CentOS

#########################################################

#Global Variables (GV)
                 BLUE='\033[1;34m'
                 RED='\033[1;31m'
                 YELLOW='\033[1;33m'
                 NC='\033[0m'
                 CYAN='\033[1;36m'
                 BLINK='\033[5m'

#Export GV

                 export BLUE
                 export RED
                 export YELLOW
                 export NC
                 export CYAN
                 export BLINK

#########################################################
#FORCE USING ROOT

	if [[ "$UID" -ne 0]]; then
	echo
	echo -e "${YELLOW} Sorry, you need to run this as ${RED}'root'" ${NC}
	echo
	exit
	fi
#GET INFORMATION IP PORT
echo -e -n "Which bond device are you configuring? (bond0, bond1, bond2, ...)"
read BONDNR
echo -e -n "Which mode number are you configuring? (1 = active-backup, 2 = balance-xor, 3 = broadcast, 4 = 802.3ad, 5 = balance-tlb, 6 = balance-alb)"
read MODENR
echo -e -n "What IP address do you want to assign to $BONDNR? (192.168.1.100)"
reade IPADDRNR
echo -e -n "What is the netmask address you want to assign to $BONDNR? (255.255.255.0)"
read NETMASKNR
echo -e -n "What is the gateway address you want to assign to $BONDNR? (192.168.1.1)"
read GATEWAYNR
echo -e -n "List the first network device you want to assign to $BONDNR (eth0, eth1, eth2, ...)"
read NETNR1
echo -e -n "List the second network device you want to assign to $BONDNR (eth0, eth1, eth2, ...)"
read NETNR2
cp -a /etc/sysconfig/network-scripts/ifcfg-$BONDNR /etc/sysconfig/ifcfg-$BONDNR.bkp
cp -a /etc/modprobe.d/bonding.conf /etc/sysconfig/
rm -f /etc/sysconfig/network-scripts/ifcfg-$BONDNR
rm -f /etc/modprobe.d/bonding.conf
echo -e "This is it ... configuring network bonding for $BONDNR... Backing up config files to /etc/sysconfig/"
echo -e "alias $BONDNR bonding" >> /etc/modprobe.d/bonding.conf
echo -e "options $BONDNR miimon=80 mode=$MODENR"  >> /etc/modprobe.d/bonding.conf
echo -e "DEVICE=$BONDNR" >> /etc/sysconfig/network-scripts/ifcfg-$BONDNR
echo -e "IPADDR=$IPADDRNR" >> /etc/sysconfig/network-scripts/ifcfg-$BONDNR
echo -e "NETMASK=$NETMASKNR" >> /etc/sysconfig/network-scripts/ifcfg-$BONDNR
echo -e "GATEWAY=$GATEWAYNR" >> /etc/sysconfig/network-scripts/ifcfg-$BONDNR
echo -e "ONBOOT=yes" >> /etc/sysconfig/network-scripts/ifcfg-$BONDNR
echo -e "BOOTPROTO=none" >> /etc/sysconfig/network-scripts/ifcfg-$BONDNR
echo "USERCTL=no" >> /etc/sysconfig/network-scripts/ifcfg-$BONDNR
cp /etc/sysconfig/network-scripts/ifcfg-$NETNR1 /etc/sysconfig/ifcfg-$NETNR1.bkp
cp /etc/sysconfig/network-scripts/ifcfg-$NETNR2 /etc/sysconfig/ifcfg-$NETNR2.bkp
rm /etc/sysconfig/network-scripts/ifcfg-$NETNR1
rm /etc/sysconfig/network-scripts/ifcfg-$NETNR2
echo -e "DEVICE=$NETNR1" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR1
echo -e "ONBOOT=yes" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR1
echo -e "BOOTPROTO=none" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR1
echo -e "USERCTL=no" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR1
echo -e "MASTER=$BONDNR" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR1
echo -e "SLAVE=yes" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR1
echo -e "DEVICE=$NETNR2" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR2
echo -e "ONBOOT=yes" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR2
echo -e "BOOTPROTO=none" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR2
echo -e "USERCTL=no" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR2
echo -e "MASTER=$BONDNR" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR2
echo -e "SLAVE=yes" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR2
clear
#Restart service network
/etc/init.d/network restart
sleep 5
#SHOW INFO IP
ip a | egrep "$BONDNR|$NETNR1|$NETNR2"
#Check activity status Bonding Port
cat /proc/net/bonding/$BONDNR
#Check Bonding Mode
cat /sys/class/net/$BONDNR/bonding/mode
#Check total bonding interface online
cat /sys/class/net/bonding_masters
