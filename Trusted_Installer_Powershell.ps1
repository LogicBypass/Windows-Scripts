if (-not ([bool]([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

Install-Module -Name NtObjectManager -RequiredVersion 1.1.32
Import-Module NtObjectManager
Start-Service TrustedInstaller
$p = Get-NtProcess TrustedInstaller.exe
$proc = New-win32process powershell.exe -Creationflags NewConsole -ParentProcess $p
