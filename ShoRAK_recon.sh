#!/bin/bash

# Colors for aesthetics
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RED="\e[31m"
RESET="\e[0m"

# Banner
banner() {
    echo -e "${CYAN}"
    echo "░██████╗██╗░░██╗░█████╗░██████╗░░█████╗░██╗░░██╗"
    echo "██╔════╝██║░░██║██╔══██╗██╔══██╗██╔══██╗██║░██╔╝"
    echo "╚█████╗░███████║██║░░██║██████╔╝███████║█████═╝░"
    echo "░╚═══██╗██╔══██║██║░░██║██╔══██╗██╔══██║██╔═██╗░"
    echo "██████╔╝██║░░██║╚█████╔╝██║░░██║██║░░██║██║░╚██╗"
    echo "╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝"
    echo -e "${RESET}"
    echo -e "${YELLOW}Copyright (c) $(date +'%Y') Shadow Hacker. All rights reserved.${RESET}"
    echo -e "${YELLOW}Visit us at: https://www.shadowhackr.com${RESET}"
    echo -e "${CYAN}-----------------------------------------${RESET}"
}

# Metasploit exploit function
exploit_with_metasploit() {
    echo -e "${YELLOW}Launching Metasploit for exploit...${RESET}"
    msfconsole -q -x "use exploit/multi/http/your_exploit; set RHOST $1; set LHOST 0.0.0.0; exploit"
}

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}Please run the script as root!${RESET}"
    exit 1
fi

# Show the banner
banner

# Request user input for domain
echo -e "${YELLOW}Please enter the domain you want to scan:${RESET}"
echo -e "${GREEN}⟹  " && read -e DOMAIN

echo -e "${YELLOW}Starting recon and exploitation on: ${GREEN}$DOMAIN${RESET}"

# 1. Find subdomains using subfinder
echo -e "${GREEN}Running subfinder to find subdomains...${RESET}"
subfinder -d $DOMAIN -silent > subdomains.txt
echo -e "${YELLOW}Subdomains saved to subdomains.txt${RESET}"

# 2. Check for live subdomains using httpx
echo -e "${GREEN}Running httpx to check live subdomains...${RESET}"
cat subdomains.txt | httpx -silent > live_domains.txt
echo -e "${YELLOW}Live domains saved to live_domains.txt${RESET}"

# 3. Gather historical URLs with waybackurls
echo -e "${GREEN}Fetching historical URLs with waybackurls...${RESET}"
cat live_domains.txt | waybackurls > waybackurls.txt
echo -e "${YELLOW}Wayback URLs saved to waybackurls.txt${RESET}"

# 4. Extract JavaScript files with gau
echo -e "${GREEN}Extracting JavaScript files with gau...${RESET}"
cat live_domains.txt | gau > js_files.txt
echo -e "${YELLOW}JavaScript files saved to js_files.txt${RESET}"

# 5. Run directory brute-force using ffuf
echo -e "${GREEN}Running ffuf for directory brute-forcing...${RESET}"
ffuf -w /usr/local/share/ffuf_wordlist.txt -u http://$DOMAIN/FUZZ -mc 200 -o ffuf_results.txt
echo -e "${YELLOW}ffuf results saved to ffuf_results.txt${RESET}"

# 6. Run port scanning with naabu
echo -e "${GREEN}Running naabu for port scanning...${RESET}"
naabu -host $DOMAIN -o naabu_results.txt
echo -e "${YELLOW}Naabu scan results saved to naabu_results.txt${RESET}"

# 7. Run Nmap for detailed port scanning
echo -e "${GREEN}Running nmap for detailed port scanning...${RESET}"
nmap -p- $DOMAIN -oN nmap_scan.txt
echo -e "${YELLOW}Nmap scan results saved to nmap_scan.txt${RESET}"

# 8. Run vulnerability scan with nuclei
echo -e "${GREEN}Running nuclei to scan for vulnerabilities...${RESET}"
nuclei -l live_domains.txt -o nuclei_results.txt
echo -e "${YELLOW}Nuclei scan results saved to nuclei_results.txt${RESET}"

# 9. Exploit identified vulnerabilities with Metasploit
if grep -q "high" nuclei_results.txt; then
    echo -e "${RED}High severity vulnerability found! Attempting to exploit...${RESET}"
    exploit_with_metasploit $DOMAIN
fi

# 10. Run Sn1per for further automated scanning
echo -e "${GREEN}Running Sn1per for further recon...${RESET}"
sniper -t $DOMAIN -o sniper_results.txt
echo -e "${YELLOW}Sn1per results saved to sniper_results.txt${RESET}"


# 11. Run Osmedeus for automated recon and exploitation
echo -e "${GREEN}Running Osmedeus for automated recon...${RESET}"
osmedeus -t $DOMAIN -o osmedeus_results/
echo -e "${YELLOW}Osmedeus results saved to osmedeus_results directory${RESET}"

# 12. Use SQLMap for SQL injection testing
echo -e "${GREEN}Running SQLMap for SQL injection testing...${RESET}"
sqlmap -u http://$DOMAIN --batch --output-dir=sqlmap_results/
echo -e "${YELLOW}SQLMap results saved to sqlmap_results directory${RESET}"

# 13. Run Gobuster for directory and file brute-forcing
echo -e "${GREEN}Running Gobuster for brute-forcing...${RESET}"
gobuster dir -u http://$DOMAIN -w /usr/local/share/ffuf_wordlist.txt -o gobuster_results.txt
echo -e "${YELLOW}Gobuster results saved to gobuster_results.txt${RESET}"

echo -e "${CYAN}Recon and exploitation process completed.${RESET}"
