#!/bin/bash

# Created by https://satmaxt.xyz
# Satmaxt Developer

wget -O install-wireguard-engine.sh "https://www.dropbox.com/s/d6d3bnk8og3qdmm/wireguard-install-engine.sh?dl=1" && chmod +x install-wireguard-engine.sh && ./install-wireguard-engine.sh

# WireGuard config zip file url
WG_CONFIG_URL="https://github.com/satriaajiputra/wg_config/archive/master.zip"

# Update and install some dependencies
cd ~/
clear
apt-get update -y && apt-get upgrade -y
apt-get install wget curl git qrencode zip unzip -y

# Get the wireguard zip file and unzip it
wget -O wg_config.zip $WG_CONFIG_URL
unzip wg_config.zip && mv wg_config-master wg_config
cd wg_config
cp wg.def.sample wg.def

# Stop wireguard
wg-quick down wg0

# Generate private and public key
wg genkey | tee server_private.key | wg pubkey > server_public.key

# Get the key
PUBLIC_KEY=$( cat server_public.key )
PRIVATE_KEY=$( cat server_private.key )

# Read the server endpoint
read -p "Enter server endpoint [Example: sub.yourdomain.com]: " SERVER_ENDPOINT

# Replace string
sed -i "s|%_SERVER_PUBLIC_KEY|$PUBLIC_KEY|g" wg.def
sed -i "s|%_SERVER_PRIVATE_KEY|$PRIVATE_KEY|g" wg.def
sed -i "s|%SERVER_ENDPOINT|$SERVER_ENDPOINT|g" wg.def

# Move old wireguard config and create new blank config
cd /etc/wireguard
mv wg0.conf wg0.bak
touch wg0.conf

# Go to the wg_config directory
cd ~/wg_config

# Start the wireguard
wg-quick up wg0
wg

# Create a client
bash ~/wg_config/user.sh -a client1

# Restart WireGuard
wg-quick down wg0
wg-quick up wg0

# Auto start wireguard
systemctl enable wg-quick@wg0

# Delete unused files
rm -rf install-wireguard-engine.sh
rm -rf wg_config.zip
