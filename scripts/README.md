# Automation Scripts

This directory documents the automation scripts developed during the cybersecurity monitoring project.

The scripts were used to automate Cyber Threat Intelligence updates, IOC-based response and IP reputation enrichment.

## Scripts

### `update_misp_iocs.sh`

Automates the synchronization of Indicators of Compromise (IOCs) between MISP and Suricata.

Main tasks:

- Load configuration variables from a `.env` file
- Query the MISP REST API
- Extract `ip-dst` indicators
- Update the IOC dataset
- Generate Suricata's `reputation.list`
- Validate the Suricata configuration
- Restart Suricata when required

The synchronization process was scheduled to run automatically every hour using cron.

### `misp_ioc_block.sh`

Used by Wazuh Active Response when an IOC detected by Suricata matched threat intelligence imported from MISP.

The script:

1. Receives the IOC-related alert
2. Extracts the destination IP
3. Applies a local `iptables` DROP rule
4. Produces evidence that the response was executed

The blocking mechanism was implemented as a local proof of concept on the Suricata IDS virtual machine.

It was not intended to operate as a perimeter firewall for the entire network.

### `abuseipdb_check.sh`

Used to enrich observed IP addresses with reputation information from AbuseIPDB.

The script retrieves information such as:

- Abuse confidence score
- Number of reports
- Country
- ISP
- Domain information
- Tor usage

The results were written to a log file monitored by Wazuh, allowing enriched events to be displayed and correlated through custom detection rules.

## Automation Flow

```text
MISP
  |
  v
update_misp_iocs.sh
  |
  v
Suricata Reputation Dataset
  |
  v
IOC Detection
  |
  v
Wazuh
  |
  v
misp_ioc_block.sh
  |
  v
Local iptables Response
```

AbuseIPDB enrichment operated as a complementary flow:

```text
Observed IP
   |
   v
abuseipdb_check.sh
   |
   v
AbuseIPDB API
   |
   v
Enrichment Log
   |
   v
Wazuh
```

## Security Note

The original scripts used protected configuration values such as API keys.

Secrets, credentials, internal addresses and environment-specific information are not included in this repository.

Any scripts published here are sanitized versions intended for documentation and portfolio purposes.
