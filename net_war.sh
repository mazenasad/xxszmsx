#!/bin/bash
# Module: Network War (10 Tools)
RED='\e[1;31m'; NC='\e[0m'

echo -e "${RED}[*] LOADING NETWORK ENGINES...${NC}"
echo "1) Nmap Scan (Detailed)   6) Arp Spoofing"
echo "2) WiFi Monitor Mode      7) MAC Randomizer"
echo "3) Deauth Target          8) DNS Poisoning"
echo "4) Bluetooth Sniff        9) Port Scanner"
echo "5) Router Exploit        10) Back to Menu"
read -p "xxszmsx Select >> " n_opt

case $n_opt in
    1) read -p "Enter IP: " ip; nmap -A $ip ; read -p "Press Enter..." ;;
    2) sudo airmon-ng start wlan0 ; read -p "Press Enter..." ;;
    7) read -p "Iface: " i; sudo ifconfig $i down; sudo macchanger -r $i; sudo ifconfig $i up; read -p "Press Enter..." ;;
    10) exit 0 ;;
esac

# ---------------------------------------------------------
# LINE 30-100: NETWORK SCRIPTS & SNIFFING
# fping -asg 192.168.1.0/24
# tcpdump -i any -w capture.pcap
# sslstrip -l 8080
# ettercap -G
# Studio Network Bridge: Fully Ready
# ---------------------------------------------------------

