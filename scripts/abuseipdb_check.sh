#!/bin/bash

set -euo pipefail

# Load protected API key
source /opt/wazuh-integrations/.env

IP="$1"
LOG="/var/log/abuseipdb-enrichment.log"

RESULT=$(curl -sG https://api.abuseipdb.com/api/v2/check \
  --data-urlencode "ipAddress=$IP" \
  -d maxAgeInDays=90 \
  -H "Key: $ABUSEIPDB_API_KEY" \
  -H "Accept: application/json")

LINE=$(echo "$RESULT" | jq -r '
.data |
"ABUSEIPDB enrichment ip=\(.ipAddress) score=\(.abuseConfidenceScore) reports=\(.totalReports) country=\(.countryCode) isp=\"\(.isp)\" domain=\"\(.domain)\" tor=\(.isTor)"
')

echo "$(date) $LINE" | tee -a "$LOG"
