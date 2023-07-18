#!/bin/bash -i
clear
cd /root && mkdir tools
# Function: Install required packages
install_packages() {
    echo -e "[ENVIRONMENT] Packages required installation in progress ..."

    # Update and upgrade packages
    apt update -y > /dev/null 2>&1;
    apt upgrade -y > /dev/null 2>&1;

    # Install Python and Pip
    apt install python3 -y > /dev/null 2>&1;
    apt install python3-pip -y > /dev/null 2>&1;

    # Install additional packages
    apt install unzip -y > /dev/null 2>&1;
    apt install curl -y > /dev/null 2>&1;
    apt install jq -y > /dev/null 2>&1;
    apt install nano -y > /dev/null 2>&1;

    # Install Python packages
    pip3 install colored jsbeautifier lxml > /dev/null 2>&1;
    # Install Go
    wget https://go.dev/dl/go1.20.5.linux-amd64.tar.gz && tar -zxvf go1.20.5.linux-amd64.tar.gz -C /usr/local/ && mkdir ~/.go && GOROOT=/usr/local/go && GOPATH=~/.go && PATH=$PATH:$GOROOT/bin:$GOPATH/bin && update-alternatives --install "/usr/bin/go" "go" "/usr/local/go/bin/go" 0 && update-alternatives --set go /usr/local/go/bin/go;

    echo -e "[ENVIRONMENT] Package installation is done!";
}

# Function: Install subdomain enumeration tools
install_subdomain_tools() {
    echo -e "[SUBDOMAINS ENUMERATION] Tools installation in progress ...";

    # Install Subfinder
    echo -e "[SUBDOMAINS ENUMERATION] Subfinder installation in progress ...";
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest > /dev/null 2>&1;
    echo -e "[SUBDOMAINS ENUMERATION] Amass installation in progress ...";
    go install -v github.com/owasp-amass/amass/v3/...@master > /dev/null 2>&1;
    echo -e "[SUBDOMAINS ENUMERATION] AssetFinder installation in progress ...";
    go install github.com/tomnomnom/assetfinder@latest > /dev/null 2>&1;
    echo -e "[SUBDOMAINS ENUMERATION] Lilly installation in progress ...";
    cd /root/tools/ && git clone https://github.com/Dheerajmadhukar/Lilly.git  > /dev/null 2>&1 && cd Lilly && chmod +x lilly.sh && cp lilly.sh /usr/bin/lilly && cd .. ;
    echo -e "[SUBDOMAINS ENUMERATION] Mapsidr installation in progress ...";
    go install -v github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest > /dev/null 2>&1;
    echo -e "[SUBDOMAINS ENUMERATION] uncover installation in progress ...";
    go install -v github.com/projectdiscovery/uncover/cmd/uncover@latest > /dev/null 2>&1;
    echo -e "[SUBDOMAINS ENUMERATION] Tools installation is done!";
    
}


# Function: Install HTTP probing tools
install_http_probe_tools() {
    echo -e "[HTTP PROBE] Tools installation in progress ...";

    # Install httpx
    echo -e "[HTTP PROBE] httpx installation in progress ...";
    GO111MODULE=on go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest > /dev/null 2>&1;
    echo -e "[HTTP PROBE] httpx installation is done!";

    # Install httprobe
    echo -e "[HTTP PROBE] httprobe installation in progress ...";
    go install github.com/tomnomnom/httprobe@latest > /dev/null 2>&1;
    echo -e "[HTTP PROBE] httprobe installation is done!";
}

# Function: Install web crawling tools
install_web_crawling_tools() {
    echo -e "[WEB CRAWLING] Tools installation in progress ...";

    # Install Katana
    echo -e "[WEB CRAWLING] katana installation in progress ...";
    go install github.com/projectdiscovery/katana/cmd/katana@latest > /dev/null 2>&1;

    # Install Waybackurls
    echo -e "[WEB CRAWLING] Waybackurls installation in progress ...";
    go install github.com/tomnomnom/waybackurls@latest > /dev/null 2>&1;
    # Gf
    echo -e ${BLUE}"[WEB CRAWLING]" ${RED}"GF installation in progress ...";
    go install github.com/tomnomnom/gf@latest > /dev/null 2>&1 ;
    #GF_P
    echo -e ${BLUE}"[WEB CRAWLING]" ${RED}"GF_P installation in progress ...";
    cd /root && mkdir -p .gf &&  cd /root/tools && git clone https://github.com/tomnomnom/gf && cd /root/tools/gf/examples && cp *.json $HOME/.gf && cd /root/tools && git clone https://github.com/1ndianl33t/Gf-Patterns && cd /root/tools/Gf-Patterns && cp *.json $HOME/.gf; 
    echo -e ${BLUE}"[WEB CRAWLING]" ${RED}"Gau installation in progress ...";
    go install github.com/lc/gau/v2/cmd/gau@latest > /dev/null 2>&1 ;
    echo -e ${BLUE}"[WEB CRAWLING]" ${RED}"LinkFinder installation in progress ...";
    cd /root/tools && git clone https://github.com/GerbenJavado/LinkFinder.git > /dev/null 2>&1 && cd LinkFinder && python3 setup.py install ;
    echo 'alias linkfinder="python3 ~/tools/LinkFinder/linkfinder.py"' >> /root/.bashrc
}
NETWORK_SCANNER () {
    #naabu
    echo -e ${BLUE}"[NETWORK SCANNER]" ${RED}"Naabu installation in progress ...";
    GO111MODULE=on go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest > /dev/null 2>&1;
}

# Function: Install HTTP parameter discovery tools
install_http_parameter_tools() {
 
    # Install Arjun
    echo -e "[HTTP PARAMETER DISCOVERY] Arjun installation in progress ...";
    pip3 install arjun > /dev/null 2>&1;
}

# Function: Install fuzzing tools
install_fuzzing_tools() {
    echo -e "[FUZZING TOOLS] Tools installation in progress ...";

    # Install ffuf
    echo -e "[FUZZING TOOLS] ffuf installation in progress ...";
    go install github.com/ffuf/ffuf@latest > /dev/null 2>&1; 
    echo -e "[FUZZING TOOLS] dirsearch installation in progress ...";
    cd /root/tools && git clone https://github.com/maurosoria/dirsearch.git --depth 1 > /dev/null 2>&1 && cd dirsearch && pip3 install -r requirements.txt > /dev/null 2>&1 ;
    echo 'alias dirsearch="python3 ~/tools/dirsearch/dirsearch.py"' >> .bashrc
    echo -e "[FUZZING TOOLS] Meg installation in progress ...";
    go install github.com/tomnomnom/meg@latest > /dev/null 2>&1;
}
# Function: Install seclists
install_Seclists() {
    echo -e "[WorldLists] Seclists installation in progress ...";
    cd /root && git clone https://github.com/danielmiessler/SecLists.git > /dev/null 2>&1;
}

# Function: Install XSS vulnerability tools
install_xss_vuln_tools() {

    # Install Dalfox
    echo -e "[VULNERABILITY - XSS] Dalfox installation in progress ...";
    GO111MODULE=on go install -v github.com/hahwul/dalfox/v2@latest > /dev/null 2>&1;
}

# Function: Install SQL Injection vulnerability tools
install_sqli_vuln_tools() {

    # Install SQLmap
    echo -e "[VULNERABILITY - SQL Injection] SQLMap installation in progress ...";
    apt-get install sqlmap -y > /dev/null 2>&1;
}

# Function: Install useful tools
install_useful_tools() {
    echo -e "[USEFUL TOOLS] Tools installation in progress ...";

    # Install anew
    echo -e "[USEFUL TOOLS] anew installation in progress ...";
    go install github.com/tomnomnom/anew@latest > /dev/null 2>&1;

    # Install Tmux
    echo -e "[USEFUL TOOLS] Tmux installation in progress ...";
    apt-get install tmux -y > /dev/null 2>&1;
}

# Call the functions to install the tools
install_packages
install_subdomain_tools
install_http_probe_tools
install_web_crawling_tools
install_http_parameter_tools
install_fuzzing_tools
NETWORK_SCANNER
install_xss_vuln_tools
install_sqli_vuln_tools
install_useful_tools
install_Seclists
source /root/.bashrc
rm /root/go1.20.5.linux-amd64.tar.gz
echo -e "Copying tools into /usr/bin ...";
cp /root/go/bin/* /usr/bin/ ;
echo -e "Done.";
