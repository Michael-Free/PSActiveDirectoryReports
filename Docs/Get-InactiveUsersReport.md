---
external help file: PSActiveDirectoryReports-help.xml
Module Name: PSActiveDirectoryReports
online version: https://github.com/Michael-Free/PSActiveDirectoryReports/
schema: 2.0.0
---

# Get-InactiveUsersReport

## SYNOPSIS
Retrieves a report of inactive Active Directory users based on the LastLogonTimestamp.

## SYNTAX

```
Get-InactiveUsersReport [[-Days] <Int32>]
```

## DESCRIPTION
The \`Get-InactiveUsersReport\` function queries Active Directory for users who haven't logged in within
a specified number of days and returns a report containing details such as user name, account name,
organizational unit (OU), domain name, and the last logon date.

## EXAMPLES

### EXAMPLE 1
```
Get-InactiveUsersReport -Days 60
Retrieves all users who have been inactive for 60 days.
```

### EXAMPLE 2
```
Get-InactiveUsersReport | Export-Csv -Path "C:\Reports\InactiveUsers.csv" -NoTypeInformation
Exports the inactive users report to a CSV file.
```

## PARAMETERS

### -Days
The number of days to consider a user as inactive.
The default is 30 days.

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 30
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### [int]$Days (default: 30)
### The number of days a user must be inactive to be included in the report.
## OUTPUTS

### [PSCustomObject[]]
### A collection of objects containing:
### - UserName (Full Name)
### - AccountName (SAM Account Name)
### - OrgUnit (OU structure)
### - DomainName (AD domain name)
### - LastLogon (Last logon date)
## NOTES
Author      : Michael Free
Date        : 2025-02-27
License     : BSD 3-Clause License
Copyright   : 2025, Michael Free.
All Rights Reserved.
Requires    : Active Directory module

## RELATED LINKS

[https://github.com/Michael-Free/PSActiveDirectoryReports/](https://github.com/Michael-Free/PSActiveDirectoryReports/)

