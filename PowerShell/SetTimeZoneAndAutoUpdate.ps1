
Function Set-TimeSync() {
    Write-Output "Setting Windows Time Sync"
    Push-Location
    Set-Location HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers
    Set-ItemProperty . 0 "ca.pool.ntp.org"
    Set-ItemProperty . "(Default)" "0"
    Set-Location HKLM:\SYSTEM\CurrentControlSet\services\W32Time\Parameters
    Set-ItemProperty . NtpServer "ca.pool.ntp.org"
    Pop-Location
    Stop-Service w32time
    Start-Service w32time
    Write-Output "Time zone"
    Write-Output "Current Time Zone"
    Get-TimeZone

    Write-Output "Updating to Eastern Standard Time"
    Set-TimeZone -Name "Eastern Standard Time"
    Get-TimeZone
}

Set-TimeSync

