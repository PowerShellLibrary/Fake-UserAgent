function Get-UserAgentData {
    [CmdletBinding()]

    $datPath = Join-Path -Path $PSScriptRoot -ChildPath "..\data\user-agents.dat"

    if (-Not(Test-Path $datPath)) {
        Write-Error 'User agent data not found.'
    }

    Import-Clixml -Path $datPath
}