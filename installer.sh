#!/bin/bash

# Colors for aesthetics
YELLOW="\e[33m"
GREEN="\e[32m"
RESET="\e[0m"

# Wordlist URL for ffuf
FFUF_WORDLIST_URL="https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/common.txt"
FFUF_WORDLIST="/usr/local/share/ffuf_wordlist.txt"

# Tool installation function
install_tools() {
    echo -e "${YELLOW}Installing required tools...${RESET}"

    # Install subfinder
    echo -e "${GREEN}Installing subfinder...${RESET}"
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    sudo cp ~/go/bin/subfinder /usr/local/bin/

    # Install httpx
    echo -e "${GREEN}Installing httpx...${RESET}"
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    sudo cp ~/go/bin/httpx /usr/local/bin/

    # Install nuclei
    echo -e "${GREEN}Installing nuclei...${RESET}"
    go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
    sudo cp ~/go/bin/nuclei /usr/local/bin/

    # Install waybackurls
    echo -e "${GREEN}Installing waybackurls...${RESET}"
    go install -v github.com/tomnomnom/waybackurls@latest
    sudo cp ~/go/bin/waybackurls /usr/local/bin/

    # Install gau
    echo -e "${GREEN}Installing gau...${RESET}"
    go install -v github.com/lc/gau@latest
    sudo cp ~/go/bin/gau /usr/local/bin/

    # Install naabu
    echo -e "${GREEN}Installing naabu...${RESET}"
    go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
    sudo cp ~/go/bin/naabu /usr/local/bin/

    # Install ffuf
    echo -e "${GREEN}Installing ffuf...${RESET}"
    go install github.com/ffuf/ffuf@latest
    sudo cp ~/go/bin/ffuf /usr/local/bin/

    # Install nmap
    echo -e "${GREEN}Installing nmap...${RESET}"
    sudo apt-get install -y nmap

    # Install metasploit
    echo -e "${GREEN}Installing Metasploit...${RESET}"
    curl https://raw.githubusercontent.com/rapid7/metasploit-framework/master/msfupdate | sudo bash

    # Install gobuster
    echo -e "${GREEN}Installing Gobuster...${RESET}"
    go install github.com/OJ/gobuster/v3@latest
    sudo cp ~/go/bin/gobuster /usr/local/bin/

    # Install sqlmap
    echo -e "${GREEN}Installing sqlmap...${RESET}"
    sudo apt-get install -y sqlmap

    # Install Sn1per
    echo -e "${GREEN}Installing Sn1per...${RESET}"
    git clone https://github.com/1N3/Sn1per /opt/Sn1per
    sudo ln -s /opt/Sn1per/sniper /usr/local/bin/sniper

    # Install Burp Suite
    echo -e "${GREEN}Installing Burp Suite...${RESET}"
    sudo apt-get install -y burpsuite

    # Install Osmedeus
    echo -e "${GREEN}Installing Osmedeus...${RESET}"
    git clone https://github.com/j3ssie/Osmedeus /opt/Osmedeus
    sudo ln -s /opt/Osmedeus/osmedeus /usr/local/bin/osmedeus

    # Install dnsenum
    echo -e "${GREEN}Installing dnsenum...${RESET}"
    sudo apt-get install -y dnsenum

    echo -e "${GREEN}All tools installed successfully!${RESET}"
}

# Download ffuf wordlist
download_ffuf_wordlist() {
    echo -e "${YELLOW}Downloading ffuf wordlist...${RESET}"
    if [ ! -d "/usr/local/share" ]; then
        sudo mkdir -p /usr/local/share
    fi
    curl -o $FFUF_WORDLIST $FFUF_WORDLIST_URL
    echo -e "${YELLOW}Wordlist downloaded as $FFUF_WORDLIST${RESET}"
}

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}Please run the script as root!${RESET}"
    exit 1
fi

# Install tools
install_tools
download_ffuf_wordlist

echo -e "${GREEN}Tool installation completed!${RESET}"
