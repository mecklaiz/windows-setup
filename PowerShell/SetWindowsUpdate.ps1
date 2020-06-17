
Function Get-WindowsUpdate() {
    Write-Host "Getting current Windows Update Settings"
	$AUSettings = (New-Object -com "Microsoft.Update.AutoUpdate").Settings
	Write-Host "Notification Settings are $($AUSettings.NotificationLevel)"
}

Function Set-WindowsUpdate() {
    Write-Host "Setting Windows Update Settings"
    $AUSettings = (New-Object -com "Microsoft.Update.AutoUpdate").Settings
	Write-Host "Setting Windows Notification Level to 3"
	$AUSettings.NotificationLevel=1
	Write-Host "$($AUSettings.NotificationLevel)"
	$AUSettings.Save()
	
	
	$WindowsUpdatePath = "HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\"
    $AutoUpdatePath = "HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"
	If(Test-Path -Path $WindowsUpdatePath) {
	    Write-Host "$($WindowsUpdatePath) exists"
	}

}

Function SetAutoUodate
{
# Disable Windows updates
# Write-Output "Disable Windows Updates"
# Disable-MicrosoftUpdate
Write-Output "Truly disabling updates"
$WindowsUpdatePath = "HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\"
$AutoUpdatePath = "HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"

If(Test-Path -Path $WindowsUpdatePath) {
    Remove-Item -Path $WindowsUpdatePath -Recurse
}

New-Item -Path $WindowsUpdatePath
New-Item -Path $AutoUpdatePath

Set-ItemProperty -Path $AutoUpdatePath -Name NoAutoUpdate -Value 1

Write-Output "Done disabling Auto Update"


}

Get-WindowsUpdate
Set-WindowsUpdate
Get-WindowsUpdate
SetAutoUodate
Get-WindowsUpdate
