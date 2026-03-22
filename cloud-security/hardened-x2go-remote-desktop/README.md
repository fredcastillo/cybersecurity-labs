🇪🇸 **Español** | 🇬🇧 [English](README-EN.md)

# 🛡️ Secure Remote Access Lab: Hardened Linux Server with X2Go

![Linux](https://img.shields.io/badge/Linux-Ubuntu%2022.04-E95420?style=for-the-badge&logo=ubuntu)
![X2Go](https://img.shields.io/badge/Remote%20Access-X2Go-0088cc?style=for-the-badge)
![Security](https://img.shields.io/badge/Security-Hardening-ff0000?style=for-the-badge)
![SSH](https://img.shields.io/badge/Protocol-SSH-000000?style=for-the-badge)
![Firewall](https://img.shields.io/badge/Firewall-UFW-87cefa?style=for-the-badge)
![Fail2Ban](https://img.shields.io/badge/Intrusion%20Prevention-Fail2Ban-ffcc00?style=for-the-badge)

---

## Quick Demo

✔ Secure SSH access (key-based authentication)  
✔ Remote desktop via X2Go (XFCE)  
✔ Hardened Linux server  
✔ Firewall (UFW) + Intrusion prevention (Fail2Ban)  

---

## 📖 Descripción General

Este proyecto documenta el despliegue de un servidor Linux en la nube (DigitalOcean) con acceso remoto gráfico mediante X2Go, aplicando **hardening de seguridad desde el inicio**.

El enfoque principal no fue solo instalar servicios, sino construir un sistema remoto **funcional, seguro y defendido**, simulando un entorno real.

---

## Objetivos del Proyecto

- Desplegar servidor Ubuntu en la nube  
- Configurar acceso remoto seguro (SSH + X2Go)  
- Implementar escritorio ligero (XFCE)  
- Aplicar hardening de seguridad  
- Documentar problemas reales y soluciones  

---

## 👤 Competencias Demostradas

- Linux system administration  
- Secure remote access (SSH)  
- Firewall management (UFW)  
- Intrusion prevention (Fail2Ban)  
- Cloud infrastructure handling  
- Troubleshooting en entornos reales  

---

## Arquitectura del Sistema
[ Client (PC) ]
↓
Internet
↓
[ UFW Firewall ]
↓
[ SSH Server (2222) ]
↓
[ X2Go Server (22) ]
↓
[ XFCE Desktop ]

---

## 🖥️ Evidencia

### 🔹 Conexión X2Go
![X2Go](screenshots/x2go-connected.png)

### 🔹 Escritorio remoto
![Desktop](screenshots/desktop.png)

---

## 🔐 Security Hardening (Resumen)

- Root login deshabilitado  
- Autenticación por clave SSH  
- Cambio de puerto SSH (2222)  
- Firewall configurado (UFW)  
- Protección contra fuerza bruta (Fail2Ban)  

Configuración completa disponible en `/docs`

---

## 🚨 Troubleshooting (Resumen)

| Problema | Solución |
|---------|---------|
| Pantalla negra en X2Go | Configurar `.xsession` con `startxfce4` |
| SSH denied | Configurar correctamente claves SSH |
| Fail2Ban no bloquea | Ajustar puertos en `jail.local` |

Guía completa en `/docs/troubleshooting.md`

---

## 📂 Estructura del Proyecto

hardened-x2go-remote-desktop/
├── README.md
├── README-EN.md
├── scripts/
├── configs/
├── screenshots/
└── docs/

## Conclusión

Este proyecto demuestra que desplegar servicios en la nube implica más que instalación: requiere aplicar controles de seguridad desde el inicio.

Se implementaron prácticas reales de hardening para reducir la superficie de ataque y mejorar la resiliencia del sistema.

---

## Mejoras Futuras

- Automatización con Bash / Ansible  
- Integración con SIEM  
- Implementación de VPN  
- Monitoreo del sistema  

---

## 👨‍💻 Autor

**Fred Castillo**  
**Estudiante de tecnologo en Seguridad Informática**  
*Aspirante a Red Team | Seguridad Ofensiva*

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Fred%20Castillo-0077B5?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/fredcastillo11/)
[![GitHub](https://img.shields.io/badge/GitHub-fredcastillo-100000?style=for-the-badge&logo=github)](https://github.com/fredcastillo)
