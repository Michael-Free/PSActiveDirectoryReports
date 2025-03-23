# PSActiveDirectoryReports

PSActiveDirectoryReports is a PowerShell module designed to simplify Active Directory (AD) reporting and management. It offers a comprehensive set of functions to query, analyze, and generate detailed reports on AD objects, including users, computers, groups, and organizational units.

This module provides PowerShell cmdlets that streamline AD administration by automating tasks such as device connectivity checks, AD reporting, and routine administrative operations, enhancing efficiency and reducing manual effort.

## Prerequisites:

- Windows Server (not Windows Desktop)
- The server must be a domain controller, or it can be any Windows Server joined to a Windows domain.
- User must have administrative privileges.
- ActiveDirectory Powershell module must be installed. This can be done using the following command:

```powershell
Install-WindowsFeature -Name "RSAT-AD-PowerShell"
```

or

```powershell
Add-WindowsFeature -Name "RSAT-AD-PowerShell"
```
Note that this will install the ActiveDirectory PowerShell module on your Windows Server.

- Basic scripting knowledge and an understanding of how PowerShell works is required.

## Installation

There are two ways to install the `PSActiveDirectoryReports` module:

1. **Using PowerShell Gallery**
    - Open PowerShell as an administrator and run the following command to install the module from the PowerShell Gallery:
    ```powershell
    Install-Module -Name PSActiveDirectoryReports -Scope CurrentUser
    ```
2. **Manual Installation**
    - Clone this repository using Git or download the ZIP file.
    - Extract the contents of the ZIP file to a directory on your computer.
    - Open PowerShell as an administrator and navigate to the directory where you extracted the module files.
    - Run the following command to install the module:

    ```powershell
    Import-Module -Name .\PSActiveDirectoryReports.ps1
    ```
    Note that the manual installation method requires you to have Git installed on your computer, as well as the ability to extract ZIP files. If you do not have these tools installed, you can use the PowerShell Gallery method instead.

## Usage

### Get-DevicesOrgUnitReport
The `Get-DevicesOrgUnitReport` function queries all computers in Active Directory, retrieves their distinguished names, and extracts their organizational unit (OU) and domain information. The results include the device name, fully qualified domain name (FQDN), organizational unit, and domain name.

```powershell
Get-DevicesOrgUnitReport
```
Retrieves a list of all devices in Active Directory and their corresponding OUs.

```powershell
Get-DevicesOrgUnitReport | Export-Csv -Path "C:\Reports\DevicesOUReport.csv" -NoTypeInformation
```
Retrieves the report and exports it to a CSV file.

### Get-DisabledUsersReport
The `Get-DisabledUsersReport` function queries all disabled Active Directory user accounts and extracts details such as username, account name, organizational unit (OU), and domain name.

```powershell
Get-DisabledUsersReport
```
Retrieves all disabled users in Active Directory.

```powershell
Get-DisabledUsersReport | Export-Csv -Path "C:\Reports\DisabledUsers.csv" -NoTypeInformation
```
Exports the disabled users report to a CSV file.

### Get-DomainControllerReport
The `Get-DomainControllerReport` function queries all domain controllers in the Active Directory domain and returns key details such as name, hostname, IP address, operating system, domain, forest, and location. The function formats the output as a collection of custom PowerShell objects.

```powershell
Get-DomainControllerReport
```
Retrieves a list of all domain controllers and their details.

```powershell
Get-DomainControllerReport | Export-Csv -Path "C:\Reports\DCReport.csv" -NoTypeInformation
```
Retrieves domain controller details and exports them to a CSV file.

### Get-ExpiredUsersReport
The `Get-ExpiredUsersReport` function queries Active Directory for user accounts that have already expired. It returns details such as username, account name, organizational unit (OU), domain name, and expiration date.

```powershell
Get-ExpiredUsersReport
```
Retrieves all expired user accounts.

```powershell
Get-ExpiredUsersReport | Export-Csv -Path "C:\Reports\ExpiredUsers.csv" -NoTypeInformation
```
Retrieves expired users and exports them to a CSV file.

### Get-ExpiringUsersReport
The `Get-ExpiringUsersReport` function queries Active Directory for user accounts that are set to expire within a specified number of days. It returns details including username, account name, organizational unit (OU), domain name, and expiration date.

```powershell
Get-ExpiringUsersReport -Days 14
```
Retrieves users whose accounts will expire within the next 14 days.

```powershell
Get-ExpiringUsersReport | Export-Csv -Path "C:\Reports\ExpiringUsers.csv" -NoTypeInformation
```
Retrieves the expiring users and exports them to a CSV file.

### Get-InactiveDevicesReport
The `Get-InactiveDevicesReport` function finds computers in Active Directory that have not logged in within the specified number of days. It retrieves their names, organizational units (OU), last logon timestamps, and domain names.

```powershell
Get-InactiveDevicesReport -Days 90
```
Retrieves devices that have been inactive for over 90 days.

```powershell
Get-InactiveDevicesReport | Export-Csv -Path "C:\Reports\InactiveDevices.csv" -NoTypeInformation
```
Retrieves the inactive devices and exports them to a CSV file.

### Get-InactiveUsersReport
The `Get-InactiveUsersReport` function queries Active Directory for users who haven't logged in within a specified number of days and returns a report containing details such as user name, account name, organizational unit (OU), domain name, and the last logon date.

```powershell
Get-InactiveUsersReport -Days 60
```
Retrieves all users who have been inactive for 60 days.

```powershell
Get-InactiveUsersReport | Export-Csv -Path "C:\Reports\InactiveUsers.csv" -NoTypeInformation
```
Exports the inactive users report to a CSV file.

### Get-LockedUsersReport
The `Get-LockedUsersReport` function queries all locked-out Active Directory user accounts and extracts details such as username, account name, organizational unit (OU), and domain name.

```powershell
Get-LockedUsersReport
```
Retrieves all locked-out users in Active Directory.

```powershell
Get-LockedUsersReport | Export-Csv -Path "C:\Reports\LockedUsers.csv" -NoTypeInformation
```
Exports the locked-out users report to a CSV file.

### Get-OnlineDevicesReport
**EXPERIMENTAL** 

The `Get-OnlineDevicesReport` function queries all computers in Active Directory and performs a network connectivity check using `Test-Connection`. It returns a list of devices that are online, along with their hostname, IP address, and the last seen timestamp.

```powershell
Get-OnlineDevicesReport
```
Retrieves a list of online devices in the Active Directory domain.

```powershell
Get-OnlineDevicesReport | Export-Csv -Path "C:\Reports\OnlineDevices.csv" -NoTypeInformation
```
Retrieves the list of online devices and exports it to a CSV file.

### Get-UsersOrgUnitReport
The `Get-UsersOrgUnitReport` function queries all Active Directory users and extracts details such as username, account name, organizational unit (OU), and domain name.

```powershell
Get-UsersOrgUnitReport
```
Retrieves all users and their OU information.

```powershell
Get-UsersOrgUnitReport | Export-Csv -Path "C:\Reports\UsersOU.csv" -NoTypeInformation
```
Exports the users' OU report to a CSV file.

## License
Free Custom License (FCL) v1.0

Copyright (c) 2025, Michael Free

## Contributions

### Reporting Bugs

If you encounter any issues while using the tool, please report them in the issue tracker on GitHub. Be sure to include the following information in your bug report:

- The steps to reproduce the issue
- The expected behavior
- The actual behavior
- Any error messages or stack traces associated with the issue

### Requesting Features

If you have an idea for a new feature, please let me know by creating an issue in the issue tracker on GitHub. Be sure to explain why this feature would be useful and how it could benefit the project.

### Contributing Code

If you're a developer interested in contributing code to the project, I encourage you to submit a pull request through GitHub. Before submitting your code, please make sure it adheres to my coding standards and passes any automated tests.

### Providing Feedback

Your feedback is valuable to me. If you have any suggestions or ideas for improving the tool, please share them with me through the issue tracker on GitHub or by reaching out to me on Mastodon: https://mastodon.social/@MichaelFree

### Testing and Quality Assurance

I appreciate any help testing the project and reporting issues. If you have experience in testing, please let me know by creating an issue in the issue tracker on GitHub or by contacting me directly.

Thank you for your interest in contributing to my project! Your contributions will help make it even better.