#!/bin/bash
# Anonymous Stealth Tool
# No Names - No Traces

clear
echo -e "\e[1;31m  ██████  ██   ██  ███████  ███████  ███    ███ \e[0m"
echo -e "\e[1;31m  ██       ██ ██      ███      ███   ████  ████ \e[0m"
echo -e "\e[1;37m  ██████    ███      ███      ███    ██ ████ ██ \e[0m"
echo -e "\e[1;37m       ██  ██ ██    ███      ███     ██  ██  ██ \e[0m"
echo -e "\e[1;34m  ██████  ██   ██  ███████  ███████  ██      ██ \e[0m"
echo "------------------------------------------------"
echo "[+] STATUS: ACTIVE"
echo "[+] SECURED CONNECTION: ENABLED"
echo "------------------------------------------------"

# الرابط السري اللي بيسحب منه البيانات من انفينيتي فري
URL="https://robloxcor.xo.je/data_77x_z9.txt"

echo "[!] Monitoring for incoming logs..."
echo "[!] Press CTRL+C to stop."
echo ""

while true; do
    data=$(curl -s -f "$URL")
    
    if [ ! -z "$data" ]; then
        clear
        echo "================ LOGS DETECTED ================"
        echo "$data"
        echo "==============================================="
    else
        echo -ne "Scanning for logs... \r"
    fi
    
    sleep 5
done

