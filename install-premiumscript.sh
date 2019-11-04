#!/bin/bash
# Created by http://vpnstunnel.com
# Modified by DENBAGUSS

cd

#echo "0 0 * * * root /usr/bin/disable-user-expire" > /etc/cron.d/user-expire
# echo "0 0 * * * root /usr/local/bin/user-expire-pptp" > /etc/cron.d/user-expire-pptp




# download script
cd
wget -O /usr/bin/benchmark "https://raw.githubusercontent.com/brantbell/cream/mei/benchmark.sh"
wget -O /usr/bin/speedtest "https://raw.githubusercontent.com/emue25/VPSauto/master/speedtest_cli.py"
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
wget -O /usr/bin/menu-update-script-vps.sh "https://raw.githubusercontent.com/emue25/cream/mei/menu-update-script-vps.sh"
wget -O /usr/bin/vpnmon "https://raw.githubusercontent.com/brantbell/cream/mei/vpnmon"

wget -O /usr/bin/edit-port-openssh "https://raw.githubusercontent.com/brantbell/cream/mei/edit-port-openssh"
wget -O /usr/bin/edit-port-openvpn "https://raw.githubusercontent.com/brantbell/cream/mei/edit-port-openvpn"
wget -O /usr/bin/edit-port-squid "https://raw.githubusercontent.com/brantbell/cream/mei/edit-port-squid"
wget -O /usr/bin/edit-port-dropbear "https://raw.githubusercontent.com/brantbell/cream/mei/edit-port-dropbear"


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
echo "Modified by DENBAGUSS"
echo "Create by https://vpnstunnel.com"
