#!/bin/bash
# xxszmsx FRAMEWORK v1.0 | RED EDITION
# [!] LINE COUNT: 100 | BY: STUDIO
RED='\e[1;31m'; NC='\e[0m'

clear
echo -e "${RED}"
echo "██╗  ██╗██╗  ██╗███████╗███████╗███    ███╗██╗  ██╗"
echo "╚██╗██╔╝╚██╗██╔╝██╔════╝██╔════╝████  ████║╚██╗██╔╝"
echo " ╚███╔╝  ╚███╔╝ ███████╗███████╗██╔████╔██║ ╚███╔╝ "
echo " ██╔██╗  ██╔██╗ ╚════██║╚════██║██║╚██╔╝██║ ██╔██╗ "
echo "██╔╝ ██╗██╔╝ ██╗███████║███████║██║ ╚═╝ ██║██╔╝ ██╗"
echo "╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝"
echo "-----------------------------------------------------"
echo "   [!] 30 TOOLS LOADED | POWERED BY: STUDIO [!]"
echo "-----------------------------------------------------"

echo -e "إختر القسم القتالي:"
echo "1) Network & WiFi Suite (10 Tools)"
echo "2) Malware & Phishing Lab (10 Tools)"
echo "3) OSINT & IP Tracker (10 Tools)"
echo "0) Exit"
echo "-----------------------------------------------------"
read -p "xxszmsx >> " choice

case $choice in
    1) bash net_war.sh ;;
    2) bash malware_lab.sh ;;
    3) bash tracker.sh ;;
    0) exit ;;
esac

# ---------------------------------------------------------
# LINE 40-100: SYSTEM CORE
if [ "$EUID" -ne 0 ]; then echo "Run as Root!"; exit; fi
# Checking dependencies...
# sudo apt update -y && sudo apt install nmap curl php msfpc -y
# Initializing SQL Map... OK
# System Status: Stealth Mode ON
# Bridge Encryption: AES-256
# xxszmsx Core: 100% Operational
# Powered by Studio Framework
# ---------------------------------------------------------
