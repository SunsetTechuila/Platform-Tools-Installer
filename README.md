# Platform Tools Installer

## How to (Windows)
Run PowerShell as Administrator, paste this commands and press Enter.
```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
IWR -UseB 'https://raw.githubusercontent.com/SunsetTechuila/Platform-Tools-Installer/main/Platform-Tools-Installer.ps1' | IEX
```
You can also update Platform Tools in this way.
### Requirements
- Windows 7 or higher
- PowerShell 5.1 or higher
- Last Windows updates installed

## How to (Linux)
Open a console, paste this command and press Enter
```shell
sudo wget -qO- https://raw.githubusercontent.com/SunsetTechuila/Platform-Tools-Installer/main/Platform-Tools-Installer.sh | bash
```
### Requirements
- Unzip package
