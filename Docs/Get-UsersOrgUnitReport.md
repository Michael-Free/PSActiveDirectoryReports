---
external help file: PSActiveDirectoryReports-help.xml
Module Name: PSActiveDirectoryReports
online version: https://github.com/Michael-Free/PSActiveDirectoryReports/
schema: 2.0.0
---

# Get-UsersOrgUnitReport

## SYNOPSIS
Retrieves a report of Active Directory users and their organizational units.

## SYNTAX

```
Get-UsersOrgUnitReport
```

## DESCRIPTION
The \`Get-UsersOrgUnitReport\` function queries all Active Directory users and extracts
details such as username, account name, organizational unit (OU), and domain name.

## EXAMPLES

### EXAMPLE 1
```
Get-UsersOrgUnitReport
Retrieves all users and their OU information.
```

### EXAMPLE 2
```
Get-UsersOrgUnitReport | Export-Csv -Path "C:\Reports\UsersOU.csv" -NoTypeInformation
Exports the users' OU report to a CSV file.
```

## PARAMETERS

## INPUTS

### None. This function does not accept pipeline input.
## OUTPUTS

### [PSCustomObject[]]
### A collection of objects containing:
### - UserName (Full Name)
### - AccountName (SAM Account Name)
### - OrgUnit (OU structure)
### - DomainName (AD domain name)
## NOTES
Author      : Michael Free
Date        : 2025-02-27
License     : BSD 3-Clause License
Copyright   : 2025, Michael Free.
All Rights Reserved.
Requires    : Active Directory module

## RELATED LINKS

[https://github.com/Michael-Free/PSActiveDirectoryReports/](https://github.com/Michael-Free/PSActiveDirectoryReports/)

