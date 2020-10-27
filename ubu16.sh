#!/bin/sh
# Script Created kopet
# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
#MYIP=$(wget -qO- ipv4.icanhazip.com);

# ipvp
IPADDRESS=`ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{print $1}' | head -1`
IPADD="s/ipaddresxxx/$IPADDRESS/g";

# go to root
cd
# clean
apt-get clean
# update
apt-get update -y
apt-get upgrade -y
# install needs
apt-get -y install stunnel4 apache2 openvpn easy-rsa ufw bridge-utils fail2ban zip -y
#plg
apt-get install yum -y
yum -y install make automake autoconf gcc gcc++
aptitude -y install build-essential
apt-get install tar
wget "https://raw.githubusercontent.com/emue25/VPSauto/master/tool/plugin.tgz"
tar -xzvf plugin.tgz

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#text gambar
apt-get -y install boxes
# text pelangi
apt-get -y install ruby
sudo gem install lolcat
#screen
cd
rm -rf /root/.bashrc
wget -O /root/.bashrc "https://raw.githubusercontent.com/emue25/cream/mei/.bashrc"
# setting port ssh
sed -i '/Port 22/a Port 143' /etc/ssh/sshd_config
sed -i '/Port 22/a Port  90' /etc/ssh/sshd_config
sed -i 's/Port 22/Port  22/g' /etc/ssh/sshd_config
/etc/init.d/ssh restart

# install dropbear
apt-get -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=442/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 777"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
/etc/init.d/dropbear restart
# setting banner
rm /etc/issue.net
wget -O /etc/issue.net "https://raw.githubusercontent.com/emue25/cream/mei/bannerssh"
sed -i 's@#Banner@Banner@g' /etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear
/etc/init.d/ssh restart
/etc/init.d/dropbear restart


# install webserver
cd
sudo apt-get -y install nginx
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/idtunnel/sshtunnel/master/debian9/nginx-default.conf"
mkdir -p /home/vps/public_html
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/idtunnel/sshtunnel/master/debian9/vhost-nginx.conf"
/etc/init.d/nginx restart

# instal nginx php5.6 
apt-get -y install nginx php5.6-fpm
apt-get -y install nginx php5.6-cli
apt-get -y install nginx php5.6-mysql
apt-get -y install nginx php5.6-mcrypt
sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/5.6/cli/php.ini

# cari config php fpm dengan perintah berikut "php --ini |grep Loaded"
sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/5.6/cli/php.ini

# Cari config php fpm www.conf dengan perintah berikut "find / \( -iname "php.ini" -o -name "www.conf" \)"
sed -i 's/listen = \/run\/php\/php5.6-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/5.6/fpm/pool.d/www.conf
cd


# Edit port apache2 ke 8090
wget -O /etc/apache2/ports.conf "https://raw.githubusercontent.com/idtunnel/sshtunnel/master/debian9/apache2.conf"

# Edit port virtualhost apache2 ke 8090
wget -O /etc/apache2/sites-enabled/000-default.conf "https://raw.githubusercontent.com/idtunnel/sshtunnel/master/debian9/virtualhost.conf"

# restart apache2
/etc/init.d/apache2 restart

# openvpn
cp -r /usr/share/easy-rsa/ /etc/openvpn
mkdir /etc/openvpn/easy-rsa/keys
sed -i 's|export KEY_COUNTRY="US"|export KEY_COUNTRY="ID"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_PROVINCE="CA"|export KEY_PROVINCE="JAWA TENGAH"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_CITY="SanFrancisco"|export KEY_CITY="PORDJO City"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_ORG="Fort-Funston"|export KEY_ORG="vpnstunnel"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_EMAIL="me@myhost.mydomain"|export KEY_EMAIL="aditya679@yahoo.com"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_OU="MyOrganizationalUnit"|export KEY_OU="vpninjector"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_NAME="EasyRSA"|export KEY_NAME="denbaguss"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_OU=changeme|export KEY_OU=vpnstunnel|' /etc/openvpn/easy-rsa/vars
# create diffie-helman pem
openssl dhparam -out /etc/openvpn/dh1024.pem 1024
# create pki
cd /etc/openvpn/easy-rsa
. ./vars
./clean-all
export EASY_RSA="${EASY_RSA:-.}"
"$EASY_RSA/pkitool" --initca $*
# create key server
export EASY_RSA="${EASY_RSA:-.}"
"$EASY_RSA/pkitool" --server server
# setting key cn
export EASY_RSA="${EASY_RSA:-.}"
"$EASY_RSA/pkitool" client
cd
cp /etc/openvpn/easy-rsa/keys/server.crt /etc/openvpn/server.crt
cp /etc/openvpn/easy-rsa/keys/server.key /etc/openvpn/server.key
cp /etc/openvpn/easy-rsa/keys/ca.crt /etc/openvpn/ca.crt
# setting server
cat > /etc/openvpn/server.conf <<-END
port 110
proto tcp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh1024.pem
client-cert-not-required
username-as-common-name
plugin /usr/lib/openvpn/openvpn-plugin-auth-pam.so login
server 192.168.10.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 1.1.1.1"
push "dhcp-option DNS 1.0.0.1"
push "route-method exe"
push "route-delay 2"
duplicate-cn
push "route-method exe"
push "route-delay 2"
keepalive 10 120
persist-key
persist-tun
status openvpn-status.log
log openvpn.log
verb 3
cipher none
END
systemctl start openvpn@server.service

#udp
cat > /etc/openvpn/server-udp.conf <<-END
port 1194
proto udp
dev tun
ca easy-rsa/keys/ca.crt
cert easy-rsa/keys/white-vps.crt
key easy-rsa/keys/white-vps.key
dh dh2048.pem
plugin /usr/lib/openvpn/openvpn-plugin-auth-pam.so login
client-cert-not-required
username-as-common-name
server 192.168.20.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1"
push "dhcp-option DNS 1.1.1.1"
push "dhcp-option DNS 1.0.0.1"
keepalive 5 30
comp-lzo
persist-key
persist-tun
status server-udp-1194.log
verb 3
END
systemctl start openvpn@server-udp.service
# create openvpn config
mkdir -p /home/vps/public_html
cat > /home/vps/public_html/openvpn.ovpn <<-END
#modif by zhangzi
client
dev tun
proto tcp
remote $IPADDRESS 110
http-proxy $IPADDRESS 8080
persist-key
persist-tun
dev tun
pull
resolv-retry infinite
nobind
ns-cert-type server
verb 3
mute 2
mute-replay-warnings
auth-user-pass
redirect-gateway def1
script-security 2
route 0.0.0.0 0.0.0.0
route-method exe
route-delay 2
cipher none

END
echo '<ca>' >> /home/vps/public_html/openvpn.ovpn
cat /etc/openvpn/ca.crt >> /home/vps/public_html/openvpn.ovpn
echo '</ca>' >> /home/vps/public_html/openvpn.ovpn

# create openvpn config with stunnel
mkdir -p /home/vps/public_html
cat > /home/vps/public_html/openvpnssl.ovpn <<-END
client
dev tun
proto tcp
remote $IPADDRESS 443
persist-key
persist-tun
dev tun
pull
resolv-retry infinite
nobind
ns-cert-type server
verb 3
mute 2
mute-replay-warnings
auth-user-pass
redirect-gateway def1
script-security 2
up /etc/openvpn/update-resolv-conf
down /etc/openvpn/update-resolv-conf
route $IPADDRESS 255.255.255.255 net_gateway
route-method exe
route-delay 2
cipher none

END
echo '<ca>' >> /home/vps/public_html/openvpnssl.ovpn
cat /etc/openvpn/ca.crt >> /home/vps/public_html/openvpnssl.ovpn
echo '</ca>' >> /home/vps/public_html/openvpnssl.ovpn
# compress config
cd /home/vps/public_html/
tar -zcvf /home/vps/public_html/openvpn.tgz openvpn.ovpn openvpnssl.ovpn stunnel.conf
# install squid
apt-get -y install squid
cat > /etc/squid/squid.conf <<-END
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
acl SSH dst ipaddresxxx-ipaddresxxx/32
http_access allow SSH
http_access allow manager localhost
http_access deny manager
http_access allow localhost
http_access deny all
http_port 8080
http_port 8000
http_port 3128
coredump_dir /var/spool/squid
refresh_pattern ^ftp: 1440 20% 10080
refresh_pattern ^gopher: 1440 0% 1440
refresh_pattern -i (/cgi-bin/|\?) 0 0% 0
refresh_pattern . 0 20% 4320
visible_hostname VPNstunnel
END
sed -i $IPADD /etc/squid/squid.conf;
# setting iptables
cat > /etc/iptables.up.rules <<-END
*nat
:PREROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -j SNAT --to-source ipaddresxxx
-A POSTROUTING -o eth0 -j MASQUERADE
-A POSTROUTING -s 192.168.100.0/24 -o eth0 -j MASQUERADE
-A POSTROUTING -s 192.168.10.0/24 -o eth0 -j MASQUERADE
COMMIT

*filter
:INPUT ACCEPT [19406:27313311]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [9393:434129]
:fail2ban-ssh - [0:0]
-A FORWARD -i eth0 -o ppp0 -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i ppp0 -o eth0 -j ACCEPT
-A INPUT -p ICMP --icmp-type 8 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 53 -j ACCEPT
-A INPUT -p tcp --dport 22  -m state --state NEW -j ACCEPT
-A INPUT -p tcp --dport 85  -m state --state NEW -j ACCEPT
-A INPUT -p tcp --dport 80  -m state --state NEW -j ACCEPT
-A INPUT -p udp --dport 80  -m state --state NEW -j ACCEPT
-A INPUT -p tcp --dport 443  -m state --state NEW -j ACCEPT
-A INPUT -p tcp --dport 1194  -m state --state NEW -j ACCEPT
-A INPUT -p udp --dport 1194  -m state --state NEW -j ACCEPT
-A INPUT -p tcp --dport 3128  -m state --state NEW -j ACCEPT
-A INPUT -p udp --dport 3128  -m state --state NEW -j ACCEPT
-A INPUT -p tcp --dport 8000  -m state --state NEW -j ACCEPT
-A INPUT -p udp --dport 8000  -m state --state NEW -j ACCEPT
-A INPUT -p tcp --dport 8080  -m state --state NEW -j ACCEPT
-A INPUT -p udp --dport 8080  -m state --state NEW -j ACCEPT
-A OUTPUT -p tcp --dport 6881:6889 -j DROP
-A OUTPUT -p udp --dport 1024:65534 -j DROP
-A FORWARD -m string --string "get_peers" --algo bm -j DROP
-A FORWARD -m string --string "announce_peer" --algo bm -j DROP
-A FORWARD -m string --string "find_node" --algo bm -j DROP
-A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
-A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
-A FORWARD -m string --algo bm --string "peer_id=" -j DROP
-A FORWARD -m string --algo bm --string ".torrent" -j DROP
-A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
-A FORWARD -m string --algo bm --string "torrent" -j DROP
-A FORWARD -m string --algo bm --string "announce" -j DROP
-A FORWARD -m string --algo bm --string "info_hash" -j DROP
-A fail2ban-ssh -j RETURN
COMMIT

*raw
:PREROUTING ACCEPT [158575:227800758]
:OUTPUT ACCEPT [46145:2312668]
COMMIT
iptables -I INPUT -p udp --dport 1024:1193 -j DROP
iptables -I INPUT -p udp --dport 1195:1644 -j DROP
iptables -I INPUT -p udp --dport 1647:65534 -j ACCEPT

## Allowing all neede ports for OpenVPN L2TP PPTP and RADIUS
iptables -I OUTPUT -p udp --dport 1812 -j ACCEPT
iptables -I OUTPUT -p udp --dport 1813 -j ACCEPT
iptables -I OUTPUT -p udp --dport 1701 -j ACCEPT
iptables -I OUTPUT -p udp --dport 4500 -j ACCEPT
iptables -I OUTPUT -p udp --dport 500 -j ACCEPT
iptables -I OUTPUT -p udp --dport 443 -j ACCEPT
iptables -I OUTPUT -p tcp --dport 1723 -j ACCEPT

## Drop torrents
iptables -A OUTPUT -p tcp --dport 6881:6889 -j DROP
iptables -A OUTPUT -p udp --dport 1024:65534 -j DROP

## Set more radius (alt) ports

iptables -I OUTPUT -p udp --dport 1645 -j ACCEPT
iptables -I OUTPUT -p udp --dport 1646 -j ACCEPT

## Try torrent name filters
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP

## Trying forward
iptables -A FORWARD -p tcp --dport 6881:6889 -j DROP
iptables -A FORWARD -p udp --dport 1024:65534 -j DROP

###### Found on web

iptables -N LOGDROP > /dev/null 2> /dev/null
iptables -F LOGDROP
iptables -A LOGDROP -j DROP

#Torrent
iptables -D FORWARD -m string --algo bm --string "BitTorrent" -j LOGDROP 
iptables -D FORWARD -m string --algo bm --string "BitTorrent protocol" -j LOGDROP
iptables -D FORWARD -m string --algo bm --string "peer_id=" -j LOGDROP
iptables -D FORWARD -m string --algo bm --string ".torrent" -j LOGDROP
iptables -D FORWARD -m string --algo bm --string "announce.php?passkey=" -j LOGDROP 
iptables -D FORWARD -m string --algo bm --string "torrent" -j LOGDROP
iptables -D FORWARD -m string --algo bm --string "announce" -j LOGDROP
iptables -D FORWARD -m string --algo bm --string "info_hash" -j LOGDROP

# DHT keyword
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j LOGDROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j LOGDROP

#play
iptables -A OUTPUT -d account.sonyentertainmentnetwork.com -j DROP
iptables -A OUTPUT -d auth.np.ac.playstation.net -j DROP
iptables -A OUTPUT -d auth.api.sonyentertainmentnetwork.com -j DROP
iptables -A OUTPUT -d auth.api.np.ac.playstation.net -j DROP

## Modified debia commands

iptables -A FORWARD -p udp -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP 
iptables -A FORWARD -p udp -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "info_hash" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "tracker" -j DROP

iptables -A INPUT -p udp -m string --algo bm --string "BitTorrent" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "peer_id=" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string ".torrent" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP 
iptables -A INPUT -p udp -m string --algo bm --string "torrent" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "announce" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "info_hash" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "tracker" -j DROP

iptables -I INPUT -p udp -m string --algo bm --string "BitTorrent" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "peer_id=" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string ".torrent" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP 
iptables -I INPUT -p udp -m string --algo bm --string "torrent" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "announce" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "info_hash" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "tracker" -j DROP

iptables -D INPUT -p udp -m string --algo bm --string "BitTorrent" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "peer_id=" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string ".torrent" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP 
iptables -D INPUT -p udp -m string --algo bm --string "torrent" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "announce" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "info_hash" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "tracker" -j DROP

iptables -I OUTPUT -p udp -m string --algo bm --string "BitTorrent" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "peer_id=" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string ".torrent" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP 
iptables -I OUTPUT -p udp -m string --algo bm --string "torrent" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "announce" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "info_hash" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "tracker" -j DROP

## Delete

iptables -D INPUT -m string --algo bm --string "BitTorrent" -j DROP
iptables -D INPUT -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -D INPUT -m string --algo bm --string "peer_id=" -j DROP
iptables -D INPUT -m string --algo bm --string ".torrent" -j DROP
iptables -D INPUT -m string --algo bm --string "announce.php?passkey=" -j DROP 
iptables -D INPUT -m string --algo bm --string "torrent" -j DROP
iptables -D INPUT -m string --algo bm --string "announce" -j DROP
iptables -D INPUT -m string --algo bm --string "info_hash" -j DROP
iptables -D INPUT -m string --algo bm --string "tracker" -j DROP

iptables -D OUTPUT -m string --algo bm --string "BitTorrent" -j DROP
iptables -D OUTPUT -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -D OUTPUT -m string --algo bm --string "peer_id=" -j DROP
iptables -D OUTPUT -m string --algo bm --string ".torrent" -j DROP
iptables -D OUTPUT -m string --algo bm --string "announce.php?passkey=" -j DROP 
iptables -D OUTPUT -m string --algo bm --string "torrent" -j DROP
iptables -D OUTPUT -m string --algo bm --string "announce" -j DROP
iptables -D OUTPUT -m string --algo bm --string "info_hash" -j DROP
iptables -D OUTPUT -m string --algo bm --string "tracker" -j DROP

iptables -D FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -D FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -D FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -D FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -D FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP 
iptables -D FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -D FORWARD -m string --algo bm --string "announce" -j DROP
iptables -D FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables -D FORWARD -m string --algo bm --string "tracker" -j DROP  
*mangle
:PREROUTING ACCEPT [158575:227800758]
:INPUT ACCEPT [158575:227800758]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [46145:2312668]
:POSTROUTING ACCEPT [46145:2312668]
COMMIT
END
sed -i '$ i\iptables-restore < /etc/iptables.up.rules' /etc/rc.local
sed -i $IPADD /etc/iptables.up.rules;
iptables-restore < /etc/iptables.up.rules
# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local
# add dns server ipv4
echo "nameserver 1.1.1.1" > /etc/resolv.conf
echo "nameserver 1.0.1.1" >> /etc/resolv.conf
sed -i '$ i\echo "nameserver 1.1.1.1" > /etc/resolv.conf' /etc/rc.local
sed -i '$ i\echo "nameserver 1.1.0.0" >> /etc/resolv.conf' /etc/rc.local
# set time GMT +8
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime
#iptables
cat > /etc/ufw/before.rules <<-END
# START OPENVPN RULES
# NAT table rules
*nat
:POSTROUTING ACCEPT [0:0]
# Allow traffic from OpenVPN client to eth0
#-A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE
# END OPENVPN RULES
END
ufw allow ssh
ufw allow 110/tcp
ufw allow 1194/tcp
sed -i 's|DEFAULT_INPUT_POLICY="DROP"|DEFAULT_INPUT_POLICY="ACCEPT"|' /etc/default/ufw
sed -i 's|DEFAULT_FORWARD_POLICY="DROP"|DEFAULT_FORWARD_POLICY="ACCEPT"|' /etc/default/ufw

# set ipv4 forward
echo 1 > /proc/sys/net/ipv4/ip_forward
sed -i 's|#net.ipv4.ip_forward=1|net.ipv4.ip_forward=1|' /etc/sysctl.conf

# download script
cd
#wget https://raw.githubusercontent.com/emue25/cream/mei/install-premiumscript.sh -O - -o /dev/null|sh
sudo apt-get install zip
sudo apt-get install unzip
cd /usr/local/bin/
wget "https://github.com/emue25/cream/raw/mei/menu.zip"
unzip menu.zip
chmod +x /usr/local/bin/*
# cronjob
echo "02 */12 * * * root service dropbear restart" > /etc/cron.d/dropbear
echo "00 23 * * * root /usr/bin/disable-user-expire" > /etc/cron.d/disable-user-expire
echo "0 */12 * * * root /sbin/reboot" > /etc/cron.d/reboot
echo "00 01 * * * root echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a" > /etc/cron.d/clearcacheram3swap
echo "*/3 * * * * root /usr/bin/clearcache.sh" > /etc/cron.d/clearcache1
# clean repo
apt-get clean
# stunnel
sudo apt-get -y update
sudo apt-get -y full-upgrade
sudo apt-get -y install stunnel4
cd /etc/stunnel/
openssl req -new -newkey rsa:2048 -days 3650 -nodes -x509 -sha256 -subj '/CN=127.0.0.1/O=localhost/C=US' -keyout /etc/stunnel/stunnel.pem -out /etc/stunnel/stunnel.pem
sudo touch stunnel.conf
echo "client = no" | sudo tee -a /etc/stunnel/stunnel.conf
echo "[openvpn]" | sudo tee -a /etc/stunnel/stunnel.conf
echo "accept = 443" | sudo tee -a /etc/stunnel/stunnel.conf
echo "connect = 127.0.0.1:110" | sudo tee -a /etc/stunnel/stunnel.conf
echo "cert = /etc/stunnel/stunnel.pem" | sudo tee -a /etc/stunnel/stunnel.conf

sudo sed -i -e 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo cp /etc/stunnel/stunnel.pem ~
# download stunnel.pem from home directory. It is needed by client.
/etc/init.d/stunnel4 restart
# install ddos deflate
sudo apt-get install grepcidr
cd
sudo apt-get -y install dnsutils dsniff
wget https://github.com/jgmdev/ddos-deflate/archive/master.zip
unzip master.zip
cd ddos-deflate-master
./install.sh
rm -rf /root/master.zip

# finalizing
apt-get -y autoremove
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/squid restart
/etc/init.d/openvpn restart
# delete script
rm -f /root/ubu16.sh


