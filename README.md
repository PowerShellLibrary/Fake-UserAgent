# Fake-UserAgent

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

- module comes with `user-agents.json.gz` downloaded from [**user-agents**](https://github.com/intoli/user-agents/)
- during first cmdlet call data will be unpacked and converted into **user-agents.dat** with help of [**uap-csharp**](https://github.com/ua-parser/uap-csharp/)

## Acknowledgements
This project makes use of the following project
- [**user-agents**](https://github.com/intoli/user-agents/) by [**intoli**](https://github.com/intoli)
  *A JavaScript library for generating random user agents with data that's updated daily.*
- [**uap-csharp**](https://github.com/ua-parser/uap-csharp/) by [**ua-parser**](https://github.com/ua-parser)
  *C# implementation of ua-parser*

## License
[MIT License](LICENSE.md) © Alan Płócieniak



