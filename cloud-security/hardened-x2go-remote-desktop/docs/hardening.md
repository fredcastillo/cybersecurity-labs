# 🔐 Security Hardening Guide

## Overview

This document explains the security configurations applied in this project to secure remote access.

---

## SSH Hardening

File:

/etc/ssh/sshd_config


Settings applied:

- Root login disabled
- Password authentication disabled
- Custom SSH port (2222)
- Limited authentication attempts

Why?

- Prevents brute-force attacks
- Reduces unauthorized access
- Minimizes attack surface

---

## Firewall (UFW)

Configuration:

- Default: deny all incoming traffic
- Allow only:
  - Port 22 (X2Go)
  - Port 2222 (SSH)

Why?

- Blocks unnecessary access
- Only exposes required services

---

## Fail2Ban

Purpose:

- Detects repeated failed login attempts
- Automatically blocks malicious IPs

Configuration:

- Max retries: 3
- Ban time: 1 hour

Why?

- Protects against brute-force attacks
- Adds automated defense layer

---

## Result

- Secure SSH access
- Reduced attack surface
- Protection against automated attacks
