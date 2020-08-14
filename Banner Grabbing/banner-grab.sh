#!/bin/bash
#Create and modify by Brian Dao - D3spere@ux
#This tool uses for Exercises LPI (Linux Professional Institute) or person who working in Fedora distro field.
#########################################################4####################################################

#Global Variables (GV)
		BLUE='\033[1;34m'
		RED='\033[1;31m'
		YELLOW='\033[1;33m'
		NC='\033[0m'
		CYAN='\033[1;36m'
		BLINK='\033[5m'

		PAKTC="${BLINK}${YELLOW}Press ${RED}ANY KEY${YELLOW} to continue..."${NC}
		PAKTGB="${BLINK}${YELLOW}Press ${RED}ANY KEY${YELLOW} to go back..."${NC}
#Code to read from keyboard without return
		READAK="read -n 1"
		
#########################################################4####################################################

#Export GV
		export BLUE
		export RED
		export YELLOW
		export NC
		export CYAN
		export BLINK
		
##############################################################################################################

#Banner Setup
	f_banner(){
		clear
		f_root
        echo
        echo -e "${YELLOW}
            ##########################################################
            =                     ${CYAN}BANNER GRABBING ${YELLOW}                   =
            =                      ${RED}By D3spere@ux${YELLOW}                     =
            ########################################################## "${NC}   
        echo
        echo
		    }
	export -f f_banner

##############################################################################################################

#Invalid Input Function
f_error() {
		echo
		echo -e "${RED}${BLINK} *** Invalid choice or entry *** "${NC}
		echo
		exit
	}
		export -f f_error

##############################################################################################################

#Force using ROOT
f_root () {
	if [[ "$UID" -ne 0 ]]; then
	echo
	echo -e "${YELLOW}Sorry, you need to run this as ${RED}'root'" ${NC}
	echo
	exit
	fi
	}
		export -f f_root
		
##############################################################################################################

#Install Peepingtom
		f_root && f_banner
	if [[ -d /opt/peepingtom ]]; then
			cd /opt/peepingtom; git pull
	else
		#Download sources from Github
			echo -e "${YELLOW}${BLINK} [+] Install Peepingtom" ${NC}
			echo
			cd /opt/
			git clone https://github.com/Rainism/peepingtom.git
			cd /opt/peepingtom
			clear
	fi
		
##############################################################################################################

#Get Target IP
	f_banner
	echo -e -n "${BLUE} [*] Input your target IP: "${NC}
		read target
		echo
		nmap --script /usr/share/nmap/scripts/banner-plus.nse --min-rate=400 --min-parallelism=512 -p 1-65535 -n -Pn -PS -oA /opt/peepingtom/report $target
		echo
		cd /opt/peepingtom/
	#Prep and clean data for scraping
		cat report.gnmap | ./gnmap.pl | grep http | cut -f 1,2 -d "," | tr "," ":" > http_ips.txt
	#run Peeping Tom
		python ./peepingtom.py -p -i http_ips.txt
		cd /opt/peepingtom
		exit
		
##############################################################################################################