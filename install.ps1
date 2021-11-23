if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) 
{ 
  Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; 
  break
}
New-Item -Path "$env:appdata\\adynetro\\" -ItemType Directory -Force
for ($i = 1; $i -le 50; $i++ )

{
    Write-Progress -Activity "Install in progress..." -Status "$i% Complete:" -PercentComplete $i
    Start-Sleep -Milliseconds 10
}

Copy-Item -Path "$PSScriptRoot\*" -Destination "$env:appdata\\adynetro\\" 
Clear-Host
for ($i = 50; $i -le 100; $i++ )

{
    Write-Progress -Activity "Install in progress..." -Status "$i% Complete:" -PercentComplete $i
    Start-Sleep -Milliseconds 10
}
schtasks /create /xml "$PSScriptRoot\Battery Enhancer.xml" /tn "Battery Enhancer" /ru $env:USERNAME
write-progress -Activity "Install in progress..." -Status "100% Complete:" -Completed
Clear-Host 
Write-Host "The script has been copied in place and scheduled to run ! Place any key to finish"

[Console]::Readkey()