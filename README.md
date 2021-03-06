## PS-Markdown - Powershell module for outputting markdown content

Made this for a larger project, simple but it works. 

### Install

`Install-Module -Name PS-Markdown`

### Usage
* `Out-MDTitle` - Outputs various sized titles
* `Out-MDCodeBlock` - Outputs codeblock
* `Out-MDLink` - Outputs formatted link
* `Out-MDTable` - Converts a PSObject from another PS command to a markdown table. Converts every property in the object, so filter it first.
* `Out-MDList` - Converts an array into a list, ordered and unordered supported.
* `Out-MDText` - Outputs standard text 
* `Out-MDTableVertical` - Outputs a two column table with headers on the left and the value on the right. 

Each command accepts the parameter `-File` which points to the output file, if none is specified all commands output to the desktop. Each command appends to the markdown file, so they can be chained together in a script. 

Set the default parameter value to stop you having to enter it for every command like so:

`$PSDefaultParameterValues = @{"Out-MD*:File" = "C:\Output.md";}`

### Examples

> PS C:\Users\Sam> Out-MDTitle -Title "hello" -Header h3

Outputs:
### hello

> PS C:\Users\Sam> Out-MDTable (Get-NetAdapter | select Name,InterfaceAlias,Speed) -File 'C:\users\Sam\Desktop\example.md'

Outputs:

|InterfaceAlias|Name|Speed|
|:-:|:-:|:-:|
Wi-Fi|Wi-Fi|173300000|
vEthernet (Default Switch)|vEthernet (Default Switch)|0|
OpenVPN|OpenVPN|10000000|
Bluetooth Network Connection|Bluetooth Network Connection|3000000|
Ethernet|Ethernet|0|

> PS C:\Users\Sam> Out-MDList -Items (Get-ComputerInfo).CsNetworkAdapters.Description -Ordered

Outputs:

1. Intel(R) Ethernet Connection (6) I219-V
2. Intel(R) Wireless-AC 9560 160MHz
3. Bluetooth Device (Personal Area Network)
4. Hyper-V Virtual Ethernet Adapter
5. TAP-Win32 Adapter V9

### Vertical Tables
Created this to create quick documentation like this:

```
$DHCP = Get-DhcpServerv4Scope
Foreach ($Scope in $DHCP) {
    if ( $Scope.State -eq 'Active' ) { $enabled = '✔️' } else { $enabled = '❌' } 
    $leases = Get-DhcpServerv4Lease $Scope.scopeid.IPAddressToString
    $reservations = Get-DhcpServerv4Reservation $Scope.scopeid.IPAddressToString
    $ScopeData = [Ordered]@{
        "Enabled" = $Enabled
        "Scope ID" = $Scope.scopeid.IPAddressToString
        "Subnet Mask" = $Scope.SubnetMask.IPAddressToString
        "Lease Start" = $Scope.startrange.IPAddressToString
        "Lease End" = $Scope.endrange.IPAddressToString
        "Lease Count" = $leases.count
        "Reservation Count" = $reservations.count
    }
    Out-MDTableVertical -InputObject $ScopeData -HeaderTitle $Scope.name
}

Out-MDTableVertical -InputObject $ScopeData -HeaderTitle $Scope.name
```
Which outputs something like this:

| tk.internal ||
|-|-|
|Enabled|✔️|
|Scope ID|10.62.10.0|
|Subnet Mask|255.255.255.0|
|Lease Start|10.62.10.20|
|Lease End|10.62.10.240|
|Lease Count|176|
|Reservation Count|10|