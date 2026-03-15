🇬🇧 **English** | 🇪🇸 [Español](README.md)

# 📡 WPA2 Handshake Capture – Wireless Security Lab

![Field](https://img.shields.io/badge/Field-Wireless%20Security-blue)
![Encryption](https://img.shields.io/badge/Encryption-WPA2-orange)
![Platform](https://img.shields.io/badge/Platform-Kali%20Linux-black)
![Tool](https://img.shields.io/badge/Tool-Aircrack--ng-red)
![Tool](https://img.shields.io/badge/Tool-Fern%20Wifi%20Cracker-green)
![Status](https://img.shields.io/badge/Status-Lab%20Completed-success)

---

## Overview

This lab demonstrates how a **WPA2 handshake can be captured from a wireless network** and later used to perform a **dictionary attack** to recover the network password.

The experiment was conducted in a **controlled lab environment** using a test wireless network specifically created for security practice.

The goal of this lab is to understand:

- How WPA2 authentication works
- How attackers capture authentication handshakes
- How dictionary attacks attempt to recover passwords
- Why strong passwords are critical for wireless security

---

## ⚠️ Ethical Notice

This project was conducted **strictly for educational purposes** in a controlled lab environment.

All tests were performed on a **personal test network** created for cybersecurity learning.

These techniques must **only be used on networks that you own or where you have explicit permission to perform security testing**.

Unauthorized access to wireless networks may be illegal and can lead to serious legal consequences.

---

## Lab Environment

### Operating System

Kali Linux

### Wireless Adapter

Chipset: Qualcomm Atheros AR9271  
Driver: ath9k_htc  
Capabilities:

- Monitor Mode
- Packet Injection

---

## Target Network

The wireless network used during the lab was configured as follows:

SSID: HACKEAME  
Encryption: WPA2-PSK  
Password: admin123  

---

## Tools Used

- Aircrack-ng
- Airodump-ng
- Aireplay-ng
- Fern Wifi Cracker
- iwconfig

---

## Attack Methodology

### 1 — Verify wireless adapter

```bash
iwconfig
```

---

### 2 — Check adapter compatibility

```bash
sudo airmon-ng
```

---

### 3 — Stop interfering processes

```bash
sudo airmon-ng check kill
```

---

### 4 — Enable monitor mode

```bash
sudo airmon-ng start wlan0
```

Monitor interface created:

```
wlan0mon
```

---

### 5 — Scan wireless networks

```bash
sudo airodump-ng wlan0mon
```

Important field:

```
ENC → WPA2
```

This confirms the network is protected using WPA2.

---

### 6 — Test packet injection

```bash
sudo aireplay-ng --test wlan0mon
```

---

### 7 — Launch Fern Wifi Cracker

```bash
sudo fern-wifi-cracker
```

Steps inside the tool:

1. Scan available access points
2. Select the target network
3. Capture WPA handshake
4. Launch dictionary attack

Dictionary used:

```
/usr/share/fern-wifi-cracker/extras/wordlists/common.txt
```

---

## Result

The dictionary attack successfully recovered the password:

```
admin123
```

This confirms that:

- The WPA2 handshake was captured successfully
- The password existed inside the dictionary

---

## Screenshots

Example evidence included in this repository:

- Network scan
- WPA2 verification
- Handshake capture
- Dictionary attack process
- Password discovery

---

## Lessons Learned

Key takeaways from this lab:

- WPA2 security depends heavily on password strength
- Weak passwords are vulnerable to dictionary attacks
- Capturing the handshake alone does not reveal the password
- Offline attacks are required to attempt password recovery

---

## Skills Demonstrated

Wireless Security Testing  
WPA/WPA2 Authentication Analysis  
Linux Networking Tools  
Packet Injection Testing  
Dictionary Attack Methodology

---

## Author

Fred Castillo  
Information Security Technology Student  
Red Team Aspirant