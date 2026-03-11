#!/bin/bash
# Studio Installer & Cleaner
RED='\e[1;31m'; GREEN='\e[1;32m'; NC='\e[0m'

echo -e "${RED}[*] جاري تنظيف النظام وتثبيت الأدوات اللازمة...${NC}"
# مسح أي نسخ قديمة
sudo rm -rf /usr/local/bin/studio
# تثبيت المتطلبات للأدوات الـ 15
sudo apt update && sudo apt install nmap msfpc curl php python3 hydra sqlmap -y

# عمل الاختصار للملف الفعال
chmod +x xxszmsx.sh
sudo ln -sf "$(pwd)/xxszmsx.sh" /usr/local/bin/studio
echo -e "${GREEN}[+] تم التفعيل! اكتب 'studio' في الترمينال لتشغيل الأداة.${NC}"

