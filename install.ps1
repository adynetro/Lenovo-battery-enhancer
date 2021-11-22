if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) 
{ 
  Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; 
  break
}
New-Item -Path "$env:appdata\\adynetro\\" -ItemType Directory -Force
Copy-Item -Path "$PSScriptRoot\*" -Destination "$env:appdata\\adynetro\\" 
schtasks /create /xml "$PSScriptRoot\Battery Enhancer.xml" /tn "Battery Enhancer" /ru SYSTEM
Write-Host "The binaries have been copied in place ! Place any key to finish"

[Console]::Readkey()