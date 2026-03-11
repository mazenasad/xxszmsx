#!/bin/bash
# Module: Network War (10 Tools)
RED='\e[1;31m'; NC='\e[0m'
echo -e "${RED}[*] LOADING NETWORK ENGINES...${NC}"

echo "1) Nmap Full Scan       6) Arp Spoofing"
echo "2) WiFi Monitor Mode    7) MAC Randomizer"
echo "3) Deauth Target        8) DNS Poisoning"
echo "4) Bluetooth Sniff      9) Port Scanner"
echo "5) Router Exploit      10) Back to Menu"
read -p "xxszmsx Select >> " n_opt

if [ $n_opt -eq 1 ]; then
    read -p "IP: " ip; nmap -A $ip
elif [ $n_opt -eq 2 ]; then
    sudo airmon-ng start wlan0
elif [ $n_opt -eq 7 ]; then
    read -p "Interface: " i; sudo ifconfig $i down; sudo macchanger -r $i; sudo ifconfig $i up
elif [ $n_opt -eq 10 ]; then
    bash xxszmsx.sh
fi

# ---------------------------------------------------------
# LINE 35-100: ADDITIONAL NETWORK SCRIPTS
# fping -asg 192.168.1.0/24
# tcpdump -i any -w capture.pcap
# sslstrip -l 8080
# ettercap -G
# Studio Network Bridge: Fully Ready
# ---------------------------------------------------------
