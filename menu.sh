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
echo "" | lolcat
echo "" | lolcat
PS3='Silahkan ketik nomor pilihan anda lalu tekan ENTER:| lolcat
options=("Buat User SSH/OVPN" "Buat User SSH/OVPN Trial" "Perbarui User" "Ganti Password User SSH/OVPN" "Semua User Dan Tanggal Kadaluarsa" "Hapus User" "Buat User PPTP VPN" "Monitor User Login" "Daftar User Aktif" "Daftar User Kadaluarsa" "Disable User Kadaluarsa" "Hapus User Kadaluarsa" "Banned User" "Unbanned User" "Penggunaan Ram" "Speedtest" "Benchmark" "Manual Kill Multi Login" "(ON)AutoKill Multi Login" "(OFF)AutoKill Multi Login" "Ganti Password VPS" "Bersihkan Cache Ram Manual" "Edit Banner Login" "Edit Banner Menu" "Lihat Lokasi User" "Restart Webmin" "Restart Server VPS" "Restart Dropbear" "Restart OpenSSH" "Restart Squid3" "Restart OpenVPN" "Restart SSL" "Ganti Port OpenSSH" "Ganti Port Dropbear" "Ganti Port Squid3" "Ganti Port OpenVPN" "Update Script VPS" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Buat User SSH/OVPN")
	clear
        user-add
        break
            ;;
	"Buat User SSH/OVPN Trial")
	clear
	user-gen
	break
	;;
	"Perbarui User")
	clear
	user-renew
	break
	;;
	"Ganti Password User SSH/OVPN")
	clear
	user-pass
	break
	;;
	"Semua User Dan Tanggal Kadaluarsa")
	clear
	user-list
	break
	;;
	"Hapus User")
	clear
	user-del
	break
	;;
	"Buat User PPTP VPN")
	clear
	user-add-pptp 
	break
	;;
	"Monitor User Login")
	clear
	dropmon
	break
	;;
	"Manual Kill Multi Login")
	clear
        read -p "Isikan Maximal User Login (1-2): " MULTILOGIN
        userlimit.sh $MULTILOGIN
	#userlimitssh.sh $MULTILOGIN
	break
	;;
	"(ON)AutoKill Multi Login")
	clear 
	read -p "Isikan Maximal User Login (1-2): " MULTILOGIN2
	echo "@reboot root /root/userlimit.sh" > /etc/cron.d/userlimitreboot
	service cron stop
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
	    service cron start
	    service cron restart
	    service ssh restart
	    service dropbear restart
	    echo "------------+ AUTO KILL SUDAH DI AKTIFKAN BOSS +--------------"  | lolcat
	    
	echo "Dasar Kedekut nak mampuz!!! user ente marah2 jangan salahkan ane ya boss¡¡¡ | lolcat
nanti jangan lupa di matikan boss | lolcat
biar user senang bs multilogin lagi.."  | boxes -d boy | lolcat
	break
	;;
	"(OFF)AutoKill Multi Login")
	clear
	service cron stop
	rm -rf /etc/cron.d/userlimit1
	rm -rf /etc/cron.d/userlimit2
	rm -rf /etc/cron.d/userlimit3
	rm -rf /etc/cron.d/userlimit4
	rm -rf /etc/cron.d/userlimit5
	rm -rf /etc/cron.d/userlimit6
	#rm -rf /etc/cron.d/userlimitreboot
	service cron start
	service cron restart
	    service ssh restart
	    service dropbear restart
	clear
	echo ""
	echo "AUTO KILL LOGIN,SUDAH SAYA MATIKAN BOS | lolcat
User Sudah Bisa Multi Login Lagi!!!" | boxes -d boy | lolcat
	break
	;;
	"Ganti Password VPS")
	clear
	read -p "Silahkan isi password baru untuk VPS anda: " pass	
        echo "root:$pass" | chpasswd
	echo "Ciieeee.. Ciieeeeeee.. Abis Ganti Password VPS Nie Yeeee...!!!"  | boxes -d peek | lolcat
	break
	;;
	"Bersihkan Cache Ram Manual") 
	clear
	echo "---------------------------------------------" | lolcat
	echo "Sebelum..."  | lolcat
	echo "---------------------------------------------" | lolcat
       free -h
	echo 1 > /proc/sys/vm/drop_caches
	sleep 1
	echo 2 > /proc/sys/vm/drop_caches
	sleep 1
	echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a
	sleep 1
	echo "---------------------------------------------" | lolcat
	echo "Sesudah..."  | lolcat
	echo "---------------------------------------------" | lolcat
	free -h
	echo "---------------------------------------------" | lolcat
	echo "SUKSES..!!!Cache ram anda sudah di bersihkan." | boxes -d boy | lolcat
        echo ""
	break
	;;
	"Daftar User Aktif") 
	clear
	user-active-list | boxes -d dog | lolcat
	break
	;;
	"Daftar User Kadaluarsa")
	clear
	user-expire-list 
	break
	;;
	"Disable User Kadaluarsa")
	clear
	disable-user-expire
	break
	;;
	"Hapus User Kadaluarsa")
	clear
	delete-user-expire
	break
	;;
	"Banned User")
	clear
	banned-user
	break
	;;
	"Unbanned User")
	clear
	unbanned-user
	break
	;;
	"Penggunaan Ram")
	clear
	ps-mem  | boxes -d dog | lolcat
	break
	;;
	"Speedtest")
	clear
	echo ""
	echo "SPEEDTEST SERVER" | boxes -d peek| lolcat
	echo "-----------------------------------------"| lolcat
	speedtest --share
	echo "-----------------------------------------"| lolcat
	break
	;;
	"Benchmark")
	clear
	echo "" | lolcat
	echo "" | lolcat
	echo "     #----------BENCHMARK-----------#" | boxes -d peek | lolcat
	benchmark
	break
	;;
        "Edit Banner Login")
	clear
	echo "-----------------------------------------------------------" | lolcat
	echo -e "1.) Simpan text          = (CTRL + X, lalu ketik Y dan tekan Enter) " | lolcat
	echo -e "2.) Membatalkan edit text= (CTRL + X, lalu ketik N dan tekan Enter)" | lolcat
	echo "-----------------------------------------------------------" | lolcat
	read -p "Tekan ENTER untuk melanjutkan........................ "  | lolcat
	nano /bannerssh
	service dropbear restart && service ssh restart
	break
	;;
	"Edit Banner Menu")
	clear
	echo "--------------------------------------------------------" 
	echo -e "1. Simpan text          = (CTRL + X, lalu ketik Y dan tekan ENTER)" | lolcat
	echo -e "2. Membatalkan edit text= (CTRL + X,lalu ketik N dan tekan ENTER)" | lolcat
	echo "--------------------------------------------------------" | lolcat
	read -p "Tekan ENTER untuk melanjutkan..................."  | lolcat
	nano /usr/bin/bannermenu
	break
	;;
	"Lihat Lokasi User")
	clear
	user-login
	echo "Contoh: 112.123.345.126 lalu Enter" | lolcat
        read -p "Ketik Salah Satu Alamat IP User: " userip
        curl ipinfo.io/$userip
	echo "-----------------------------------" | lolcat
        break
	;;
	"Restart Webmin")
	clear
	 service webmin restart
	 echo "Webmin sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "Restart Server VPS")
	 clear
	 reboot
	 echo "Sudah di restart tunggu sebentar ya boss!!!" | boxes -d boy | lolcat
	 echo "Sebentar lagi CONSOLE akan log out" | lolcat
	 break
	 ;;
	 "Restart Dropbear")
	 clear
	 service dropbear restart
	 echo "Dropbear sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "Restart OpenSSH") 
	 clear
	 service ssh restart
	 echo "OpenSSH sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "Restart OpenVPN")
	 clear
	 service openvpn restart
	 echo "openvpn sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	  "Restart SSL")
	 clear
	 service stunnel4 restart
	 echo "stunnel4/ssl sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 
	 "Restart Squid3")
	 clear
	 service squid3 restart
	 echo "Squid3 sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "Ganti Port OpenSSH")
	 clear
	 
		edit-port-openssh
	 break
         ;;
	 "Ganti Port Dropbear")
	 clear
		edit-port-dropbear
	 break
	 ;;
	 "Ganti Port Squid3")
	 clear
		edit-port-squid
			break
			;;
			"Speedtest")
			clear
			python speedtest.py --share
			break		
	 ;;
	 "Ganti/Change Port OpenVPN")
	 clear
		edit-port-openvpn
	 break
	 ;;
	 "Update Script VPS")
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
