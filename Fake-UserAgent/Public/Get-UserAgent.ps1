function Get-UserAgent {
    [CmdletBinding()]
    param ()

    $data = Get-UserAgentData
    return $data

}

Export-ModuleMember -Function Get-UserAgent
