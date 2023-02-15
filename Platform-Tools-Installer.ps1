#Requires -RunAsAdministrator
#Requires -Version 5.1

$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Add-Type -AssemblyName System.Windows.Forms
$folderDialog = New-Object -TypeName System.Windows.Forms.FolderBrowserDialog

Write-Host
Write-Host -Object 'Downloading Platform Tools...'
Write-Host
Write-Host -Object 'Do not switch to another window!'

Invoke-WebRequest -Uri https://dl.google.com/android/repository/platform-tools-latest-windows.zip -OutFile $env:Temp\platform-tools.zip

Write-Host
Write-Host -Object 'Please choose a folder to install Platform Tools'

if ( $folderDialog.ShowDialog() -eq 'OK' ) {
	
	Write-Host
	Write-Host -Object 'Unpacking Platform Tools...'
	
	Expand-Archive -Path $env:Temp\platform-tools.zip -DestinationPath $folderDialog.SelectedPath -Force
	
	$platformToolsPath = $folderDialog.SelectedPath + '\platform-tools'
	
	if ($env:Path -notlike "*$platformToolsPath*") {
		[Environment]::SetEnvironmentVariable('Path', "$env:Path`;$platformToolsPath", 'User')
	}
	
	Remove-Item -Path $env:Temp\platform-tools.zip -Force
	
	Write-Host
	Write-Host -Object 'Platform Tools has been successfully installed!' -ForegroundColor Green
	
	Start-Sleep -Seconds 2
}
else {
	Write-Host
	Write-Host -Object 'Folder has not been selected!' -ForegroundColor Red
	
	Start-Sleep -Seconds 2
}