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

echo "--------------------------- GANTI PASSWORD AKUN SSH ---------------------------" | lolcat

	echo "            DEVELOPED BY ZhangZi atau VPNSTUNNEL.COM            " | lolcat
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
echo "-----------------------------------"
echo ""
# end of user-list

read -p "Isikan username: " username

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	read -p "Isikan password baru akun [$username]: " password
	read -p "Konfirmasi password baru akun [$username]: " password1
	echo ""
	if [[ $password = $password1 ]]; then
		echo $username:$password | chpasswd
		echo "Penggantian password akun [$username] Sukses" | lolcat
		echo ""
		echo "-----------------------------------" | lolcat
		echo "Data Login:" | lolcat
		echo "-----------------------------------" | lolcat
		echo "Host/IP: $MYIP" | lolcat
		echo "Dropbear Port: 442, 777" | lolcat
		echo "SSL/TSL Port: 443" | lolcat
		echo "OpenSSH Port: 22, 143" | lolcat
		echo "Squid Proxy: 8080, 3128" | lolcat
		echo "OpenVPN Config: http://$MYIP:85/client.ovpn" | lolcat
		echo "Username: $username" | lolcat
		echo "Password: $password" | lolcat
		#echo "Valid s/d: $(date -d "$AKTIF days" +"%d-%m-%Y")" | lolcat
		echo "-----------------------------------" | lolcat
	else
		echo "Penggantian password akun [$username] Gagal" | lolcat
		echo "[Password baru] & [Konfirmasi Password Baru] tidak cocok, silahkan ulangi lagi!" | lolcat
	fi
else
	echo "Username [$username] belum terdaftar!" | lolcat
	exit 1
fi


