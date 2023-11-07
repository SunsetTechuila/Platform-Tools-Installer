if ($Host.Version.Major -lt 5) {
	Write-Host -Object 'PowerShell 5 or higher is required.' -ForegroundColor 'Red'
	Start-Sleep -Seconds 2
	Exit
}

$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Add-Type -AssemblyName 'System.Windows.Forms'
$folderDialog = New-Object -TypeName 'System.Windows.Forms.FolderBrowserDialog'

Write-Verbose -Message 'Downloading Platform Tools...' -Verbose
$Parameters = @{
	Uri             = 'https://dl.google.com/android/repository/platform-tools-latest-windows.zip'
	OutFile         = "$env:Temp\platform-tools.zip"
	UseBasicParsing = $true
}
Invoke-WebRequest @Parameters

Write-Host
Write-Host -Object 'Please choose a folder to install Platform Tools'

if ($folderDialog.ShowDialog() -eq 'OK') {
	Write-Host
	Write-Verbose -Message 'Unpacking Platform Tools...' -Verbose
	$Parameters = @{
		Path        = "$env:Temp\platform-tools.zip"
		Destination = $folderDialog.SelectedPath
		Force       = $true
	}
	Expand-Archive @Parameters
	
	$platformToolsPath = "$($folderDialog.SelectedPath)\platform-tools"
	if ($env:Path -notlike "*$platformToolsPath*") {
		[Environment]::SetEnvironmentVariable('Path', "$env:Path`;$platformToolsPath", 'User')
	}
	
	Remove-Item -Path $Parameters.Path -Force
	
	Write-Host
	Write-Host -Object 'Platform Tools has been successfully installed!' -ForegroundColor 'Green'
	Start-Sleep -Seconds 2
}
else {
	Write-Host
	Write-Host -Object 'Folder has not been selected!' -ForegroundColor 'Red'
	Start-Sleep -Seconds 2
}
