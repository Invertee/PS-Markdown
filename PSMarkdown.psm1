Get-ChildItem -Path $PSScriptRoot -Recurse -File | Unblock-File
Get-ChildItem -Path $PSScriptRoot\*.ps1 -Recurse | Foreach-Object{ . $_.FullName }

$FunctionsToExport = @(
    'Out-MDCodeBlock',
    'Out-MDLink',
    'Out-MDText',
    'Out-MDTable',
    'Out-MDTitle'
)

Export-ModuleMember -Function $FunctionsToExport 