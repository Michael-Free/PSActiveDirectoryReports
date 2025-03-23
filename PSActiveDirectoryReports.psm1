#Requires -RunAsAdministrator
Import-Module ActiveDirectory

function Get-InactiveUsersReport {
  <#
    .SYNOPSIS
        Retrieves a report of inactive Active Directory users based on the LastLogonTimestamp.

    .DESCRIPTION
        The `Get-InactiveUsersReport` function queries Active Directory for users who haven't logged in within
        a specified number of days and returns a report containing details such as user name, account name,
        organizational unit (OU), domain name, and the last logon date.

    .PARAMETER Days
        The number of days to consider a user as inactive. The default is 30 days.

    .INPUTS
        [int]$Days (default: 30)
        The number of days a user must be inactive to be included in the report.

    .OUTPUTS
        [PSCustomObject[]]
        A collection of objects containing:
        - UserName (Full Name)
        - AccountName (SAM Account Name)
        - OrgUnit (OU structure)
        - DomainName (AD domain name)
        - LastLogon (Last logon date)

    .EXAMPLE
        Get-InactiveUsersReport -Days 60
        Retrieves all users who have been inactive for 60 days.

    .EXAMPLE
        Get-InactiveUsersReport | Export-Csv -Path "C:\Reports\InactiveUsers.csv" -NoTypeInformation
        Exports the inactive users report to a CSV file.

    .NOTES
        Author      : Michael Free
        Date        : 2025-03-23
        License     : Free Custom License (FCL) v1.0
        Copyright   : 2025, Michael Free. All Rights Reserved.
        Requires    : Active Directory module

    .LINK
        https://github.com/Michael-Free/PSActiveDirectoryReports/
    #>
  param (
    [int]$Days = 30
  )

  $fileTime = $((Get-Date).AddDays(-$Days)).ToFileTime()

  try {
    $ObjectArray = @()
    Get-ADUser -Filter { LastLogonTimeStamp -lt $fileTime } -Properties LastLogonTimeStamp |
      Sort-Object -Property Name -Unique |
      ForEach-Object {
        $ObjectArray += [PSCustomObject]@{
          UserName    = $_.Name
          AccountName = $_.SamAccountName
          OrgUnit     = $($_.DistinguishedName -replace '^CN=[^,]+,') -ireplace 'CN=', '\' -ireplace ',DC=.*$', ''
          DomainName  = $_.Distinguishedname -ireplace 'DC=([^,]+(?:,|$))|.', '$1' -Replace ',', '.'
          LastLogon   = [DateTime]::FromFileTime($_.lastLogonTimestamp)
        }
      }
    $ObjectArray
  }
  catch {
    throw "Error getting Inactive AD Users Report: $($_.Exception.Message)"
  }
}

function Get-LockedUsersReport {
  <#
    .SYNOPSIS
        Retrieves a report of all locked-out Active Directory users.

    .DESCRIPTION
        The `Get-LockedUsersReport` function queries all locked-out Active Directory user accounts
        and extracts details such as username, account name, organizational unit (OU), and domain name.

    .INPUTS
        None. This function does not accept pipeline input.

    .OUTPUTS
        [PSCustomObject[]]
        A collection of objects containing:
        - UserName (Full Name)
        - AccountName (SAM Account Name)
        - OrgUnit (OU structure)
        - DomainName (AD domain name)

    .EXAMPLE
        Get-LockedUsersReport
        Retrieves all locked-out users in Active Directory.

    .EXAMPLE
        Get-LockedUsersReport | Export-Csv -Path "C:\Reports\LockedUsers.csv" -NoTypeInformation
        Exports the locked-out users report to a CSV file.

    .NOTES
        Author      : Michael Free
        Date        : 2025-03-23
        License     : Free Custom License (FCL) v1.0
        Copyright   : 2025, Michael Free. All Rights Reserved.
        Requires    : Active Directory module

    .LINK
      https://github.com/Michael-Free/PSActiveDirectoryReports/
    #>
  try {
    $ObjectArray = @()
    Search-ADAccount -LockedOut -UsersOnly |
      Sort-Object -Property Name -Unique |
      ForEach-Object {
        $ObjectArray += [PSCustomObject]@{
          UserName    = $_.Name
          AccountName = $_.SamAccountName
          OrgUnit     = $($_.DistinguishedName -replace '^CN=[^,]+,') -ireplace 'CN=', '\' -ireplace ',DC=.*$', ''
          DomainName  = $_.Distinguishedname -ireplace 'DC=([^,]+(?:,|$))|.', '$1' -Replace ',', '.'
        }
      }
    $ObjectArray
  }
  catch {
    throw "Error getting Locked AD Users Report: $($_.Exception.Message)"
  }
}

function Get-DisabledUsersReport {
  <#
    .SYNOPSIS
        Retrieves a report of all disabled Active Directory users.

    .DESCRIPTION
        The `Get-DisabledUsersReport` function queries all disabled Active Directory user accounts
        and extracts details such as username, account name, organizational unit (OU), and domain name.

    .INPUTS
        None. This function does not accept pipeline input.

    .OUTPUTS
        [PSCustomObject[]]
        A collection of objects containing:
        - UserName (Full Name)
        - AccountName (SAM Account Name)
        - OrgUnit (OU structure)
        - DomainName (AD domain name)

    .EXAMPLE
        Get-DisabledUsersReport
        Retrieves all disabled users in Active Directory.

    .EXAMPLE
        Get-DisabledUsersReport | Export-Csv -Path "C:\Reports\DisabledUsers.csv" -NoTypeInformation
        Exports the disabled users report to a CSV file.

    .NOTES
        Author      : Michael Free
        Date        : 2025-03-23
        License     : Free Custom License (FCL) v1.0
        Copyright   : 2025, Michael Free. All Rights Reserved.
        Requires    : Active Directory module

    .LINK
        https://github.com/Michael-Free/PSActiveDirectoryReports/
    #>
  try {
    $ObjectArray = @()
    Search-ADAccount -AccountDisabled -UsersOnly |
      Sort-Object -Property Name -Unique |
      ForEach-Object {
        $ObjectArray += [PSCustomObject]@{
          UserName    = $_.Name
          AccountName = $_.SamAccountName
          OrgUnit     = $($_.DistinguishedName -replace '^CN=[^,]+,') -ireplace 'CN=', '\' -ireplace ',DC=.*$', ''
          DomainName  = $_.Distinguishedname -ireplace 'DC=([^,]+(?:,|$))|.', '$1' -Replace ',', '.'
        }
      }
    $ObjectArray
  }
  catch {
    throw "Error getting Disabled AD Users Report: $($_.Exception.Message)"
  }
}

function Get-UsersOrgUnitReport {
  <#
    .SYNOPSIS
        Retrieves a report of Active Directory users and their organizational units.

    .DESCRIPTION
        The `Get-UsersOrgUnitReport` function queries all Active Directory users and extracts
        details such as username, account name, organizational unit (OU), and domain name.

    .INPUTS
        None. This function does not accept pipeline input.

    .OUTPUTS
        [PSCustomObject[]]
        A collection of objects containing:
        - UserName (Full Name)
        - AccountName (SAM Account Name)
        - OrgUnit (OU structure)
        - DomainName (AD domain name)

    .EXAMPLE
        Get-UsersOrgUnitReport
        Retrieves all users and their OU information.

    .EXAMPLE
        Get-UsersOrgUnitReport | Export-Csv -Path "C:\Reports\UsersOU.csv" -NoTypeInformation
        Exports the users' OU report to a CSV file.

    .NOTES
        Author      : Michael Free
        Date        : 2025-03-23
        License     : Free Custom License (FCL) v1.0
        Copyright   : 2025, Michael Free. All Rights Reserved.
        Requires    : Active Directory module

    .LINK
        https://github.com/Michael-Free/PSActiveDirectoryReports/
    #>
  try {
    $ObjectArray = @()
    Get-ADUser -Filter * -Properties DistinguishedName |
      Sort-Object -Property Name -Unique |
      ForEach-Object {
        $ObjectArray += [PSCustomObject]@{
          UserName    = $_.Name
          AccountName = $_.SamAccountName
          OrgUnit     = $($_.DistinguishedName -replace '^CN=[^,]+,') -ireplace 'CN=', '\' -ireplace ',DC=.*$', ''
          DomainName  = $_.Distinguishedname -ireplace 'DC=([^,]+(?:,|$))|.', '$1' -Replace ',', '.'
        }
      }
    $ObjectArray
  }
  catch {
    throw "Error getting Users Org Unit Report: $($_.Exception.Message)"
  }
}

function Get-ExpiredUsersReport {
  <#
    .SYNOPSIS
        Retrieves a report of expired Active Directory user accounts.

    .DESCRIPTION
        The `Get-ExpiredUsersReport` function queries Active Directory for user accounts
        that have already expired. It returns details such as username, account name,
        organizational unit (OU), domain name, and expiration date.

    .INPUTS
        None. This function does not accept pipeline input.

    .OUTPUTS
        [PSCustomObject[]]
        A collection of objects containing:
        - UserName (full name)
        - AccountName (SAM account name)
        - OrgUnit (OU structure)
        - DomainName (AD domain name)
        - ExpirationDate (account expiration date or "Never Expires")

    .EXAMPLE
        Get-ExpiredUsersReport
        Retrieves all expired user accounts.

    .EXAMPLE
        Get-ExpiredUsersReport | Export-Csv -Path "C:\Reports\ExpiredUsers.csv" -NoTypeInformation
        Retrieves expired users and exports them to a CSV file.

    .NOTES
        Author      : Michael Free
        Date        : 2025-03-23
        License     : Free Custom License (FCL) v1.0
        Copyright   : 2025, Michael Free. All Rights Reserved.
        Requires    : Active Directory module

    .LINK
        https://github.com/Michael-Free/PSActiveDirectoryReports/
    #>

  try {
    $ObjectArray = @()
    Search-ADAccount -AccountExpired -UsersOnly |
      Sort-Object -Property Name -Unique |
      ForEach-Object {
        $ObjectArray += [PSCustomObject]@{
          UserName       = $_.Name
          AccountName    = $_.SamAccountName
          OrgUnit        = $($_.DistinguishedName -replace '^CN=[^,]+,') -ireplace 'CN=', '\' -ireplace ',DC=.*$', ''
          DomainName     = $_.Distinguishedname -ireplace 'DC=([^,]+(?:,|$))|.', '$1' -Replace ',', '.'
          ExpirationDate = $_.AccountExpirationDate
        }
      }
    $ObjectArray
  }
  catch {
    throw "Error getting Expired AD Users Report: $($_.Exception.Message)"
  }
}

function Get-ExpiringUsersReport {
  <#
    .SYNOPSIS
        Retrieves a report of Active Directory user accounts that are expiring soon.

    .DESCRIPTION
        The `Get-ExpiringUsersReport` function queries Active Directory for user accounts
        that are set to expire within a specified number of days. It returns details
        including username, account name, organizational unit (OU), domain name,
        and expiration date.

    .PARAMETER Days
        Specifies the number of days within which the accounts are set to expire. Defaults to 30 days.

    .INPUTS
        None. This function does not accept pipeline input.

    .OUTPUTS
        [PSCustomObject[]]
        A collection of objects containing:
        - UserName (full name)
        - AccountName (SAM account name)
        - OrgUnit (OU structure)
        - DomainName (AD domain name)
        - ExpirationDate (account expiration date or "Never Expires")

    .EXAMPLE
        Get-ExpiringUsersReport -Days 14
        Retrieves users whose accounts will expire within the next 14 days.

    .EXAMPLE
        Get-ExpiringUsersReport | Export-Csv -Path "C:\Reports\ExpiringUsers.csv" -NoTypeInformation
        Retrieves the expiring users and exports them to a CSV file.

    .NOTES
        Author      : Michael Free
        Date        : 2025-03-23
        License     : Free Custom License (FCL) v1.0
        Copyright   : 2025, Michael Free. All Rights Reserved.
        Requires    : Active Directory module

    .LINK
        https://github.com/Michael-Free/PSActiveDirectoryReports/
    #>
  try {
    $ObjectArray = @()
    Search-ADAccount -AccountExpiring -UsersOnly |
      Sort-Object -Property Name -Unique |
      ForEach-Object {
        $ObjectArray += [PSCustomObject]@{
          UserName       = $_.Name
          AccountName    = $_.SamAccountName
          OrgUnit        = $($_.DistinguishedName -replace '^CN=[^,]+,') -ireplace 'CN=', '\' -ireplace ',DC=.*$', ''
          DomainName     = $_.Distinguishedname -ireplace 'DC=([^,]+(?:,|$))|.', '$1' -Replace ',', '.'
          ExpirationDate = $_.AccountExpirationDate
        }
      }
    $ObjectArray
  }
  catch {
    throw "Error getting Expiring AD Users Report: $($_.Exception.Message)"
  }
}

function Get-InactiveDevicesReport {
  <#
    .SYNOPSIS
        Retrieves a list of inactive devices in Active Directory.

    .DESCRIPTION
        The `Get-InactiveDevicesReport` function finds computers in Active Directory that have not logged in
        within the specified number of days. It retrieves their names, organizational units (OU), last logon timestamps,
        and domain names.

    .PARAMETER Days
        Specifies the number of days of inactivity to filter devices. Defaults to 30 days.

    .INPUTS
        None. This function does not accept pipeline input.

    .OUTPUTS
        [PSCustomObject[]]
        A collection of objects containing:
        - DeviceName (computer name)
        - Hostname (FQDN in lowercase, if available)
        - OrgUnit (OU structure in readable format)
        - DomainName (derived from distinguished name)
        - LastLogon (last logon timestamp in human-readable format)

    .EXAMPLE
        Get-InactiveDevicesReport -Days 90
        Retrieves devices that have been inactive for over 90 days.

    .EXAMPLE
        Get-InactiveDevicesReport | Export-Csv -Path "C:\Reports\InactiveDevices.csv" -NoTypeInformation
        Retrieves the inactive devices and exports them to a CSV file.

    .NOTES
        Author      : Michael Free
        Date        : 2025-03-23
        License     : Free Custom License (FCL) v1.0
        Copyright   : 2025, Michael Free. All Rights Reserved.
        Requires    : Active Directory module

    .LINK
        https://github.com/Michael-Free/PSActiveDirectoryReports/
    #>
  param (
    [int]$Days = 30
  )

  $fileTime = $((Get-Date).AddDays(-$Days)).ToFileTime()

  try {
    $ObjectArray = @()
    Get-ADComputer -Filter { LastLogonTimeStamp -lt $fileTime } -Properties LastLogonTimeStamp |
      Sort-Object -Property Name -Unique |
      ForEach-Object {
        $ObjectArray += [PSCustomObject]@{
          DeviceName = $_.Name
          Hostname   = $($_.DNSHostName).ToLower()
          OrgUnit    = $($_.DistinguishedName -replace '^CN=[^,]+,') -ireplace 'CN=', '\' -ireplace ',DC=.*$', ''
          DomainName = $_.Distinguishedname -ireplace 'DC=([^,]+(?:,|$))|.', '$1' -Replace ',', '.'
          LastLogon  = [DateTime]::FromFileTime($_.lastLogonTimestamp)
        }
      }
    $ObjectArray
  }
  catch {
    throw "Error getting Inactive AD Users Report: $($_.Exception.Message)"
  }
}

function Get-DevicesOrgUnitReport {
  <#
    .SYNOPSIS
        Retrieves a report of devices and their organizational units (OUs) in Active Directory.

    .DESCRIPTION
        The `Get-DevicesOrgUnitReport` function queries all computers in Active Directory, retrieves
        their distinguished names, and extracts their organizational unit (OU) and domain information.
        The results include the device name, fully qualified domain name (FQDN), organizational unit,
        and domain name.

    .INPUTS
        None. This function does not accept pipeline input.

    .OUTPUTS
        [PSCustomObject[]]
        A collection of objects containing:
        - DeviceName (computer name)
        - Hostname (FQDN in lowercase)
        - OrgUnit (OU structure in a readable format)
        - DomainName (derived from distinguished name)

    .EXAMPLE
        Get-DevicesOrgUnitReport
        Retrieves a list of all devices in Active Directory and their corresponding OUs.

    .EXAMPLE
        Get-DevicesOrgUnitReport | Export-Csv -Path "C:\Reports\DevicesOUReport.csv" -NoTypeInformation
        Retrieves the report and exports it to a CSV file.

    .NOTES
        Author      : Michael Free
        Date        : 2025-03-23
        License     : Free Custom License (FCL) v1.0
        Copyright   : 2025, Michael Free. All Rights Reserved.
        Requires    : Active Directory module

    .LINK
        https://github.com/Michael-Free/PSActiveDirectoryReports/
    #>
  try {
    $ObjectArray = @()
    Get-ADComputer -Filter * -Properties DistinguishedName |
      Sort-Object -Property Name -Unique |
      ForEach-Object {
        $ObjectArray += [PSCustomObject]@{
          DeviceName = $_.Name
          Hostname   = $($_.DNSHostName).ToLower()
          OrgUnit    = $($_.DistinguishedName -replace '^CN=[^,]+,') -ireplace 'OU=', '\' -ireplace ',DC=.*$', ''
          DomainName = $_.Distinguishedname -ireplace 'DC=([^,]+(?:,|$))|.', '$1' -Replace ',', '.'
        }
      }
    $ObjectArray
  }
  catch {
    throw "Error getting Device Org Unit Report: $($_.Exception.Message)"
  }
}

function Get-OnlineDevicesReport {
  <#
    .SYNOPSIS
        Retrieves a report of online devices within the Active Directory environment.

    .DESCRIPTION
        The `Get-OnlineDevicesReport` function queries all computers in Active Directory and performs
        a network connectivity check using `Test-Connection`. It returns a list of devices that are online,
        along with their hostname, IP address, and the last seen timestamp.

    .INPUTS
        None. This function does not accept pipeline input.

    .OUTPUTS
        [PSCustomObject[]]
        A collection of objects containing hostname, IP address, and last seen timestamp of online devices.

    .EXAMPLE
        Get-OnlineDevicesReport
        Retrieves a list of online devices in the Active Directory domain.

    .EXAMPLE
        Get-OnlineDevicesReport | Export-Csv -Path "C:\Reports\OnlineDevices.csv" -NoTypeInformation
        Retrieves the list of online devices and exports it to a CSV file.

    .NOTES
        Author      : Michael Free
        Date        : 2025-03-23
        License     : Free Custom License (FCL) v1.0
        Copyright   : 2025, Michael Free. All Rights Reserved.
        Requires    : Active Directory module

    .LINK
        https://github.com/Michael-Free/PSActiveDirectoryReports/
    #>
  try {
    #$ObjectArray = @()
    $AllDevices = Get-ADComputer -Filter * | Select-Object -ExpandProperty Name
    $PingJobs = @()
    foreach ($TargetHost in $AllDevices) {
      #Start-Sleep (Get-Random -Minimum 1 -Maximum 5)
      $PingJobs += Start-Job -ScriptBlock {
        param($th)
        try {
          Start-Sleep (Get-Random -Minimum 1 -Maximum 10)
          $PingBack = Test-Connection -ComputerName $th -Count 2 -Quiet
          if ($PingBack) {
            [PSCustomObject]@{
              Hostname  = $th
              IPAddress = (Resolve-DnsName -Name $th -ErrorAction Stop | Where-Object { $_.QueryType -eq 'A' }).IPAddress
              LastSeen  = (Get-Date).ToString('yyyy/MM/dd HH:mm:ss')
            }
          }
        }
        catch {
          Start-Sleep (Get-Random -Minimum 1 -Maximum 5)
        }
      } -ArgumentList $TargetHost #-Using $th
    }
    $PingJobs | Wait-Job | Out-Null
    $PingJobs | Get-Job | Out-Null
    $Results = $PingJobs | ForEach-Object { Receive-Job -Job $_ } | Where-Object { $_ }
    $PingJobs | Remove-Job | Out-Null
    $Results
  }
  catch {
    throw "Error getting Online Devices Report: $($_.Exception.Message)"
  }
}

function Get-DomainControllerReport {
  <#
    .SYNOPSIS
        Retrieves a report of all domain controllers in the Active Directory environment.

    .DESCRIPTION
        The `Get-DomainControllerReport` function queries all domain controllers in the Active Directory domain
        and returns key details such as name, hostname, IP address, operating system, domain, forest, and location.
        The function formats the output as a collection of custom PowerShell objects.

    .INPUTS
        None. This function does not accept pipeline input.

    .OUTPUTS
        [PSCustomObject[]]
        A collection of objects containing details of each domain controller.

    .EXAMPLE
        Get-DomainControllerReport
        Retrieves a list of all domain controllers and their details.

    .EXAMPLE
        Get-DomainControllerReport | Export-Csv -Path "C:\Reports\DCReport.csv" -NoTypeInformation
        Retrieves domain controller details and exports them to a CSV file.

    .NOTES
        Author      : Michael Free
        Date        : 2025-03-23
        License     : Free Custom License (FCL) v1.0
        Copyright   : 2025, Michael Free. All Rights Reserved.
        Requires    : Active Directory module

    .LINK
        https://github.com/Michael-Free/PSActiveDirectoryReports/
    #>
  $ObjectArray = @()
  Get-ADDomainController -Filter * |
    Sort-Object -Property Name -Unique |
    ForEach-Object {
      $ObjectArray += [PSCustomObject]@{
        Name      = $_.Name
        HostName  = $_.Hostname
        IpAddress = $_.IPv4Address
        OS        = $_.OperatingSystem
        Domain    = $_.Domain
        Forest    = $_.Forest
        Location  = $($_.ComputerObjectDN -replace '^CN=[^,]+,') -ireplace 'OU=', '\' -ireplace ',DC=.*$', ''
      }
    }
  $ObjectArray
}
