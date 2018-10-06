#!/bin/bash

if [[ $USER != "root" ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;

MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
fi
MYIP2="s/xxxxxxxxx/$MYIP/g";
MYIP3="s/xxxxxxxxx:443/$MYIP:443/g";
ether=`ifconfig | cut -c 1-8 | sort | uniq -u | grep venet0 | grep -v venet0:`
if [[ $ether = "" ]]; then
        ether=eth0
fi

	source="https://raw.githubusercontent.com/brantbell/cream/mei"


# go to root
cd

# check registered ip
wget -q -O IP https://raw.githubusercontent.com/brantbell/cream/mei/IP.txt
if ! grep -w -q $MYIP IP; then
	echo "Maaf, hanya IP yang terdaftar yang bisa menggunakan script ini!"
        echo "     

                       
               =============== OS-32 & 64-bit ================
               ♦                                             ♦
               ♦  AUTOSCRIPT CREATED BY YUSUF ARDIANSYAH     ♦
	       ♦                     &                       ♦
	       ♦               DENY SISWANTO                 ♦
	       ♦           MODIFIED BY DENBAGUSS             ♦
               ♦       -----------About Us------------       ♦ 
               ♦            Tel : +6283843700098             ♦
               ♦         { Sms/whatsapp/telegram }           ♦ 
               ♦       http://facebook.com/t34mh4ck3r        ♦    
               ♦   http://www.facebook.com/elang.overdosis   ♦
               ♦                                             ♦
               =============== OS-32 & 64-bit ================
               
                 Please make payment before use auto script
                 ..........................................
                 .        Price: Rp.20.000 = 1IP          .
                 .          *****************             .
                 .           Maybank Account              .
                 .           =================            .
                 .          No   : Hubungi admin          .
                 .          Name : Yusuf Ardiansyah       .
                 ..........................................   
                          Thank You For Choice Us"

	echo "        Hubungi: editor ( elang overdosis atau deeniedoank)"
	
	rm /root/IP
	rm zhangzi.sh
	rm -f /root/IP
	exit
fi

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

# install wget and curl
apt-get update;apt-get -y install wget curl;
apt-get install gem
# set time GMT +8
ln -fs /usr/share/zoneinfo/Asia/Malaysia /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
service ssh restart

# set repo
wget -O /etc/apt/sources.list https://raw.githubusercontent.com/brantbell/cream/mei/sources.list.debian7
wget http://www.dotdeb.org/dotdeb.gpg
wget http://www.webmin.com/jcameron-key.asc
cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
cat jcameron-key.asc | apt-key add -;rm jcameron-key.asc

# remove unused
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove bind9*;
apt-get -y --purge remove dropbear*;
apt-get -y autoremove;

# update
apt-get update;apt-get -y upgrade;

# install webserver
apt-get -y install nginx php5-fpm php5-cli
apt-get -y install zip tar
apt-get install python
cd

# install essential package
#echo "mrtg mrtg/conf_mods boolean true" | debconf-set-selections
#apt-get -y install bmon iftop htop nmap axel nano iptables traceroute sysv-rc-conf dnsutils bc nethogs openvpn vnstat less screen psmisc apt-file whois ptunnel ngrep mtr git zsh mrtg snmp snmpd snmp-mibs-downloader unzip unrar rsyslog debsums rkhunter
apt-get -y install bmon iftop htop nmap axel nano iptables traceroute sysv-rc-conf dnsutils bc nethogs less screen psmisc apt-file whois ptunnel ngrep mtr git zsh unzip unrar rsyslog debsums rkhunter
apt-get -y install build-essential
apt-get -y install libio-pty-perl libauthen-pam-perl apt-show-versions

# disable exim
service exim4 stop
sysv-rc-conf exim4 off

# update apt-file
apt-file update

# setting vnstat
vnstat -u -i eth0
sudo service vnstat restart
cd

# text wrn
cd
rm -rf /root/.bashrc
wget -O /root/.bashrc https://raw.githubusercontent.com/brantbell/cream/mei/.bashrc

#text gambar
apt-get install boxes
# text pelangi
sudo apt-get install ruby -y
sudo gem install lolcat
 
# install webserver
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf https://raw.githubusercontent.com/brantbell/cream/mei/nginx.conf
mkdir -p /home/vps/public_html
echo "<pre>Modified by elang overdosis n' yusuf ardiansyah</pre>" > /home/vps/public_html/index.html
echo "<?php phpinfo(); ?>" > /home/vps/public_html/info.php
wget -O /etc/nginx/conf.d/vps.conf https://raw.githubusercontent.com/brantbell/cream/mei/vps.conf
sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf
service php5-fpm restart
service nginx restart
cd

# install badvpn
wget -O /usr/bin/badvpn-udpgw https://raw.githubusercontent.com/brantbell/cream/mei/badvpn-udpgw
if [[ $OS == "x86_64" ]]; then
wget -O /usr/bin/badvpn-udpgw https://raw.githubusercontent.com/brantbell/cream/mei/badvpn-udpgw64
fi
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300' /etc/rc.local
chmod +x /usr/bin/badvpn-udpgw
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300
cd

# install mrtg
apt-get update;apt-get -y install snmpd;
wget -O /etc/snmp/snmpd.conf https://raw.githubusercontent.com/brantbell/cream/mei/snmpd.conf
wget -O /root/mrtg-mem.sh https://raw.githubusercontent.com/brantbell/cream/mei/mrtg-mem.sh
chmod +x /root/mrtg-mem.sh
cd /etc/snmp/
sed -i 's/TRAPDRUN=no/TRAPDRUN=yes/g' /etc/default/snmpd
service snmpd restart
snmpwalk -v 1 -c public localhost 1.3.6.1.4.1.2021.10.1.3.1
mkdir -p /home/vps/public_html/mrtg
cfgmaker --zero-speed 100000000 --global 'WorkDir: /home/vps/public_html/mrtg' --output /etc/mrtg.cfg public@localhost
curl https://raw.githubusercontent.com/brantbell/cream/mei/mrtg.conf >> /etc/mrtg.cfg
sed -i 's/WorkDir: \/var\/www\/mrtg/# WorkDir: \/var\/www\/mrtg/g' /etc/mrtg.cfg
sed -i 's/# Options\[_\]: growright, bits/Options\[_\]: growright/g' /etc/mrtg.cfg
indexmaker --output=/home/vps/public_html/mrtg/index.html /etc/mrtg.cfg
if [ -x /usr/bin/mrtg ] && [ -r /etc/mrtg.cfg ]; then mkdir -p /var/log/mrtg ; env LANG=C /usr/bin/mrtg /etc/mrtg.cfg 2>&1 | tee -a /var/log/mrtg/mrtg.log ; fi
if [ -x /usr/bin/mrtg ] && [ -r /etc/mrtg.cfg ]; then mkdir -p /var/log/mrtg ; env LANG=C /usr/bin/mrtg /etc/mrtg.cfg 2>&1 | tee -a /var/log/mrtg/mrtg.log ; fi
if [ -x /usr/bin/mrtg ] && [ -r /etc/mrtg.cfg ]; then mkdir -p /var/log/mrtg ; env LANG=C /usr/bin/mrtg /etc/mrtg.cfg 2>&1 | tee -a /var/log/mrtg/mrtg.log ; fi
cd

# setting port ssh
sed -i '/Port 22/a Port 90' /etc/ssh/sshd_config
sed -i 's/Port 22/Port  22/g' /etc/ssh/sshd_config
sed -i '$ i\Banner bannerssh' /etc/ssh/sshd_config
service ssh restart

# install dropbear
apt-get -y update
apt-get install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=777/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 443"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
sed -i 's/DROPBEAR_BANNER=""/DROPBEAR_BANNER="bannerssh"/g' /etc/default/dropbear
/etc/init.d/dropbear restart
service ssh restart

# upgade dropbear 2016.74
#apt-get install zlib1g-dev
#wget https://raw.githubusercontent.com/brantbell/cream/mei/dropbear-2016.74.tar.bz2
#bzip2 -cd dropbear-2016.74.tar.bz2 | tar xvf -
#cd dropbear-2016.74
#./configure
#make && make install
#mv /usr/sbin/dropbear /usr/sbin/dropbear.old
#ln /usr/local/sbin/dropbear /usr/sbin/dropbear
#cd && rm -rf dropbear-2018.76 && rm -rf dropbear-2016.74.tar.bz2

# bannerssh
wget https://raw.githubusercontent.com/brantbell/cream/mei/bannerssh
mv ./bannerssh /bannerssh
chmod 0644 /bannerssh
service dropbear restart
service ssh restart

# install vnstat gui
cd /home/vps/public_html/
wget https://raw.githubusercontent.com/brantbell/cream/mei/vnstat_php_frontend-1.5.1.tar.gz
tar xvfz vnstat_php_frontend-1.5.1.tar.gz
rm vnstat_php_frontend-1.5.1.tar.gz
mv vnstat_php_frontend-1.5.1 vnstat
cd vnstat
sed -i "s/eth0/$ether/g" config.php
sed -i "s/\$iface_list = array('venet0', 'sixxs');/\$iface_list = array($ether);/g" config.php
sed -i "s/\$language = 'nl';/\$language = 'en';/g" config.php
sed -i 's/Internal/Internet/g' config.php
sed -i '/SixXS IPv6/d' config.php
cd

# block all port except
sed -i '$ i\iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -d 127.0.0.1 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 21 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 22 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 53 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 80 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 81 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 109 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 110 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 143 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 443 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 442 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 1194 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 3128 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 8000 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 8080 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 10000 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 55 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p udp -m udp --dport 2500 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p udp -m udp --dport 53 -j ACCEPT' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p udp -m udp -j DROP' /etc/rc.local
sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp -j DROP' /etc/rc.local

# install fail2ban
apt-get update;apt-get -y install fail2ban;service fail2ban restart

# install squid3
#apt-get -y install squid3
#wget -O /etc/squid3/squid.conf https://raw.githubusercontent.com/brantbell/cream/mei/squid3.conf
#sed -i $MYIP2 /etc/squid3/squid.conf;
#service squid3 restart
sudo apt-get -y install squid3
cat > /etc/squid3/squid.conf <<-END
acl localhost src 127.0.0.1/32 ::1
acl to_localhost dst 127.0.0.0/8 0.0.0.0/32 ::1
acl SSL_ports port 443
acl Safe_ports port 80
acl Safe_ports port 21
acl Safe_ports port 443
acl Safe_ports port 70
acl Safe_ports port 210
acl Safe_ports port 1025-65535
acl Safe_ports port 280
acl Safe_ports port 488
acl Safe_ports port 591
acl Safe_ports port 777
acl CONNECT method CONNECT
acl SSH dst xxxxxxxxx-xxxxxxxxx/32
http_access allow SSH
http_access allow manager localhost
http_access deny manager
http_access allow localhost
http_access deny all
http_port 8080
http_port 8000
http_port 80
http_port 3128
coredump_dir /var/spool/squid3
refresh_pattern ^ftp: 1440 20% 10080
refresh_pattern ^gopher: 1440 0% 1440
refresh_pattern -i (/cgi-bin/|\?) 0 0% 0
refresh_pattern . 0 20% 4320
visible_hostname denbaguss
END
sed -i $MYIP2 /etc/squid3/squid.conf;
service squid3 restart

# install webmin
cd
apt-get -y update && apt-get -y upgrade
apt-get -y install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python
wget -O webmin-current.deb http://prdownloads.sourceforge.net/webadmin/webmin_1.890_all.deb
#wget -O webmin-current.deb https://raw.githubusercontent.com/cream/mei/webmin-current.deb
dpkg -i --force-all webmin-current.deb
apt-get -y -f install;
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
rm -f /root/webmin-current.deb
#apt-get -y --force-yes -f install libxml-parser-perl
service webmin restart

# install pptp vpn
wget -O /root/pptp.sh https://raw.githubusercontent.com/brantbell/cream/mei/pptp.sh
chmod +x pptp.sh
./pptp.sh

# download script
cd
wget -O /usr/bin/benchmark "https://raw.githubusercontent.com/brantbell/cream/mei/benchmark.sh"
wget -O /usr/bin/speedtest "https://raw.githubusercontent.com/brantbell/cream/mei/speedtest_cli.py"
wget -O /usr/bin/ps-mem "https://raw.githubusercontent.com/brantbell/cream/mei/ps_mem.py"
wget -O /usr/bin/dropmon "https://raw.githubusercontent.com/brantbell/cream/mei/dropmon.sh"
wget -O /usr/bin/menu "https://raw.githubusercontent.com/brantbell/cream/mei/menu.sh"
wget -O /usr/bin/user-active-list "https://raw.githubusercontent.com/brantbell/cream/mei/user-active-list.sh"
wget -O /usr/bin/user-add "https://raw.githubusercontent.com/brantbell/cream/mei/user-add.sh"
wget -O /usr/bin/user-add-pptp "https://raw.githubusercontent.com/brantbell/cream/mei/user-add-pptp.sh"
wget -O /usr/bin/user-del "https://raw.githubusercontent.com/brantbell/cream/mei/user-del.sh"
wget -O /usr/bin/disable-user-expire "https://raw.githubusercontent.com/brantbell/cream/mei/disable-user-expire.sh"
wget -O /usr/bin/delete-user-expire "https://raw.githubusercontent.com/brantbell/cream/mei/delete-user-expire.sh"
wget -O /usr/bin/banned-user "https://raw.githubusercontent.com/brantbell/cream/mei/banned-user.sh"
wget -O /usr/bin/unbanned-user "https://raw.githubusercontent.com/brantbell/cream/mei/unbanned-user.sh"
wget -O /usr/bin/user-expire-list "https://raw.githubusercontent.com/brantbell/cream/mei/user-expire-list.sh"
wget -O /usr/bin/user-gen "https://raw.githubusercontent.com/brantbell/cream/mei/user-gen.sh"
wget -O /usr/bin/userlimit.sh "https://raw.githubusercontent.com/brantbell/cream/mei/userlimit.sh"
#wget -O /usr/bin/userlimitssh.sh "https://raw.githubusercontent.com/brantbell/cream/mei/userlimitssh.sh"
wget -O /usr/bin/user-list "https://raw.githubusercontent.com/brantbell/cream/mei/user-list.sh"
wget -O /usr/bin/user-login "https://raw.githubusercontent.com/brantbell/cream/mei/user-login.sh"
wget -O /usr/bin/user-pass "https://raw.githubusercontent.com/brantbell/cream/mei/user-pass.sh"
wget -O /usr/bin/user-renew "https://raw.githubusercontent.com/brantbell/cream/mei/user-renew.sh"
wget -O /usr/bin/clearcache.sh "https://raw.githubusercontent.com/brantbell/cream/mei/clearcache.sh"
wget -O /usr/bin/bannermenu "https://raw.githubusercontent.com/brantbell/cream/mei/bannermenu"
wget -O /usr/bin/menu-update-script-vps.sh "https://raw.githubusercontent.com/brantbell/cream/mei/menu-update-script-vps.sh"
wget -O /usr/bin/vpnmon "https://raw.githubusercontent.com/brantbell/cream/mei/vpnmon"
cd
# cronjob
echo "02 */12 * * * root service dropbear restart" > /etc/cron.d/dropbear
echo "00 23 * * * root /usr/bin/disable-user-expire" > /etc/cron.d/disable-user-expire
echo "0 */12 * * * root /sbin/reboot" > /etc/cron.d/reboot
echo "00 01 * * * root echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a" > /etc/cron.d/clearcacheram3swap
echo "*/3 * * * * root /usr/bin/clearcache.sh" > /etc/cron.d/clearcache1

cd
chmod +x /usr/bin/benchmark
chmod +x /usr/bin/speedtest
chmod +x /usr/bin/ps-mem
#chmod +x /usr/bin/autokill
chmod +x /usr/bin/dropmon
chmod +x /usr/bin/menu
chmod +x /usr/bin/user-active-list
chmod +x /usr/bin/user-add
chmod +x /usr/bin/user-add-pptp
chmod +x /usr/bin/user-del
chmod +x /usr/bin/disable-user-expire
chmod +x /usr/bin/delete-user-expire
chmod +x /usr/bin/banned-user
chmod +x /usr/bin/unbanned-user
chmod +x /usr/bin/user-expire-list
chmod +x /usr/bin/user-gen
chmod +x /usr/bin/userlimit.sh
#chmod +x /usr/bin/userlimitssh.sh
chmod +x /usr/bin/user-list
chmod +x /usr/bin/user-login
chmod +x /usr/bin/user-pass
chmod +x /usr/bin/user-renew
chmod +x /usr/bin/clearcache.sh
chmod +x /usr/bin/bannermenu
chmod +x /usr/bin/menu-update-script-vps.sh
chmod 777 /usr/bin/vpnmon
cd

#wget https://raw.githubusercontent.com/brantbell/cream/mei/instalshc.sh
#chmod +x /root/instalshc.sh
#/root/instalshc.sh
#rm /root/instalshc.sh

# swap ram
dd if=/dev/zero of=/swapfile bs=1024 count=4096k
# buat swap
mkswap /swapfile
# jalan swapfile
swapon /swapfile
#auto star saat reboot
wget https://raw.githubusercontent.com/brantbell/cream/mei/fstab
mv ./fstab /etc/fstab
chmod 644 /etc/fstab
sysctl vm.swappiness=10
#permission swapfile
chown root:root /swapfile 
chmod 0600 /swapfile
cd

#install stunnel ssl
apt-get update
apt-get upgrade
apt-get install stunnel4
wget -O /etc/stunnel/stunnel.conf https://raw.githubusercontent.com/brantbell/cream/mei/stunnel.conf
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart

#ovpn
wget -O ovpn.sh https://raw.githubusercontent.com/brantbell/cream/mei/installovpn.sh
chmod +x ovpn.sh
./ovpn.sh
rm ./ovpn.sh

echo "kopet" > /etc/openvpn/pass.txt

usermod -s /bin/false mail
echo "mail:kopet" | chpasswd
useradd -s /bin/false -M zhangzi
echo "zhangzi:kopet" | chpasswd

# Restart openvpn
/etc/init.d/openvpn restart
service openvpn start
service openvpn status

#Setting USW
apt-get install ufw
ufw allow ssh
ufw allow 1194/tcp
sed -i 's|DEFAULT_INPUT_POLICY="DROP"|DEFAULT_INPUT_POLICY="ACCEPT"|' /etc/default/ufw
sed -i 's|DEFAULT_FORWARD_POLICY="DROP"|DEFAULT_FORWARD_POLICY="ACCEPT"|' /etc/default/ufw
cat > /etc/ufw/before.rules <<-END
# START OPENVPN RULES
# NAT table rules
*nat
:POSTROUTING ACCEPT [0:0]
# Allow traffic from OpenVPN client to eth0
-A POSTROUTING -s 10.8.0.0/8 -o eth0 -j MASQUERADE
COMMIT
# END OPENVPN RULES
END
ufw enable
ufw status
ufw disable

# set ipv4 forward
echo 1 > /proc/sys/net/ipv4/ip_forward
sed -i 's|#net.ipv4.ip_forward=1|net.ipv4.ip_forward=1|' /etc/sysctl.conf

# finishing
chown -R www-data:www-data /home/vps/public_html
service cron restart
service nginx start
service php5-fpm start
service vnstat restart
service snmpd restart
service ssh restart
service dropbear restart
service fail2ban restart
service squid3 restart
service webmin restart

cd
rm -f /root/.bash_history && history -c
# echo "unset HISTFILE" >> /etc/profile

echo "=======================================================" | tee -a log-install.txt
cd ~/
rm -f /root/zhangzi.sh
rm -f /root/pptp.sh
rm -f /root/ovpn.sh
rm -f /root/IP
rm -f /root/IPcarding
echo 3 > /proc/sys/vm/drop_caches
