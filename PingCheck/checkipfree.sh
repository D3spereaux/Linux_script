#!/bin/bash
#Global Variables (GV)

	RED='\033[1;31m'
	CYAN='\033[1;36m'
	YELLOW='\033[1;33m'
	BLINK='\033[5m'
	NC='\033[0m'

	export RED
	export CYAN
	export YELLOW
	export BLINK
	export NC

######################################################################################

#Clear old data store in file ip_used.txt
	rm -rf ip_used.txt ip_free.txt

#Get data file list IP
	echo -e "${YELLOW} [*] For example: /home/linuxuser/iplist.txt"${NC}
	echo -e -n "${YELLOW} [+] Input IP list path: "${NC}
		read ip_list
	echo

#Check ping
	clear
	echo -e "${BLINK}---Check Ping from file iplist.txt---"${NC}; echo
	for i in $( cat $ip_list ); do
		ping -q -c 1 -W 1 $i > /dev/null
		if [ $? -eq 0 ]; then
			echo -e ${RED} $i ${NC}  | tee -a ip_used.txt
		else
			echo -e ${CYAN} $i ${NC} | tee -a ip_free.txt
		fi
	done
echo "*Data store in 2 file: ip_used.txt and ip_free.txt"
	echo

######################################################################################

#Check port opened from list IP free using Netcat (Make sure in case host IP blocked ICMP)
	clear
	echo -e "${BLINK}---Check Port from file ip_free.txt---"${NC}
	echo

#Clear old data store in file port_open.txt
	rm -rf port_open.txt

#Check port
	for i in $( cat ip_free.txt); do
        	nc -zvw1 $i 22 80 433 3389 2>&1 | grep "succeeded" | tee -a port_open.txt

	done
	echo
echo "*List IP with port opened has stored in file port_open.txt"
