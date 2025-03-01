---
external help file: PSActiveDirectoryReports-help.xml
Module Name: PSActiveDirectoryReports
online version: https://github.com/Michael-Free/PSActiveDirectoryReports/
schema: 2.0.0
---

# Get-ExpiringUsersReport

## SYNOPSIS
Retrieves a report of Active Directory user accounts that are expiring soon.

## SYNTAX

```
Get-ExpiringUsersReport
```

## DESCRIPTION
The \`Get-ExpiringUsersReport\` function queries Active Directory for user accounts
that are set to expire within a specified number of days.
It returns details
including username, account name, organizational unit (OU), domain name,
and expiration date.

## EXAMPLES

### EXAMPLE 1
```
Get-ExpiringUsersReport -Days 14
Retrieves users whose accounts will expire within the next 14 days.
```

### EXAMPLE 2
```
Get-ExpiringUsersReport | Export-Csv -Path "C:\Reports\ExpiringUsers.csv" -NoTypeInformation
Retrieves the expiring users and exports them to a CSV file.
```

## PARAMETERS

## INPUTS

### None. This function does not accept pipeline input.
## OUTPUTS

### [PSCustomObject[]]
### A collection of objects containing:
### - UserName (full name)
### - AccountName (SAM account name)
### - OrgUnit (OU structure)
### - DomainName (AD domain name)
### - ExpirationDate (account expiration date or "Never Expires")
## NOTES
Author      : Michael Free
Date        : 2025-02-27
License     : BSD 3-Clause License
Copyright   : 2025, Michael Free.
All Rights Reserved.
Requires    : Active Directory module

## RELATED LINKS

[https://github.com/Michael-Free/PSActiveDirectoryReports/](https://github.com/Michael-Free/PSActiveDirectoryReports/)

