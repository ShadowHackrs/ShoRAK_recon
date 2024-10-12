# ShoRAK_recon
ShoRAK Recon is a comprehensive tool designed for vulnerability discovery and exploitation, tailored for penetration testers and bug bounty hunters. It integrates multiple well-known cybersecurity tools to automate various phases of security testing and vulnerability exploitation.
Here’s a complete guide for documenting your tool and uploading it to GitHub:

### 1. **Tool Documentation**
#### **Tool Name**: Shadow Recon

#### **Description**:
Shadow Recon is a comprehensive tool designed for vulnerability discovery and exploitation, tailored for penetration testers and bug bounty hunters. It integrates multiple well-known cybersecurity tools to automate various phases of security testing and vulnerability exploitation.

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
chmod +x install_tools.sh
./install_tools.sh
```

##### **Step 2**: Run the Main Tool
After installing the dependencies, you can start the main script by running:
```bash
chmod +x Shadow_Recon.sh
./Shadow_Recon.sh
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

---

### 2. **Uploading to GitHub**

#### **Step 1**: Setting Up GitHub
- Create an account on [GitHub](https://github.com) if you don’t have one.
- After logging in, click the "+" button in the top-right corner and select "New repository".
- Name the repository (e.g., "Shadow-Recon") and add a short description.
- Set the repository to "Public" for open access.
- Click "Create repository".

#### **Step 2**: Setting Up Locally
1. **Install Git** if it’s not already installed:
   ```bash
   sudo apt-get install git
   ```

2. **Initialize a Local Repository**:
   ```bash
   git init
   ```

3. **Add Files to the Repository**:
   ```bash
   git add .
   ```

4. **Commit the Files**:
   ```bash
   git commit -m "Initial commit - Added Shadow Recon tool"
   ```

5. **Link the Local Repository with GitHub**:
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/Shadow-Recon.git
   ```

6. **Push the Files to GitHub**:
   ```bash
   git push -u origin master
   ```

#### **Step 3**: Create a README.md File
- In your GitHub repository, create a `README.md` file and add the tool documentation.
- You can use the following format for the README:

```markdown
# Shadow Recon

## Description
Shadow Recon is a comprehensive tool designed for vulnerability discovery and exploitation, tailored for penetration testers and bug bounty hunters...

(Continue with the rest of the documentation here)
```

---

### 3. **Additional Tips**:
- **Separation of Scripts**: You can include the tool installation script (`install_tools.sh`) and the main tool script (`Shadow_Recon.sh`) in the GitHub repository to keep them organized.
- **Ensure Easy Usability**: Make sure to provide clear instructions on how to install dependencies and run the tool to make it user-friendly for others.
- **License**: Add a license file (e.g., MIT License) if you want to allow others to use and modify the tool.

By following these steps, you’ll be able to successfully document and upload your tool to GitHub, making it available for others to use and contribute to.
