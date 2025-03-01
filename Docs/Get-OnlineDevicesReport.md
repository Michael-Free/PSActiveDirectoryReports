---
external help file: PSActiveDirectoryReports-help.xml
Module Name: PSActiveDirectoryReports
online version: https://github.com/Michael-Free/PSActiveDirectoryReports/
schema: 2.0.0
---

# Get-OnlineDevicesReport

## SYNOPSIS
Retrieves a report of online devices within the Active Directory environment.

## SYNTAX

```
Get-OnlineDevicesReport
```

## DESCRIPTION
The \`Get-OnlineDevicesReport\` function queries all computers in Active Directory and performs
a network connectivity check using \`Test-Connection\`.
It returns a list of devices that are online,
along with their hostname, IP address, and the last seen timestamp.

## EXAMPLES

### EXAMPLE 1
```
Get-OnlineDevicesReport
Retrieves a list of online devices in the Active Directory domain.
```

### EXAMPLE 2
```
Get-OnlineDevicesReport | Export-Csv -Path "C:\Reports\OnlineDevices.csv" -NoTypeInformation
Retrieves the list of online devices and exports it to a CSV file.
```

## PARAMETERS

## INPUTS

### None. This function does not accept pipeline input.
## OUTPUTS

### [PSCustomObject[]]
### A collection of objects containing hostname, IP address, and last seen timestamp of online devices.
## NOTES
Author      : Michael Free
Date        : 2025-02-27
License     : BSD 3-Clause License
Copyright   : 2025, Michael Free.
All Rights Reserved.
Requires    : Active Directory module

## RELATED LINKS

[https://github.com/Michael-Free/PSActiveDirectoryReports/](https://github.com/Michael-Free/PSActiveDirectoryReports/)

