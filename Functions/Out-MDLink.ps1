function Out-MDLink {
    Param(
        [parameter(Mandatory=$true)] [string] $Text,
        [Parameter(Mandatory=$true)] [string] $Link,
        [parameter()] [string] $File = "C:$env:HOMEPATH\Desktop\Output.md"
    )
    $Output = '[' + $Text + ']' + '(' + $Link + ')'
    $Output | Out-File -FilePath $File -Encoding utf8 -Append
}