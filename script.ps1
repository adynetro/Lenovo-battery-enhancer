if ([BOOL](Get-WmiObject -Class BatteryStatus -Namespace root\wmi).PowerOnLine ){
       #Device is plugged in now, do this action
       write-host "Power on!"
   }
else{
      #Device is NOT plugged in now, do this action
      write-host "Now on battery, Running scripts..."
      Get-PnpDevice -FriendlyName "NVIDIA Quadro*" | Disable-PnpDevice -confirm:$false # Disable nvidia discrete graphics
      Get-PnpDevice -FriendlyName "NVIDIA Quadro*" | Enable-PnpDevice -confirm:$false # Re-enable nvidia adapter
   }