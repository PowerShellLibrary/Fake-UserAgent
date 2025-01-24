Import-Module .\Fake-UserAgent\Fake-UserAgent.psm1 -Force

Describe 'Fake-UserAgent.Tests' {
    Context "Get-UserAgentData Tests" {

        BeforeAll {
            $datPath = '.\Fake-UserAgent\data\user-agents.dat'
        }

        It "should have initialized state" {
            Test-Path $datPath | Should -Be $true
        }

        It "should have user agents" {
            $agents = Get-UserAgent
            $agents | Should -Not -BeNullOrEmpty
            $agents.Count | Should -BeGreaterThan 0
        }
    }

    Context "UA file update Tests" {

        BeforeAll {
            $datPath = '.\Fake-UserAgent\data\user-agents.dat'
            Remove-Item -Path $datPath -ErrorAction SilentlyContinue
        }

        It "should have broken state" {
            Test-Path $datPath | Should -Be $false
            { Get-UserAgent -ErrorAction SilentlyContinue } | Should -Throw
        }

        It "should download and update user agents" {
            { .\update-data.ps1  6>$null } | Should -Not -Throw
        }

        It "should have initialized state" {
            Test-Path $datPath | Should -Be $true
        }

        It "should have the same number of user agents" {
            $raw = Get-Content .\temp\user-agents.json -Raw | ConvertFrom-Json
            $processed = Get-UserAgent
            $processed.Count | Should -Be $raw.Count
        }

        It "should have the same user agent values" {
            $raw = Get-Content .\temp\user-agents.json -Raw | ConvertFrom-Json
            $processed = Get-UserAgent

            for ($i = 0; $i -lt 200; $i++) {
                $processed[$i].ua           | Should -Be $raw[$i].userAgent
                $processed[$i].type         | Should -Be $raw[$i].deviceCategory
                $processed[$i].platform     | Should -Be $raw[$i].platform
            }
        }
    }
}
