if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) 
{ 
  Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; 
  break
}
New-Item -Path "$env:appdata\\adynetro\\" -ItemType Directory -Force
Copy-Item -Path "$PSScriptRoot\*" -Destination "$env:appdata\\adynetro\\" 
schtasks /create /xml "$PSScriptRoot\Battery Enhancer.xml" /tn "Battery Enhancer" /ru $env:USERNAME
Write-Host "The script has been copied in place and scheduled to run ! Place any key to finish"

[Console]::Readkey()