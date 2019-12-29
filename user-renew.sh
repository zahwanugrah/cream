#!/bin/bash

if [[ $USER != 'root' ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

# get the VPS IP
#ip=`ifconfig venet0:0 | grep 'inet addr' | awk {'print $2'} | sed s/.*://`
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
#MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
fi
#MYIP=$(wget -qO- ipv4.icanhazip.com)

echo "----------------- TAMBAH MASA AKTIF AKUN SSH --------------------" | lolcat

	echo "        DEVELOPED BY ZHANG-ZI atau VPNSTUNNEL.COM        " | lolcat
echo ""

# begin of user-list
echo "-----------------------------------" | lolcat
echo "USERNAME              EXP DATE     " | lolcat
echo "-----------------------------------" | lolcat

while read expired
do
	AKUN="$(echo $expired | cut -d: -f1)"
	ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
	exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
	if [[ $ID -ge 1000 ]]; then
		printf "%-21s %2s\n" "$AKUN" "$exp"
	fi
done < /etc/passwd
echo "-----------------------------------" | lolcat
echo ""
# end of user-list

read -p "Isikan username: " username

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	#read -p "Isikan password akun [$username]: " password
	read -p "Berapa hari akun [$username] aktif: " AKTIF
	
	expiredate=$(chage -l $username | grep "Account expires" | awk -F": " '{print $2}')
	today=$(date -d "$expiredate" +"%Y-%m-%d")
	expire=$(date -d "$today + $AKTIF days" +"%Y-%m-%d")
	chage -E "$expire" $username
	passwd -u $username
	#useradd -M -N -s /bin/false -e $expire $username
clear
	
echo -e ""
echo -e "|       Informasi Akun Baru SSH      |" | lolcat
echo -e "============[[-SERVER-PREMIUM-]]===========" | lolcat
echo -e "     Host: $MYIP                           " | lolcat
echo -e "     Username: $username                   " | lolcat
echo -e "     Password: $password                   " | lolcat
echo -e "     Port default dropbear: 442,110        " | lolcat
echo -e "     Port default SSL/TLS : 443            " | lolcat
echo -e "     Port default openSSH : 22,143         " | lolcat
echo -e "     Port default squid   : 8080,3128,81   " | lolcat
echo -e "     Auto kill user maximal login 2        " | lolcat
echo -e "-------------------------------------------" | lolcat
echo -e "     Aktif Sampai: $(date -d "$AKTIF days" +"%d-%m-%Y")" | lolcat
echo -e "===========================================" | lolcat
echo -e "     NO-CRIMINAL - CYBER,,,                " | lolcat
echo -e "===========================================" | lolcat
echo -e "   http://$MYIP:85/client.ovpn             " | lolcat
echo -e "   Script by ZHANG-ZI & VPNSTUNNEL.COM     " | lolcat
echo -e "-------------------------------------------" | lolcat
echo -e ""
echo -e ""
else
	echo "Username [$username] belum terdaftar!" | lolcat
	exit 1
fi


