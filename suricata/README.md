# Suricata Network Monitoring

This directory documents the use of Suricata as the Network Intrusion Detection System (NIDS) in the cybersecurity monitoring environment.

## Role in the Project

Suricata was responsible for inspecting mirrored network traffic and generating security events that were later analyzed by Wazuh.

## Main Tasks

- Network traffic inspection
- Intrusion detection
- Emerging Threats rule usage
- `HOME_NET` configuration
- Security event generation
- `eve.json` analysis
- Detection testing with controlled Nmap scans
- False-positive identification and reduction

## Event Flow

```text
Network Traffic
      |
      v
   Suricata
      |
      v
   eve.json
      |
      v
     Wazuh
```

## Detection Testing

Controlled Nmap SYN scans were used to generate network activity and validate the detection pipeline.

The testing process allowed the verification of:

1. Network visibility
2. Suricata alert generation
3. Event logging in `eve.json`
4. Wazuh ingestion
5. Alert analysis and correlation

## False Positives and Noise Reduction

During monitoring, several sources of legitimate but noisy traffic were identified, including:

- STUN / WebRTC
- Spotify P2P traffic
- Discord traffic
- SSDP
- Package-management traffic

Rules and suppressions were adjusted to reduce unnecessary alerts while maintaining visibility over relevant security events.

## Security Note

Configuration examples published in this repository are sanitized and do not include infrastructure-specific or sensitive information.
