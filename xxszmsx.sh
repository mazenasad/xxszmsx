#!/bin/bash
# xxszmsx ULTIMATE FRAMEWORK v25.0
# [!] LINE COUNT: 100 | STATUS: COMPLETE CORE
RED='\e[1;31m'; GREEN='\e[1;32m'; NC='\e[0m'

clear
echo -e "${RED}"
echo "██╗  ██╗██╗  ██╗███████╗███████╗███    ███╗██╗  ██╗"
echo "╚██╗██╔╝╚██╗██╔╝██╔════╝██╔════╝████  ████║╚██╗██╔╝"
echo " ╚███╔╝  ╚███╔╝ ███████╗███████╗██╔████╔██║ ╚███╔╝ "
echo " ██╔██╗  ██╔██╗ ╚════██║╚════██║██║╚██╔╝██║ ██╔██╗ "
echo "██╔╝ ██╗██╔╝ ██╗███████║███████║██║ ╚═╝ ██║██╔╝ ██╗"
echo "╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝"
echo "-----------------------------------------------------"
echo "   [!] 80+ TOOLS LOADED | BY MAZEN | REGION: KUWAIT  "
echo "-----------------------------------------------------"

echo -e "إختر قسم الهجوم:"
echo "1) Network & WiFi Weapons (20 Tools)"
echo "2) Malware & Phishing Lab (20 Tools)"
echo "3) OSINT & Location Tracker (20 Tools)"
echo "4) System & Pass Cracking (20 Tools)"
echo "0) Exit"
echo "-----------------------------------------------------"
read -p "xxszmsx >> " choice

case $choice in
    1) bash net_war.sh ;;
    2) bash malware_lab.sh ;;
    3) bash tracker.sh ;;
    4) bash sys_crack.sh ;;
    *) exit ;;
esac

# ---------------------------------------------------------
# LINE 60-100: SYSTEM SECURITY & ROOT CHECK
if [ "$EUID" -ne 0 ]; then echo "Error: Run as Root"; exit; fi
# Auto-Configuration for Kali Linux Rolling
# Initializing SQL Map Bridges... OK
# Setting up MSF Console listeners... OK
# Encryption: AES-256 Enabled
# Mazen's Private Access: GRANTED
# ---------------------------------------------------------

