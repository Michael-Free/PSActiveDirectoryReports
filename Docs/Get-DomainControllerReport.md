---
external help file: PSActiveDirectoryReports-help.xml
Module Name: PSActiveDirectoryReports
online version: https://github.com/Michael-Free/PSActiveDirectoryReports/
schema: 2.0.0
---

# Get-DomainControllerReport

## SYNOPSIS
Retrieves a report of all domain controllers in the Active Directory environment.

## SYNTAX

```
Get-DomainControllerReport
```

## DESCRIPTION
The \`Get-DomainControllerReport\` function queries all domain controllers in the Active Directory domain
and returns key details such as name, hostname, IP address, operating system, domain, forest, and location.
The function formats the output as a collection of custom PowerShell objects.

## EXAMPLES

### EXAMPLE 1
```
Get-DomainControllerReport
Retrieves a list of all domain controllers and their details.
```

### EXAMPLE 2
```
Get-DomainControllerReport | Export-Csv -Path "C:\Reports\DCReport.csv" -NoTypeInformation
Retrieves domain controller details and exports them to a CSV file.
```

## PARAMETERS

## INPUTS

### None. This function does not accept pipeline input.
## OUTPUTS

### [PSCustomObject[]]
### A collection of objects containing details of each domain controller.
## NOTES
Author      : Michael Free
Date        : 2025-02-27
License     : BSD 3-Clause License
Copyright   : 2025, Michael Free.
All Rights Reserved.
Requires    : Active Directory module

## RELATED LINKS

[https://github.com/Michael-Free/PSActiveDirectoryReports/](https://github.com/Michael-Free/PSActiveDirectoryReports/)

