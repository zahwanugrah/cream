#!/bin/bash
cd /etc/pam.d

cp common-password common-password.bak

sed -i '0,/^[^#]*requisite/s/^[^#]*requisite/#&/' common-password
sed -i 's/use_authtok//' common-password

exit;