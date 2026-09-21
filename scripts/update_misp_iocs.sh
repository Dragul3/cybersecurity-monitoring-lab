#!/bin/bash

set -euo pipefail

# Load protected environment variables
source /opt/misp-suricata/.env

WORKDIR="/opt/misp-suricata"
DATASET="/etc/suricata/datasets/misp_ipdst_iocs.txt"
IPREP="/etc/suricata/iprep/reputation.list"
TMP_IPS="$WORKDIR/misp_ipdst_iocs.tmp"
LOG="$WORKDIR/update.log"

echo "[$(date)] Starting MISP IOC update" >> "$LOG"

curl -sk \
  -H "Authorization: $MISP_KEY" \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -X POST "$MISP_URL/attributes/restSearch" \
  -d '{"returnFormat":"json","type":"ip-dst","to_ids":1,"limit":1000}' \
| jq -r '.response.Attribute[].value' \
| grep -E '^([0-9]{1,3}\.){3}[0-9]{1,3}$' \
| sort -u > "$TMP_IPS"

COUNT=$(wc -l < "$TMP_IPS")

if [ "$COUNT" -lt 1 ]; then
  echo "[$(date)] ERROR: No IOCs received" >> "$LOG"
  exit 1
fi

cp "$TMP_IPS" "$DATASET"

awk '{print $1",1,100"}' "$TMP_IPS" > "$IPREP"

suricata -T -c /etc/suricata/suricata.yaml >> "$LOG" 2>&1

systemctl restart suricata

echo "[$(date)] Updated $COUNT IOCs and restarted Suricata" >> "$LOG"
