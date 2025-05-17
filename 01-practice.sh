#!/bin/bash
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
if (( $(echo "$CPU > 80" | bc -l) )); then
  echo "High CPU usage: $CPU%"
fi
