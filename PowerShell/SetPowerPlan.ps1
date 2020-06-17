
Function Set-PowerPlan() {
    $hpPlan = Get-WmiObject -Namespace root\cimv2\power -Class win32_powerplan
    Write-Output $hpPlan.Count
    foreach ($powerplan in $hpPlan) {

        if ($powerplan.ElementName.Equals("High performance")) {
            $powerplan.IsActive = 1
        } else {
            $powerplan.IsActive = 0
        }
    }
}

Function Set-SleepSettings() {
    Invoke-Command -ScriptBlock {C:\Windows\system32\powercfg.exe -change -standby-timeout-ac 0}
    Invoke-Command -ScriptBlock {C:\Windows\system32\powercfg.exe -change -hibernate-timeout-ac 0}
    Invoke-Command -ScriptBlock {C:\Windows\system32\powercfg.exe -change -standby-timeout-ac 0}
    Invoke-Command -ScriptBlock {C:\Windows\system32\powercfg.exe -change -monitor-timeout-ac 0}

    # c:\windows\system32\powercfg.exe - change - monitor - timeout - dc 0; c:\windows\system32\powercfg.exe - change - disk - timeout - ac 0; c:\windows\system32\powercfg.exe - change - disk - timeout - dc 0; c:\windows\system32\powercfg.exe - change - standby - timeout - ac 0; c:\windows\system32\powercfg.exe - change - standby - timeout - dc 0; c:\windows\system32\powercfg.exe - change - hibernate - timeout - ac 0; c:\windows\system32\powercfg.exe - change - hibernate - timeout - dc 0 }"
}



Set-PowerPlan
Set-SleepSettings