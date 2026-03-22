#!/bin/bash

# ==========================================
# hardened-x2go-remote-desktop | setup.sh
# ==========================================
# Description:
# Automated setup for a secure remote desktop
# environment using X2Go + XFCE on Ubuntu.
# ==========================================

set -e

echo "[+] Updating system..."
sudo apt update && sudo apt upgrade -y

echo "[+] Installing XFCE desktop environment..."
sudo apt install xfce4 xfce4-goodies -y

echo "[+] Installing X2Go server..."
sudo apt install x2goserver x2goserver-xsession -y

echo "[+] Installing security tools..."
sudo apt install ufw fail2ban -y

# ==========================================
# Create user
# ==========================================

read -p "[?] Enter new username: " USERNAME

echo "[+] Creating user: $USERNAME"
sudo adduser --disabled-password --gecos "" $USERNAME

echo "[?] Set password for $USERNAME"
sudo passwd $USERNAME

sudo usermod -aG sudo $USERNAME

# ==========================================
# Configure XFCE session
# ==========================================

echo "[+] Configuring XFCE session..."

echo "startxfce4" | sudo tee /home/$USERNAME/.xsession > /dev/null
sudo chown $USERNAME:$USERNAME /home/$USERNAME/.xsession

# ==========================================
# Enable services
# ==========================================

echo "[+] Enabling services..."

sudo systemctl enable ssh
sudo systemctl enable x2goserver
sudo systemctl enable fail2ban

echo "[+] Setup completed successfully!"
