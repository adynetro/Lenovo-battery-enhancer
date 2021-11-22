if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) 
{ 
  Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; 
  break
}

if ([BOOL](Get-WmiObject -Class BatteryStatus -Namespace root\wmi).PowerOnLine ){
       #Device is plugged in now, do this action
       write-host "Power on!"
   }
else{
      #Device is NOT plugged in now, do this action
      write-host "Now on battery, Running scripts..."
      Get-PnpDevice -FriendlyName "NVIDIA Quadro*" | Disable-PnpDevice -confirm:$false 2>$null # Disable nvidia discrete graphics 
      Get-PnpDevice -FriendlyName "NVIDIA Quadro*" | Enable-PnpDevice -confirm:$false 2>$null # Re-enable nvidia adapter
   }
