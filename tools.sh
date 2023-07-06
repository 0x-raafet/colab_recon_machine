#!/bin/bash -i
# Clear the terminal
clear

# Function: Install required packages
install_packages() {
    echo -e "[ENVIRONMENT] Packages required installation in progress ..."

    # Update and upgrade packages
    apt-get update -y
    apt-get upgrade -y

    # Install Python and Pip
    apt-get install python python2 python3 python-pip python3-pip -y

    # Install additional packages
    apt-get install unzip curl snap jq -y

    # Install Python packages
    pip3 install colored jsbeautifier lxml

    echo -e "[ENVIRONMENT] Package installation is done!"
}

# Function: Install subdomain enumeration tools
install_subdomain_tools() {
    echo -e "[SUBDOMAINS ENUMERATION] Tools installation in progress ..."

    # Install Golang
    echo -e "[SUBDOMAINS ENUMERATION] Golang installation in progress ..."
    wget https://go.dev/dl/go1.20.5.linux-amd64.tar.gz
    rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.5.linux-amd64.tar.gz
    echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.profile
    source $HOME/.profile
    
    # Install Recon-ng
    echo -e "[SUBDOMAINS ENUMERATION] Recon-ng installation in progress ..."
    git clone https://github.com/lanmaster53/recon-ng.git
    cd recon-ng
    pip install -r REQUIREMENTS

    # Install Subfinder
    echo -e "[SUBDOMAINS ENUMERATION] Subfinder installation in progress ..."
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

    echo -e "[SUBDOMAINS ENUMERATION] Tools installation is done!"
}

# Function: Install HTTP probing tools
install_http_probe_tools() {
    echo -e "[HTTP PROBE] Tools installation in progress ..."

    # Install httpx
    echo -e "[HTTP PROBE] httpx installation in progress ..."
    GO111MODULE=on go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    ln -s ~/go/bin/httpx /usr/local/bin/
    echo -e "[HTTP PROBE] httpx installation is done!"

    # Install httprobe
    echo -e "[HTTP PROBE] httprobe installation in progress ..."
    go install github.com/tomnomnom/httprobe@latest
    echo -e "[HTTP PROBE] httprobe installation is done!"
}

# Function: Install web crawling tools
install_web_crawling_tools() {
    echo -e "[WEB CRAWLING] Tools installation in progress ..."

    # Install ParamSpider
    echo -e "[WEB CRAWLING] ParamSpider installation in progress ..."
    git clone https://github.com/devanshbatham/ParamSpider
    cd ParamSpider
    pip3 install -r requirements.txt
    echo -e "[WEB CRAWLING] ParamSpider installation is done!"

    # Install Waybackurls
    echo -e "[WEB CRAWLING] Waybackurls installation in progress ..."
    go install github.com/tomnomnom/waybackurls@latest
    echo -e "[WEB CRAWLING] Waybackurls installation is done!"
}

# Function: Install HTTP parameter discovery tools
install_http_parameter_tools() {
    echo -e "[HTTP PARAMETER DISCOVERY] Tools installation in progress ..."

    # Install Arjun
    echo -e "[HTTP PARAMETER DISCOVERY] Arjun installation in progress ..."
    pip3 install arjun
    echo -e "[HTTP PARAMETER DISCOVERY] Arjun installation is done!"
}

# Function: Install fuzzing tools
install_fuzzing_tools() {
    echo -e "[FUZZING TOOLS] Tools installation in progress ..."

    # Install ffuf
    echo -e "[FUZZING TOOLS] ffuf installation in progress ..."
    go install github.com/ffuf/ffuf@latest
    echo -e "[FUZZING TOOLS] ffuf installation is done!"
}
# Function: Install seclists
install_security_lists() {
    echo -e "[VULNERABILITY SCANNER] Seclists installation in progress ..."
    git clone https://github.com/danielmiessler/SecLists.git
    echo -e "[VULNERABILITY SCANNER] Seclists installation is done!"
}

# Function: Install API tools
install_api_tools() {
    echo -e "[API TOOLS] Tools installation in progress ..."

    # Install Kiterunner
    echo -e "[API TOOLS] Kiterunner installation in progress ..."
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
    echo -e "[API TOOLS] Kiterunner installation is done!"
}

# Function: Install XSS vulnerability tools
install_xss_vuln_tools() {
    echo -e "[VULNERABILITY - XSS] Tools installation in progress ..."

    # Install Dalfox
    echo -e "[VULNERABILITY - XSS] Dalfox installation in progress ..."
    GO111MODULE=on go install -v github.com/hahwul/dalfox/v2@latest
    echo -e "[VULNERABILITY - XSS] Dalfox installation is done!"
}

# Function: Install SQL Injection vulnerability tools
install_sqli_vuln_tools() {
    echo -e "[VULNERABILITY - SQL Injection] Tools installation in progress ..."

    # Install SQLmap
    echo -e "[VULNERABILITY - SQL Injection] SQLMap installation in progress ..."
    apt-get install sqlmap -y
    echo -e "[VULNERABILITY - SQL Injection] SQLMap installation is done!"
}

# Function: Install useful tools
install_useful_tools() {
    echo -e "[USEFUL TOOLS] Tools installation in progress ..."

    # Install anew
    echo -e "[USEFUL TOOLS] anew installation in progress ..."
    go install github.com/tomnomnom/anew@latest
    echo -e "[USEFUL TOOLS] anew installation is done!"

    # Install Tmux
    echo -e "[USEFUL TOOLS] Tmux installation in progress ..."
    apt-get install tmux -y
    echo -e "[USEFUL TOOLS] Tmux installation is done!"
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

echo -e "Copying tools into /usr/bin ..."
cp ~/go/bin/* /usr/bin/
echo -e "Done."
