#!/bin/bash
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.0f\n", 100 - $8}')
if [ "$CPU" -gt 80 ]; then
  echo "High CPU usage: $CPU%"
fi
