# TP1 - Información del sistema

function Write-Section {
    param(
        [Parameter(Mandatory)]
        [string]$Title
    )

    Write-Host "`n=== $Title ===" -ForegroundColor Cyan
}

Write-Section -Title 'Versión de PowerShell'
$PSVersionTable | Format-List

Write-Section -Title 'Política de ejecución de PowerShell'
Get-ExecutionPolicy -List | Format-Table -AutoSize

Write-Section -Title 'Edición del sistema operativo'
$operatingSystem = Get-CimInstance -ClassName Win32_OperatingSystem
$windowsEdition = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion'

[PSCustomObject]@{
    ProductName  = $windowsEdition.ProductName
    Edition      = $windowsEdition.EditionID
    Version      = $operatingSystem.Version
    BuildNumber  = $operatingSystem.BuildNumber
    Architecture = $operatingSystem.OSArchitecture
} | Format-List

Write-Section -Title 'Información completa de la PC (systeminfo)'
cmd /c systeminfo
