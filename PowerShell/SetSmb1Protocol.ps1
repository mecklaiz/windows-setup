Write-Host "Allow for SMB1 Protocol - a reboot will follow"

Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
Enable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol

