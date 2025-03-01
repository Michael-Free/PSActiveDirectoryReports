---
external help file: PSActiveDirectoryReports-help.xml
Module Name: PSActiveDirectoryReports
online version: https://github.com/Michael-Free/PSActiveDirectoryReports/
schema: 2.0.0
---

# Get-InactiveDevicesReport

## SYNOPSIS
Retrieves a list of inactive devices in Active Directory.

## SYNTAX

```
Get-InactiveDevicesReport [[-Days] <Int32>]
```

## DESCRIPTION
The \`Get-InactiveDevicesReport\` function finds computers in Active Directory that have not logged in
within the specified number of days.
It retrieves their names, organizational units (OU), last logon timestamps,
and domain names.

## EXAMPLES

### EXAMPLE 1
```
Get-InactiveDevicesReport -Days 90
Retrieves devices that have been inactive for over 90 days.
```

### EXAMPLE 2
```
Get-InactiveDevicesReport | Export-Csv -Path "C:\Reports\InactiveDevices.csv" -NoTypeInformation
Retrieves the inactive devices and exports them to a CSV file.
```

## PARAMETERS

### -Days
Specifies the number of days of inactivity to filter devices.
Defaults to 30 days.

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

### None. This function does not accept pipeline input.
## OUTPUTS

### [PSCustomObject[]]
### A collection of objects containing:
### - DeviceName (computer name)
### - Hostname (FQDN in lowercase, if available)
### - OrgUnit (OU structure in readable format)
### - DomainName (derived from distinguished name)
### - LastLogon (last logon timestamp in human-readable format)
## NOTES
Author      : Michael Free
Date        : 2025-02-27
License     : BSD 3-Clause License
Copyright   : 2025, Michael Free.
All Rights Reserved.
Requires    : Active Directory module

## RELATED LINKS

[https://github.com/Michael-Free/PSActiveDirectoryReports/](https://github.com/Michael-Free/PSActiveDirectoryReports/)

