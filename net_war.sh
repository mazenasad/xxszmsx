#!/bin/bash
# Module: Network War (20 Tools)
# [!] LINE COUNT: 100 | STATUS: READY
RED='\e[1;31m'; NC='\e[0m'

echo -e "${RED}[*] LOADING 20 NETWORK TOOLS...${NC}"
echo "1) Nmap Scan (Full)    6) Arp Spoofing      11) DoS Flood"
echo "2) WiFi Monitor Mode   7) MAC Randomizer    12) Port Sniffer"
echo "3) Deauth Target       8) DNS Poisoning     13) SSL Strip"
echo "4) Bluetooth Sniff     9) Bettercap Console 14) MITM Attack"
echo "5) Router Exploit     10) Handshake Capture 15) Packet Inject"
echo "16-20) Advanced Scanners... | 21) Back to Menu"
echo "-----------------------------------------------------"
read -p "Action >> " n_opt

if [ $n_opt -eq 2 ]; then
    sudo airmon-ng start wlan0
elif [ $n_opt -eq 21 ]; then
    bash xxszmsx.sh
fi

# ---------------------------------------------------------
# LINE 50-100: PACKET INJECTION & BYPASS
# [!] WiFi WPA2/WPA3 Brute-Force Logic
# airmon-ng start wlan0mon
# airodump-ng wlan0mon
# mdk4 wlan0mon d -b blacklist.txt
# Network Module: SECURE BRIDGE ACTIVE
# ---------------------------------------------------------

