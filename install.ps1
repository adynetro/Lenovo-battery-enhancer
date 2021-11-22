If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{   
  #"No Administrative rights, it will display a popup window asking user for Admin rights"

  $arguments = "& '" + $myinvocation.mycommand.definition + "'"
  Start-Process "$psHome\powershell.exe" -Verb runAs -ArgumentList $arguments
  Break
}
New-Item -Path "$env:appdata\\adynetro\\" -ItemType Directory -Force
Copy-Item -Path ".\\script.ps1" -Destination "$env:appdata\\adynetro\\" 