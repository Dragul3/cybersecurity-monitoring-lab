# Architecture

## Overview

The cybersecurity monitoring environment was designed to provide centralized visibility over network activity and security events.

The infrastructure combined:

- **Suricata** — Network Intrusion Detection System (NIDS)
- **Wazuh** — Security monitoring, analysis and event correlation
- **MISP** — Cyber Threat Intelligence
- **Proxmox** — Virtualization infrastructure

## Network Architecture

Network traffic was made available to Suricata through switch port mirroring.

```text
Monitored Network
       │
       ▼
     Switch
  (Port Mirror)
       │
       ▼
    Suricata
     (NIDS)
       │
       │ eve.json
       ▼
      Wazuh
 (SIEM / Analysis)
       │
       ▼
 Wazuh Dashboard


      MISP
(Threat Intelligence)

Infrastructure hosted using Proxmox
```

## Data Flow

1. Network traffic passes through the monitored network.
2. The switch mirrors network traffic to Suricata.
3. Suricata analyzes the traffic for suspicious activity.
4. Suricata generates events in `eve.json`.
5. Wazuh collects and analyzes these events.
6. Detection and correlation rules process the events.
7. Security alerts are displayed in the Wazuh Dashboard.

## Main Components

### Suricata

Suricata was responsible for network traffic analysis and intrusion detection using detection rules including Emerging Threats rules.

### Wazuh

Wazuh was used for centralized security monitoring, event analysis, correlation and alert visualization.

### MISP

MISP was deployed as the Cyber Threat Intelligence platform for managing threat intelligence and Indicators of Compromise (IOCs).

### Proxmox

Proxmox provided the virtualization infrastructure used to host the security environment.

---

> **Security Note:** IP addresses, hostnames and other sensitive information from the original infrastructure have been intentionally omitted or generalized.
