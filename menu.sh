#!/bin/bash
rm /root/IP
clear

# get the VPS IP
#ip=`ifconfig venet0:0 | grep 'inet addr' | awk {'print $2'} | sed s/.*://`
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
#MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
fi
#myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;

flag=0

echo

	#MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
	#if [ "$MYIP" = "" ]; then
		#MYIP=$(wget -qO- ipv4.icanhazip.com)
	#fi

	clear

	
	echo "" 
	echo ""
	echo "" 
	echo "" 
	echo "" 
	echo "" 
	echo ""
	echo ""
	echo ""
	
cat /usr/bin/bannermenu | lolcat
echo "                    Server: $MYIP"  | lolcat
date +"                    %A, %d-%m-%Y"  | lolcat
date +"                            %H:%M:%S %Z" | lolcat
echo "" 
echo ""
PS3='Silahkan ketik nomor pilihan anda lalu tekan ENTER: '
options=("Create User SSH/OVPN" "Create User SSH/OVPN Trial" "Renew User" "Change Password User SSH/OVPN" "All User Dan Date Expired" "Delete User" "Create User PPTP VPN" "Monitor User Login" "List User Aktif" "list User Expire" "Disable User Expire" "Delete User Expire" "Banned User" "Unbanned User" "Penggunaan Ram" "Speedtest" "Benchmark" "Manual Kill Multi Login" "(ON)AutoKill Multi Login" "(OFF)AutoKill Multi Login" "Change Password VPS" "Bersihkan Cache Ram Manual" "Edit Banner Login" "Edit Banner Menu" "Lihat Lokasi User" "Restart Webmin" "Restart Server VPS" "Restart Dropbear" "Restart OpenSSH" "Restart Squid3" "Restart OpenVPN" "Restart SSL" "Ganti Port OpenSSH" "Change Port Dropbear" "Change Port Squid3" "Change Port OpenVPN" "Update Script VPS" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Create User SSH/OVPN")" | lolcat
	clear
        user-add 
        break
            ;;
	"Create User SSH/OVPN Trial")" | lolcat
	clear
	user-gen
	break
	;;
	"Renew User")" | lolcat
	clear
	user-renew
	break
	;;
	"Change Password User SSH/OVPN")" | lolcat
	clear
	user-pass
	break
	;;
	"All User Dan Date Expired")" | lolcat
	clear
	user-list
	break
	;;
	"Delete User")" | lolcat
	clear
	user-del 
	break
	;;
	"Create User PPTP VPN")" | lolcat
	clear
	user-add-pptp
	break
	;;
	"Monitor User Login")" | lolcat
	clear
	dropmon 
	break
	;;
	"Manual Kill Multi Login")" | lolcat
	clear
        read -p "Isikan Maximal User Login (1-2): " MULTILOGIN
        userlimit.sh $MULTILOGIN
	#userlimitssh.sh $MULTILOGIN
	break
	;;
	"(ON)AutoKill Multi Login")" | lolcat
	clear 
	read -p "Isikan Maximal User Login (1-2): " MULTILOGIN2
	echo "@reboot root /root/userlimit.sh" > /etc/cron.d/userlimitreboot
	/etc/init.d/cron stop
	echo "* * * * * root /usr/bin/userlimit.sh $MULTILOGIN2" > /etc/cron.d/userlimit1
	   echo "* * * * * root sleep 10; /usr/bin/userlimit.sh $MULTILOGIN2" > /etc/cron.d/userlimit2
           echo "* * * * * root sleep 20; /usr/bin/userlimit.sh $MULTILOGIN2" > /etc/cron.d/userlimit3
           echo "* * * * * root sleep 30; /usr/bin/userlimit.sh $MULTILOGIN2" > /etc/cron.d/userlimit4
           echo "* * * * * root sleep 40; /usr/bin/userlimit.sh $MULTILOGIN2" > /etc/cron.d/userlimit5
           echo "* * * * * root sleep 50; /usr/bin/userlimit.sh $MULTILOGIN2" > /etc/cron.d/userlimit6
	   #:echo "@reboot root /root/userlimitssh.sh" >> /etc/cron.d/userlimitreboot
	  # echo "* * * * * root /usr/bin/userlimitssh.sh $MULTILOGIN2" >> /etc/cron.d/userlimit1
	  # echo "* * * * * root sleep 11; /usr/bin/userlimitssh.sh $MULTILOGIN2" >> /etc/cron.d/userlimit2
          # echo "* * * * * root sleep 21; /usr/bin/userlimitssh.sh $MULTILOGIN2" >> /etc/cron.d/userlimit3
           #echo "* * * * * root sleep 31; /usr/bin/userlimitssh.sh $MULTILOGIN2" >> /etc/cron.d/userlimit4
          # echo "* * * * * root sleep 41; /usr/bin/userlimitssh.sh $MULTILOGIN2" >> /etc/cron.d/userlimit5
           #echo "* * * * * root sleep 51; /usr/bin/userlimitssh.sh $MULTILOGIN2" >> /etc/cron.d/userlimit6
	    /etc/init.d/cron start
	    /etc/init.d/cron restart
	    /etc/init.d/ssh restart
	    /etc/init.d/dropbear restart
	    echo "------------+ AUTO KILL SUDAH DI AKTIFKAN BOSS +--------------"  | lolcat
	    
	echo "Dasar Kedekut nak mampuz!!! user ente marah2 jangan salahkan ane ya boss¡¡¡ | lolcat
nanti jangan lupa di matikan boss
biar user senang bisa multilogin lagi.."  | boxes -d boy
	break
	;;
	"(OFF)AutoKill Multi Login")" | lolcat
	clear
	/etc/init.d/cron stop
	rm -rf /etc/cron.d/userlimit1
	rm -rf /etc/cron.d/userlimit2
	rm -rf /etc/cron.d/userlimit3
	rm -rf /etc/cron.d/userlimit4
	rm -rf /etc/cron.d/userlimit5
	rm -rf /etc/cron.d/userlimit6
	#rm -rf /etc/cron.d/userlimitreboot
	/etc/init.d/cron start
	/etc/init.d/cron restart
	    /etc/init.d/ssh restart
	    /etc/init.d/dropbear restart
	clear
	echo ""
	echo "AUTO KILL LOGIN,SUDAH SAYA MATIKAN BOS 
User Sudah Bisa Multi Login Lagi!!!" | boxes -d boy | lolcat
	break
	;;
	"Change Password VPS")" | lolcat
	clear
	read -p "Silahkan isi password baru untuk VPS anda: " pass	
        echo "root:$pass" | chpasswd
	echo "Ciieeee.. Ciieeeeeee.. Abis Ganti Password VPS Nie Yeeee...!!!"  | boxes -d peek 
	break
	;;
	"Bersihkan Cache Ram Manual")" | lolcat
	clear
	echo "---------------------------------------------"
	echo "Sebelum..."  
	echo "---------------------------------------------"
       free -h
	echo 1 > /proc/sys/vm/drop_caches
	sleep 1
	echo 2 > /proc/sys/vm/drop_caches
	sleep 1
	echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a
	sleep 1
	echo "---------------------------------------------" 
	echo "Sesudah..."  
	echo "---------------------------------------------" 
	free -h
	echo "---------------------------------------------" 
	echo "SUKSES..!!!Cache ram anda sudah di bersihkan." | boxes -d boy | lolcat
        echo ""
	break
	;;
	"List User Aktif")" | lolcat
	clear
	user-active-list | boxes -d peek | lolcat
	break
	;;
	"List User Expire")" | lolcat
	clear
	user-expire-list 
	break
	;;
	"Disable User expire")" | lolcat
	clear
	disable-user-expire 
	break
	;;
	"Delete User Expire")" | lolcat
	clear
	delete-user-expire 
	break
	;;
	"Banned User")" | lolcat
	clear
	banned-user 
	break
	;;
	"Unbanned User")" | lolcat
	clear
	unbanned-user 
	break
	;;
	"Penggunaan Ram")" | lolcat
	clear
	ps-mem  | boxes -d peek| lolcat
	break
	;;
	"Speedtest")" | lolcat
	clear
	echo ""
	echo "SPEEDTEST SERVER" | boxes -d peek| lolcat
	echo "-----------------------------------------"| lolcat
	speedtest --share | lolcat
	echo "-----------------------------------------" | lolcat
	break
	;;
	"Benchmark")" | lolcat
	clear
	echo ""
	echo ""
	echo "     #----------BENCHMARK-----------#" | boxes -d peek | lolcat
	benchmark
	break
	;;
        "Edit Banner Login")" | lolcat
	clear
	echo "-----------------------------------------------------------" 
	echo -e "1.) Simpan text          = (CTRL + X, lalu ketik Y dan tekan Enter) "
	echo -e "2.) Membatalkan edit text= (CTRL + X, lalu ketik N dan tekan Enter)"
	echo "-----------------------------------------------------------"
	read -p "Tekan ENTER untuk melanjutkan........................ " 
	nano /etc/issue.net
	/etc/init.d/dropbear restart && service ssh restart
	break
	;;
	"Edit Banner Menu")" | lolcat
	clear
	echo "--------------------------------------------------------" | lolcat
	echo -e "1. Simpan text          = (CTRL + X, lalu ketik Y dan tekan ENTER)" | lolcat
	echo -e "2. Membatalkan edit text= (CTRL + X,lalu ketik N dan tekan ENTER)" | lolcat
	echo "--------------------------------------------------------" | lolcat
	read -p "Tekan ENTER untuk melanjutkan..................." | lolcat
	nano /usr/bin/bannermenu
	break
	;;
	"Lihat Lokasi User")" | lolcat
	clear
	user-login 
	echo "Contoh: 112.123.345.126 lalu Enter" | lolcat
        read -p "Ketik Salah Satu Alamat IP User: " userip
        curl ipinfo.io/$userip
	echo "-----------------------------------"
        break
	;;
	"Restart Webmin")" | lolcat
	clear
	 service webmin restart
	 echo "Webmin sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "Restart Server VPS")" | lolcat
	 clear
	 reboot
	 echo "Sudah di restart tunggu sebentar ya boss!!!" | boxes -d boy | lolcat
	 echo "Sebentar lagi CONSOLE akan log out"
	 break
	 ;;
	 "Restart Dropbear")" | lolcat
	 clear
	 /etc/init.d/dropbear restart
	 echo "Dropbear sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "Restart OpenSSH")" | lolcat
	 clear
	 /etc/init.d/ssh restart
	 echo "OpenSSH sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "Restart OpenVPN")" | lolcat
	 clear
	 /etc/init.d/openvpn restart
	 echo "openvpn sudah di restart boss!!!" | boxes -d boy  | lolcat
	 break
	 ;;
	  "Restart SSL")" | lolcat
	 clear
	 /etc/init.d/stunnel4 restart
	 echo "stunnel4/ssl sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 
	 "Restart Squid")" | lolcat
	 clear
	 /etc/init.d/squid restart
	 echo "Squid3 sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "Change Port OpenSSH")" | lolcat
	 clear
	 
		edit-port-openssh
	 break
         ;;
	 "Change Port Dropbear")" | lolcat
	 clear
		edit-port-dropbear
	 break
	 ;;
	 "Change Port Squid3")" | lolcat
	 clear
		edit-port-squid
			break
			;;
			"Speedtest")
			clear
			python speedtest.py --share
			break		
	 ;;
	 "Change Port OpenVPN")" | lolcat
	 clear
		edit-port-openvpn 
	 break
	 ;;
	 "Update Script VPS")" | lolcat
	 clear
	 /usr/bin/menu-update-script-vps.sh
	 break
	 ;;
	"Quit")
	
	break
	;;
	 
        *) echo invalid option;
	esac
done
