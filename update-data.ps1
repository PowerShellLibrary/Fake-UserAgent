Write-Host 'Updating user-agent data...'
$uaJsonUri = "https://raw.githubusercontent.com/intoli/user-agents/main/src/user-agents.json.gz"

Write-Host 'Importing required modules...'
. .\scripts\ConvertFrom-Gzip.ps1
. .\scripts\Initialize-Dataset.ps1
Add-Type -Path .\tools\UAParser.dll

Write-Host 'Cleaning up temp directory...'
$temp = "temp"
if (Test-Path $temp) {
    Remove-Item -Path $temp -Recurse -Force
}
New-Item -ItemType Directory -Path $temp | Out-Null
Push-Location -Path $temp


Write-Host 'Downloading user-agents.json...'
Invoke-WebRequest -Uri $uaJsonUri -OutFile "user-agents.json.gz"

Write-Host 'Decompressing user-agents.json...'
ConvertFrom-Gzip -InputObject (Get-Item "user-agents.json.gz") -RemoveInputFile

Write-Host 'Processing user-agents.json...'
$processed = Initialize-Dataset -uaJsonPath "user-agents.json"

Pop-Location

Write-Host 'Exporting user-agents.dat...'
Push-Location .\Fake-UserAgent\data
$processed | Export-Clixml -Path user-agents.clixml -NoClobber

Write-Host 'Optimizing file size...'
Get-Content .\user-agents.clixml -Raw | ForEach-Object { $_ -replace '\s+(?=<)', '' } | Set-Content .\user-agents.dat
Remove-Item .\user-agents.clixml
Pop-Location

Write-Host 'Done!'