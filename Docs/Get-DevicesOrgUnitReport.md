---
external help file: PSActiveDirectoryReports-help.xml
Module Name: PSActiveDirectoryReports
online version: https://github.com/Michael-Free/PSActiveDirectoryReports/
schema: 2.0.0
---

# Get-DevicesOrgUnitReport

## SYNOPSIS
Retrieves a report of devices and their organizational units (OUs) in Active Directory.

## SYNTAX

```
Get-DevicesOrgUnitReport
```

## DESCRIPTION
The \`Get-DevicesOrgUnitReport\` function queries all computers in Active Directory, retrieves
their distinguished names, and extracts their organizational unit (OU) and domain information.
The results include the device name, fully qualified domain name (FQDN), organizational unit,
and domain name.

## EXAMPLES

### EXAMPLE 1
```
Get-DevicesOrgUnitReport
Retrieves a list of all devices in Active Directory and their corresponding OUs.
```

### EXAMPLE 2
```
Get-DevicesOrgUnitReport | Export-Csv -Path "C:\Reports\DevicesOUReport.csv" -NoTypeInformation
Retrieves the report and exports it to a CSV file.
```

## PARAMETERS

## INPUTS

### None. This function does not accept pipeline input.
## OUTPUTS

### [PSCustomObject[]]
### A collection of objects containing:
### - DeviceName (computer name)
### - Hostname (FQDN in lowercase)
### - OrgUnit (OU structure in a readable format)
### - DomainName (derived from distinguished name)
## NOTES
Author      : Michael Free
Date        : 2025-02-27
License     : BSD 3-Clause License
Copyright   : 2025, Michael Free.
All Rights Reserved.
Requires    : Active Directory module

## RELATED LINKS

[https://github.com/Michael-Free/PSActiveDirectoryReports/](https://github.com/Michael-Free/PSActiveDirectoryReports/)

