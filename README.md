# Fake-UserAgent
[![PowerShell Gallery](https://img.shields.io/powershellgallery/v/Fake-UserAgent?label=Fake-UserAgent&labelColor=373e45&color=blue&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciICB2aWV3Qm94PSIwIDAgNDggNDgiIHdpZHRoPSI0OHB4IiBoZWlnaHQ9IjQ4cHgiPjxwYXRoIGZpbGw9IiMwMjc3YmQiIGQ9Ik0xOS44NDcsNDEuOTU2Yy01LjYyOS0wLjAwMi0xMS4yNTksMC4wMjQtMTYuODg4LTAuMDEzYy0yLjg1NS0wLjAxOS0zLjM3NC0wLjctMi43MzEtMy41MjUgYzIuMTc4LTkuNTgsNC40MjctMTkuMTQzLDYuNTU3LTI4LjczNEM3LjM1Niw3LjExMiw4LjU4OCw1Ljk3NSwxMS4zMTIsNkMyMi41Nyw2LjEwNiwzMy44MjksNi4wMzQsNDUuMDg4LDYuMDQ2IGMyLjgyNCwwLjAwMywzLjI5OCwwLjYxNCwyLjY2NCwzLjUxMWMtMi4wNTgsOS40MDYtNC4xMjksMTguODA5LTYuMjM2LDI4LjIwM2MtMC43ODksMy41MTYtMS42OTcsNC4xODctNS4zNTMsNC4xOTUgQzMwLjcyNCw0MS45NjYsMjUuMjg1LDQxLjk1OCwxOS44NDcsNDEuOTU2eiIvPjxwYXRoIGZpbGw9IiNmYWZhZmEiIGQ9Ik0yNS4wNTcgMjMuOTIyYy0uNjA4LS42ODctMS4xMTQtMS4yNjctMS41MzEtMS43MzItMi40My0yLjcyOC00LjY1Ni01LjI3LTcuMDYzLTcuODY5LTEuMTAyLTEuMTg5LTEuNDUzLTIuMzQ0LS4xMy0zLjUxOCAxLjMwNy0xLjE2IDIuNTkyLTEuMDU4IDMuNzkxLjI3NyAzLjM0IDMuNzE3IDYuNjc2IDcuNDM4IDEwLjA3MSAxMS4xMDQgMS4yNjggMS4zNjkuOTcyIDIuMy0uNDI0IDMuMzE1LTUuMzU5IDMuODk1LTEwLjY4NyA3LjgzMy0xNi4wMSAxMS43NzgtMS4xOTYuODg3LTIuMzM3IDEuMTA5LTMuMzA0LS4yMDEtMS4wNjYtMS40NDUtLjA4LTIuMzA1IDEuMDI2LTMuMTE0IDMuOTU1LTIuODkzIDcuOTAzLTUuNzk4IDExLjgzNC04LjcyNUMyMy44NjUgMjQuODMgMjQuNTk1IDI0LjI2NyAyNS4wNTcgMjMuOTIyek0yMS43NSAzN0MyMC42MjUgMzcgMjAgMzYgMjAgMzVzLjYyNS0yIDEuNzUtMmM0LjIyNCAwIDYuMTEyIDAgOS41IDAgMS4xMjUgMCAxLjc1IDEgMS43NSAycy0uNjI1IDItMS43NSAyQzI5LjEyNSAzNyAyNSAzNyAyMS43NSAzN3oiLz48L3N2Zz4=)](https://www.powershellgallery.com/packages/Fake-UserAgent)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?labelColor=373e45)](LICENSE)
[![Build Status](https://img.shields.io/github/actions/workflow/status/PowerShellLibrary/Fake-UserAgent/test.yml?branch=master&logo=github&labelColor=373e45&label=Pester)](https://github.com/PowerShellLibrary/Fake-UserAgent/actions/workflows/test.yml)

PowerShell module for generating random **User Agents**.


## How to use

```powershell
$agents = Get-UserAgent
```

Output

```text
ua                          : Mozilla/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Mobile/15E148 Safari/604.1
percent                     : 0.0969801619581542
type                        : mobile
device_brand                : Apple
browser                     : Mobile Safari
browser_version             : 18.1.1.0
browser_version_major_minor : 18.1
os                          : iOS
os_version                  : 18.1.1.0
platform                    : iPhone
```

## How it works

Module comes with bundled `user-agents.dat` file which contains different User Agent entries.

The process of creating it:
- Download the version of **user-agents.json** from [**user-agents**](https://github.com/intoli/user-agents/)
- Preprocess using [**uap-csharp**](https://github.com/ua-parser/uap-csharp/)
- Serialize into an XML-based representation (Common Language Infrastructure (CLI)) of all the objects
- Optimize for smaller size
- Store as a file `user-agents.dat`

## Acknowledgements
This project makes use of the following project
- [**user-agents**](https://github.com/intoli/user-agents/) by [**intoli**](https://github.com/intoli)
  *A JavaScript library for generating random user agents with data that's updated daily.*
- [**uap-csharp**](https://github.com/ua-parser/uap-csharp/) by [**ua-parser**](https://github.com/ua-parser)
  *C# implementation of ua-parser*

## License
[MIT License](LICENSE.md) © Alan Płócieniak



