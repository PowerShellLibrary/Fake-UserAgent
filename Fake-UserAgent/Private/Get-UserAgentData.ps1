function Get-UserAgentData {
    [CmdletBinding()]

    $datPath = Join-Path -Path $PSScriptRoot -ChildPath "..\data\user-agents.dat"

    if (-Not(Test-Path $datPath)) {
        Initialize-Dataset
    }

    Import-Clixml -Path $datPath
}