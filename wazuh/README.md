# Wazuh Detection Rules

This directory contains sanitized examples of custom Wazuh detection rules developed during the cybersecurity monitoring project.

## Network Scan Correlation Rule

The `custom-rules.xml` file contains a rule designed to identify repeated network scan activity based on Suricata events.

The rule:

- Monitors events belonging to the `suricata` group
- Correlates multiple events from the same source IP
- Uses a threshold of 5 events within 60 seconds
- Raises a higher-level alert when the threshold is reached
- Maps the activity to MITRE ATT&CK technique `T1595` — Active Scanning

## Detection Logic

```text
Suricata Events
      |
      v
Same Source IP
      |
      v
5 Events / 60 Seconds
      |
      v
Wazuh Correlation Rule
      |
      v
Network Scan Alert
```

## Security Note

This repository contains sanitized examples only.

Infrastructure-specific information, internal IP addresses, hostnames and other sensitive data from the original environment have been omitted.
