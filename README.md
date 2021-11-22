# Lenovo-battery-enhancer
This is a quickfix written in powershell that fixes Lenovo P71 ( and posible many others ) bug for battery drainage on Windows 11.

## Concept

This script simply disables and reenables the discrete graphic board at computer startup. In multiple runs we saw an increase in battery of 600%. Without this patch the workstation had 40 minutes or less of runtime. After patch applied increased to 4h+

This is a project under development, use it at your own risk.
To install simply run 

```ps
.\install.ps1
```

To uninstall you have to run

```ps
.\uninstall.ps1
```
