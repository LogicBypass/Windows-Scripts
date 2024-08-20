Install-Module -Name NtObjectManager -RequiredVersion 1.1.32
Import-Module NtObjectManager
Start-Service TrustedInstaller
$p = Get-NtProcess TrustedInstaller.exe
$proc = New-win32process powershell.exe -Creationflags NewConsole -ParentProcess $p