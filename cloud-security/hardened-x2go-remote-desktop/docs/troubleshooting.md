# 🚨 Troubleshooting Guide

## X2Go Black Screen

Problem:
- Connection works but screen is black

Solution:

```bash
echo "startxfce4" > /home/<username>/.xsession
chown <username>:<username> /home/<username>/.xsession

```
## SSH Access Denied

Problem:

Permission denied (publickey)

Cause:

SSH keys not configured

Solution:

```bash
mkdir -p /home/<username>/.ssh
nano /home/<username>/.ssh/authorized_keys
chmod 700 /home/<username>/.ssh
chmod 600 /home/<username>/.ssh/authorized_keys
chown -R <username>:<username> /home/<username>/.ssh
```

## Fail2Ban Not Working

Problem:

No IP bans

Solution:

```bash
sudo nano /etc/fail2ban/jail.local
```

Ensure:

```bash
port = ssh,2222
```

Then:

```bash
sudo systemctl restart fail2ban
```

## SSH Blocked by Firewall

Problem:

Cannot connect after enabling UFW

Solution:

```bash
sudo ufw allow 2222/tcp
sudo ufw enable
```

## Lessons Learned

Always test configurations step by step
Never disable access without backup
Security must be validated, not assumed


