#!/bin/bash
# ==========================================
# System Health Check Script
# Author: V. Sriram
# ==========================================

LOGFILE="healthlog_$(date +'%Y-%m-%d_%H-%M-%S').txt"

exec > >(tee -a "$LOGFILE") 2>&1

echo "==================== SYSTEM HEALTH CHECK ===================="
echo "Date and Time: $(date)"
echo "--------------------------------------------------------------"

echo "System Uptime:"
uptime
echo "--------------------------------------------------------------"

echo "CPU Load (from uptime):"
uptime | awk -F'load average:' '{ print $2 }'
echo "--------------------------------------------------------------"

echo "Memory Usage (MB):"
free -m
echo "--------------------------------------------------------------"

echo "Disk Usage:"
df -h
echo "--------------------------------------------------------------"

echo "Top 5 Memory-Consuming Processes:"
ps aux --sort=-%mem | head -n 6
echo "--------------------------------------------------------------"

SERVICES=("nginx" "ssh" "docker")

echo "Service Status Check:"
for service in "${SERVICES[@]}"
do
  if systemctl is-active --quiet "$service"; then
    echo "$service: ✅ Running"
  else
    echo "$service: ❌ Not running"
  fi
done

echo "--------------------------------------------------------------"
echo "Log saved to: $LOGFILE"
echo "==================== END OF REPORT ==========================="
