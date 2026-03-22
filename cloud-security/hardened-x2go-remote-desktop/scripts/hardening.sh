#!/bin/bash

# ==========================================
# hardened-x2go-remote-desktop | hardening.sh
# ==========================================
# Description:
# Applies security hardening to SSH, firewall,
# and intrusion prevention (Fail2Ban)
# ==========================================

set -e

echo "[+] Starting system hardening..."

# ==========================================
# SSH HARDENING
# ==========================================

echo "[+] Hardening SSH configuration..."

SSH_CONFIG="/etc/ssh/sshd_config"

sudo cp $SSH_CONFIG ${SSH_CONFIG}.bak

# Apply secure settings
sudo sed -i 's/^#*PermitRootLogin.*/PermitRootLogin no/' $SSH_CONFIG
sudo sed -i 's/^#*PasswordAuthentication.*/PasswordAuthentication no/' $SSH_CONFIG
sudo sed -i 's/^#*PermitEmptyPasswords.*/PermitEmptyPasswords no/' $SSH_CONFIG
sudo sed -i 's/^#*MaxAuthTries.*/MaxAuthTries 3/' $SSH_CONFIG
sudo sed -i 's/^#*MaxSessions.*/MaxSessions 2/' $SSH_CONFIG

# Change SSH port (optional but recommended)
echo "[+] Changing SSH port to 2222..."
sudo sed -i 's/^#*Port.*/Port 2222/' $SSH_CONFIG

# Restart SSH
echo "[+] Restarting SSH service..."
sudo systemctl restart ssh

# ==========================================
# FIREWALL (UFW)
# ==========================================

echo "[+] Configuring UFW firewall..."

sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow required ports
sudo ufw allow 2222/tcp comment 'SSH Hardened'
sudo ufw allow 22/tcp comment 'X2Go Remote Desktop'

# Enable firewall
sudo ufw --force enable

# ==========================================
# FAIL2BAN
# ==========================================

echo "[+] Configuring Fail2Ban..."

JAIL_LOCAL="/etc/fail2ban/jail.local"

sudo cp /etc/fail2ban/jail.conf $JAIL_LOCAL

# Configure SSH protection
sudo sed -i '/^\[sshd\]/,/^\[/ s/enabled = .*/enabled = true/' $JAIL_LOCAL
sudo sed -i '/^\[sshd\]/,/^\[/ s/port = .*/port = ssh,2222/' $JAIL_LOCAL
sudo sed -i '/^\[sshd\]/,/^\[/ s/maxretry = .*/maxretry = 3/' $JAIL_LOCAL
sudo sed -i '/^\[sshd\]/,/^\[/ s/bantime = .*/bantime = 3600/' $JAIL_LOCAL

# Restart Fail2Ban
sudo systemctl restart fail2ban

# ==========================================
# FINAL STATUS
# ==========================================

echo "[+] Hardening completed successfully!"
echo "[+] Verifying services..."

sudo systemctl status ssh --no-pager
sudo systemctl status fail2ban --no-pager
sudo ufw status verbose
