#  VCRedist AIO x64 - One-Line Installer

Welcome to the ultimate time-saver! This repository provides an automated, one-line PowerShell command to download and install the **Visual C++ Redistributable Runtimes All-in-One** package. No more clicking through endless "Next" buttons or managing multiple `.exe` files manually.

##  Features
- **One-Line Execution:** Install everything directly from your terminal. Just like `curl | bash` but for Windows!
- **Fully Automated:** Automatically downloads the `.zip` release, extracts it, installs the runtimes, and cleans up temporary files.
- **Clean & Fast:** Leaves no junk files on your storage after the installation is complete.

##  Usage
To install, simply open **PowerShell** on your Windows and paste the following this command:

```powershell
irm "https://raw.githubusercontent.com/xdntenderman/VCR-AIO-x64/refs/heads/main/run.ps1" | iex
