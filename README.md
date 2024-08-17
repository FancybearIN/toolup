# Toolup: Your One-Stop Shop for Bug Bounty Tools

**Developed by Deepak aka FancybearIN**

**What is Toolup?**

Toolup is a comprehensive Bash script designed to automate the installation of essential tools for bug bounty hunters and security researchers. It simplifies the process of setting up your environment, saving you time and effort.

**Uses Cases:**

* **Web Application Security:** Toolup installs tools for web application enumeration, vulnerability scanning, and exploitation, including:
    * **Subfinder:** Discover subdomains of a target website.
    * **Assetfinder:** Find assets associated with a domain.
    * **Nuclei:** Scan for vulnerabilities using a vast library of templates.
    * **Httpx:** Probe and test web servers.
    * **Waybackurls:** Discover historical versions of a website.
    * **Gau:** Find live URLs from a list of potential URLs.
    * **Gf:** Analyze web requests and identify potential vulnerabilities.
    * **Gxss:** Test for cross-site scripting (XSS) vulnerabilities.
    * **Dalfox:** Automate XSS exploitation.
* **Network Security:** Toolup installs tools for network reconnaissance, scanning, and analysis, including:
    * **Nmap:** Network scanner.
    * **Gobuster:** Directory and file brute-forcer.
    * **Dirb:** Directory brute-forcer.
    * **Nikto:** Web server scanner.
    * **Recon-ng:** Reconnaissance framework.
    * **Wireshark:** Network packet analyzer.
    * **Scapy:** Network packet manipulation tool.
    * **Masscan:** Fast network scanner.
    * **Ffuf:** Web fuzzer.
    * **Hashcat:** Password cracking tool.
    * **Medusa:** Password brute-forcer.
    * **Hydra:** Password brute-forcer.
* **General Security:** Toolup installs general-purpose security tools, including:
    * **Sqlmap:** SQL injection tool.
    * **Steghide:** Steganography tool.
    * **Dirsearch:** Directory brute-forcer.
    * **Wfuzz:** Web fuzzer.
    * **Socat:** Network relay tool.
    * **Metagoofil:** Information gathering tool.
    * **Traceroute:** Network path tracer.
    * **Tcpdump:** Network packet capture tool.
    * **Dirbuster:** Directory brute-forcer.
    * **Arjun:** Web vulnerability scanner.
    * **NbtScan:** NetBIOS scanner.
    * **Dnsrecon:** DNS reconnaissance tool.
* **Programming Languages:** Toolup installs popular programming languages used in security research, including:
    * **Python:** General-purpose scripting language.
    * **Go:** High-performance programming language.
    * **Node.js:** JavaScript runtime environment.
    * **Java:** Object-oriented programming language.
* **Database Management:** Toolup installs database management systems, including:
    * **MySQL:** Relational database management system.
    * **MariaDB:** Open-source relational database management system.
https://github.com/FancybearIN/Projects
**Installation:**

1. **Prerequisites:**
    * A Linux system with either `apt` or `pacman` package manager.
    * Root privileges.
2. **Download the script:**
    ```bash
    wget https://github.com/fancybearIN/Toolup/raw/main/toolup.sh
    ```
3. **Make the script executable:**
    ```bash
    chmod +x toolup.sh
    ```
4. **Run the script:**
    ```bash
    sudo ./toolup.sh
    ```

**Note:** The script will automatically detect your package manager and install the necessary tools.

**Developer:**

Deepak aka FancybearIN
