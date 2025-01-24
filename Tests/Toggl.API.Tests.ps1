Import-Module -Name Pester -Force
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

        It "should have correct structure" {
            $agent = Get-UserAgent | Select-Object -Skip 2 -First 1
            $agent.ua                           | Should -Be "Mozilla/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Mobile/15E148 Safari/604.1"
            $agent.percent                      | Should -Be ([decimal]0.0969801619581542)
            $agent.type                         | Should -Be "mobile"
            $agent.device_brand                 | Should -Be "Apple"
            $agent.browser                      | Should -Be "Mobile Safari"
            $agent.browser_version              | Should -Be ([version]::new(18, 1, 1, 0))
            $agent.browser_version_major_minor  | Should -Be ([version]::new(18, 1))
            $agent.os                           | Should -Be "iOS"
            $agent.os_version                   | Should -Be ([version]::new(18, 1, 1, 0))
            $agent.platform                     | Should -Be "iPhone"
        }
    }

    Context "UA file update Tests" {

        BeforeAll {
            $datPath = '.\Fake-UserAgent\data\user-agents.dat'
            Remove-Item -Path $datPath -ErrorAction SilentlyContinue
        }

        It "should have initial state" {
            Test-Path $datPath | Should -Be $false
        }

        It "should download and update user agents" {
            { .\update-data.ps1 } | Should -Not -Throw
        }

        It "should have initialized state" {
            Test-Path $datPath | Should -Be $true
        }
    }
}
