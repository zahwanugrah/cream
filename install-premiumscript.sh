#!/bin/bash
# Created by http://vpnstunnel.com
# Modified by DENBAGUSS

cd

#echo "0 0 * * * root /usr/bin/disable-user-expire" > /etc/cron.d/user-expire
# echo "0 0 * * * root /usr/local/bin/user-expire-pptp" > /etc/cron.d/user-expire-pptp




# download script
cd
wget -O /usr/bin/benchmark "https://raw.githubusercontent.com/emue25/cream/mei/benchmark.sh" | lolcat
wget -O /usr/bin/speedtest "https://raw.githubusercontent.com/emue25/VPSauto/master/speedtest_cli.py" | lolcat
wget -O /usr/bin/ps-mem "https://raw.githubusercontent.com/emue25/cream/mei/ps_mem.py" | lolcat
wget -O /usr/bin/dropmon "https://raw.githubusercontent.com/emue25/cream/mei/dropmon.sh" | lolcat
wget -O /usr/bin/menu "https://raw.githubusercontent.com/emue25/cream/mei/menu.sh" | lolcat
wget -O /usr/bin/user-active-list "https://raw.githubusercontent.com/emue25/cream/mei/user-active-list.sh" | lolcat
wget -O /usr/bin/user-add "https://raw.githubusercontent.com/emue25/cream/mei/user-add.sh" | lolcat
wget -O /usr/bin/user-add-pptp "https://raw.githubusercontent.com/emue25/cream/mei/user-add-pptp.sh" | lolcat
wget -O /usr/bin/user-del "https://raw.githubusercontent.com/emue25/cream/mei/user-del.sh" | lolcat
wget -O /usr/bin/disable-user-expire "https://raw.githubusercontent.com/emue25/cream/mei/disable-user-expire.sh" | lolcat
wget -O /usr/bin/delete-user-expire "https://raw.githubusercontent.com/emue25/cream/mei/delete-user-expire.sh" | lolcat
wget -O /usr/bin/banned-user "https://raw.githubusercontent.com/emue25/cream/mei/banned-user.sh" | lolcat
wget -O /usr/bin/unbanned-user "https://raw.githubusercontent.com/emue25/cream/mei/unbanned-user.sh" | lolcat
wget -O /usr/bin/user-expire-list "https://raw.githubusercontent.com/emue25/cream/mei/user-expire-list.sh" | lolcat
wget -O /usr/bin/user-gen "https://raw.githubusercontent.com/emue25/cream/mei/user-gen.sh" | lolcat
wget -O /usr/bin/userlimit.sh "https://raw.githubusercontent.com/emue25/cream/mei/userlimit.sh" | lolcat
#wget -O /usr/bin/userlimitssh.sh "https://raw.githubusercontent.com/brantbell/cream/mei/userlimitssh.sh"
wget -O /usr/bin/user-list "https://raw.githubusercontent.com/emue25/cream/mei/user-list.sh" | lolcat
wget -O /usr/bin/user-login "https://raw.githubusercontent.com/emue25/cream/mei/user-login.sh" | lolcat
wget -O /usr/bin/user-pass "https://raw.githubusercontent.com/emue25/cream/mei/user-pass.sh" | lolcat
wget -O /usr/bin/user-renew "https://raw.githubusercontent.com/emue25/cream/mei/user-renew.sh" | lolcat
wget -O /usr/bin/clearcache.sh "https://raw.githubusercontent.com/emue25/cream/mei/clearcache.sh" | lolcat
wget -O /usr/bin/bannermenu "https://raw.githubusercontent.com/emue25/cream/mei/bannermenu" | lolcat
wget -O /usr/bin/menu-update-script-vps.sh "https://raw.githubusercontent.com/emue25/cream/mei/menu-update-script-vps.sh" | lolcat
wget -O /usr/bin/vpnmon "https://raw.githubusercontent.com/emue25/cream/mei/vpnmon" | lolcat

wget -O /usr/bin/edit-port-openssh "https://raw.githubusercontent.com/emue25/cream/mei/edit-port-openssh" | lolcat
wget -O /usr/bin/edit-port-openvpn "https://raw.githubusercontent.com/emue25/cream/mei/edit-port-openvpn" | lolcat
wget -O /usr/bin/edit-port-squid "https://raw.githubusercontent.com/emue25/cream/mei/edit-port-squid" | lolcat
wget -O /usr/bin/edit-port-dropbear "https://raw.githubusercontent.com/emue25/cream/mei/edit-port-dropbear" | lolcat


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



chmod +x /usr/bin/edit-port-openssh
chmod +x /usr/bin/edit-port-openvpn
chmod +x /usr/bin/edit-port-squid
chmod +x /usr/bin/edit-port-dropbear


clear
cd
echo " "
echo " "
echo "Premium Script Successfully Installed!"
echo "Restarting all services..."
echo "Wait for a few minutes..."
echo "Modified by denbaguss"
echo "Create by https://vpnstunnel.com"
