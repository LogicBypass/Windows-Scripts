SC config trustedinstaller start=auto
dism /Online /Cleanup-image /ScanHealth
dism /Online /Cleanup-image /CheckHealth
dism /Online /Cleanup-image /RestoreHealth
dism /Online /Cleanup-image /StartComponentCleanup
Sfc /ScanNow
$LogicalDisks = Get-WmiObject Win32_LogicalDisk | Select-Object -ExpandProperty DeviceID
foreach ($Disk in $LogicalDisks){chkdsk $Disk /f /r /x }
