#!/bin/bash

# Function to block Parallels domains
block_parallels_domains() {
    # Backup the existing hosts file
    sudo cp /etc/hosts /etc/hosts.backup
    echo "Backup of the hosts file created."

    # Additional domains that might be used for update notifications
    declare -a update_domains=(
        "update.parallels.com"
        "download.parallels.com"
        "license.parallels.com"
        "registration.parallels.com"
        "update.parallels.com.cdn.cloudflare.net"
        "download.parallels.com.cdn.cloudflare.net"
    )

    # Combine all domains to block
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

    domains+=("${update_domains[@]}")

    # Append each domain to block in /etc/hosts
    for domain in "${domains[@]}"
    do
        echo "127.0.0.1 $domain" | sudo tee -a /etc/hosts > /dev/null
    done

    echo "All specified Parallels domains have been blocked, including update checks."
}

# Function to monitor Parallels launch and execute block
monitor_parallels_launch() {
    # Monitor for Parallels process and execute block when detected
    while true; do
        if pgrep -x "Parallels" > /dev/null; then
            echo "Parallels launched. Executing block."
            block_parallels_domains
            sleep 600  # Check every 10 minutes to reduce resource usage.
        else
            sleep 60  # Check every minute if Parallels is not running.
        fi
    done
}

# Main function
main() {
    echo "Flames Co. Systems [C] 20XX - Wormgpt + Cat-san"
    for i in {1..5}
    do
        echo -n "."
        sleep 1
    done
    echo "Initializing PD BLOCKER V0.X.X..."

    # Monitor and block Parallels on launch
    monitor_parallels_launch &

    echo "PD BLOCKER V0.X.X is active and monitoring Parallels."
}

# Call the main function
main
