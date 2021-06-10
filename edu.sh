#!/bin/bash

# Getting Proxy Template
wget -q -O /usr/local/bin/edu-proxy https://raw.githubusercontent.com/emue25/cream/mei/proxy-templated.py
chmod +x /usr/local/bin/edu-proxy

# Installing Service
cat > /etc/systemd/system/edu-proxy.service << END
[Unit]
Description=Python Edu Proxy By mambo Service
Documentation=https://vpninjector.com
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/edu-proxy 80
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable edu-proxy
systemctl restart edu-proxy

clear
