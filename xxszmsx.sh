#!/bin/bash
# xxszmsx RED-DRAGON v15.0 | MAIN CORE
RED='\e[1;31m'; NC='\e[0m'
clear
echo -e "${RED}"
echo "██╗  ██╗██╗  ██╗███████╗███████╗███    ███╗██╗  ██╗"
echo "╚██╗██╔╝╚██╗██╔╝██╔════╝██╔════╝████  ████║╚██╗██╔╝"
echo " ╚███╔╝  ╚███╔╝ ███████╗███████╗██╔████╔██║ ╚███╔╝ "
echo " ██╔██╗  ██╔██╗ ╚════██║╚════██║██║╚██╔╝██║ ██╔██╗ "
echo "██╔╝ ██╗██╔╝ ██╗███████║███████║██║ ╚═╝ ██║██╔╝ ██╗"
echo "╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝"
echo "-----------------------------------------------------"
echo "   [!] 5 POWERFUL MODULES LOADED | READY BY MAZEN [!]"
echo "-----------------------------------------------------"
echo -e "1) Network & WiFi Exploit    3) Android & Mobile Hack"
echo "2) Virus & FUD Creator      4) Web & Phishing Logs"
echo "5) System Installer         0) Exit Framework"
echo "-----------------------------------------------------"
read -p "xxszmsx >> " choice

case $choice in
    1) bash net_wifi.sh ;;
    2) bash virus_gen.sh ;;
    3) bash mobile_hack.sh ;;
    4) bash web_phish.sh ;;
    5) bash installer.sh ;;
    0) exit ;;
    *) echo "Invalid option!" ;;
esac

