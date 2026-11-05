#!/bin/bash
# This script displays system information. 
echo "System Information"
echo ""
# This part displays the information related to the operating sytem. 
echo "Operating System:"
cat /etc/os-release
echo ""
# This part displays information related to the Memory.
echo "Memory:"
free -m
echo ""
# This part displays information related to the disk usage. 
echo "Disk Usage:" 
df -h
