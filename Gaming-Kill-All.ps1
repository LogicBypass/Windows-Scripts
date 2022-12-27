if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

# Get a list of all running processes
$processes = Get-Process

# Loop through each process
foreach ($process in $processes){
    # Check if the process is non-essential for gaming
    if ($process.Name -notin "powershell", "csrss", "wininit", "winlogon", "audiodg", "sihost", "services", "lsass", "svchost", "taskmgr", "explorer", "dwm", "ctfmon", "System", "smss", "ntoskrnl", "taskhostw", "fontdrvhost", "amdfendrsr", "amdow", "AMDRSServ", "AMDRSSrcExt", "atieclxx", "atiesrxx", "avp", "avpui", "cmd", "conhost", "RadeonSoftware", "cncmd", "vgtray", "vgc")
    {
        # Debugging. Test once then comment this line:
        #Write-Host $process.name

        #After debugging UNcomment this line to start to Disable the processes:
        Stop-Process -Name $process.Name -Force
    }
}
