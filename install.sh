#!/bin/bash
# Studio Activator - Clean & Setup
RED='\e[1;31m'; GREEN='\e[1;32m'; NC='\e[0m'

echo -e "${RED}[*] جاري تنظيف النظام وتثبيت المحركات الأساسية...${NC}"
# مسح الاختصار القديم والمجلد لو موجود
sudo rm -f /usr/local/bin/studio
# تثبيت الأدوات اللي الأداة هتحتاجها فعلياً
sudo apt update && sudo apt install nmap msfpc curl python3 macchanger -y

# تفعيل الأداة
chmod +x xxszmsx.sh
sudo ln -sf "$(pwd)/xxszmsx.sh" /usr/local/bin/studio
echo -e "${GREEN}[+] تم التفعيل بنجاح! الآن اكتب كلمة studio لفتح أقوى 10 أدوات.${NC}"
