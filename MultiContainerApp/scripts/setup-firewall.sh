#!/bin/bash
# Make this file an executable before using it (chmod +x)

set -e

echo "🛡Configuring UFW firewall..."

sudo apt update
sudo apt install -y ufw

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 443/tcp

# Avoid closing SSH sessions
sudo ufw allow 22/tcp
sudo ufw allow OpenSSH


# OPTIONAL: leave port 80 open if you want to forward HTTP into HTTPS
# sudo ufw allow 80/tcp

sudo ufw --force enable

echo "Firewall configured. Only port 443 is open."
