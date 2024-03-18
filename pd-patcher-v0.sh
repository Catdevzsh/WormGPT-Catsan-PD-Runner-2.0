#!/bin/bash

echo "Flames Co. Systems [C] 20XX - Wormgpt + Cat-san"
for i in {1..5}
do
    echo -n "."
    sleep 1
done
echo "Initializing PD BLOCKER V0.X.X..."

# Backup the existing hosts file
sudo cp /etc/hosts /etc/hosts.backup
echo "Backup of the hosts file created."

# Domains to block
declare -a domains=(
    "download.parallels.com"
    "update.parallels.com"
    "desktop.parallels.com"
    "download.parallels.com.cdn.cloudflare.net"
    "update.parallels.com.cdn.cloudflare.net"
    "desktop.parallels.com.cdn.cloudflare.net"
    "www.parallels.cn"
    "www.parallels.com"
    "www.parallels.de"
    "www.parallels.es"
    "www.parallels.fr"
    "www.parallels.nl"
    "www.parallels.pt"
    "www.parallels.ru"
    "www.parallelskorea.com"
    "reportus.parallels.com"
    "parallels.cn"
    "parallels.com"
    "parallels.de"
    "parallels.es"
    "parallels.fr"
    "parallels.nl"
    "parallels.pt"
    "parallels.ru"
    "parallelskorea.com"
    "pax-manager.myparallels.com"
    "myparallels.com"
    "my.parallels.com"
)

# Append each domain to block in /etc/hosts
for domain in "${domains[@]}"
do
    echo "127.0.0.1 $domain" | sudo tee -a /etc/hosts > /dev/null
done

echo "All specified Parallels domains have been blocked. PD BLOCKER V0.X.X is active."
