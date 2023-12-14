SC config trustedinstaller start=auto
Sfc /ScanNow
dism /Online /Cleanup-image /RestoreHealth
dism /Online /Cleanup-image /ScanHealth
dism /Online /Cleanup-image /CheckHealth
dism /Online /Cleanup-image /RestoreHealth
dism /Online /Cleanup-image /StartComponentCleanup
$LogicalDisks = Get-WmiObject Win32_LogicalDisk | Select-Object -ExpandProperty DeviceID
foreach ($Disk in $LogicalDisks){chkdsk $Disk /f /r /x }
