#!/bin/bash

LOG="/var/log/misp-active-response.log"

read INPUT_JSON

DST_IP=$(echo "$INPUT_JSON" \
  | grep -oP '"dest_ip":"\K[^"]+|"dstip":"\K[^"]+' \
  | head -1)

if [[ -z "$DST_IP" ]]; then
  echo "$(date) MISP AR ERROR: no destination IP found raw=$INPUT_JSON" >> "$LOG"
  exit 1
fi

if iptables -C OUTPUT -d "$DST_IP" -j DROP 2>/dev/null; then
  echo "$(date) MISP AR BLOCKED: $DST_IP already blocked via iptables OUTPUT" >> "$LOG"
  exit 0
fi

iptables -I OUTPUT -d "$DST_IP" -j DROP

echo "$(date) MISP AR BLOCKED: $DST_IP blocked via iptables OUTPUT" >> "$LOG"

exit 0
