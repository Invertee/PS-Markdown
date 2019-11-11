## Powershell module for outputting markdown

Made this for a larger project, simple but it works. 

#### Usage
* `Out-MDTitle` - Outputs various sized titles
* `Out-MDCodeBlock` - Outputs codeblock
* `Out-MDLink` - Outputs formatted link
* `Out-MDTable` - Converts a PSObject from another PS command to a markdown table. Converts every property in the object, so filter it first.
* `Out-MDText` - Outputs standard text 

Each command accepts the parameter `-File` which points to the output file, if none is specified all commands output to the desktop. Each command appends to the markdown file, so they can be chained together in a script. 

Set the default parameter value to stop you having to enter it for every command like so:

`$PSDefaultParameterValues = @{"Out-MD*:File" = "C:\Output.md";}`

#### Examples

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
