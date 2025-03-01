---
external help file: PSActiveDirectoryReports-help.xml
Module Name: PSActiveDirectoryReports
online version: https://github.com/Michael-Free/PSActiveDirectoryReports/
schema: 2.0.0
---

# Get-DisabledUsersReport

## SYNOPSIS
Retrieves a report of all disabled Active Directory users.

## SYNTAX

```
Get-DisabledUsersReport
```

## DESCRIPTION
The \`Get-DisabledUsersReport\` function queries all disabled Active Directory user accounts
and extracts details such as username, account name, organizational unit (OU), and domain name.

## EXAMPLES

### EXAMPLE 1
```
Get-DisabledUsersReport
Retrieves all disabled users in Active Directory.
```

### EXAMPLE 2
```
Get-DisabledUsersReport | Export-Csv -Path "C:\Reports\DisabledUsers.csv" -NoTypeInformation
Exports the disabled users report to a CSV file.
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

