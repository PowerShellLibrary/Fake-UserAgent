function Initialize-Dataset {
    param (
        [string]$uaJsonPath = "user-agents.json"
    )
    Process {

        Get-Content $uaJsonPath -Raw | ConvertFrom-Json | % {
            $ua_result = $uaParser.Parse($_.userAgent)
            [PSCustomObject]@{
                ua                          = $_.userAgent
                percent                     = [decimal]($_.weight * 100)
                type                        = $_.deviceCategory
                device_brand                = $ua_result.Device.Brand
                browser                     = $ua_result.UserAgent.Family
                browser_version             = [version]::new($ua_result.UserAgent.Major, $ua_result.UserAgent.Minor, $ua_result.UserAgent.Patch, $ua_result.UserAgent.PatchMinor)
                browser_version_major_minor = [version]::new($ua_result.UserAgent.Major, $ua_result.UserAgent.Minor)
                os                          = $ua_result.OS.Family
                os_version                  = [version]::new($ua_result.OS.Major, $ua_result.OS.Minor, $ua_result.OS.Patch, $ua_result.OS.PatchMinor)
                platform                    = $_.platform
            }
        }
    }
}