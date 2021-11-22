If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{   
  #"No Administrative rights, it will display a popup window asking user for Admin rights"

  $arguments = "& '" + $myinvocation.mycommand.definition + "'"
  Start-Process "powershell" -Verb runAs -ArgumentList $arguments
  Break
}
schtasks.exe /delete /tn 'Battery Enhancer' /f
Remove-Item -Path "$env:appdata\\adynetro" -Recurse
Write-Host "The script have been removed from your system ! Place any key to finish"

[Console]::Readkey()