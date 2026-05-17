#!/bin/bash

REPORT=/var/log/docker-report.txt

echo "===== $(date) =====" >> $REPORT

echo "CPU/RAM" >> $REPORT
docker stats --no-stream >> $REPORT

echo "Disk Usage" >> $REPORT
df -h >> $REPORT

echo "Container Status" >> $REPORT
docker ps -a >> $REPORT