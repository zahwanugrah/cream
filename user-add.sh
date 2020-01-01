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


echo "------------------------ MEMBUAT AKUN SSH ------------------------" | lolcat


	echo "           DEVELOPED BY ZHANG-ZI atau VPNSTUNNEL.COM           " | lolcat
echo ""

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
echo "Connecting to Server..."
sleep 0.5
echo "Checking Permision..."
sleep 0.4
CEK=FordSenpai
if [ "$CEK" != "zhangzi" ]; then
		echo -e "${red}Permission Denied!${NC}";
        echo $CEK;
        exit 0;
else
echo -e "${green}Permission Accepted...${NC}"
sleep 1
clear
fi
  echo ""
  echo ""
  echo ""
read -p "        Username       : " username
egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
echo "Username already exists in your VPS"
exit 0
else
read -p "        Password       : " password
read -p "        How many days? : " masa_aktif
MYIP=$(wget -qO- ipv4.icanhazip.com)
today=`date +%s`
masa_aktif_detik=$(( $masa_aktif * 86400 ))
saat_expired=$(($today + $masa_aktif_detik))
tanggal_expired=$(date -u --date="1970-01-01 $saat_expired sec GMT" +%Y/%m/%d)
tanggal_expired_display=$(date -u --date="1970-01-01 $saat_expired sec GMT" '+%d %B %Y')
clear
echo "Connecting to Server..."
sleep 0.5
echo "Creating Account..."
sleep 0.5
echo "Generating Host..."
sleep 0.5
echo "Generating Your New Username: $username"
sleep 0.5
echo "Generating Password: $password"
sleep 1

useradd $username
usermod -s /bin/false $username
usermod -e  $tanggal_expired $username
  egrep "^$username" /etc/passwd >/dev/null
  echo -e "$password\n$password" | passwd $username
  clear
clear
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e "         ---[Informasi Akun Baru SSH ]---"| boxes -d peek | lolcat
echo -e "============[[-SERVER-PREMIUM-]]===========" | lolcat
echo -e "     Host: $MYIP                           " | lolcat
echo -e "     Username: $username                   " | lolcat
echo -e "     Password: $password                   " | lolcat
echo -e "     Port default SSL/TLS : 443            " | lolcat
echo -e "     Port default dropbear: 442,777        " | lolcat
echo -e "     Port default openSSH : 22,143         " | lolcat
echo -e "     Port default squid   : 8080,3128, 80  " | lolcat
echo -e "     Auto kill user maximal login 2        " | lolcat
echo -e "-------------------------------------------" | lolcat
echo -e "     Aktif Sampai: $(date -d "$AKTIF days" +"%d-%m-%Y")" | lolcat
echo -e "===========================================" | lolcat
echo -e "     NO-CRIMINAL - CYBER & TORRENT         " | lolcat
echo -e "===========================================" | lolcat
echo -e "   http://$MYIP:85/client.ovpn             " | lolcat
echo -e "   Script by ZHANG-ZI & VPNSTUNNEL         " | lolcat
echo -e "-------------------------------------------" | lolcat
echo -e ""
echo -e ""
fi


