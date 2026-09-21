# Cybersecurity Monitoring Lab

A practical cybersecurity monitoring environment developed during my final Cybersecurity internship project.

The project focused on implementing a centralized security monitoring architecture using **Wazuh**, **Suricata** and **MISP**, combining SIEM, Network Intrusion Detection and Cyber Threat Intelligence capabilities.

## 🎯 Project Objectives

- Centralize security events and alerts
- Monitor network traffic for suspicious activity
- Detect potential attacks and network scans
- Reduce false positives and unnecessary alerts
- Integrate threat intelligence capabilities
- Improve visibility over the monitored infrastructure

## 🏗️ Architecture

The environment was deployed using **Proxmox** virtualization and Linux-based systems.

Main components:

- **Wazuh** — SIEM, log analysis and security monitoring
- **Suricata** — Network Intrusion Detection System (NIDS)
- **MISP** — Cyber Threat Intelligence platform
- **Proxmox** — Virtualization infrastructure
- **Linux / Ubuntu Server** — Server environment
- **Network Port Mirroring** — Traffic visibility for Suricata

> A sanitized architecture diagram will be added to this repository.

## 🔐 Wazuh

Wazuh was used as the central security monitoring platform.

Work performed included:

- Deployment and configuration of Wazuh components
- Integration of Suricata alerts
- Security event analysis
- Custom detection and correlation rules
- Alert noise reduction
- Index retention management

## 🦈 Suricata

Suricata was deployed as a Network Intrusion Detection System.

The implementation included:

- Network traffic monitoring
- Emerging Threats rules
- `HOME_NET` configuration
- Analysis of `eve.json` events
- Detection testing using controlled Nmap scans
- Rule tuning and false-positive reduction

Examples of noisy traffic identified during analysis included:

- STUN / WebRTC
- Spotify P2P
- Discord traffic
- SSDP
- Package-management traffic

## 🧠 Threat Intelligence

**MISP** was deployed to introduce Cyber Threat Intelligence capabilities into the monitoring environment.

The environment included:

- MISP deployment and configuration
- MariaDB
- Redis
- Apache
- Python MISP/STIX libraries
- Preparation for IOC-based security monitoring

## 🔎 Detection Engineering

A custom Wazuh correlation rule was developed to identify repeated network scan activity.

The rule correlated multiple Suricata events originating from the same source within a defined time window.

This demonstrated how raw NIDS events could be transformed into higher-level security alerts.

## 🧪 Testing

The environment was tested using controlled network activity, including Nmap SYN scans.

Testing was used to:

1. Generate network security events
2. Verify Suricata detection
3. Confirm event ingestion into Wazuh
4. Analyze generated alerts
5. Tune detection rules and reduce noise

## 🛠️ Technologies

`Wazuh` `Suricata` `MISP` `Proxmox` `Linux` `Ubuntu` `SIEM` `NIDS` `CTI` `Networking`

## 📚 What I Learned

This project provided practical experience with:

- SIEM architecture
- Network intrusion detection
- Security event analysis
- Detection engineering
- False-positive management
- Linux server administration
- Virtualized infrastructure
- Cyber Threat Intelligence
- Troubleshooting and technical documentation

## 🚧 Repository Status

This repository is currently being expanded with sanitized documentation, architecture diagrams, detection examples and configuration samples.

> Sensitive information related to the original infrastructure has been removed or generalized.
