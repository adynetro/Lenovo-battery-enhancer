-sourceIdentifier "Power" `
-action {
    if ([BOOL](Get-WmiObject -Class BatteryStatus -Namespace root\wmi).PowerOnLine ){
       #Device is plugged in now, do this action
       write-host "Power on!"
   }
  else{
      #Device is NOT plugged in now, do this action
      write-host "Now on battery, Running scripts..."
      Get-PnpDevice -FriendlyName "*Nvidia*" | Disable-PnpDevice # Enables all PNP Devices with a name containing "Ethernet"
      Get-PnpDevice -FriendlyName "*Nvidia*" | Enable-PnpDevice # Enables all PNP Devices with a name containing "Ethernet"

    #   [NativeMethods]::LockWorkStation()
   }
}