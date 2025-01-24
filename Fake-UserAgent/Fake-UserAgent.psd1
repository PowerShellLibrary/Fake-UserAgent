
@{
    RootModule        = 'Fake-UserAgent.psm1'
    ModuleVersion     = '0.2.0'
    GUID              = 'ef6d1c27-66ac-4f6c-8cc6-2bbae0f24543'
    Author            = 'Alan Plocieniak'
    CompanyName       = 'Alan Plocieniak'
    Copyright         = '(c) Alan Plocieniak. All rights reserved.'
    Description       = 'PowerShell module for generating random User Agents.'
    PowerShellVersion = '5.0'
    CompatiblePSEditions = 'Desktop', 'Core'
    FunctionsToExport = '*'
    PrivateData       = @{
        PSData = @{
            Tags       = @('powershell', 'fake', 'ps', 'power-shell', 'fake-useragent', 'useragent', 'user', 'agent' )
            LicenseUri = 'https://github.com/PowerShellLibrary/Fake-UserAgent/blob/master/LICENSE.md'
            ProjectUri = 'https://github.com/PowerShellLibrary/Fake-UserAgent'
        }
    }
}
