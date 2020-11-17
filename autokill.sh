#!/bin/bash
# auto kill multi login tiap 5 detik

cd /usr/bin
wget -O tendang "http://evira.us/tendang.sh"
chmod +x tendang

cd

echo "* * * * * root /usr/bin/tendang" >> /etc/crontab
echo "* * * * * root sleep 5; /usr/bin/tendang" >> /etc/crontab
echo "* * * * * root sleep 10; /usr/bin/tendang" >> /etc/crontab
echo "* * * * * root sleep 15; /usr/bin/tendang" >> /etc/crontab
echo "* * * * * root sleep 20; /usr/bin/tendang" >> /etc/crontab
echo "* * * * * root sleep 25; /usr/bin/tendang" >> /etc/crontab
echo "* * * * * root sleep 30; /usr/bin/tendang" >> /etc/crontab
echo "* * * * * root sleep 35; /usr/bin/tendang" >> /etc/crontab
echo "* * * * * root sleep 40; /usr/bin/tendang" >> /etc/crontab
echo "* * * * * root sleep 45; /usr/bin/tendang" >> /etc/crontab
echo "* * * * * root sleep 50; /usr/bin/tendang" >> /etc/crontab
echo "* * * * * root sleep 55; /usr/bin/tendang" >> /etc/crontab

service cron restart
