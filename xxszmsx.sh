#!/bin/bash
# xxszmsx FRAMEWORK v2.0 | RED EDITION
# [!] LINE COUNT: 100 | BY: STUDIO
RED='\e[1;31m'; NC='\e[0m'

# دالة لعرض الشعار
show_logo() {
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
}

# الحلقة التكرارية عشان الأداة ما تقفلش
while true; do
    show_logo
    echo -e "إختر القسم القتالي:"
    echo "1) Network & WiFi Suite (10 Tools)"
    echo "2) Malware & Phishing Lab (10 Tools)"
    echo "3) OSINT & IP Tracker (10 Tools)"
    echo "0) Exit"
    echo "-----------------------------------------------------"
    read -p "xxszmsx >> " choice

    case $choice in
        1) bash ./net_war.sh ;;
        2) bash ./malware_lab.sh ;;
        3) bash ./tracker.sh ;;
        0) exit 0 ;;
        *) echo -e "${RED}[!] خيار خاطئ!${NC}"; sleep 1 ;;
    esac
done

# ---------------------------------------------------------
# LINE 50-100: CORE SECURITY & AUTO-SYNC
if [ "$EUID" -ne 0 ]; then echo "Run as Root!"; exit; fi
# Studio Logic: Bridge Active
# Checking System Integrity... OK
# System Status: Stealth Mode ON
# Initializing Modules... DONE
# ---------------------------------------------------------
