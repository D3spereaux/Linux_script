#!/usr/bin/env bash
 
# Import credentials form config file
. /opt/ssh-login-alert-telegram/credentials.config
for i in "${CHATID[@]}"
do
URL="https://api.telegram.org/bot${TOKEN}/sendMessage"
DATE="$(date "+%H:%M - %d/%m/%Y")"

if [ -n "$SSH_CLIENT" ]; then
	CLIENT_IP=$(echo $SSH_CLIENT | awk '{print $1}')

	SRV_HOSTNAME=$(hostname -f)
	SRV_IP=$(hostname -I | awk '{print $1}')

	IPINFO="https://ipinfo.io/${CLIENT_IP}"

	TEXT=" ‼️*LOGIN ALERT*‼️
	(${DATE})
	~~~~~~~~~~~~~~
	- From: *${CLIENT_IP}*
	- Username: * ${USER}*
	- Hostname: *${SRV_HOSTNAME}* (*${SRV_IP}*)
	- More informations: [${IPINFO}](${IPINFO})"

curl -s -d "chat_id=$i&text=${TEXT}&disable_web_page_preview=true&parse_mode=markdown" $URL > /dev/null
fi
done
