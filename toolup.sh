#!/bin/bash
# Display banner
if [ "$LOLCAT_INSTALLED" = true ]; then
    figlet "Toolup" | lolcat
    figlet "Developed by Riya,Deepak aka FancybearIN" | lolcat
else
    echo "------------------------------------"
                figlet "Toolup" && echo "Developed by Deepak aka FancybearIN"
    echo "------------------------------------"
    
fi

# try to be inspire don't copy !!!!
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# Detect package manager
if command -v apt &> /dev/null; then
    PM="apt"
    PM_INSTALL="apt install -y"
    PM_UPDATE="apt update -y"
    PM_UPGRADE="apt upgrade -y"
    PM_AUTOREMOVE="apt autoremove -y"
    PM_AUTOCLEAN="apt autoclean -y"
    PM_DIST_UPGRADE="apt dist-upgrade -y"
elif command -v pacman &> /dev/null; then
    PM="pacman"
    PM_INSTALL="pacman -S --noconfirm"
    PM_UPDATE="pacman -Sy --noconfirm"
    PM_UPGRADE="pacman -Syu --noconfirm"
    PM_AUTOREMOVE="pacman -Rns $(pacman -Qdtq) --noconfirm"
    PM_AUTOCLEAN="pacman -Sc --noconfirm"
    PM_DIST_UPGRADE=""
else
    echo "Unsupported package manager. Exiting."
    exit 1
fi

# Install figlet and lolcat if not present
if ! command -v figlet &> /dev/null; then
    $PM_INSTALL figlet
fi

if ! command -v lolcat &> /dev/null; then
    if [ "$PM" == "apt" ]; then
        $PM_INSTALL ruby lolcat
    elif [ "$PM" == "pacman" ]; then
        $PM_INSTALL ruby lolcat
    fi
fi   


read -p "Press Enter to start the setup..."

projectdiscovery() {
    go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest #nuclei
    if [ "$PM" == "apt" ]; then
        $PM_INSTALL libpcap-dev
    elif [ "$PM" == "pacman" ]; then
        $PM_INSTALL libpcap
    fi
    go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest #naabu
    go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest #chaos-client
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest #subfinder
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest #httpx
    go install github.com/projectdiscovery/katana/cmd/katana@latest #katana
    go install github.com/projectdiscovery/alterx/cmd/alterx@latest #alterx
}

github() {
    go install github.com/tomnomnom/httprobe@latest #httprobe
    go install github.com/tomnomnom/assetfinder@latest #assetsfinder
    go install github.com/tomnomnom/meg@latest #meg
    go install github.com/tomnomnom/waybackurls@latest #waybackurls
    go install github.com/tomnomnom/gf@latest #gf
    go install github.com/tomnomnom/qsreplace@latest #qsreplace
    go install github.com/tomnomnom/anew@latest #anew
    go install github.com/lc/gau/v2/cmd/gau@latest #gau
    go install github.com/KathanP19/Gxss@latest #gxss
    go install github.com/hahwul/dalfox/v2@latest #dalfox

    #cd; mkdir -p github.com; cd github.com
    #git clone https://github.com/SNGWN/Burp-Suite.git
}

ptlib() {
    for apt in sqlmap nmap gobuster dirb nikto recon-ng dig hydra steghide wireshark scapy dirsearch wfuzz socat medusa masscan ffuf hashcat metagoofil traceroute tcpdump dirbuster arjun nbtscan dnsrecon
    do
        $PM_INSTALL $apt
    done
}

command() {
    for commands in git gh jq wget net-tools redis-tools curl
    do
        $PM_INSTALL $commands
    done
}

language() {
    pythonbhai() {
        $PM_INSTALL python python-pip 
    }

    gobhai() {
        if [ "$PM" == "apt" ]; then
            apt-get purge -y golang
        #     wget https://go.dev/dl/go1.20.3.linux-amd64.tar.gz
        #     tar -C /usr/local -xzf go1.20.3.linux-amd64.tar.gz
        #     mkdir -p ~/.go
        # echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
        # echo 'export GOPATH=~/.go' >> ~/.bashrc
        # echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.bashrc
        # source ~/.bashrc
        # update-alternatives --install "/usr/bin/go" "go" "/usr/local/go/bin/go" 0
       # update-alternatives --set go /usr/local/go/bin/go
        elif [ "$PM" == "pacman" ]; then
            pacman -Syy go 
            #wget https://go.dev/dl/go1.20.3.linux-amd64.tar.gz
        fi
        
    }

    javascriptbhai() {
        if [ "$PM" == "apt" ]; then
            curl -fsSL https://deb.nodesource.com/setup_21.x | bash -
            $PM_INSTALL nodejs
        elif [ "$PM" == "pacman" ]; then
            $PM_INSTALL nodejs npm
        fi
    }

    javabhai() {
        if [ "$PM" == "apt" ]; then
            wget https://download.oracle.com/java/20/latest/jdk-23_linux-x64_bin.deb
            dpkg -i jdk-23_linux-x64_bin.deb
        elif [ "$PM" == "pacman" ]; then
            $PM_INSTALL jdk-openjdk
        fi
        update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-23/bin/java 1
        update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-23/bin/javac 1
    }

    sqlbhai() {
        $PM_INSTALL mysql
    }

    dbmsbhai() {
        $PM_INSTALL mariadb
    }

    pythonbhai
    gobhai
    javascriptbhai
    javabhai
    sqlbhai
    dbmsbhai
}

gf() {
    echo "you have to mannual"
    echo "echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc"
    echo "mkdir -p ~/.gf"
    echo "cp -r $GOPATH/src/github.com/tomnomnom/gf/examples ~/.gf"
    echo "git clone https://github.com/1ndianl33t/Gf-Patterns"
    echo "mv ~/Gf-Patterns/*.json ~/.gf"
    echo "gf --list"
}

config() {
    cp -v ~/go/bin/* /usr/local/bin/
}

chaotic_aur() {
    if [ "$PM" == "pacman" ]; then
        pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
        pacman-key --lsign-key 3056513887B78AEB
        echo '[chaotic-aur]' >> /etc/pacman.conf
        echo 'Server = https://chaotic.bangl.de/$repo/$arch' >> /etc/pacman.conf
        $PM_UPDATE
    fi
}

blackarch() {
    if [ "$PM" == "pacman" ]; then
        curl -O https://blackarch.org/strap.sh
        chmod +x strap.sh
        ./strap.sh
        $PM_UPDATE
    fi
}

# System update
for i in update upgrade autoremove autoclean dist-upgrade
do
    if [ "$i" == "dist-upgrade" ] && [ "$PM" == "pacman" ]; then
        continue
    fi

done

# Calling functions
language
chaotic_aur
blackarch
ptlib
projectdiscovery
github
command
gf
config
