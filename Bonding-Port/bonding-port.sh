#!/bin/bash

modprobe --first-time bonding
modinfo bonding

/bin/echo -n "Which bond device are you configuring? (bond0, bond1, bond2, ...)"
read BONDNR
/bin/echo -n "Which mode number are you configuring? (1 = active-backup, 2 = balance-xor, 3 = broadcast, 4 = 802.3ad, 5 = balance-tlb, 6 = balance-alb)"
read MODENR
/bin/echo -n "What IP address do you want to assign to $BONDNR? (192.168.1.100)"
read IPADDRNR
/bin/echo -n "What is the netmask address you want to assign to $BONDNR? (255.255.255.0)"
read NETMASKNR
/bin/echo -n "What is the gateway address you want to assign to $BONDNR? (192.168.1.1)"
read GATEWAYNR
/bin/echo -n "List the first network device you want to assign to $BONDNR (eth0, eth1, eth2, ...)"
read NETNR1
/bin/echo -n "List the second network device you want to assign to $BONDNR (eth0, eth1, eth2, ...)"
read NETNR2
/bin/cp /etc/sysconfig/network-scripts/ifcfg-$BONDNR /etc/sysconfig/ifcfg-$BONDNR.bkp
/bin/cp /etc/modprobe.d/bonding.conf /etc/sysconfig/
/bin/rm /etc/sysconfig/network-scripts/ifcfg-$BONDNR
/bin/rm /etc/modprobe.d/bonding.conf
/bin/echo "Configuring network bonding for $BONDNR... Backing up config files to /etc/sysconfig/"
/bin/echo "alias $BONDNR bonding" >> /etc/modprobe.d/bonding.conf
/bin/echo "DEVICE=$BONDNR" >> /etc/sysconfig/network-scripts/ifcfg-$BONDNR
/bin/echo "IPADDR=$IPADDRNR" >> /etc/sysconfig/network-scripts/ifcfg-$BONDNR
/bin/echo "NETMASK=$NETMASKNR" >> /etc/sysconfig/network-scripts/ifcfg-$BONDNR
/bin/echo "GATEWAY=$GATEWAYNR" >> /etc/sysconfig/network-scripts/ifcfg-$BONDNR
/bin/echo "ONBOOT=yes" >> /etc/sysconfig/network-scripts/ifcfg-$BONDNR
/bin/echo "BOOTPROTO=none" >> /etc/sysconfig/network-scripts/ifcfg-$BONDNR
/bin/echo "USERCTL=no" >> /etc/sysconfig/network-scripts/ifcfg-$BONDNR
/bin/echo "BONDING_OPTS="miimon=100 mode=$MODENR"" >> /etc/sysconfig/network-scripts/ifcfg-$BONDNR
/bin/cp /etc/sysconfig/network-scripts/ifcfg-$NETNR1 /etc/sysconfig/ifcfg-$NETNR1.bkp
/bin/cp /etc/sysconfig/network-scripts/ifcfg-$NETNR2 /etc/sysconfig/ifcfg-$NETNR2.bkp
/bin/rm /etc/sysconfig/network-scripts/ifcfg-$NETNR1
/bin/rm /etc/sysconfig/network-scripts/ifcfg-$NETNR2
/bin/echo "DEVICE=$NETNR1" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR1
/bin/echo "ONBOOT=yes" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR1
/bin/echo "BOOTPROTO=none" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR1
/bin/echo "USERCTL=no" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR1
/bin/echo "MASTER=$BONDNR" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR1
/bin/echo "SLAVE=yes" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR1
/bin/echo "DEVICE=$NETNR2" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR2
/bin/echo "ONBOOT=yes" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR2
/bin/echo "BOOTPROTO=none" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR2
/bin/echo "USERCTL=no" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR2
/bin/echo "MASTER=$BONDNR" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR2
/bin/echo "SLAVE=yes" >> /etc/sysconfig/network-scripts/ifcfg-$NETNR2
ifdown $BONDNR && ifup $BONDNR
ifdown $NETNR1 && ifup $NETNR1
ifdown $NETNR2 && ifup $NETNR2
/bin/sleep 5
clear
ip a | egrep "$BONDNR|$NETNR1|$NETNR2"
/bin/cat /proc/net/bonding/$BONDNR
/bin/cat /sys/class/net/$BONDNR/bonding/mode
/bin/cat /sys/class/net/bonding_masters
