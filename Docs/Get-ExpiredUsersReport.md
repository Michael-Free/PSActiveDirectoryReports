---
external help file: PSActiveDirectoryReports-help.xml
Module Name: PSActiveDirectoryReports
online version: https://github.com/Michael-Free/PSActiveDirectoryReports/
schema: 2.0.0
---

# Get-ExpiredUsersReport

## SYNOPSIS
Retrieves a report of expired Active Directory user accounts.

## SYNTAX

```
Get-ExpiredUsersReport
```

## DESCRIPTION
The \`Get-ExpiredUsersReport\` function queries Active Directory for user accounts
that have already expired.
It returns details such as username, account name,
organizational unit (OU), domain name, and expiration date.

## EXAMPLES

### EXAMPLE 1
```
Get-ExpiredUsersReport
Retrieves all expired user accounts.
```

### EXAMPLE 2
```
Get-ExpiredUsersReport | Export-Csv -Path "C:\Reports\ExpiredUsers.csv" -NoTypeInformation
Retrieves expired users and exports them to a CSV file.
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

