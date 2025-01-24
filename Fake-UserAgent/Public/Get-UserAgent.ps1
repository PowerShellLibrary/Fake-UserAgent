function Get-UserAgent {
    [CmdletBinding()]
    param ()

    $data = Get-UserAgentData
    return ,$data

}