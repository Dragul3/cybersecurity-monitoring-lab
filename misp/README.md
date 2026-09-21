# MISP Threat Intelligence Integration

This directory documents the use of MISP as the Cyber Threat Intelligence (CTI) platform in the cybersecurity monitoring environment.

## Role in the Project

MISP was used as a centralized source of Indicators of Compromise (IOCs).

Public threat intelligence feeds were enabled and the collected indicators were exported through the MISP API for use by Suricata.

## CTI Feeds

Several public threat intelligence feeds were configured, including sources related to:

- Malicious IP addresses
- Phishing
- Botnets
- Command and Control infrastructure
- Reputation data

## IOC Automation

A script named `update_misp_iocs.sh` was developed to automate the IOC update process.

The workflow was:

```text
MISP
  |
  v
REST API
  |
  v
Extract ip-dst IOCs
  |
  v
misp_ipdst_iocs.txt
  |
  v
reputation.list
  |
  v
Suricata
```

The script performed the following tasks:

1. Load configuration variables from a `.env` file
2. Query the MISP REST API
3. Extract valid `ip-dst` indicators
4. Update the local IOC dataset
5. Generate the Suricata `reputation.list`
6. Validate the Suricata configuration
7. Restart Suricata when required

## Automatic Updates

The IOC synchronization process was scheduled to run automatically every hour using cron.

This allowed Suricata to periodically receive updated threat intelligence without requiring manual intervention.

## MISP to Suricata Integration

Indicators exported from MISP were converted into the format required by Suricata's IP Reputation system.

When network traffic matched an IOC present in the reputation dataset, Suricata generated an alert that could then be processed and correlated by Wazuh.

## Security Note

API keys, internal addresses and infrastructure-specific information from the original environment are not included in this repository.

Configuration examples and scripts published here are sanitized versions intended for documentation and portfolio purposes.
