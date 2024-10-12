# ShoRAK_recon
ShoRAK Recon is a comprehensive tool designed for vulnerability discovery and exploitation, tailored for penetration testers and bug bounty hunters. It integrates multiple well-known cybersecurity tools to automate various phases of security testing and vulnerability exploitation.
Here’s a complete guide for documenting your tool and uploading it to GitHub:

#### **Tools Integrated**:
- **Subfinder**: For discovering subdomains.
- **httpx**: To check for live subdomains.
- **Naabu**: To scan for open ports.
- **FFUF**: For directory and file fuzzing.
- **Nmap**: For port and service scanning.
- **Metasploit**: To exploit vulnerabilities.
- **Gobuster**: For directory brute-forcing.
- **SQLMap**: For SQL injection vulnerability testing.
- **Sn1per**: For integrated security scanning.
- **Burp Suite**: For manual vulnerability testing.
- **Osmedeus**: For automated reconnaissance.
- **dnsenum**: For DNS enumeration and zone transfer testing.

#### **Workflow**:
1. **Subdomain Enumeration** using `subfinder`.
2. **Checking Live Subdomains** with `httpx`.
3. **Port Scanning** using `naabu`.
4. **Fuzzing for Hidden Files/Directories** using `FFUF`.
5. **Port and Service Scanning** with `nmap`.
6. **Fetching Historical URLs** using `gau`.
7. **Performing Comprehensive Scans** with `Sn1per` and `Osmedeus`.
8. **SQL Injection Testing** with `SQLMap`.
9. **Exploiting Vulnerabilities** using `Metasploit`.
10. **Manual Testing** with Burp Suite.

#### **Features**:
- Automatically detects and exploits key vulnerabilities using `Metasploit` when discovered.
- Saves all scan results in separate files for easy reference.
- Automates the bug bounty process with powerful reconnaissance and exploitation tools.

#### **Installation and Usage**:

##### **Step 1**: Install Dependencies
The tool comes with a script to install all the required tools. Run the following command to install them:
```bash
chmod +x installer.sh
./installer.sh
```

##### **Step 2**: Run the Main Tool
After installing the dependencies, you can start the main script by running:
```bash
chmod +x ShoRAK_recon.sh
./ShoRAK_recon.sh
```

##### **Step 3**: Enter the Target Domain
Once the tool is running, you'll be prompted to enter the domain you want to scan. After that, the tool will begin a comprehensive reconnaissance and vulnerability exploitation process.

#### **Additional Features**:
- Automatically attempts exploitation of discovered vulnerabilities using `Metasploit`.
- Supports detailed scan reports for all phases, making it easy to review the results.
- Integrated with multiple tools to ensure thorough scanning and exploitation.

#### **System Requirements**:
- Linux-based OS (Kali Linux or Parrot OS preferred).
- Python 3.
- GoLang installed.


https://www.shadowhackr.com
